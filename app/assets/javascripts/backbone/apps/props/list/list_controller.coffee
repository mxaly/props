@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { @props, show_header } = options
      @props ||= App.request 'prop:entities'

      @layout = @getLayoutView()

      @listenTo App.vent, 'prop:created', (prop) ->
        props.add prop

      @listenTo @layout, 'show', ->
        @headerRegion() if show_header
        @propsRegion @props

      @show @layout,
        loading:
          entities: @props

    getLayoutView: ->
      new List.Layout

    getPropsView: (props) ->
      new List.Props
        collection: props

    propsRegion: (props) ->
      React.render(React.createElement(PropsListComponent,
        props: props
      ), $('.props-region')[0])

    refetechProps: =>
      @props.fetch()

    headerRegion: ->
      users = App.request 'user:entities'
      prop = App.request 'new:prop:entity'
      component = React.render(React.createElement(NewPropFormComponent,
        users: users
        onPropCreated: @refetechProps
      ), $('.header-region')[0])
