import './sass/index.scss';

import { createStore, applyMiddleware, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import { initialState } from './initialState';
import { combineForms } from 'react-redux-form';
import Thunk from 'redux-thunk';
import { Component } from 'react';
import { render } from 'react-dom';
import { fetchPDFs, uploadPDFsToBox } from 'apex-actions';

import Main from './components/Main';
import AddressForm from './components/Address';
import PersonForm from './components/Person';
import HouseholdMemberForm from './components/HouseholdMember';
import IncomeForm from './components/Income';
import EmploymentForm from './components/Employment';
import CriminalHistoryForm from './components/CriminalHistory';
import Nav from './components/Nav';
import BuildingList from './components/BuildingList';
import Overlay from './components/Overlay';

import * as reducers from './reducers';

class App extends Component {
  render(){
    return (
      <Main>
        <BuildingList />
        <Overlay />
        <article>
          <h1>MEGA APP</h1>
          <PersonForm />
          <AddressForm />
          <HouseholdMemberForm />
          <IncomeForm />
          <EmploymentForm />
          <CriminalHistoryForm />
        </article>
        <Nav/>
      </Main>
    );
  }
}

export default class HapForm{
    constructor(state=initialState, idSelector='app'){

      this.store = createStore(combineReducers({
          ...reducers,
          formData: combineForms(state.form, 'formData')
        }), applyMiddleware(Thunk)
      );

      render(
        <Provider store={this.store}>
          <App/>
        </Provider>,
        document.getElementById(idSelector)
      );

      this.setEligibility(state.eligibility);
      this.setBuildings(state.buildings);
      this.addScrollListener();

      let queueLen = 0;
      this.store.subscribe(()=>{
        let { fetchQueue, status } = this.store.getState();
        let queue = fetchQueue;

        if(queue.length===queueLen){ return; }
        else if(queue.length > 0 && (status=='PDF_FETCHED' || status == 'READY' || status.indexOf('ERROR')!=-1)){
          queueLen = queue.length;
          this.fetchBuilding();
        } else if(queue.length===0 && (status=='PDF_FETCHED' || status == 'READY' || status.indexOf('ERROR')!=-1)){
          queueLen = 0;
          this.store.dispatch({
            type: 'SET_STATUS',
            status: 'COMPLETE'
          });
        }
      });
    }

    addScrollListener(){
      let { dispatch } = this.store;

      window.addEventListener('scroll', function(e){
        dispatch({
          type: 'SET_SCROLL_POSITION',
          scrollPosition: window.scrollTop || window.pageYOffset
        });
      });
    }

    fetchBuilding = () => {
      let { dispatch } = this.store;
      let { selectedBuildings, status, fetchQueue, formData } = this.store.getState();

      let building = fetchQueue[0];

      dispatch({
        type: 'SHIFT_QUEUE',
        building
      });

      let submitData = {
        applicant: {...formData},
        form: {
          path: building.application_url,
          name: building.name
        }
      };
      console.log('fetching...');
      delete submitData.applicant.forms;
      console.log(submitData);

      fetchPDFs(JSON.stringify(submitData), JSON.stringify(submitData.applicant), building.salesforceId);
    }

    setPDFResults(pdfResults){
      let { dispatch } = this.store;
      dispatch({type: 'SET_PDF_RESULTS', pdfResults});
    }

    setStatus(status){
      let { dispatch } = this.store;
      let { fetching } = this.store.getState();
      if(status.indexOf('ERROR')!=-1){
        dispatch({
          type: 'ADD_FAILURE',
          building: fetching,
          status
        });
      }
      dispatch({type: 'SET_STATUS', status});
    }

    setEligibility(eligibility){
      let { dispatch } = this.store;
      dispatch({type: 'SET_ELIGIBILITY_DATA', eligibility});
    }

    setBuildings(buildings){
      let { dispatch } = this.store;
      dispatch({type: 'SET_BUILDING_DATA', buildings});
    }
}
