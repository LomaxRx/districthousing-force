import { Component } from 'react';
import { connect } from 'react-redux';

class FormSection extends Component {
  el = null;
  inView = () => {
    if(!this.el) return;
    let el = this.el;
    let { dispatch, id } = this.props;
    let top = el.getBoundingClientRect().top - 10;
    let bottom = this.el.offsetHeight + 20;

    if(top < 0 && top > -bottom){
      dispatch({
        type: 'SET_IN_VIEW_SECTION',
        id: '#'+id
      });
    }
  }

  render() {
    this.inView();
    return (
      <section {...this.props} ref={(el)=>{this.el=el;}}></section>
    )
  }
}

const mapStateToProps = (state) => ({
  scrollPosition: state.scrollPosition
});

export default connect(mapStateToProps)(FormSection);
