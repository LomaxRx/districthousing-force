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
        <h2>General Information</h2>
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
              <Control.select model='.citizenship'>
                <option value=''></option>
                <option value='US Citizen'>US Citizen</option>
                <option value='Non-Citizen with eligible immigration status'>Non-Citizen with eligible immigration status</option>
                <option value='Other'>Other</option>
            </Control.select>
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
            <Control.select model='.marital_status'>
              <option value=''></option>
              <option value='Single'>Single</option>
              <option value='Separated'>Separated</option>
              <option value='Married'>Married</option>
              <option value='Widowed'>Widowed</option>
              <option value='Divorced'>Divorced</option>
            </Control.select>
          </div>
          <div className='field col-md-6'>
            <label>Student Status</label>
            <Control.select model='.student_status'>
              <option value=''></option>
              <option value='Not a student'>Not a student</option>
              <option value='Part-time'>Part-time</option>
              <option value='Full-time'>Full-time</option>
            </Control.select>
          </div>
        </div>
        <div className='row'>
          <div className='field col-md-4'>
            <label>Gender</label>
            <Control.select model='.gender'>
              <option value=''></option>
              <option value='Female'>Female</option>
              <option value='Male'>Male</option>
            </Control.select>
          </div>
          <div className='field col-md-4'>
            <label>Race</label>
            <Control.select model='.race'>
              <option value=''></option>
              <option value='NativeAmerican'>American Indian or Alaska Native</option>
              <option value='Asian'>Asian</option>
              <option value='Black'>Black or African American</option>
              <option value='PacificIslander'>Native Hawaiian or Other Pacific Islander</option>
              <option value='White'>White</option>
              <option value='Decline'>Decline to State</option>
              <option value='Other'>Other</option>
          </Control.select>
          </div>
          <div className='field col-md-4'>
            <label>Ethnicity</label>
            <Control.select model='.ethnicity'>
              <option value=''></option>
              <option value='Hispanic'>Hispanic or Latino</option>
              <option value='NotHispanic'>Not Hispanic or Latino</option>
              <option value='Decline'>Decline to State</option>
            </Control.select>
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
