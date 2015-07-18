import React from 'react';
import PropReceiverComponent from './prop-receiver';

export default React.createClass({
  propTypes: {
    users: React.PropTypes.array.isRequired,
  },

  render() {
    const list = this.props.users.map((item) => {
      return <PropReceiverComponent user={item} key={item.id}/>;
    });

    return (<div>{list}</div>);
  },
});
