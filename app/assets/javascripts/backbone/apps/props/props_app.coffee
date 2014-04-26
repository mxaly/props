@Props.module 'PropsApp', (PropsApp, App, Backbone, Marionette, $, _) ->
  class PropsApp.Router extends Marionette.AppRouter
    appRoutes:
      'props' : 'list'

  API =
    list: (prop) ->
      new PropsApp.List.Controller

  App.addInitializer ->
    new PropsApp.Router
      controller: API
