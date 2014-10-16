@Props.module 'PropsApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'props/list/templates/layout'
    regions:
      'props_region' : '.props-region'
      'header_region' : '.header-region'

  class List.Form extends App.Views.ItemView
    template: 'props/list/templates/form'

    form:
      buttons:
        primary: 'Prop!'
        cancel: false

    ui:
      select: 'select'

    initialize: (options) ->
      @users ||= options.users

    onShow: ->
      @renderSelectItems @users

    renderSelectItems: (users) ->
      users.each (user) =>
        @ui.select.append "<option value='#{user.get('id')}'>#{user.get('name')}</option>"

  class List.Header extends App.Views.Layout
    template: 'props/list/templates/header'
    regions:
      'form_region' : '.form-region'

  class List.Prop extends App.Views.ItemView
    template: 'props/list/templates/prop'
    tagName: 'a'
    className: 'list-group-item'
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
