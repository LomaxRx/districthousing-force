import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';
import DatePicker from './DatePicker';

class HouseholdMemberForm extends Component {
  addHouseholdMember = () => {
    const { dispatch, household_members } = this.props;
    dispatch(actions.push('household_members', {
      ...models.HouseholdMember, id: uniqueInteger(household_members)
    }));
  }

  removeHouseholdMember = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('household_members', index));
  }

  render() {
    const { household_members } = this.props;
    return (
      <section id='household_members' className='form-list'>
        <h2>Household Members</h2>
        {household_members.map((h,i)=>(
          <Form model={track('household_members[]', { id: h.id })} className='form-item'>
            <h3>
              Member {i+1}
              <button className='remove-button' onClick={()=>{this.removeHouseholdMember(i)}}>X</button>
            </h3>
            <div className='row'>
              <div className="field col-md-6">
                <label>First Name</label>
                <Control.text model='.member.first_name'/>
              </div>
              <div className="field col-md-6">
                <label>Last Name</label>
                <Control.text model='.member.last_name'/>
              </div>
            </div>
            <div className='row'>
              <div className="field">
                <label>Relationship</label>
                <Control.text model='.relationship'/>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-8">
                <label>Social Security Number</label>
                <Control.text model='.member.ssn'/>
              </div>
              <div className="field col-md-4">
                <label>Date of Birth</label>
                <DatePicker model='.member.dob'/>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-4">
                <label>Home Phone</label>
                <Control.text model='.member.home_phone'/>
              </div>
              <div className="field col-md-4">
                <label>Cell Phone</label>
                <Control.text model='.member.cell_phone'/>
              </div>
              <div className="field col-md-4">
                <label>Work Phone</label>
                <Control.text model='.member.work_phone'/>
              </div>
            </div>
          </Form>
        ))}
        <div className='sub-section'>
          <button onClick={this.addHouseholdMember}>Add Household Member</button>
        </div>
      </section>
    );
  }
}

const mapStateToProps = (state) => ({
  household_members: state.household_members
});

export default connect(mapStateToProps)(HouseholdMemberForm);
