@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'props/list/templates/layout'
    regions:
      'props_region' : '.props-region'
      'header_region' : '.header-region'
    className: 'col-xs-12'

  class List.Form extends App.Views.ItemView
    template: 'props/list/templates/form'

    form:
      buttons:
        primary: 'Prop!'
        cancel: false

    ui:
      input: 'input'
      praisedPersonAvatar: '.praised-person-avatar'
      selectedUsers: '.selected-users'

    initialize: (options) ->
      @users ||= options.users

    onShow: ->
      @renderSelectItems @users
      @ui.input.on 'change', @onSelectChange

    onSelectChange: (e) =>
      selectedUsers = @users.filter (user) ->
        _.include e.val, String(user.get('id'))
      return if !selectedUsers?
      @ui.selectedUsers.html('')

      _.each selectedUsers.reverse(), (u) =>
        @ui.selectedUsers.append(@userBigTemplate(u))

    renderSelectItems: (users) ->
      users_data = users.map (user) ->
        { id: user.get('id'), text: user.get('name' ), avatar_url: user.get('avatar_url')}

      @ui.input.select2
        placeholder: 'Who do you want to prop?'
        allowClear: true
        dropdownAutoWidth: true
        multiple: true
        data: users_data
        width: 'resolve'
        formatResult: @userSmallTemplate

    userSmallTemplate: (user) ->
      "<img class='user-small-face' src='" + user.avatar_url + "'/>" + user.text

    userBigTemplate: (user) ->
      "<img class='praised-person-avatar' src='" + user.get('avatar_url') + "'/>"

  class List.Header extends App.Views.Layout
    template: 'props/list/templates/header'
    className: 'jumbotron clearfix'
    regions:
      'form_region' : '.form-region'

  class List.Prop extends App.Views.ItemView
    template: 'props/list/templates/prop'
    tagName: 'li'
    className: 'list-group-item props-list-item'
    triggers:
      'click [js-upvote]': 'prop:upvote:clicked'
    modelEvents:
      'change' : 'render'
    ui:
      propsReceivers: '.props-receivers'

    serializeData: ->
      _.extend super,
        created_at: moment(@model.get('created_at')).fromNow()

    onRender: ->
      @insertReceivers()

    insertReceivers: ->
      _.each @model.get('users'), (user) =>
        @ui.propsReceivers.append(@receiverTemplate(user))

    receiverTemplate: (user) ->
      "<a class='props-receiver-avatar' href='#users/#{user.id}'><img src='#{user.avatar_url}' title='#{user.name}'/></a>"

  class List.EmptyView extends App.Views.ItemView
    template: 'props/list/templates/empty'

  class List.Props extends App.Views.CompositeView
    template: 'props/list/templates/props'
    childView: List.Prop
    childViewContainer: '.props-list'
    className: 'list-group'
    emptyView: List.EmptyView

    events:
      'click [data-page]' : 'pageSelected'

    pageSelected: (e) ->
      if $(e.target).data().page == 'next'
        @collection.getNextPage()
      else
        @collection.getPreviousPage()

