import React from 'react';

class Option extends React.Component {

  render() {
    const obj = this.props.option;
    return (
      <div
        className={this.props.className}
        onMouseEnter={this.props.mouseEnter}
        onMouseLeave={this.props.mouseLeave}
        onMouseDown={this.props.mouseDown}
        onClick={this.props.mouseDown}>
        <img className="user-small-face" src={obj.avatarUrl}></img>
        <span>{obj.label}</span>
      </div>
    );
  }
}

Option.propTypes = {
  addLabelText: React.PropTypes.string,               // string rendered in case of allowCreate option passed to ReactSelect
  className: React.PropTypes.string,                  // className (based on mouse position)
  mouseDown: React.PropTypes.func,                    // method to handle click on option element
  mouseEnter: React.PropTypes.func,                   // method to handle mouseEnter on option element
  mouseLeave: React.PropTypes.func,                   // method to handle mouseLeave on option element
  option: React.PropTypes.object.isRequired,          // object that is base for that option
  renderFunc: React.PropTypes.func                    // method passed to ReactSelect component to render label text
};

export default Option;
