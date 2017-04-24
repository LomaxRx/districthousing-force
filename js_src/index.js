import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { initialState } from './initialState';
import { combineForms } from 'react-redux-form';
import Thunk from 'redux-thunk';
import { Component } from 'react';
import { render } from 'react-dom';

import AddressForm from './components/Address';
import PersonForm from './components/Person';

class App extends Component {
  render(){
    return (
      <main>
        <PersonForm />
        <AddressForm />
      </main>
    );
  }
}

export default class HapForm{
    constructor(state=initialState){
        this.store = createStore(
          combineForms(state),
          applyMiddleware(Thunk)
        );
        render(
          <Provider store={this.store}>
            <App />
          </Provider>,
          document.getElementById('app')
        );
    }
}
