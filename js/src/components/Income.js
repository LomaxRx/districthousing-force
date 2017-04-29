import { Component } from 'react';
import { Form, Control, track, actions } from 'react-redux-form';
import { connect } from 'react-redux';
import { models } from '../initialState';


class IncomeForm extends Component {
  addIncome = () => {
    const { dispatch, incomes } = this.props;
    dispatch(actions.push('incomes', {
      ...models.Income, index: incomes.length
    }));
  }

  render() {
    const { incomes } = this.props;
    return (
      <section id="incomes">
        <h2>Income</h2>
        {incomes.map((inc,i)=>(
          <Form model={track('incomes[]', { index: i })}>
            <div className="field">
              <label>Income Type</label>
              <Control.text model='.income_type'/>
            </div>
            <div className="field">
              <label>Amount</label>
              <Control.text model='.amount'/>
            </div>
            <div className="field">
              <label>Interval</label>
              <Control.text model='.interval'/>
            </div>
          </Form>
        ))}
        <Form>
          <button onClick={this.addIncome}>Add Income</button>
        </Form>
      </section>
    );
  }
}

const mapStateToProps = (state) => ({
  incomes: state.incomes
});

export default connect(mapStateToProps)(IncomeForm);