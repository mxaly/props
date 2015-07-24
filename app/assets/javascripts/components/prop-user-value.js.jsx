import React from 'react';

class Value extends React.Component {

  blockEvent(event) {
    event.stopPropagation();
  }

  handleOnRemove(event) {
    if (!this.props.disabled) {
      this.props.onRemove(event);
    }
  }

  render() {
    const obj = this.props.option;
    const handleOnRemove = this.handleOnRemove.bind(this);

    return (
      <div className="Select-item">
        <span className="Select-item-icon"
          onMouseDown={this.blockEvent}
          onClick={handleOnRemove}
          onTouchEnd={handleOnRemove}>&times;</span>
        <span className="Select-item-label">
          <img className="user-small-face__value" src={obj.avatarUrl}></img>
          {obj.label}
        </span>
      </div>
    );
  }
}

Value.propTypes = {
  disabled: React.PropTypes.bool,                   // disabled prop passed to ReactSelect
  onOptionLabelClick: React.PropTypes.func,         // method to handle click on value label
  onRemove: React.PropTypes.func,                   // method to handle remove of that value
  option: React.PropTypes.object.isRequired,        // option passed to component
  optionLabelClick: React.PropTypes.bool,           // indicates if onOptionLabelClick should be handled
  renderer: React.PropTypes.func                    // method to render option label passed to ReactSelect
};

export default Value;
