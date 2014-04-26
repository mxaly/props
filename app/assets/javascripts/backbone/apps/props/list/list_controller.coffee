@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { props } = options
      props ||= App.request 'prop:entities'

      @layout = @getLayoutView props

      @show @layout,
        loading:
          entities: props

    getLayoutView: (props) ->
      new List.Props
        collection: props
