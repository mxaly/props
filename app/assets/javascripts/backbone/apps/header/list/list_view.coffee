@Props.module 'HeaderApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.ItemView
    template: 'header/list/list_layout'
    className: 'row'

