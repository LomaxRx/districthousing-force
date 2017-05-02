import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';
import DatePicker from './DatePicker';
import FormSection from './FormSection';

class EmploymentForm extends Component {
  addEmployment = () => {
    const { dispatch, employments } = this.props;
    dispatch(actions.push('formData.employments', {
      ...models.Employment, id: uniqueInteger(employments)
    }));
  }

  removeEmployment = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.employments', index));
  }

  render() {
    const { employments } = this.props;
    return (
      <FormSection id='employments' className='form-list'>
        <h2>Employment History</h2>
        {employments.map((e,i)=>(
          <Form model={track('formData.employments[]', { id: e.id })} className='form-item'>
            <h3>
              Employment {i+1}
              <button className='remove-button' onClick={()=>{this.removeEmployment(i)}}>X</button>
            </h3>
            <div className='row'>
              <div className="field col-md-6">
                <label>Employer Name</label>
                <Control.text model='.employer_name'/>
              </div>
              <div className="field col-md-6">
                <label>Position</label>
                <Control.text model='.position'/>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-4">
                <label>Start Date</label>
                <DatePicker model='.start_date'/>
              </div>
              <div className="field col-md-4">
                <label>End Date</label>
                <DatePicker model='.end_date'/>
              </div>
              <div className="field col-md-2">
                <label>Current</label>
                <Control.checkbox model='.current'/>
              </div>
              <div className="field col-md-2">
                <label>Part Time</label>
                <Control.checkbox model='.part_tie'/>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-6">
                <label>Phone</label>
                <Control.text model='.phone'/>
              </div>
              <div className="field col-md-6">
                <label>Supervisor Name</label>
                <Control.text model='.supervisor_name'/>
              </div>
            </div>
            <div className='row'>
              <div className="field col-md-5">
                <label>Street</label>
                <Control.text model='.address.street'/>
              </div>
              <div className="field col-md-5">
                <label>City</label>
                <Control.text model='.address.city'/>
              </div>
              <div className="field col-md-2">
                <label>State</label>
                <Control.text model='.address.state'/>
              </div>
            </div>
          </Form>
        ))}
        <div className='sub-section'>
          <button onClick={this.addEmployment}>Add Employment</button>
        </div>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  employments: state.formData.employments
});

export default connect(mapStateToProps)(EmploymentForm);
