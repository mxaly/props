import propsActions from './props-actions';
import alt from './alt';
import _ from 'lodash';

class PropsStore {
  constructor() {
    this.state = {
      errors: {},
      users: [],
      body: '',
      selectedUserIds: '',
      creating: false,
    };

    this.bindListeners({
      onUsersFetched: propsActions.usersFetched,
      onCreate: propsActions.create,
      onCreated: propsActions.created,
      onCreateError: propsActions.createError,
    });
  }

  onCreate(prop) {
    this.setState(prop);
    this.setState({creating: true});
    this.emitChange();
  }

  onCreated() {
    this.setState({body: '', selectedUserIds: '', creating: false});
    this.emitChange();
  }

  onCreateError(data) {
    this.setState({errors: data.errors, creating: false});
    this.emitChange();
  }

  onUsersFetched(users) {
    this.setState({users: users});
    this.emitChange();
  }
}

export default alt.createStore(PropsStore, 'PropFormStore');
