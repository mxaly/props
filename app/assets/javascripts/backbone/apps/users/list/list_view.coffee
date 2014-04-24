@Props.module 'UsersApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.User extends App.Views.ItemView
    template: 'users/list/templates/user'
    tagName: 'li'

  class List.Users extends App.Views.CompositeView
    template: 'users/list/templates/users'
    itemView: List.User
    itemViewContainer: 'ul'

