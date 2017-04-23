import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';

class AddressForm extends Component {
  addAddress = () => {
      const { dispatch, addresses } = this.props;
      dispatch(actions.push('addresses', { ...models.Address, index: addresses.length } ));
  }

  render() {
    const { addresses } = this.props;
    return (
      <div>
        <button onClick={this.addAddress}>Add</button>
        {addresses.map((a, i) => (
          <Form model={track('addresses[]', { index: i })}>
            <Control.text model='.street'/>
          </Form>
        ))}
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  addresses: state.addresses
});

export default connect(
  mapStateToProps
)(AddressForm);
