import { Component } from 'react';
import { connect } from 'react-redux';
import { actions } from 'react-redux-form';
import { models } from '../initialState';
import { getIndex } from '../utils';


class SelectedBuilding extends Component {
  removeBuildingFromForm = () => {
    let { dispatch, index } = this.props;
    dispatch(actions.remove('formData.housing_forms', index));
  }

  render(){
    let { name, index } = this.props.building;
    return (
      <div className="selected-building-wrapper">
        <div className="selected-building">
          <h4>{name}</h4>
          <button className="remove-selected-building remove-button" onClick={this.removeBuildingFromForm}>X</button>
        </div>
      </div>
    );
  }
}

SelectedBuilding = connect()(SelectedBuilding);

class Building extends Component {

  addBuildingToForm = () => {
    const { dispatch, building } = this.props;
    dispatch(actions.push('formData.housing_forms', building ));
  }

  render(){
    let {
      name, application_fee, application_info,
      bedrooms_open, bedrooms_offered, address,
      building_phone, company_phone, wait_length,
      waitlist_open, waitlist_closed_until,
      eligibility, required_proofs, id
    } = this.props.building;

    let { housing_forms } = this.props;

    if(getIndex(housing_forms, id)!==false) return null;

    return (
      <div className="building col-md-4" onClick={this.addBuildingToForm}>
        <div className="building-details">
          <h3>{name}</h3>
          <div className="building-detail">
            <label>Address</label>
            <p>{address}</p>
          </div>
          <div className="building-detail">
            <label>Building Phone</label>
            <p>{building_phone}</p>
          </div>
          <div className="more-details">
            <div className="building-detail">
              <label>Bedrooms Open</label>
              <p>{bedrooms_open}</p>
            </div>
            <div className="building-detail">
              <label>Waitlist Open</label>
              <p>{waitlist_open}</p>
            </div>
            <div className="building-detail">
              <label>Waitlist Closed Until</label>
              <p>{waitlist_closed_until}</p>
            </div>
            <div className="building-detail">
              <label>Wait Length</label>
              <p>{wait_length}</p>
            </div>
            <div className="building-detail">
              <label>Details</label>
              <p dangerouslySetInnerHTML={{__html:application_info}}></p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

const mapStateToBuildingProps = (state) => ({
  housing_forms: state.formData.housing_forms
});

Building = connect(mapStateToBuildingProps)(Building);

class BuildingList extends Component{
  splitList = () => {
    let { buildings } = this.props;
    let list = [];
    for (let i=0,j=buildings.length; i<j; i+=3) {
      list.push(buildings.slice(i,i+3));
    }

    return list;
  }

  closeBuildingList = () => {
      let { dispatch } = this.props;
      dispatch({type: 'DEACTIVATE_BUILDING_LIST'});
  }

  render(){
    let { buildingListActive, housing_forms, buildings } = this.props;
    let list = this.splitList();
    return (
      <div id="building-list" className={buildingListActive ? 'container active' : 'container'}>
        <button onClick={this.closeBuildingList} className="close-button">X</button>
        <div className="row column-wrapper">
          <div className="col-md-9 building-options">
            <div className="row">
              {buildings.map((b,j)=>(
                <Building building={b}/>
              ))}
            </div>
          </div>
          <div className="col-md-3 selected-buildings">
            <div className="row">
              {housing_forms.map((h,i)=>(
                <SelectedBuilding index={i} building={h} />
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

// {list.map((buildings,i)=>(
//   <div className="row">
//     {buildings.map((b,j)=>(
//       <Building building={b} id={j}/>
//     ))}
//   </div>
// ))}

const mapStateToProps = (state) => ({
  buildings: state.buildings,
  buildingListActive: state.buildingListActive,
  housing_forms: state.formData.housing_forms
});

export default connect(mapStateToProps)(BuildingList);
