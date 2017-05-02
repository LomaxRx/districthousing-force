import { Component } from 'react';
import { connect } from 'react-redux';

class FormSection extends Component {
  el = null;

  inView = () => {
    if(!this.el) return;

    let { dispatch, id, inViewSection } = this.props;
    id = '#' + id;

    let top = this.el.getBoundingClientRect().top - 10;
    let bottom = this.el.offsetHeight + 20;

    if(top < 0 && top > -bottom && id != inViewSection )
      dispatch({ type: 'SET_IN_VIEW_SECTION', id });
  }

  render() {
    this.inView();
    return (
      <section {...this.props} ref={(el)=>{this.el=el;}}></section>
    )
  }
}

const mapStateToProps = (state) => ({
  scrollPosition: state.scrollPosition,
  inViewSection: state.inViewSection
});

export default connect(mapStateToProps)(FormSection);
