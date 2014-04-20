@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Entities.Model
    defaults:
      name: ''
      email: ''

  API =
    getCurrentUser: ->
      @current_user ||= new Entities.User gon.current_user

  App.reqres.setHandler 'current_user:entity', ->
    API.getCurrentUser()

