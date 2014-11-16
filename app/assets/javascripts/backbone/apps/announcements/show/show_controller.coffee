@Props.module 'AnnouncementsApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: (options) ->
      count = App.request 'props:total'
      @layout = @getLayoutView(count)

      @listenTo @layout, 'show', @fadeLayout

      @show @layout

    getLayoutView: (props_count) ->
      new Show.Layout(props_count: props_count)

    fadeLayout: ->
      _.delay =>
        @layout.fade()
      , 1500
