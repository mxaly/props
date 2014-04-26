@Props.module 'PropsApp', (PropsApp, App, Backbone, Marionette, $, _) ->
  class PropsApp.Router extends Marionette.AppRouter
    appRoutes:
      'props' : 'list'

  API =
    list: (options) ->
      new PropsApp.List.Controller options

  App.addInitializer ->
    new PropsApp.Router
      controller: API

  App.commands.setHandler 'props:list', (props, region) ->
    API.list
      props: props
      region: region

