var React = require("react");

var VoteComponent = React.createClass({
  render: function() {
    var ratingButton =
      <button className="btn btn-default" disabled>
        Rating +
        {this.props.upvotesCount}
      </button>

    var upvoteButton =
      <button className="btn btn-success" onClick={this.props.onUpvote}>+1</button>

    return(
      <div className="btn-group pull-right">
        { this.props.upvotesCount > 0 ? ratingButton : null }
        { this.props.isUpvotePossible ? upvoteButton : null }
      </div>
    )
  }
});

module.exports = VoteComponent;
