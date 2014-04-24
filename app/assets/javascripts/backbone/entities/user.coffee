@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Entities.Model
    defaults:
      name: ''
      email: ''

  class Entities.Users extends Entities.Collection
    model: Entities.User
    url: Routes.api_users_path()

  API =
    getCurrentUser: ->
      @current_user ||= new Entities.User gon.current_user

    getUsers: ->
      users = new Entities.Users
      users.fetch()
      users

  App.reqres.setHandler 'current_user:entity', ->
    API.getCurrentUser()

  App.reqres.setHandler 'user:entities', ->
    API.getUsers()

