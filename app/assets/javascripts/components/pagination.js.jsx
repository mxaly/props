import React from 'react';

class Pagination extends React.Component {
  render() {
    const prevButton = (
      <a className="previous-page" href="#"
        onClick={this.props.onPrevPageClick}>Previous</a>
    );
    const nextButton = (
      <a className="next-page" href="#"
        onClick={this.props.onNextPageClick}>Next</a>
    );

    return (
      <div>
        <nav>
          <ul className="pagination">
            <li>{this.props.hasPreviousPage ? prevButton : null}</li>
            <li><a href="#">{this.props.currentPage}</a></li>
            <li>{this.props.hasNextPage ? nextButton : null}</li>
          </ul>
        </nav>
      </div>
    );
  }
}

Pagination.propTypes = {
  currentPage: React.PropTypes.number.isRequired,
  hasNextPage: React.PropTypes.bool.isRequired,
  hasPreviousPage: React.PropTypes.bool.isRequired,
  onPrevPageClick: React.PropTypes.func.isRequired,
  onNextPageClick: React.PropTypes.func.isRequired,
};

export default Pagination;
