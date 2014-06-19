@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'props/list/templates/layout'
    regions:
      'props_region' : '.props-region'
      'header_region' : '.header-region'

  class List.Prop extends App.Views.ItemView
    template: 'props/list/templates/prop'
    tagName: 'li'

  class List.Form extends App.Views.ItemView
    template: 'props/list/templates/form'

  class List.Header extends App.Views.Layout
    template: 'props/list/templates/header'
    regions:
      'form_region' : '.form-region'

  class List.Props extends App.Views.CompositeView
    template: 'props/list/templates/props'
    itemView: List.Prop
    itemViewContainer: 'ul'

