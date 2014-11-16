@Props.module 'AnnouncementsApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'announcements/show/layout'
    ui:
      content: '.announcement-screen'

    fade: ->
      @ui.content.addClass('animated fadeOut')

    serializeData: ->
      props_count: @props_count

    initialize: (options) ->
      @props_count = options.props_count
