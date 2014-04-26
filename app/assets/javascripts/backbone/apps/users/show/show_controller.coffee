@Props.module 'UsersApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Application

    initialize: (options) ->
      { user } = options

      user ||= App.request 'user:entity', options.id

      @layout = @getLayoutView user

      @listenTo @layout, 'show', =>
        @givenPropsRegion user
        @receivedPropsRegion user

      @show @layout,
        loading:
          entities: user

    getLayoutView: (user) ->
      new Show.Layout
        model: user

    givenPropsRegion: (user) ->
      props = App.request 'prop:entities', propser_id: user.id

      App.commands.execute 'props:list', props, @layout.given_props_region

    receivedPropsRegion: (user) ->
      props = App.request 'prop:entities', user_id: user.id

      App.commands.execute 'props:list', props, @layout.received_props_region
