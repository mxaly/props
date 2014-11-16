@Props.module 'AnnouncementsApp', (AnnouncementsApp, App, Backbone, Marionette, $, _) ->

  API =
    hide: ->
      new AnnouncementsApp.Show.Controller
        region: App.announcementsRegion

  AnnouncementsApp.on 'start', (user) ->
    API.hide()
