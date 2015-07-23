import React from 'react';
import PropReceiversComponent from './prop-receivers';
import VoteComponent from './vote';
import moment from 'moment';
import Actions from './../flux/props-actions';

class Prop extends React.Component {
  constructor(props) {
    super(props);
    this.onUpVote = this.onUpVote.bind(this);
  }

  onUpVote() {
    Actions.upVote(this.props.prop);
  }

  render() {
    const propser = this.props.prop.propser;
    const propserUrl = `#users/${propser ? propser.id : ''}`;
    const propserAvatar = propser ? propser.avatarUrl : '';
    const createdAt = moment(this.props.prop.created_at).fromNow();

    return (
      <div className="row list-group-item props-list-item">
        <div className="col-xs-12 prop-users">
          <a className="prop-gaver" href={propserUrl}>
            <img src= {propserAvatar}></img>
          </a>
          <i className="glyphicon glyphicon-chevron-right prop-to"></i>
          <PropReceiversComponent users={this.props.prop.users}/>
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
