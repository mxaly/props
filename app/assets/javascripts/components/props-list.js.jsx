var PropsListComponent = React.createClass({

  componentWillMount: function() {
    var list = this.props.props;
    list.bind('change', this.onChange);
    list.bind('add', this.onChange);
    list.bind('remove', this.onChange);
    return this.setState({
      currentPage: list.state.currentPage,
      list: list
    });
  },

  resetState: function(){
    this.setState({list: this.state.list});
  },

  onNextPage: function(e) {
    e.preventDefault();
    var _this = this;
    this.state.list.getNextPage({
      success: _this.resetState
    });
  },

  onPrevPage: function(e) {
    e.preventDefault();
    var _this = this;
    this.state.list.getPreviousPage({
      success: _this.resetState.bind(_this)
    });
  },

  onChange: function() {
    this.setState(this.props.props);
  },

  render: function() {
    var list = this.state.list.map(function(item){
      return <PropComponent prop={item} key={item.id}/>
    });
    var emptyView = "no props here";
    return(
      <div>
        <div>{list.length > 0 ? list : emptyView}</div>
        <PaginationComponent
          currentPage={this.state.list.state.currentPage}
          onNextPageClick={this.onNextPage}
          onPrevPageClick={this.onPrevPage}
          hasPreviousPage={this.state.list.hasPreviousPage()}
          hasNextPage={this.state.list.hasNextPage()}/>
      </div>
    )
  }
});
