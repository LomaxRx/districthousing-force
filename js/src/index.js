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
import ContactForm from './components/Contact';
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
          <ContactForm />
        </article>
        <Nav/>
      </Main>
    );
  }
}

export default class HapForm{
    constructor(state=initialState, idSelector='app'){
      // make archived data compatible with new models by merging old and new models
      state.form = { ...initialState.form, ...state.form };
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

      this.setFetchQueue();
      this.setEligibility(state.eligibility);
      this.setBuildings(state.buildings);
      this.addScrollListener();
    }

    setFetchQueue(){
      /**
        Fetch next building when status changes
        to READY_TO_FETCH
      **/
      let currentStatus;
      this.store.subscribe(()=>{
        let prevStatus = currenStatus;
        let { status, pdfQueue } = this.store.getState();
        currentStatus = status;

        if(currentStatus==prevStatus) return;
        if(currentStatus != 'READY_TO_FETCH') return;

        if(pdfQueue.length===0){
          this.store.dispatch({
            type: 'SET_STATUS',
            status: 'COMPLETE'
          });
        } else {
          this.fetchBuilding();
        }
      });
    }

    fetchBuilding = () => {
      let { dispatch } = this.store;
      let { selectedBuildings, status, pdfQueue, formData } = this.store.getState();

      let building = pdfQueue[0];

      dispatch({
        type: 'SET_FETCHING_AND_SHIFT_QUEUE',
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
      let submitDataString = JSON.stringify(submitData);
      console.log(submitDataString);

      fetchPDFs(submitDataString, JSON.stringify(submitData.applicant), building.salesforceId);
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
      dispatch({ type: 'SET_STATUS', status: 'READY_TO_FETCH' });
    }

    setEligibility(eligibility){
      let { dispatch } = this.store;
      dispatch({type: 'SET_ELIGIBILITY_DATA', eligibility});
    }

    setBuildings(buildings){
      let { dispatch } = this.store;
      dispatch({type: 'SET_BUILDING_DATA', buildings});
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
}
