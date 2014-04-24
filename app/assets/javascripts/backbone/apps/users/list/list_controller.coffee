@Props.module 'UsersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      users = App.request 'user:entities'

      @layout = @getLayoutView users

      @show @layout,
        loading:
          entities: users

    getLayoutView: (users) ->
      new List.Users
        collection: users
