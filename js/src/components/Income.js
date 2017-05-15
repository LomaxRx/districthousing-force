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
                <Control.select model='.income_type'>
                  <option value=''></option>
                  <option value='salary'>Employment (Salary/Full-time)</option>
                  <option value='part-time'>Employment (Part-time)</option>
                  <option value='self'>Self-Employment</option>
                  <option value='social_security'>Social Security</option>
                  <option value='disability_benefits'>Disability Benefits</option>
                  <option value='military'>Military</option>
                  <option value='veterans_benefits'>Veterans Benefits</option>
                  <option value='child_support'>Child Support</option>
                  <option value='government_assistance'>TANF/Government Assistance</option>
                  <option value='retirement'>Retirement</option>
                  <option value='alimony'>Alimony</option>
                  <option value='commissions'>Commissions</option>
                  <option value='rental'>Rental</option>
                  <option value='stock'>Stock</option>
                  <option value='insurance'>Insurance Claim</option>
                  <option value='cash_gifts'>Cash Gifts</option>
                  <option value='trust_fund'>Trust Fund</option>
                  <option value='workers_compensation'>Worker's Compensation</option>
                  <option value='severance'>Severance</option>
                  <option value='scholarship'>Scholarship</option>
            </Control.select>
              </div>
              <div className="field col-md-4">
                <label>Amount ($)</label>
                <Control.text model='.amount'/>
              </div>
              <div className="field col-md-4">
                <label>Interval</label>
                <Control.select model='.interval'>
                  <option value=''></option>
                  <option value='weekly'>Weekly</option>
                  <option value='monthly'>Monthly</option>
                  <option value='yearly'>Yearly</option>
                </Control.select>
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
