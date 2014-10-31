@Props.module 'UsersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.User extends App.Views.ItemView
    template: 'users/list/templates/user'
    triggers:
      'click a' : 'user:clicked'
    className: 'col-xs-6 col-sm-3 col-md-2'

  class List.Users extends App.Views.CompositeView
    template: 'users/list/templates/users'
    childView: List.User
    childViewContainer: '.users'
    ui:
      filter: 'input'

    onShow: ->
      @ui.filter.focus()
      @ui.filter.on 'keyup', (event) =>
        @trigger 'users:filter', event.target.value
