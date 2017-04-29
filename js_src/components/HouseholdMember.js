import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';

class HouseholdMemberForm extends Component {
  addHouseholdMember = () => {
    const { dispatch, household_members } = this.props;
    dispatch(actions.push({
      ...models.HouseholdMember, index: household_members.length
    }));
  }

  render() {
    const { household_members } = this.props;
    return (
      {household_members.map((h,i)=>(
        <Form model={track('household_members[]', { index: i })}>
          <div className="field">
            <label>Relationship</label>
            <Control.text model='.relationship'/>
          </div>
          <div className="field">
            <label>First Name</label>
            <Control.text model='.member.first_name'/>
          </div>
          <div className="field">
            <label>Last Name</label>
            <Control.text model='.member.last_name'/>
          </div>
          <div className="field">
            <label>Date of Birth</label>
            <Control.text model='.member.dob'/>
          </div>
          <div className="field">
            <label>Social Security Number</label>
            <Control.text model='.member.ssn'/>
          </div><div className="field">
            <label>Home Phone</label>
            <Control.text model='.member.home_phone'/>
          </div>
          <div className="field">
            <label>Cell Phone</label>
            <Control.text model='.member.cell_phone'/>
          </div>
          <div className="field">
            <label>Work Phone</label>
            <Control.text model='.member.work_phone'/>
          </div>
        </Form>
      ))}
      <button onClick={this.addHouseholdMember}>Add Household Member</button>
    );
  }
}

const mapStateToProps = (state) => ({
  household_members: state.household_members
});

export default connect(mapStateToProps)(HouseholdMemberForm);
