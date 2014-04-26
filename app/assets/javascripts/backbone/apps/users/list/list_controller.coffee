@Props.module 'UsersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      users = App.request 'user:entities'

      @layout = @getLayoutView users

      @show @layout,
        loading:
          entities: users

    getLayoutView: (users) ->
      view = new List.Users
        collection: users

      @listenTo view, 'itemview:user:clicked', (_iv, args) ->
        { model } = args
        App.vent.trigger 'user:clicked', model

      view
