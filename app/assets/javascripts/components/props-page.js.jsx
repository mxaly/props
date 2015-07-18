import React from 'react';
import NewPropFormComponent from './new-prop-form';
import PropsListComponent from './props-list';

export default React.createClass({
  propTypes: {
    props: React.PropTypes.object.isRequired,
    users: React.PropTypes.object.isRequired,
    showForm: React.PropTypes.bool,
  },

  onPropCreated() {
    this.props.props.fetch();
  },

  render() {
    const form = (
      <NewPropFormComponent
        users={this.props.users}
        onPropCreated={this.onPropCreated}
      />
    );

    return (
      <div>
        {this.props.showForm ? form : null}
        <PropsListComponent props={this.props.props}/>
      </div>
    );
  },
});
