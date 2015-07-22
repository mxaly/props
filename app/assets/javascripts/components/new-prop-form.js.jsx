import React from 'react';
import InputWrapperComponent from './input-wrapper';
import Select from 'react-select';

class NewPropForm extends React.Component {
  constructor(props) {
    super(props);

    this.onUsersSync = this.onUsersSync.bind(this);
    this.onUsersChange = this.onUsersChange.bind(this);
    this.onBodyChange = this.onBodyChange.bind(this);
    this.onPropClick = this.onPropClick.bind(this);

    props.users.bind('sync', this.onUsersSync);

    this.state = {
      body: '',
      selectedUserIds: '',
      errors: {},
      users: props.users,
    };
  }

  onUsersSync() {
    this.setState({users: this.state.users});
  }

  onUsersChange(values) {
    this.onResetErrors('user_ids');
    this.setState({selectedUserIds: values});
  }

  onBodyChange(e) {
    this.onResetErrors('body');
    this.setState({body: e.target.value});
  }

  onPropClick() {
    const prop = new Props.Entities.Prop;
    prop.set({user_ids: this.state.selectedUserIds, body: this.state.body});
    prop.save(null, {
      success: () => {
        this.setState({body: '', selectedUserIds: '', errors: {}});
        this.props.onPropCreated();
      },
      error: (_, error) => {
        this.setState({errors: error.responseJSON.errors});
      },
    });
  }

  onResetErrors(key) {
    const errors = this.state.errors;
    errors[key] = null;
    this.setState({errors: errors});
  }

  getMappedUsers(users) {
    return users.map((user) => {
      return {value: user.id, label: user.get('name')};
    });
  }

  getSelectedUsers() {
    const ids = this.state.selectedUserIds;
    if (ids.length > 0) {
      return ids.split(',').map((userId) => {
        return this.state.users._byId[userId];
      });
    }
    return [];
  }

  render() {
    const usersData = this.getMappedUsers(this.props.users);
    const selectedUsers = this.getMappedUsers(this.getSelectedUsers());

    return (
      <div className="jumbotron clearfix">
        <InputWrapperComponent errors={this.state.errors.user_ids}>
          <Select
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
        >Prop</button>
      </div>
    );
  }
}

NewPropForm.propTypes = {
  users: React.PropTypes.object.isRequired,
  onPropCreated: React.PropTypes.func.isRequired,
};

export default NewPropForm;
