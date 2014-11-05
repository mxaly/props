@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Prop extends Entities.Model
    defaults:
      user: {}
      propser: {}
      body: ''
      props_count:
        received: 0
        given: 0
    urlRoot: ->
      Routes.api_props_path()

    upvote: ->
      $.post Routes.api_prop_upvotes_path(@get('id')), (data) =>
        @set data

  class Entities.Props extends Entities.Collection
    model: Entities.Prop
    comparator: (model) ->
      - moment(model.get('created_at')).format('X')
    url: ->
      Routes.api_props_path()

  API =
    getProps: (filters) ->
      props = new Entities.Props
      props.fetch
        data: filters if filters
      props

    newProp: ->
      new Entities.Prop

  App.reqres.setHandler 'prop:entities', (filters) ->
    API.getProps filters

  App.reqres.setHandler 'new:prop:entity', ->
    API.newProp()
