import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';


class EmploymentForm extends Component {
  addEmployment = () => {
    const { dispatch, employments } = this.props;
    dispatch(actions.push('employments', {
      ...models.Employment, id: employments.length
    }));
  }

  removeEmployment = (id) => {

  }

  render() {
    const { employments } = this.props;
    return (
      <section id='employments' className='form-list'>
        <h2>Employment History</h2>
        {employments.map((e,i)=>(
          <Form model={track('employments[]', { id: e.id })} className='form-item'>
            <h3>
              Employment {i+1}
              <button className='remove-button' onClick={()=>{this.removeEmployment(e.id)}}>X</button>
            </h3>
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
        <div className='sub-section'>
          <button onClick={this.addEmployment}>Add Employment</button>
        </div>
      </section>
    );
  }
}

const mapStateToProps = (state) => ({
  employments: state.employments
});

export default connect(mapStateToProps)(EmploymentForm);
