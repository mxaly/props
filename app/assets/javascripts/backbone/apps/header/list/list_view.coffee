@Props.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'header/list/list_layout'
    className: 'navbar navbar-default navbar-static-top'
    tagName: 'nav'

    regions:
      nav_region: '.navigation-links'

  class List.Nav extends App.Views.ItemView
    template: 'header/list/templates/nav'
    tagName: 'li'

  class List.Navs extends App.Views.CollectionView
    childView: List.Nav
    tagName: 'ul'
    className: 'nav navbar-nav'

    onRender: ->
      @$('li').after(' ') # otherwise lis are treated as one word
