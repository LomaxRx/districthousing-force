import { Component } from 'react';
import { connect } from 'react-redux';


class Overlay extends Component {
  closeBuildingList = () => {
      let { dispatch } = this.props;
      dispatch({type: 'DEACTIVATE_BUILDING_LIST'});
  }

  render(){
    let { active } = this.props;
    return (
      <div id="overlay"
        className={active ? 'active' : ''}
        onClick={this.closeBuildingList}></div>
    );
  }
}

const mapStateToProps = (state) => ({
  active: state.buildingListActive
});

export default connect(mapStateToProps)(Overlay);
