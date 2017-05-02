import './sass/index.scss';

import { createStore, applyMiddleware, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import { initialState } from './initialState';
import { combineForms } from 'react-redux-form';
import Thunk from 'redux-thunk';
import { Component } from 'react';
import { render } from 'react-dom';

import AddressForm from './components/Address';
import PersonForm from './components/Person';
import HouseholdMemberForm from './components/HouseholdMember';
import IncomeForm from './components/Income';
import EmploymentForm from './components/Employment';
import CriminalHistoryForm from './components/CriminalHistory';
import Nav from './components/Nav';

import * as reducers from './reducers';

class App extends Component {
  render(){
    return (
      <main>
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
      </main>
    );
  }
}

export default class HapForm{
    constructor(state=initialState, idSelector='app'){
      let _reducers = combineReducers({
        ...reducers,
        formData: combineForms(state, 'formData')
      });

      this.store = createStore(_reducers, applyMiddleware(Thunk));

      render(
        <Provider store={this.store}>
          <App />
        </Provider>,
        document.getElementById(idSelector)
      );

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
}
