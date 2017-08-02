import { Component } from 'react';
import { connect } from 'react-redux';
import { actions } from 'react-redux-form';
import { models } from '../initialState';
import { getIndex } from '../utils';


class SelectedBuilding extends Component {
  removeBuildingFromForm = () => {
    let { dispatch, index } = this.props;
    dispatch({
      type: 'REMOVE_BUILDING',
      index
    });
    //dispatch(actions.remove('formData.housing_forms', index));
  }

  render(){
    let { name, index, fetchingBuilding } = this.props.building;
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

const mapStateToSelectedBuilding = (state) => ({
  fetchingBuilding: state.fetchingBuilding
});

SelectedBuilding = connect(mapStateToSelectedBuilding)(SelectedBuilding);

class Building extends Component {

  addBuildingToForm = () => {
    const { dispatch, building } = this.props;
    dispatch({
      type: 'SELECT_BUILDING',
      building
    });
    //dispatch(actions.push('formData.housing_forms', building ));
  }

  render(){
    let {
      name, application_fee, application_info,
      bedrooms_open, bedrooms_offered, address,
      building_phone, company_phone, wait_length,
      waitlist_open, waitlist_closed_until,
      eligibility, required_proofs, id
    } = this.props.building;

    let { selectedBuildings } = this.props;

    if(getIndex(selectedBuildings, id)!==false) return null;

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
  selectedBuildings: state.selectedBuildings
});

Building = connect(mapStateToBuildingProps)(Building);

class BuildingList extends Component{
  filterBuildings = () => {
    let { buildings, eligibility: { age, mobility_impairment, disability, rooms_requested }} = this.props;
    let filtered = buildings.filter(function(b){

      if(!b.eligibility.rooms_available) return false;
      if(!mobility_impairment && age < 62 && b.eligibility.mobility_impairment===true) return false;
      if(!disability && b.eligibility.disability===true) return false;
      if(b.eligibility.minimum_age_with_disability){
        if(disability && age < b.eligibility.minimum_age_with_disability) return false;
      }
      if(b.eligibility.minimum_age_without_disability){
        if(!disability && age < b.eligibility.minimum_age_without_disability) return false;
      }
      if(rooms_requested!='' && rooms_requested!==null){
        if(b.eligibility.rooms_available.indexOf(rooms_requested)==-1) return false;
      }

      return true;
    });

    return filtered;
  }

  setElig = (fieldName, value) => {
    let { dispatch } = this.props;
    dispatch({
      type: 'SET_ELIGIBILITY',
      name: fieldName,
      value
    });
  }

  closeBuildingList = () => {
      let { dispatch } = this.props;
      dispatch({type: 'DEACTIVATE_BUILDING_LIST'});
  }

  render(){
    let { buildingListActive, selectedBuildings, eligibility: { mobility_impairment, disability, age, rooms_requested} } = this.props;
    let buildings = this.filterBuildings();
    return (
      <div id="building-list" className={buildingListActive ? 'container active' : 'container'}>
        <button onClick={this.closeBuildingList} className="close-button">X</button>
        <div className="eligibility">
          <h6>Filter by</h6>
          <div className="eligibility-inputs row">
            <div className="field col-md-3">
              <label>Mobility Impairment</label>
              <input type="checkbox" value={mobility_impairment} onChange={(e)=>{this.setElig('mobility_impairment', e.target.value);}} />
            </div>
            <div className="field col-md-3">
              <label>Disability</label>
              <input type="checkbox" value={disability} onChange={(e)=>{this.setElig('disability', e.target.value);}} />
            </div>
            <div className="field col-md-3">
              <label>Age</label>
              <input type="text" value={age} onChange={(e)=>{this.setElig('age', e.target.value);}}/>
            </div>
            <div className="field col-md-3">
              <label>Rooms Needed</label>
              <select onChange={(e)=>{this.setElig('rooms_requested', e.target.value);}}>
                <option value="" selected={rooms_requested==""||rooms_requested==null}></option>
                <option value="1" selected={rooms_requested=="1"}>1</option>
                <option value="2" selected={rooms_requested=="2"}>2</option>
                <option value="3" selected={rooms_requested=="3"}>3</option>
                <option value="4" selected={rooms_requested=="4"}>4</option>
                <option value="5" selected={rooms_requested=="5"}>5</option>
              </select>
            </div>
          </div>
        </div>
        <div className="row column-wrapper">
          <div className="col-md-9 building-options">
            <div className="row">
              {buildings.map((b,j)=>(
                <Building building={b}/>
              ))}
            </div>
          </div>
          <div className="col-md-3 selected-buildings">
            <h6>Selected</h6>
            <div className="row">
              {selectedBuildings.map((s,i)=>(
                <SelectedBuilding index={i} building={s} />
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  buildings: state.buildings,
  eligibility: state.eligibility,
  selectedBuildings: state.selectedBuildings,
  buildingListActive: state.buildingListActive
});

export default connect(mapStateToProps)(BuildingList);
