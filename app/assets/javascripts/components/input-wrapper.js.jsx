var React = require("react");
var classNames = require('classnames');

var InputWrapperComponent = React.createClass({
  render: function() {
    var classes = classNames({
      'form-group': true,
      'has-error': !!this.props.errors
    });
    var errors = this.props.errors;
    var errorsList = errors ? errors.map(function(error){
      return(
        <span className="help-block error" key={error}>
          {error}
        </span>
      )
    }) : null;
    return(
      <div className={classes}>
        {this.props.children}
        {errorsList}
      </div>
  )}
});

module.exports = InputWrapperComponent;
