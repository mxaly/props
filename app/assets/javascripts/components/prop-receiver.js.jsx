var PropReceiverComponent = React.createClass({
  render: function() {
    return (
      <a className="props-receiver-avatar" href={'#users/' + this.props.user.id}>
        <img src={this.props.user.avatar_url} title={this.props.user.name}/>
      </a>
    );
  }
});
