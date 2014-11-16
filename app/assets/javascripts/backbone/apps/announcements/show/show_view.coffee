@Props.module 'AnnouncementsApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'announcements/show/layout'
    className: 'announcement-screen'
    ui:
      content: '.announcement-screen'

    fade: ->
      @$el.addClass('animated fadeOut')
      _.delay =>
        @destroy()
      , 1000

    serializeData: ->
      props_count: @props_count

    initialize: (options) ->
      @props_count = options.props_count
