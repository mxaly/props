var PropsListComponent = React.createClass({
  render: function() {
    var list = this.props.props.map(function(item){
      return <PropComponent prop={item}/>
    });
    var emptyView = "no props here";
    return(
      <div>
        {list.length > 0 ? list : emptyView}
      </div>
    )
  }
});
