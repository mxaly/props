@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { show_header } = options

      @layout = new List.Layout

      @listenTo @layout, 'show', ->
        @propsRegion show_header

      @show @layout

    propsRegion: (show_header) ->
      React.render(React.createElement(PropsPageComponent), $('.props-region')[0])
