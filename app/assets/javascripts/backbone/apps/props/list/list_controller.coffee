@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { props, show_header } = options
      props ||= App.request 'prop:entities'

      @layout = @getLayoutView()

      @listenTo @layout, 'show', ->
        @headerRegion() if show_header
        @propsRegion props

      @show @layout,
        loading:
          entities: props

    getLayoutView: ->
      new List.Layout

    getPropsView: (props) ->
      new List.Props
        collection: props

    propsRegion: (props) ->
      view = @getPropsView props
      @show view,
        region: @layout.props_region

    getHeaderView: ->
      new List.Header

    headerRegion: ->
      view = @getHeaderView()
      @show view,
        region: @layout.header_region
