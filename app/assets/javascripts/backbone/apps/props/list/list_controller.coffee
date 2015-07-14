@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { props, show_header } = options
      props ||= App.request 'prop:entities'
      users = App.request 'user:entities'

      @layout = new List.Layout

      @listenTo @layout, 'show', ->
        @propsRegion props, users, show_header

      @show @layout

    propsRegion: (props, users, show_header) ->
      React.render(React.createElement(PropsPageComponent,
        props: props
        users: users
        showForm: show_header
      ), $('.props-region')[0])
