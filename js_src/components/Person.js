import { Component } from 'react';
import { Form, Control } from 'react-redux-form';
import { connect } from 'react-redux';

class PersonForm extends Component {
  render() {
    const { addresses } = this.props;
    return (
      <section id="contact_information">
        <h2>Contact Information</h2>
        <Form model='person'>
          <div className='field'>
            <label>First Name</label>
            <Control.text model='.first_name'/>
          </div>
          <div className='field'>
            <label>Middle Name</label>
            <Control.text model='.middle_name'/>
          </div>
          <div className='field'>
            <label>Last Name</label>
            <Control.text model='.last_name'/>
          </div>
          <div className='field'>
            <label>Social Security Number</label>
            <Control.text model='.ssn'/>
          </div>
          <div className='field'>
            <label>Date of Birth</label>
            <Control.text model='.dob'/>
          </div>
          <div className='field'>
            <label>City of Birth</label>
            <Control.text model='.city_of_birth'/>
          </div>
          <div className='field'>
            <label>State of Birth</label>
            <Control.text model='.state_of_birth'/>
          </div>
          <div className='field'>
            <label>Country of Birth</label>
            <Control.text model='.country_of_birth'/>
          </div>
          <div className='field'>
            <label>Citizenship</label>
            <Control.text model='.citizenship'/>
          </div>
          <div className='field'>
            <label>Cell Phone</label>
            <Control.text model='.cell_phone'/>
          </div>
          <div className='field'>
            <label>Home Phone</label>
            <Control.text model='.home_phone'/>
          </div>
          <div className='field'>
            <label>Work Phone</label>
            <Control.text model='.work_phone'/>
          </div>
          <div className='field'>
            <label>Email</label>
            <Control.text model='.email'/>
          </div>
          <div className='field'>
            <label>Occupation</label>
            <Control.text model='.occupation'/>
          </div>
          <div className='field'>
            <label>Marital Status</label>
            <Control.text model='.marital_status'/>
          </div>
          <div className='field'>
            <label>Student Status</label>
            <Control.text model='.student_status'/>
          </div>
          <div className='field'>
            <label>Gender</label>
            <Control.text model='.gender'/>
          </div>
          <div className='field'>
            <label>Race</label>
            <Control.text model='.race'/>
          </div>
          <div className='field'>
            <label>Ethnicity</label>
            <Control.text model='.ethnicity'/>
          </div>
          <div className='field'>
            <label>Driver License Number</label>
            <Control.text model='.driver_license_number'/>
          </div>
          <div className='field'>
            <label>Driver License State</label>
            <Control.text model='.driver_license_state'/>
          </div>
          <div className='field'>
            <label>Drive License Expiration Date</label>
            <Control.text model='.drive_licenese_exp_date'/>
          </div>
          <div className='field'>
            <label>Mailing Address</label>
            <Control.select model='.mailing_address_id'>
              <option value=''></option>
              {addresses.map((a,i)=>(
                <option value={a.id}>{`${a.street||''} ${a.city||''}, ${a.state||''}`}</option>
              ))}
            </Control.select>
          </div>
        </Form>
      </section>
    );
  }
}

const mapStateToProps = (state) => ({
  addresses: state.addresses
});

export default connect(mapStateToProps)(PersonForm);
