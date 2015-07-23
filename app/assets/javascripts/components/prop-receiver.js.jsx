import React from 'react';

class PropReceiver extends React.Component {
  render() {
    const reveiverUrl = `#users/${this.props.user.id}`;
    return (
      <a className="props-receiver-avatar" href={reveiverUrl}>
        <img src={this.props.user.avatarUrl} title={this.props.user.name}/>
      </a>
    );
  }
}

PropReceiver.propTypes = {
  user: React.PropTypes.object.isRequired,
};

export default PropReceiver;
