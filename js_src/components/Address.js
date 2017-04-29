import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';

class AddressForm extends Component {
  addAddress = () => {
      const { dispatch, addresses } = this.props;
      dispatch(actions.push('addresses', {
        ...models.Address, index: addresses.length
      }));
  }

  render() {
    const { addresses } = this.props;
    return (
      <section id="addresses">
        <h2>Addresses</h2>
        {addresses.map((a, i) => (
          <Form model={track('addresses[]', { index: i })}>
            <div className="field">
              <label>Street</label>
              <Control.text model='.street'/>
            </div>
            <div className="field">
              <label>Apt</label>
              <Control.text model='.apt'/>
            </div>
            <div className="field">
              <label>City</label>
              <Control.text model='.city'/>
            </div>
            <div className="field">
              <label>State</label>
              <Control.text model='.state'/>
            </div>
          </Form>
        ))}
        <button onClick={this.addAddress}>Add Address</button>
      </section>
    );
  }
}

const mapStateToProps = (state) => ({
  addresses: state.addresses
});

export default connect(
  mapStateToProps
)(AddressForm);
