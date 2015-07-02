var PropReceiversComponent = React.createClass({
  render: function() {
    var list = this.props.users.map(function(item){
      return <PropReceiverComponent user={item} />
    })
    return (
      <div>
        {list}
      </div>
    );
  }
});
