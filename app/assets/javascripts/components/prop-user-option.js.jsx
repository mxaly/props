import React from 'react';

class Option extends React.Component {

  render() {
    const obj = this.props.option;
    console.log(obj);
    return (
      <div
        className={this.props.className}
        onMouseEnter={this.props.mouseEnter}
        onMouseLeave={this.props.mouseLeave}
        onMouseDown={this.props.mouseDown}
        onClick={this.props.mouseDown}>
        <img className="user-small-face" src={obj.avatarUrl}></img>
        <span>{obj.value}</span>
      </div>
    );
  }
}

Option.propTypes = {
  addLabelText: React.PropTypes.string,
  className: React.PropTypes.string,
  mouseDown: React.PropTypes.func,
  mouseEnter: React.PropTypes.func,
  mouseLeave: React.PropTypes.func,
  option: React.PropTypes.object.isRequired,
  renderFunc: React.PropTypes.func,
};

export default Option;
