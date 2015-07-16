var React = require("react");
var PropComponent = require("./prop");
var PaginationComponent = require("./pagination");

var PropsListComponent = React.createClass({

  componentWillMount: function() {
    var list = this.props.props;
    list.bind('change', this.resetState);
    list.bind('add', this.resetState);
    list.bind('remove', this.resetState);
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
      success: _this.resetState
    });
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

module.exports = PropsListComponent;
