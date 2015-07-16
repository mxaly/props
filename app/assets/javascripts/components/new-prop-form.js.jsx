var React = require("react");
var InputWrapperComponent = require("./input-wrapper");
var Select = require("react-select");

var NewPropFormComponent = React.createClass({
  getInitialState: function(){
    return {body: '', selectedUserIds: '', errors: {}};
  },

  componentWillMount: function(){
    var users = this.props.users;
    users.bind('sync', this.onUsersSync);
    this.setState({users: users});
  },

  onUsersSync: function(){
    this.setState({users: this.state.users});
  },

  onUsersChange: function(values){
    this.resetErrors('user_ids');
    this.setState({selectedUserIds: values});
  },

  onBodyChange: function(e){
    this.resetErrors('body');
    this.setState({body: e.target.value});
  },

  resetErrors: function(key){
    var errors = this.state.errors;
    errors[key] = null;
    this.setState({errors: errors});
  },

  onPropClick: function(){
    // when using flux, this should only fire an action but since we have bacbkone,
    // we need to handle save ant it's errors here.
    var prop = new Props.Entities.Prop;
    prop.set({user_ids: this.state.selectedUserIds, body: this.state.body})
    prop.save(null, {
      success: function() {
        this.setState(this.getInitialState());
        this.props.onPropCreated();
      }.bind(this),
      error: function(prop, error){
        this.setState({errors: error.responseJSON.errors});
      }.bind(this)
    });
  },

  mappedUsers: function(users) {
    return users.map(function(user){
      return {value: user.id, label: user.get('name')};
    });
  },

  selectedUsers: function(){
    var ids = this.state.selectedUserIds;
    if(ids.length > 0) {
      return ids.split(',').map(function(userId){
        return this.state.users._byId[userId]
      }.bind(this));
    } else{
      return [];
    }
  },

  render: function() {
    var usersData = this.mappedUsers(this.props.users);
    var selectedUsers = this.mappedUsers(this.selectedUsers());

    return(
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
        <button className="btn btn-primary" onClick={this.onPropClick}>Prop</button>
      </div>
  )}
});

module.exports = NewPropFormComponent;
