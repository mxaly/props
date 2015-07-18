import React from 'react';
import PropComponent from './prop';
import PaginationComponent from './pagination';

export default React.createClass({
  propTypes: {
    props: React.PropTypes.object.isRequired,
  },

  componentWillMount() {
    const list = this.props.props;
    list.bind('change', this.onResetState);
    list.bind('add', this.onResetState);
    list.bind('remove', this.onResetState);
    return this.setState({
      currentPage: list.state.currentPage,
      list: list,
    });
  },

  onResetState() {
    this.setState({list: this.state.list});
  },

  onNextPage(e) {
    e.preventDefault();
    const _this = this;
    this.state.list.getNextPage({
      success: _this.resetState,
    });
  },

  onPrevPage(e) {
    e.preventDefault();
    const _this = this;
    this.state.list.getPreviousPage({
      success: _this.resetState,
    });
  },

  render() {
    const list = this.state.list.map((item) => {
      return <PropComponent prop={item} key={item.id}/>;
    });
    const emptyView = 'no props here';

    return (
      <div>
        <div>{list.length > 0 ? list : emptyView}</div>
        <PaginationComponent
          currentPage={this.state.list.state.currentPage}
          onNextPageClick={this.onNextPage}
          onPrevPageClick={this.onPrevPage}
          hasPreviousPage={this.state.list.hasPreviousPage()}
          hasNextPage={this.state.list.hasNextPage()}/>
      </div>
    );
  },
});
