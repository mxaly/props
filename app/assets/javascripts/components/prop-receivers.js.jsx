import React from 'react';
import PropReceiverComponent from './prop-receiver';

class PropReceivers extends React.Component {
  render() {
    const list = this.props.users.map((item) => {
      return <PropReceiverComponent user={item} key={item.id}/>;
    });

    return (<div>{list}</div>);
  }
}

PropReceivers.propTypes = {
  users: React.PropTypes.array.isRequired,
};

export default PropReceivers;
