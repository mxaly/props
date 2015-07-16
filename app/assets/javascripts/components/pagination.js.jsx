var React = require("react");

var PaginationComponent = React.createClass({
  render: function() {
    var prevButton =
      <a className="previous-page" href="#" onClick={this.props.onPrevPageClick}>Previous</a>
    var nextButton =
      <a className="next-page" href="#" onClick={this.props.onNextPageClick}>Next</a>
    return (
      <div>
        <nav>
          <ul className="pagination">
            <li>
              {this.props.hasPreviousPage ? prevButton : null}
            </li>
            <li>
              <a href="#">{this.props.currentPage}</a>
            </li>
            <li>
              {this.props.hasNextPage ? nextButton : null}
            </li>
          </ul>
        </nav>
      </div>
    );
  }
});

module.exports = PaginationComponent;
