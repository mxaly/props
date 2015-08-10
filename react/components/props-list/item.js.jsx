import React from 'react';
import moment from 'moment';

import Actions from './../../flux/props-actions';

import VoteComponent from './vote';
import UserComponent from './user';

class Prop extends React.Component {
  constructor(props) {
    super(props);
    this.onUpVote = this.onUpVote.bind(this);
  }

  onUpVote() {
    Actions.upVote(this.props.prop);
  }


  render() {
    const createdAt = moment(this.props.prop.created_at).fromNow();
    const receivers = this.props.prop.users.map((receiver) => {
      return <UserComponent user={receiver} key={receiver.id}/>;
    });

    return (
      <div className="row list-group-item props-list-item">
        <div className="col-xs-12 prop-users">
          <UserComponent user={this.props.prop.propser}/>
          <i className="glyphicon glyphicon-chevron-right prop-to"></i>
          {receivers}
          <div className="col-xs-12 prop-content">
            <p className="lead prop-body">
              {this.props.prop.body}
            </p>
            <div className="row">
              <div className="col-xs-12 prop-footer">
                <div className="prop-create-at pull-left">
                  {createdAt}
                </div>
                <VoteComponent
                  upvotesCount={this.props.prop.upvotesCount}
                  isUpvotePossible={this.props.prop.isUpvotePossible}
                  onUpvote={this.onUpVote}
                  upVoting={this.props.prop.upVoting}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

Prop.propTypes = {
  prop: React.PropTypes.object.isRequired,
};

export default Prop;
