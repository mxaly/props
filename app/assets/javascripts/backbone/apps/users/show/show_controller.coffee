@Props.module 'UsersApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: (options) ->
      { user } = options

      user ||= App.request 'user:entity', options.id

      @layout = @getLayoutView user

      @show @layout,
        loading:
          entities: user

    getLayoutView: (user) ->
      new Show.Layout
        model: user
