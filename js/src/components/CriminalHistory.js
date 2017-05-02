import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';

class CriminalHistoryForm extends Component {
  addCriminalHistory = () => {
    const { dispatch, criminal_histories } = this.props;
    dispatch(actions.push('formData.criminal_histories', {
      ...models.CriminalHistory, id: uniqueInteger(criminal_histories)
    }));
  }

  removeCriminalHistory = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.criminal_histories', index));
  }

  render() {
    const { criminal_histories } = this.props;
    return (
      <section id='criminal_histories' className='form-list'>
        <h2>Criminal History</h2>
        {criminal_histories.map((c,i)=>(
          <Form model={track('formData.criminal_histories[]', { id: c.id })} className='form-item'>
            <h3>
              Criminal History {i+1}
              <button className='remove-button' onClick={()=>{this.removeCriminalHistory(i)}}>X</button>
            </h3>
            <div className='row'>
              <div className="field col-md-8">
                <label>Crime Type</label>
                <Control.text model='.crime_type'/>
              </div>
              <div className="field col-md-4">
                <label>Year</label>
                <Control.text model='.year'/>
              </div>
            </div>
            <div className='row'>
              <div className="field">
                <label>Description</label>
                <Control.textarea model='.description'/>
              </div>
            </div>
          </Form>
        ))}
        <div className="sub-section">
          <button onClick={this.addCriminalHistory}>Add Criminal History</button>
        </div>
      </section>
    )
  }
}

const mapStateToProps = (state) => ({
  criminal_histories: state.formData.criminal_histories
});

export default connect(mapStateToProps)(CriminalHistoryForm);
