import { connect } from 'react-redux';
import { Component } from 'react';

class Main extends Component {
  html = document.getElementsByTagName('html')[0]
  render() {
    let { buildingListActive } = this.props;

    if(buildingListActive)
      this.html.classList.add('hidden-overflow');
    else
      this.html.classList.remove('hidden-overflow');

    return (
      <main id="main-app" className={buildingListActive ? 'hidden-overflow' : ''}>{this.props.children}</main>
    )
  }
}

const mapStateToProps = (state) => ({
  buildingListActive: state.buildingListActive
});

export default connect(mapStateToProps)(Main);
