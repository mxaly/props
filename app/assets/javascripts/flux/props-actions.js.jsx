import alt from './alt';
import camelize from 'camelize';

class PropActions {
  constructor() {
    this.generateActions('created', 'fetched', 'upVoted', 'usersFetched', 'createError');
    this.perPage = 25;
  }

  fetch(page) {
    $.getJSON('api/props', {
      per_page: 25,
      page: page,
    })
      .done((data) => {
        this.actions.fetched(camelize(data));
      });
  }

  fetchUsers() {
    $.getJSON('api/users')
      .done((data) => {
        this.actions.usersFetched(camelize(data));
        this.dispatch();
      });
  }

  create(prop) {
    $.post('/api/props', {user_ids: prop.selectedUserIds, body: prop.body})
      .done((data) => {
        this.actions.created(camelize(data));
      })
      .error((response) => {
        const errors = camelize(response.responseJSON);
        this.actions.createError(errors);
      });
    this.dispatch(prop);
  }

  upVote(prop) {
    $.post(`/api/props/${prop.id}/upvotes`)
      .done((data) => {
        this.actions.upVoted({prop: prop, updateProp: camelize(data)});
      });
    this.dispatch(prop);
  }
}

export default alt.createActions(PropActions);
