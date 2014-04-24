@Props.module 'UsersApp', (UsersApp, App, Backbone, Marionette, $, _) ->
  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      'users' : 'list'

  API =
    list: (user) ->
      new UsersApp.List.Controller

  App.addInitializer ->
    new UsersApp.Router
      controller: API
