@Props.module 'UsersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.User extends App.Views.ItemView
    template: 'users/list/templates/user'
    tagName: 'li'
    triggers:
      'click a' : 'user:clicked'

  class List.Users extends App.Views.CompositeView
    template: 'users/list/templates/users'
    childView: List.User
    childViewContainer: 'ul'

