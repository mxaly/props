@Props.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { user } = options

      @layout = @getLayoutView user

      @listenTo @layout, 'show', =>

      @show @layout

    getLayoutView: (user) ->
      new List.Layout
        model: user
