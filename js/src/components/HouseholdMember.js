import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';
import DatePicker from './DatePicker';
import FormSection from './FormSection';

class HouseholdMemberForm extends Component {
  addHouseholdMember = () => {
    const { dispatch, household_members } = this.props;
    dispatch(actions.push('formData.household_members', {
      ...models.HouseholdMember, id: uniqueInteger(household_members)
    }));
  }

  removeHouseholdMember = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.household_members', index));
  }

  render() {
    const { household_members } = this.props;
    return (
      <FormSection id='household_members' className='form-list'>
        <h2>Household Members</h2>
        {household_members.map((h,i)=>(
          <Form model={track('formData.household_members[]', { id: h.id })} className='form-item'>
            <h3>
              Member {i+1}
              <button className='remove-button' onClick={()=>{this.removeHouseholdMember(i)}}>X</button>
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
              <div className="field col-md-8">
                <label>Social Security Number</label>
                <Control.text model='.ssn'/>
              </div>
              <div className="field col-md-4">
                <label>Date of Birth</label>
                <DatePicker model='.dob'/>
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
          </Form>
        ))}
        <div className='sub-section'>
          <button onClick={this.addHouseholdMember}>Add Household Member</button>
        </div>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  household_members: state.formData.household_members
});

export default connect(mapStateToProps)(HouseholdMemberForm);
