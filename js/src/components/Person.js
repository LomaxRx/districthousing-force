import { Component } from 'react';
import { Form, Control } from 'react-redux-form';
import { connect } from 'react-redux';
import DatePicker from './DatePicker';
import FormSection from './FormSection';

class PersonForm extends Component {
  render() {
    const { addresses } = this.props;
    return (
      <FormSection id="contact_information">
        <h2>Contact Information</h2>
        <Form model='formData.person'>
          <div className='row'>
            <div className='field col-md-4'>
              <label>First Name</label>
              <Control.text model='.first_name'/>
            </div>
            <div className='field col-md-4'>
              <label>Middle Name</label>
              <Control.text model='.middle_name'/>
            </div>
            <div className='field col-md-4'>
              <label>Last Name</label>
              <Control.text model='.last_name'/>
            </div>
          </div>
          <div className='row'>
            <div className='field col-md-4'>
              <label>Date of Birth</label>
              <DatePicker model='.dob'/>
            </div>
            <div className='field col-md-8'>
              <label>Social Security Number</label>
              <Control.text model='.ssn'/>
            </div>
          </div>
          <div className='row'>
            <div className='field col-md-10'>
              <label>City of Birth</label>
              <Control.text model='.city_of_birth'/>
            </div>
            <div className='field col-md-2'>
              <label>State of Birth</label>
              <Control.text model='.state_of_birth'/>
            </div>
         </div>
         <div className='row'>
            <div className='field col-md-6'>
              <label>Citizenship</label>
              <Control.text model='.citizenship'/>
            </div>
            <div className='field col-md-6'>
              <label>Occupation</label>
              <Control.text model='.occupation'/>
            </div>
        </div>
        <div className='row'>
          <div className='field col-md-4'>
            <label>Cell Phone</label>
            <Control.text model='.cell_phone'/>
          </div>
          <div className='field col-md-4'>
            <label>Home Phone</label>
            <Control.text model='.home_phone'/>
          </div>
          <div className='field col-md-4'>
            <label>Work Phone</label>
            <Control.text model='.work_phone'/>
          </div>
        </div>
        <div className='row'>
          <div className='field'>
            <label>Email</label>
            <Control.text model='.email'/>
          </div>
        </div>
        <div className='row'>
          <div className='field col-md-6'>
            <label>Marital Status</label>
            <Control.text model='.marital_status'/>
          </div>
          <div className='field col-md-6'>
            <label>Student Status</label>
            <Control.text model='.student_status'/>
          </div>
        </div>
        <div className='row'>
          <div className='field col-md-4'>
            <label>Gender</label>
            <Control.text model='.gender'/>
          </div>
          <div className='field col-md-4'>
            <label>Race</label>
            <Control.text model='.race'/>
          </div>
          <div className='field col-md-4'>
            <label>Ethnicity</label>
            <Control.text model='.ethnicity'/>
          </div>
        </div>
        <div className='row'>
          <div className='field col-md-6'>
            <label>Driver License Number</label>
            <Control.text model='.driver_license_number'/>
          </div>
          <div className='field col-md-2'>
            <label>License State</label>
            <Control.text model='.driver_license_state'/>
          </div>
          <div className='field col-md-4'>
            <label>License Expiration Date</label>
            <DatePicker model='.drive_licenese_exp_date'/>
          </div>
        </div>
        </Form>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  addresses: state.formData.addresses
});

export default connect(mapStateToProps)(PersonForm);
