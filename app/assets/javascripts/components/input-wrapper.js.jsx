var InputWrapperComponent = React.createClass({
  render: function() {
    var cx = React.addons.classSet;
    var classes = cx({
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
