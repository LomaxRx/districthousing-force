import { Component } from 'react';
import { connect } from 'react-redux';
import Jump from 'jump.js';
import { uploadPDFsToBox } from 'apex-actions';
import { easeInOutQuad } from '../utils';

class NavSection extends Component {
  click = () => {
    const { anchor } = this.props;
    Jump(anchor, {
      easing: easeInOutQuad
    });
  }

  render() {
    const { label, inViewSection, anchor } = this.props;
    return (
      <div
        className={`nav-section ${(inViewSection==anchor ? 'in-view' : '')}`}
        onMouseDown={this.click}>
        {label}
      </div>
    )
  }
}

const mapStateToNavProps = (state) => ({
  inViewSection: state.inViewSection
});

NavSection = connect(mapStateToNavProps)(NavSection);

const PDFResult = (props) => (
  <div className='pdf-result'>
    <a href={props.url} target='_blank'>{props.building}</a>
  </div>
);

class Nav extends Component {
  openBuildingList = () => {
      let { dispatch } = this.props;
      dispatch({type: 'ACTIVATE_BUILDING_LIST'});
  }

  submit = () => {
    let { dispatch, selectedBuildings } = this.props;
    if(selectedBuildings.length===0){
      alert('Please add at least one building.');
      return;
    }
    dispatch({
      type: 'SET_QUEUE',
      queue: selectedBuildings
    });
  }

  uploadToBox = () => {
    let { dispatch } = this.props;
    dispatch({type:'SET_STATUS', status: 'FETCHING'});
    uploadPDFsToBox();
  }

  render(){
    let { failed, status, fetching, selectedBuildings } = this.props;
    return(
      <nav>
        <div className="nav-sections-wrapper">
          <div className="nav-sections">
            <NavSection
              anchor='#contact_information'
              label='General'/>
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
            <NavSection
              anchor='#contacts'
              label='Contacts'/>
          </div>
        </div>
        {status=='READY' &&
          <button onClick={this.openBuildingList}>Add Buildings</button>
        }
        {status=='READY' &&
          <button onClick={this.submit} className={selectedBuildings.length===0 ? 'disabled' : ''}>Submit</button>
        }
        {status=='FETCHING' &&
          <div className="fetching">
            <div className="fetching-which">
              generating pdf for <b>{fetching.name}</b>...
            </div>
            <div className="spinner">
              <div className="rect1"></div>
              <div className="rect2"></div>
              <div className="rect3"></div>
              <div className="rect4"></div>
              <div className="rect5"></div>
            </div>
          </div>
        }
        {status=='PDFS_READY' &&
          <button onClick={this.uploadToBox}>Upload to Box</button>
        }
        {status=='COMPLETE' &&
          <h3>Done.</h3>
        }
        <div className='failures'>
          {failed.map((f,i)=>(
            <div className='failure'>
              <em>failed to generate pdf for <b>{f.building.name}</b></em>
              <p className="error-msg">
                {f.status}
              </p>
            </div>
          ))}
        </div>
      </nav>
    )
  }
}

const mapStateToProps = (state) => ({
  status: state.status,
  failed: state.failed,
  selectedBuildings: state.selectedBuildings,
  fetchQueue: state.fetchQueue,
  fetching: state.fetching
});

export default connect(mapStateToProps)(Nav);
