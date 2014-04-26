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
    getProps: (filters) ->
      props = new Entities.Props
      props.fetch
        data: filters if filters
      props

  App.reqres.setHandler 'prop:entities', (filters) ->
    API.getProps filters
