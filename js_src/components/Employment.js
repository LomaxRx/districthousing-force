import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';


class EmploymentForm extends Component {
  addEmployment = () => {
    const { dispatch, employments } = this.props;
    dispatch(actions.push({
      ...models.Employment, index: employments.length
    }));
  }

  render() {
    const { employments } = this.props;
    return (
      {employments.map((e,i)=>(
        <Form model={track('employments[]', { index: i })}>
          <div className="field">
            <label>Employer Name</label>
            <Control.text model='.employer_name'/>
          </div>
          <div className="field">
            <label>Position</label>
            <Control.text model='.position'/>
          </div>
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
            <label>Part Time</label>
            <Control.checkbox model='.part_tie'/>
          </div>
          <div className="field">
            <label>Phone</label>
            <Control.text model='.phone'/>
          </div>
          <div className="field">
            <label>Supervisor Name</label>
            <Control.text model='.supervisor_name'/>
          </div>
          <div className="field">
            <label>Street</label>
            <Control.text model='.address.street'/>
          </div>
          <div className="field">
            <label>City</label>
            <Control.text model='.address.city'/>
          </div>
          <div className="field">
            <label>State</label>
            <Control.text model='.address.state'/>
          </div>
        </Form>
      ))}
      <button onClick={this.addEmployment}>Add Employment</button>
    );
  }
}

const mapStateToProps = (state) => ({
  employments: state.employments
});

export default connect(mapStateToProps)(EmploymentForm);
