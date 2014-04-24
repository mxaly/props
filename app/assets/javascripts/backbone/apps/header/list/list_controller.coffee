@Props.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Application

    initialize: (options) ->
      { user } = options

      @layout = @getLayoutView user

      @listenTo @layout, 'show', =>

      @show @layout

    getNavsView: (navs) ->
      new List.Navs
        collection: navs

    getLayoutView: (user) ->
      view = new List.Layout
        model: user

      navs = App.request 'nav:header:entities'
      navigation_view = @getNavsView navs

      view.on 'show', =>
        @show navigation_view,
          region: view.nav_region

      view
