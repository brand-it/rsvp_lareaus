import React from "react"
import PropTypes from "prop-types"

class NumberElementFlipper extends React.Component {
  renderNumber(number) {
    return (<li key={number} className="number">
      <a>
        <div className="up">
          <div className="shadow"></div>
          <div className="inn">{number}</div>
        </div>
        <div className="down">
          <div className="shadow"></div>
          <div className="inn">{number}</div>
        </div>
      </a>
    </li>)
  }

  move(className, fn) {
    let num = 0
    let ele = null
    return () => {
      const element = ele || (ele = this.$$(`${className} > li`))

      this.clearFilpClock(className)
      element[num].className = 'flip-clock-before'

      if (num === element.length - 1) {
        element[0].className = 'flip-clock-active'
        num = 0
        fn && fn()
        return
      }

      element[num + 1].className = 'flip-clock-active'
      num = num + 1
    }
  }

  renderNumbers() {
    var numbers = []
    for (var i = 0; i < this.props.totalNumbers; ++i) {
      numbers.push(this.renderNumber(i))
    }
    return numbers
  }

  render () {
    return(
      <ul className='flip play'>
        {this.renderNumbers()}
      </ul>
    );
  }
}

NumberElementFlipper.propTypes = {
  name: PropTypes.string.isRequired,
  totalNumbers: PropTypes.number.isRequired
};
export default NumberElementFlipper
