import './sass/index.scss';

import { createStore, applyMiddleware, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import { initialState } from './initialState';
import { combineForms } from 'react-redux-form';
import Thunk from 'redux-thunk';
import { Component } from 'react';
import { render } from 'react-dom';

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
          <h1>Affordable Housing FTW</h1>
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

      this.setBuildings(state.buildings);
      this.addScrollListener();
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

    setPDFResults(pdfResults){
      let { dispatch } = this.store;
      dispatch({type: 'SET_PDF_RESULTS', pdfResults});
    }

    setStatus(status){
      let { dispatch } = this.store;
      dispatch({type: 'SET_STATUS', status});
    }

    setBuildings(buildings){
      let { dispatch } = this.store;
      dispatch({type: 'SET_BUILDING_DATA', buildings});
    }
}
