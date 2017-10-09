import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';
import DatePicker from './DatePicker';
import FormSection from './FormSection';

class ContactForm extends Component {
  addContact = () => {
    const { dispatch, contacts } = this.props;
    dispatch(actions.push('formData.contacts', {
      ...models.Contact, id: uniqueInteger(contacts)
    }));
  }

  removeContact = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.contacts', index));
  }

  render() {
    const { contacts } = this.props;

    return (
      <FormSection id='contacts' className='form-list'>
        <h2>Contacts</h2>
        {contacts.map((c,i)=>(
          <Form model={track('formData.contacts[]', { id: c.id })} className='form-item'>
            <h3>
              Contact {i+1}
              <button className='remove-button' onClick={()=>{this.removeContact(i)}}>X</button>
            </h3>
            <div className='row'>
              <div className="field col-md-6">
                <label>First Name</label>
                <Control.text model='.first_name'/>
              </div>
              <div className="field col-md-6">
                <label>Last Name</label>
                <Control.text model='.last_name'/>
              </div>
            </div>
            <div className='row'>
              <div className="field">
                <label>Relationship</label>
                <Control.select model='.relationship'>
                  <option value=''></option>
                  <option value='Spouse'>Spouse</option>
                  <option value='Mother'>Mother</option>
                  <option value='Father'>Father</option>
                  <option value='Sister'>Sister</option>
                  <option value='Brother'>Brother</option>
                  <option value='Daughter'>Daughter</option>
                  <option value='Son'>Son</option>
                  <option value='Grandmother'>Grandmother</option>
                  <option value='Grandfather'>Grandfather</option>
                  <option value='Friend'>Friend</option>
                </Control.select>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-4">
                <label>Home Phone</label>
                <Control.text model='.home_phone'/>
              </div>
              <div className="field col-md-4">
                <label>Cell Phone</label>
                <Control.text model='.cell_phone'/>
              </div>
              <div className="field col-md-4">
                <label>Work Phone</label>
                <Control.text model='.work_phone'/>
              </div>
            </div>
            <div className="row">
              <div className="field col-md-4">
                <label>Street</label>
                <Control.text model=".address.street" />
              </div>
              <div className="field col-md-4">
                <label>City</label>
                <Control.text model=".address.city" />
              </div>
              <div className="field col-md-2">
                <label>State</label>
                <Control.text model=".address.state" />
              </div>
              <div className="field col-md-2">
                <label>Zip</label>
                <Control.text model=".address.zip" />
              </div>
            </div>
          </Form>
        ))}
        <div className='sub-section'>
          <button onClick={this.addContact}>Add Contact</button>
        </div>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  contacts: state.formData.contacts
});

export default connect(mapStateToProps)(ContactForm);
