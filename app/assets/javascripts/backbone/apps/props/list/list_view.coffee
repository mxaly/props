@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'props/list/templates/layout'
    regions:
      'props_region' : '.props-region'
      'header_region' : '.header-region'
    className: 'col-xs-12'

  class List.Header extends App.Views.ItemView
    template: 'props/list/templates/header'
    ui:
      newPropArea: '.new-prop-area'

    initialize: (options) ->
      @users ||= options.users

    onShow: ->
      @renderNewPropForm(@users, @model)

    renderNewPropForm: (users, prop) ->
      usersData = users.map (user) ->
        { value: user.get('id'), label: user.get('name')}

      React.render(React.createElement(NewPropFormComponent,
        users: users
        model: @model
      ), @ui.newPropArea[0])
