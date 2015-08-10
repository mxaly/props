import React from 'react';

class Vote extends React.Component {
  render() {
    const ratingButton = (
      <button className="btn btn-default" disabled>
        Rating + {this.props.upvotesCount}
      </button>
    );

    const upvoteButton = (
      <button className="btn btn-success" onClick={this.props.onUpvote} disabled={this.props.upVoting}>
        {this.props.upVoting ? 'upvoting...' : '+1'}
      </button>
    );

    return (
      <div className="btn-group pull-right">
        { this.props.upvotesCount > 0 ? ratingButton : null }
        { this.props.isUpvotePossible ? upvoteButton : null }
      </div>
    );
  }
}

Vote.propTypes = {
  onUpvote: React.PropTypes.func.isRequired,
  upvotesCount: React.PropTypes.number.isRequired,
  isUpvotePossible: React.PropTypes.bool.isRequired,
  upVoting: React.PropTypes.bool,
};

export default Vote;
