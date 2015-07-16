var React = require("react");
var PropReceiversComponent = require("./prop-receivers");
var VoteComponent = require("./vote");

var PropComponent = React.createClass({
  upVote: function() {
    this.props.prop.upvote();
  },

  render: function() {
    var propser = this.props.prop.get('propser');
    var propserUrl = '#users/' + (propser ? propser.id : '');
    var propserAvatar = propser ? propser.avatar_url : '';
    var createdAt = moment(this.props.prop.get('created_at')).fromNow();
    return(
      <div className="row">
        <div className="col-xs-12 prop-users">
            <a className="prop-gaver" href={propserUrl}>
              <img src= {propserAvatar}></img>
            </a>
            <i className="glyphicon glyphicon-chevron-right prop-to"></i>
            <PropReceiversComponent users={this.props.prop.get('users')}/>
          <div className="col-xs-12 prop-content">
            <p className="lead prop-body">
              {this.props.prop.get('body')}
            </p>
            <div className="row">
              <div className="col-xs-12 prop-footer">
                <div className="prop-create-at pull-left">
                  {createdAt}
                </div>
                <VoteComponent
                  upvotesCount={this.props.prop.get('upvotes_count')}
                  isUpvotePossible={this.props.prop.get('is_upvote_possible')}
                  onUpvote={this.upVote}
                />
              </div>
          </div>
        </div>
      </div>
    </div>
  )}
});

module.exports = PropComponent;
