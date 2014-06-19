@Props.module 'PropsApp', (PropsApp, App, Backbone, Marionette, $, _) ->
  class PropsApp.Router extends Marionette.AppRouter
    appRoutes:
      'props' : 'index'

  API =
    list: (options) ->
      new PropsApp.List.Controller options

    index: ->
      new PropsApp.List.Controller
        show_header: true

  App.addInitializer ->
    new PropsApp.Router
      controller: API

  App.commands.setHandler 'props:list', (props, region) ->
    API.list
      props: props
      region: region

