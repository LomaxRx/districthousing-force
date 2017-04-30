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
        id: residences.length
    }));

    return residences.length;
  }

  componentWillMount(){
    this.setState({ id: this.addResidence() });
  }

  render(){
    const { id } = this.props;
    return(
      <Form model={track('residences[]', { id })}>
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
        ...models.Address, id: addresses.length
      }));
  }

  removeAddress = (id) => {

  }

  render() {
    const { addresses } = this.props;
    return (
      <section id='addresses' className='form-list'>
        <h2>Current and Previous Addresses</h2>
        {addresses.map((a, i) => (
          <Form model={track('addresses[]', { id: a.id })} className='form-item'>
            <h3>
              Address {i+1}
              <button className='remove-button'onClick={()=>{this.removeAddress(a.id)}}>X</button>
            </h3>
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
        <div className="sub-section">
          <button onClick={this.addAddress}>Add Address</button>
          <div className='field'>
            <label>Select Mailing Address</label>
            <Control.select model='person.mailing_address_id'>
              <option value=''></option>
              {addresses.map((a,i)=>(
                <option value={a.id}>{`${a.street||''} ${a.city||''}, ${a.state||''}`}</option>
              ))}
            </Control.select>
          </div>
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
