import propsActions from './props-actions';
import alt from './alt';
import _ from 'lodash';

class PropsStore {
  constructor() {
    this.state = {
      props: [],
      meta: {
        currentPage: 1,
      },
    };

    this.bindListeners({
      onFetched: propsActions.fetched,
      onCreated: propsActions.created,
      onUpVote: propsActions.upVote,
      onUpVoted: propsActions.upVoted,
    });
  }

  onCreated(prop) {
    this.state.props.unshift(prop);
    this.emitChange();
  }

  onUpVote(prop) {
    _.find(this.state.props, prop).upVoting = true;
    this.emitChange();
  }

  onUpVoted(data) {
    const index = _.findIndex(this.state.props, data.prop);
    this.state.props[index] = data.updateProp;
    this.emitChange();
  }

  onFetched(propsData) {
    this.setState(propsData);
    this.emitChange();
  }
}

export default alt.createStore(PropsStore, 'PropsStore');
