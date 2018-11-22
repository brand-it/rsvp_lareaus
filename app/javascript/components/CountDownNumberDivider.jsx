import React from "react"
import PropTypes from "prop-types"
class CountDownNumberDivider extends React.Component {

  renderDots() {
    if (this.props.hideDots) { return }
    return(
      <React.Fragment>
        <div className="flip-clock-dot top"></div>
        <div className="flip-clock-dot bottom"></div>
      </React.Fragment>
    )
  }

  render () {
    return (
      <div className={"flip-clock-divider " + this.props.type}>
        <div className="flip-clock-label lucida-console text-white">{this.props.label}</div>
        {this.renderDots()}
      </div>
    );
  }
}

CountDownNumberDivider.propTypes = {
  type: PropTypes.string.isRequired,
  label: PropTypes.string,
  hideDots: PropTypes.bool.isRequired
};
export default CountDownNumberDivider
