import { Component } from 'react';
import { Form, Control } from 'react-redux-form';
import { connect } from 'react-redux';

class PersonForm extends Component {
  render() {
    return (
      <section>
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
        </Form>
      </section>
    );
  }
}

export default PersonForm;
