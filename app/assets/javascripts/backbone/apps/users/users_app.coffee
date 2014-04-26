@Props.module 'UsersApp', (UsersApp, App, Backbone, Marionette, $, _) ->
  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      'users/:id': 'show'
      'users':     'list'

  API =
    list: () ->
      new UsersApp.List.Controller

    show: (id, user) ->
      new UsersApp.Show.Controller
        id: id
        user: user

  App.addInitializer ->
    new UsersApp.Router
      controller: API
