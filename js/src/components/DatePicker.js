import { Component } from 'react';
import { connect } from 'react-redux';
import { Control, actions } from 'react-redux-form';
import DayPicker from 'react-day-picker';
import moment from 'moment';

class DatePicker extends Component{
  clickedInside = false;
  clickTimeout = null;
  input = null;

  componentWillMount(){
    if(this.props.value)
      this.dayClick(this.props.value);
    this.setState({ active: false });
  }

  componentWillUnmount = () => {
    clearTimeout(this.clickTimeout);
  }

  activate = () => {
    this.setState({active: true});
  }

  deactivate = () => {
    if(!this.clickedInside){
      this.setState({active: false});
    } else {
      this.input.focus();
    }
  }

  mouseDown = () => {
    this.clickedInside = true;
    // The input's onBlur method is called from a queue right after onMouseDown event.
    // setTimeout adds another callback in the queue, but is called later than onBlur event
    this.clickTimeout = setTimeout(() => {
      this.clickedInside = false;
    }, 0);
  }

  dayClick = (day) => {
    const { name, dispatch } = this.props;
    let d = moment(day).format('YYYY-MM-DD');
    dispatch(actions.change(name, d));
    if(this.input)
      this.input.blur();
  }

  render() {
    const { active } = this.state;
    return (
      <div className={`datepicker ${(active ? 'active' : '')}`} onMouseDown={this.mouseDown}>
        <input type="text" {...this.props}
          onFocus={this.activate}
          onBlur={this.deactivate}
          ref={el=>{this.input=el;}}
          />
        <DayPicker onDayClick={this.dayClick} />
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
