@Props.module 'UsersApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: (options) ->
      { user } = options

      user ||= App.request 'user:entity', options.id

      @layout = @getLayoutView user

      @listenTo @layout, 'show', =>
        @propsRegion user

      @show @layout,
        loading:
          entities: user

    getLayoutView: (user) ->
      new Show.Layout
        model: user

    propsRegion: (user) ->
      props = App.request 'prop:entities', user_id: user.id

      App.commands.execute 'props:list', props, @layout.props_region
