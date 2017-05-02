import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';
import { uniqueInteger } from '../utils';
import FormSection from './FormSection';

class IncomeForm extends Component {
  addIncome = () => {
    const { dispatch, incomes } = this.props;
    dispatch(actions.push('formData.incomes', {
      ...models.Income, id: uniqueInteger(incomes)
    }));
  }

  removeIncome = (index) => {
    const { dispatch } = this.props;
    dispatch(actions.remove('formData.incomes', index));
  }

  render() {
    const { incomes } = this.props;
    return (
      <FormSection id="incomes" className='form-list'>
        <h2>Income</h2>
        {incomes.map((inc,i)=>(
          <Form model={track('formData.incomes[]', { id: inc.id })} className='form-item'>
            <h3>
              Income {i+1}
              <button className='remove-button' onClick={()=>{this.removeIncome(i)}}>X</button>
            </h3>
            <div className='row'>
              <div className="field col-md-4">
                <label>Income Type</label>
                <Control.text model='.income_type'/>
              </div>
              <div className="field col-md-4">
                <label>Amount ($)</label>
                <Control.text model='.amount'/>
              </div>
              <div className="field col-md-4">
                <label>Interval</label>
                <Control.text model='.interval'/>
              </div>
            </div>
          </Form>
        ))}
        <div className='sub-section'>
          <button onClick={this.addIncome}>Add Income</button>
        </div>
      </FormSection>
    );
  }
}

const mapStateToProps = (state) => ({
  incomes: state.formData.incomes
});

export default connect(mapStateToProps)(IncomeForm);
