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
      view = new List.Header

      @listenTo view, 'show', ->
        @formRegion view.form_region

      view

    getFormView: ->
      new List.Form
        model: new Backbone.Model

    formRegion: (region) ->
      view = @getFormView()
      form_view = App.request 'form:component', view
      @show form_view,
        region: region

    headerRegion: ->
      view = @getHeaderView()
      @show view,
        region: @layout.header_region
