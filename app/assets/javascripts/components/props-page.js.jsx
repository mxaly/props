var PropsPageComponent = React.createClass({
  onPropCreated: function() {
    this.props.props.fetch();
  },

  render: function() {
    return(
      <div>
        {this.props.showForm ? <NewPropFormComponent users={this.props.users} onPropCreated={this.onPropCreated}/> : null}
        <PropsListComponent props={this.props.props}/>
      </div>
    )
  }
});
