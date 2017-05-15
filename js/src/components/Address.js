import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger, getIndex } from '../utils';
import DatePicker from './DatePicker';
import FormSection from './FormSection';

class ResidenceForm extends Component {
  addResidence = () => {
    const { dispatch, residences, addressId } = this.props;
    let id = addressId;
    dispatch(actions.push('formData.residences', {
        ...models.Residence,
        address_id: addressId,
        id
    }));

    return id;
  }

  removeResidence = () => {
    const { dispatch, residences } = this.props;
    const { id } = this.state;
    dispatch(actions.remove('formData.residences'), getIndex(residences, id));
  }

  componentWillMount(){
    const { residences, addressId } = this.props;
    if(getIndex(residences, addressId)===false)
      this.setState({ id: this.addResidence() });
    else
      this.setState({ id: addressId });
  }

  componentWillUnmount(){
    this.removeResidence();
  }

  render(){
    const { id } = this.state;
    return(
      <Form model={track('formData.residences[]', { id })}>
        <div className="row">
          <div className="field col-md-5">
            <label>Start Date</label>
            <DatePicker model='.start_date'/>
          </div>
          <div className="field col-md-5">
            <label>End Date</label>
            <DatePicker model='.end_date'/>
          </div>
          <div className="field col-md-2">
            <label>Current</label>
            <Control.checkbox model='.current'/>
          </div>
        </div>
        <div className="row">
          <div className="field col-md-4">
            <label>Landlord's First Name</label>
            <Control.text model='.landlord.first_name'/>
          </div>
          <div className="field col-md-4">
            <label>Landlord's Last Name</label>
            <Control.text model='.landlord.last_name'/>
          </div>
          <div className="field col-md-4">
            <label>Landlord's Phone Number</label>
            <Control.text model='.landlord.work_phone'/>
          </div>
        </div>
        <div className="row">
          <div className="field">
            <label>Reason for leaving</label>
            <Control.select model='.reason'>
              <option value=''></option>
              <option value='Voluntary'>Voluntary</option>
              <option value='Evicted'>Evicted</option>
            </Control.select>
          </div>
        </div>
      </Form>
    )
  }
}

const mapStateToResidenceProps = (state) => ({
  residences: state.formData.residences
});

ResidenceForm = connect(mapStateToResidenceProps)(ResidenceForm);

class AddressForm extends Component {
  addAddress = () => {
      const { dispatch, addresses } = this.props;
      dispatch(actions.push('formData.addresses', {
        ...models.Address, id: uniqueInteger(addresses)
      }));
  }

  removeAddress = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.addresses', index));
  }

  render() {
    const { addresses } = this.props;
    return (
      <FormSection id='addresses' className='form-list'>
        <h2>Current and Previous Addresses</h2>
        {addresses.map((a, i) => (
          <Form model={track('formData.addresses[]', { id: a.id })} className='form-item'>
            <h3>
              Address {i+1}
              <button className='remove-button' onClick={()=>{this.removeAddress(i)}}>X</button>
            </h3>
            <div>
              <div className="row">
                <div className="field col-md-10">
                  <label>Street</label>
                  <Control.text model='.street'/>
                </div>
                <div className="field col-md-2">
                  <label>Apt</label>
                  <Control.text model='.apt'/>
                </div>
              </div>
              <div className="row">
                <div className="field col-md-8">
                  <label>City</label>
                  <Control.text model='.city'/>
                </div>
                <div className="field col-md-2">
                  <label>State</label>
                  <Control.text model='.state'/>
                </div>
                <div className="field col-md-2">
                  <label>Residence</label>
                  <Control.checkbox model='.residence'/>
                </div>
              </div>
            </div>
            {a.residence===true &&
              <ResidenceForm addressId={i} />
            }
          </Form>
        ))}
        <div className="sub-section">
          <button onClick={this.addAddress}>Add Address</button>
          <div className="row">
            <div className='field col-md-6'>
              <label>Select Mailing Address</label>
              <Control.select model='formData.person.mailing_address_id'>
                <option value=''></option>
                {addresses.map((a,i)=>(
                  <option value={a.id}>{`${a.street||''} ${a.city||''}, ${a.state||''}`}</option>
                ))}
              </Control.select>
            </div>
          </div>
        </div>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  addresses: state.formData.addresses
});

export default connect(
  mapStateToProps
)(AddressForm);
