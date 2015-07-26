import React from 'react';
import _ from 'lodash';
import Select from 'react-select';

import InputWrapperComponent from './../shared/input-wrapper';
import UserOption from './prop-user-option';
import UserValue from './prop-user-value';

import Actions from './../../flux/props-actions';
import FormStore from './../../flux/prop-form-store';

class NewPropForm extends React.Component {
  constructor(props) {
    super(props);

    this.onUsersChange = this.onUsersChange.bind(this);
    this.onBodyChange = this.onBodyChange.bind(this);
    this.onPropClick = this.onPropClick.bind(this);

    this.onChange = this.onChange.bind(this);
    this.state = FormStore.getState();
  }

  componentDidMount() {
    FormStore.listen(this.onChange);
    Actions.fetchUsers();
  }

  componentWillUnmount() {
    FormStore.unlisten(this.onChange);
  }

  onChange() {
    this.setState(FormStore.getState());
  }

  onUsersChange(values) {
    this.onResetErrors('userIds');
    this.setState({selectedUserIds: values});
  }

  onBodyChange(e) {
    this.onResetErrors('body');
    this.setState({body: e.target.value});
  }

  onPropClick() {
    const prop = {selectedUserIds: this.state.selectedUserIds, body: this.state.body};
    Actions.create(prop);
  }

  onResetErrors(key) {
    const errors = this.state.errors;
    errors[key] = null;
    this.setState({errors: errors});
  }

  getMappedUsers(users) {
    return users.map((user) => {
      return {value: user.id, label: user.name, avatarUrl: user.avatarUrl};
    });
  }

  getSelectedUsers() {
    const ids = this.state.selectedUserIds;
    if (ids.length > 0) {
      return ids.split(',').map((userId) => {
        const user = _.findWhere(this.state.users, {id: parseInt(userId, 10)});
        return user;
      });
    }

    return [];
  }

  render() {
    const usersData = this.getMappedUsers(this.state.users);
    const selectedUsers = this.getMappedUsers(this.getSelectedUsers());
    const propLabel = this.state.creating ? 'Propsing...' : 'Prop';

    return (
      <div className="jumbotron clearfix">
        <InputWrapperComponent errors={this.state.errors.userIds}>
          <Select
            optionComponent={UserOption}
            valueComponent={UserValue}
            name="user_ids"
            options={usersData}
            multi={true}
            value={selectedUsers}
            placeholder="Who do you want to prop?"
            onChange={this.onUsersChange}
          />
        </InputWrapperComponent>
        <InputWrapperComponent errors={this.state.errors.body}>
          <textarea
            className="form-control"
            rows="2"
            placeholder="What do you want to thank for?"
            value={this.state.body}
            onChange={this.onBodyChange}/>
        </InputWrapperComponent>
        <button
          className="btn btn-primary"
          onClick={this.onPropClick}
          disabled={this.state.creating}
        >{propLabel}</button>
      </div>
    );
  }
}

export default NewPropForm;
