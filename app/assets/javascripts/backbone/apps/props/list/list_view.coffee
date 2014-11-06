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
      select: 'select'
      praisedPersonAvatar: '.praised-person-avatar'

    initialize: (options) ->
      @users ||= options.users

    onShow: ->
      @renderSelectItems @users
      @ui.select.on 'change', (e) =>
        selectedUser = @users.get(e.val)
        avatarUrl = if selectedUser?
          selectedUser.get('avatar_url')
        else
          ''
        @ui.praisedPersonAvatar.attr('src', avatarUrl)


    renderSelectItems: (users) ->
      users.each (user) =>
        @ui.select.append "<option value='#{user.get('id')}'>#{user.get('name')}</option>"
      @ui.select.select2
        placeholder: 'Select user'
        allowClear: true
        dropdownAutoWidth : true
        width: 'resolve'

  class List.Header extends App.Views.Layout
    template: 'props/list/templates/header'
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

    onUpvote: (e) ->
      console.log 'kliknal'

    serializeData: ->
      _.extend super,
        created_at: moment(@model.get('created_at')).fromNow()

  class List.EmptyView extends App.Views.ItemView
    template: 'props/list/templates/empty'

  class List.Props extends App.Views.CompositeView
    template: 'props/list/templates/props'
    childView: List.Prop
    childViewContainer: 'ul'
    className: 'list-group'
    emptyView: List.EmptyView
