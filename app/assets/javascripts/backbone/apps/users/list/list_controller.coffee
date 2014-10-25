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

      @listenTo view, 'childview:user:clicked', (_iv, args) ->
        { model } = args
        App.vent.trigger 'user:clicked', model
      @listenTo view, 'users:filter', (name) =>
        @allUsers ||= users.clone()
        filteredUsers = @allUsers.filter (user) =>
          user.get('name').toLowerCase().match(name.toLowerCase())
        users.reset(filteredUsers)

      view
