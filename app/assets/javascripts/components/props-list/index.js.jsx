import React from 'react';
import PropComponent from './item';
import PaginationComponent from './../shared/pagination';

class PropsList extends React.Component {
  constructor(props) {
    super(props);

    this.onNextPage = this.onNextPage.bind(this);
    this.onPrevPage = this.onPrevPage.bind(this);
  }

  onNextPage(e) {
    e.preventDefault();
    this.props.onNextPage();
  }

  onPrevPage(e) {
    e.preventDefault();
    this.props.onPrevPage();
  }

  render() {
    const list = this.props.props.map((item) => {
      return <PropComponent prop={item} key={item.id}/>;
    });
    const emptyView = 'no props here';

    return (
      <div>
        <div>{list.length > 0 ? list : emptyView}</div>
        <PaginationComponent
          currentPage={this.props.meta.currentPage}
          onNextPageClick={this.onNextPage}
          onPrevPageClick={this.onPrevPage}
          hasPreviousPage={!!this.props.meta.prevPage}
          hasNextPage={!!this.props.meta.nextPage}/>
      </div>
    );
  }
}

PropsList.propTypes = {
  props: React.PropTypes.array.isRequired,
  onNextPage: React.PropTypes.func.isRequired,
  onPrevPage: React.PropTypes.func.isRequired,
  meta: React.PropTypes.object.isRequired,
};

export default PropsList;
