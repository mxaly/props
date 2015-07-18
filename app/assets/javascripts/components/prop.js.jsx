import React from 'react';
import PropReceiversComponent from './prop-receivers';
import VoteComponent from './vote';
import moment from 'moment';

export default React.createClass({
  propTypes: {
    prop: React.PropTypes.object.isRequired,
  },

  onUpVote() {
    this.props.prop.upvote();
  },

  render() {
    const propser = this.props.prop.get('propser');
    const propserUrl = `#users/${propser ? propser.id : ''}`;
    const propserAvatar = propser ? propser.avatar_url : '';
    const createdAt = moment(this.props.prop.get('created_at')).fromNow();

    return (
      <div className="row list-group-item props-list-item">
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
                  onUpvote={this.onUpVote}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  },
});
