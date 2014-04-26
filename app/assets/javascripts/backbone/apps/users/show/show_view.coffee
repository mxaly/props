@Props.module 'UsersApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: 'users/show/templates/layout'

    regions:
      received_props_region: '.received-props-region'
      given_props_region: '.given-props-region'
