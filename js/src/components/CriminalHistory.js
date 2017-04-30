import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';

class CriminalHistoryForm extends Component {
  addCriminalHistory = () => {
    const { dispatch, criminal_histories } = this.props;
    dispatch(actions.push('criminal_histories', {
      ...models.CriminalHistory, id: uniqueInteger(criminal_histories)
    }));
  }

  removeCriminalHistory = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('criminal_histories', index));
  }

  render() {
    const { criminal_histories } = this.props;
    return (
      <section id='criminal_histories' className='form-list'>
        <h2>Criminal History</h2>
        {criminal_histories.map((c,i)=>(
          <Form model={track('criminal_histories[]', { id: c.id })} className='form-item'>
            <h3>
              Criminal History {i+1}
              <button className='remove-button' onClick={()=>{this.removeCriminalHistory(i)}}>X</button>
            </h3>
            <div className="field">
              <label>Crime Type</label>
              <Control.text model='.crime_type'/>
            </div>
            <div className="field">
              <label>Year</label>
              <Control.text model='.year'/>
            </div>
            <div className="field">
              <label>Description</label>
              <Control.text model='.description'/>
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
  criminal_histories: state.criminal_histories
});

export default connect(mapStateToProps)(CriminalHistoryForm);
