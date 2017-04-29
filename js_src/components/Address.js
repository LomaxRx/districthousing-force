import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';

class ResidenceForm extends Component {
  addResidence = () => {
    const { dispatch, residences, addressId } = this.props;
    dispatch(actions.push('residences', {
        ...models.Residence,
        address_id: addressId,
        index: residences.length
    }));

    return residences.length;
  }

  componentWillMount(){
    this.setState({ index: this.addResidence() });
  }

  render(){
    const { index } = this.props;
    return(
      <Form model={track('residences[]', { index })}>
        <div className="field">
          <label>Start Date</label>
          <Control.text model='.start_date'/>
        </div>
        <div className="field">
          <label>End Date</label>
          <Control.text model='.end_date'/>
        </div>
        <div className="field">
          <label>Current</label>
          <Control.checkbox model='.current'/>
        </div>
        <div className="field">
          <label>Landlord's First Name</label>
          <Control.text model='.landlord.first_name'/>
        </div>
        <div className="field">
          <label>Landlord's Last Name</label>
          <Control.text model='.landlord.last_name'/>
        </div>
        <div className="field">
          <label>Landlord's Phone Number</label>
          <Control.text model='.landlord.work_phone'/>
        </div>
        <div className="field">
          <label>Reason for leaving</label>
          <Control.textarea model='.reason'/>
        </div>
      </Form>
    )
  }
}

const mapStateToResidenceProps = (state) => ({
  residences: state.residences
});

ResidenceForm = connect(mapStateToResidenceProps)(ResidenceForm);

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
        <h2>Current and Previous Addresses</h2>
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
            <div className="field">
              <label>Current or previous residence?</label>
              <Control.checkbox model='.residence'/>
            </div>
            {a.residence===true &&
              <ResidenceForm addressId={i} />
            }
          </Form>
        ))}
        <button onClick={this.addAddress}>Add Address</button>
        <div className='field'>
          <label>Mailing Address</label>
          <Control.select model='person.mailing_address_id'>
            <option value=''></option>
            {addresses.map((a,i)=>(
              <option value={a.id}>{`${a.street||''} ${a.city||''}, ${a.state||''}`}</option>
            ))}
          </Control.select>
        </div>
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
