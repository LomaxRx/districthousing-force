import { Component } from 'react';
import Jump from 'jump.js';
import { easeInOutQuad } from '../utils';

class NavSection extends Component {
  click = () => {
    const { anchor } = this.props;
    Jump(anchor, {
      easing: easeInOutQuad
    });
  }

  render() {
    const { label } = this.props;
    return (
      <div
        className="nav-section"
        onMouseDown={this.click}>
        {label}
      </div>
    )
  }
}

export default class Nav extends Component {
  render(){
    return(
      <nav>
        <div className="nav-sections-wrapper">
          <div className="nav-sections">
            <NavSection
              anchor='#contact_information'
              label='Contact'/>
            <NavSection
              anchor='#addresses'
              label='Addresses'/>
            <NavSection
              anchor='#household_members'
              label='Household'/>
            <NavSection
              anchor='#incomes'
              label='Income'/>
            <NavSection
              anchor='#employments'
              label='Employment'/>
            <NavSection
              anchor='#criminal_histories'
              label='Record'/>
          </div>
        </div>
        <button>Submit</button>
      </nav>
    )
  }
}
