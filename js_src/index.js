import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { initialState } from './initialState';
import { combineForms } from 'react-redux-form';
import Thunk from 'redux-thunk';
import { render } from 'react-dom';

import AddressForm from './components/Address';

export default class HapForm{
    constructor(state=initialState){
        this.store = createStore(
          combineForms(state),
          applyMiddleware(Thunk)
        );
        render(
          <Provider store={this.store}>
            <AddressForm />
          </Provider>,
          document.getElementById('app')
        );
    }
}
