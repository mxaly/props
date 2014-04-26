@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Prop extends Entities.Model
    defaults:
      user: {}
      propser: {}
      body: ''

  class Entities.Props extends Entities.Collection
    model: Entities.Prop
    url: Routes.api_props_path()

  API =
    getProps: ->
      props = new Entities.Props
      props.fetch()
      props

  App.reqres.setHandler 'prop:entities', ->
    API.getProps()
