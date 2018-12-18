import React from "react"
import PropTypes from "prop-types"
import NumberElementFlipper from "./NumberElementFlipper";
import CountDownNumberDivider from "./CountDownNumberDivider";

class CountDownClock extends React.Component {

  flippers() {
    return (document.querySelectorAll('.flip-clock-wrapper .time-container'))
  }

  getParsedDate() {
    // This order matches up to the order that the elements display on the page
    // if they get out of order or one of them is missing from the page. things will get weird
    var parsedDate = {
      yearsLeft: {},
      daysLeft: {},
      hoursLeft: {},
      minutesLeft: {},
      secondsLeft: {}
    }
    var secondsRemaining = (Date.parse(new Date(this.props.date)) - Date.parse(new Date())) / 1000

    parsedDate.yearsLeft = this.yearsLeft(secondsRemaining)

    parsedDate.daysLeft = this.daysLeft(secondsRemaining, parsedDate.yearsLeft)

    parsedDate.hoursLeft = this.hoursLeft(
      secondsRemaining, parsedDate.yearsLeft, parsedDate.daysLeft
    )

    parsedDate.minutesLeft = this.minutesLeft(
      secondsRemaining, parsedDate.yearsLeft, parsedDate.daysLeft, parsedDate.hoursLeft
    )

    parsedDate.secondsLeft = this.secondsLeft(
      secondsRemaining, parsedDate.yearsLeft, parsedDate.daysLeft,
      parsedDate.hoursLeft, parsedDate.minutesLeft
    )
    return parsedDate
  }

  splitNumber(number) {
    let numbers = []
    let numberToString = number.toString();
    if (numberToString.length === 1) {
      numbers.push(0)
      numbers.push(+numberToString.charAt(0))
    } else {
      numbers.push(+numberToString.charAt(0))
      numbers.push(+numberToString.charAt(1))

    }

    return numbers;
  }

  flip() {
    setInterval(() => {
      let parsedDate = this.getParsedDate();
      let flippers = this.flippers();
      let objectIndex = 0;
      // offset if we are missing years days and so on from the ui
      let indexStartAt = (5 - flippers.length);
      for (const key in parsedDate) {
        if (parsedDate.hasOwnProperty(key) && objectIndex >= indexStartAt) {
          const date = parsedDate[key];
          const flipper = flippers[objectIndex - indexStartAt];
          const flips = flipper.querySelectorAll('.flip')
          const numbers = this.splitNumber(date[Object.keys(date)[0]])
          for (let index = 0; index < flips.length; index++) {
            const flip = flips[index];
            let oldFlip = flip.getElementsByClassName('flip-clock-active')[0]
            const beforeFlip = flip.getElementsByClassName('flip-clock-before')[0]
            if (oldFlip === undefined) {
              oldFlip = flip.children[0]
            }
            const newFlip = flip.children[numbers[index]];
            if (newFlip !== undefined && !newFlip.classList.contains('flip-clock-active')) {
              newFlip.classList.add('flip-clock-active')
              if (beforeFlip !== undefined) {
                beforeFlip.classList.remove('flip-clock-before')
              }
              if (oldFlip != newFlip) {
                oldFlip.classList.add('flip-clock-before')
                oldFlip.classList.remove('flip-clock-active')
              }

            }
          }
        }
        objectIndex++;
      }
    }, 1000)
  }

  secondsLeft(seconds, yearsLeft, daysLeft, hoursLeft, minutesLeft) {
    seconds -= (yearsLeft.seconds + daysLeft.seconds + hoursLeft.seconds + minutesLeft.seconds)
    return({
      seconds: seconds,
      seconds: seconds
    })
  }

  minutesLeft(seconds, yearsLeft, daysLeft, hoursLeft) {
    seconds -= (yearsLeft.seconds + daysLeft.seconds + hoursLeft.seconds)
    if (seconds >= 60) {
      let minutes = Math.floor(seconds / 60)
      return ({
        minutes: minutes,
        seconds: (minutes * 60)
      })
    }
    return ({ minutes: 0, seconds: 0 })
  }

  hoursLeft(seconds, yearsLeft, daysLeft) {
    seconds -= (yearsLeft.seconds + daysLeft.seconds)
    if (seconds >= 3600) {
      let hours = Math.floor(seconds / 3600)
      return ({
        hours: hours,
        seconds: (hours * 3600)
      })
    }
    return ({ hours: 0, seconds: 0 })
  }

  daysLeft(seconds, yearsLeft) {
    seconds -= yearsLeft.seconds
    if (seconds >= 86400) {
      let days = Math.floor(seconds / 86400)
      return({
        days: days,
        seconds: (days * 86400)
      })
    }
    return({ days: 0, seconds: 0 })
  }

  yearsLeft(seconds) {
    if (seconds >= (365.25 * 86400)) {
      let years = Math.floor(seconds / (365.25 * 86400))
      return({
        years: years,
        seconds: (365.25 * 86400 * years)
      })

    }
    return ({ years: 0, seconds: 0 })
  }

  componentDidMount() {
    this.flip()
  }


  render() {
    return (
      <div className="flip-clock-wrapper">
        <div className="time-container pr-3 pt-4">
          <CountDownNumberDivider type='days' label='Days' hideDots={true} />
          <NumberElementFlipper name='days-tens' totalNumbers={10} />
          <NumberElementFlipper name='days-ones' totalNumbers={10} />
        </div>

        <div className="time-container pr-3 pt-4">
          <CountDownNumberDivider type='hours' label='Hours' hideDots={false} />
          <NumberElementFlipper name='hours-tens' totalNumbers={2} />
          <NumberElementFlipper name='hours-ones' totalNumbers={10} />
        </div>
        <div className="time-container pr-3 pt-4">
          <CountDownNumberDivider type='minutes' label='Minutes' hideDots={false} />
          <NumberElementFlipper name='minutes-tens' totalNumbers={6} />
          <NumberElementFlipper name='minutes-ones' totalNumbers={10} />
        </div>

        <div className="time-container pr-3 pt-4">
          <CountDownNumberDivider type='seconds' label='Seconds' hideDots={false} />
          <NumberElementFlipper name='seconds-tens' totalNumbers={6} />
          <NumberElementFlipper name='seconds-ones' totalNumbers={10} />
        </div>

      </div>
    );
  }
}

CountDownClock.propTypes = {
  date: PropTypes.string.isRequired
};

CountDownClock.defaultProps = {
  date: new Date()
};

export default CountDownClock
