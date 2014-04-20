@Props.module 'HeaderApp', (HeaderApp, App, Backbone, Marionette, $, _) ->

  API =
    list: (user) ->
      new HeaderApp.List.Controller
        user: user
        region: App.headerRegion

  HeaderApp.on 'start', (user) ->
    API.list user
