@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Nav extends Entities.Model

  class Entities.NavsCollection extends Entities.Collection
    model: Entities.Nav

  API =
    getHeaderNavs: ->
      new Entities.NavsCollection [
        { name: 'Props',  url: '#props' }
        { name: 'Users',  url: '#users' }
      ]

  App.reqres.setHandler 'nav:header:entities', ->
    API.getHeaderNavs()
