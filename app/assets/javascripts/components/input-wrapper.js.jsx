import React from 'react';
import classNames from 'classnames';

export default React.createClass({
  propTypes: {
    errors: React.PropTypes.array,
    children: React.PropTypes.object.isRequired,
  },

  render() {
    const classes = classNames({
      'form-group': true,
      'has-error': !!this.props.errors,
    });
    const errors = this.props.errors;
    const errorsList = errors ? errors.map((error) => {
      return (<span className="help-block error" key={error}>{error}</span>);
    }) : null;

    return (
      <div className={classes}>
        {this.props.children}
        {errorsList}
      </div>
    );
  },
});
