import { Component } from 'react';
import { connect } from 'react-redux';
import Jump from 'jump.js';
import { submit } from 'apex-actions';
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

const PDFResult = (props) => (
  <div className='pdf-result'>
    <a href={props.url} target='_blank'>{props.building}</a>
  </div>
);

class Nav extends Component {
  submit = () => {
    let { formData, dispatch } = this.props;
    dispatch({type:'SET_STATUS', status: 'FETCHING'});
    submit(formData);
  }

  render(){
    let { results, status } = this.props;
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
        {status=='READY' &&
          <button onClick={this.submit}>Submit</button>
        }
        {status=='FETCHING' &&
          <div className="spinner">
            <div className="rect1"></div>
            <div className="rect2"></div>
            <div className="rect3"></div>
            <div className="rect4"></div>
            <div className="rect5"></div>
          </div>
        }
        <div className='results'>
          {results.map((r,i)=>(
            <PDFResult url={r.url} building={r.building} />
          ))}
        </div>
      </nav>
    )
  }
}

const mapStateToProps = (state) => ({
  status: state.status,
  results: state.pdfResults,
  formData: state.formData
});

export default connect(mapStateToProps)(Nav);
