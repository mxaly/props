var PropReceiversComponent = React.createClass({
  render: function() {
    var list = this.props.users.map(function(item){
      return <PropReceiverComponent user={item} key={item.id}/>
    })
    return (
      <div>
        {list}
      </div>
    );
  }
});
