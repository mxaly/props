@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Prop extends App.Views.ItemView
    template: 'props/list/templates/prop'
    tagName: 'li'

  class List.Props extends App.Views.CompositeView
    template: 'props/list/templates/props'
    itemView: List.Prop
    itemViewContainer: 'ul'
