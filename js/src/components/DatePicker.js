import { Component } from 'react';
import { connect } from 'react-redux';
import { Control, actions } from 'react-redux-form';
import DayPicker from 'react-day-picker';
import moment from 'moment';

class DatePicker extends Component{
  componentWillMount(){
    if(this.props.value)
      this.handleDayClick(this.props.value);
  }
  
  handleDayClick = (day) => {
    const { name, dispatch } = this.props;
    console.log(name);
    let d = moment(day).format('L');
    dispatch(actions.change(name, d));
  }
  render() {
    return (
      <div className="datepicker">
        <input type="text" {...this.props} />
        <DayPicker onDayClick={this.handleDayClick} />
      </div>
    )
  }
}

DatePicker = connect()(DatePicker);

const CustomControl = (props) => (
  <Control
    component={DatePicker}
    mapProps={{
      value: (props) => props.viewValue
    }}
    {...props}
    />
)

export default CustomControl;
