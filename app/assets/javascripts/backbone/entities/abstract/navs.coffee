@Props.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Nav extends Entities.Model

  class Entities.NavsCollection extends Entities.Collection
    model: Entities.Nav

  API =
    getHeaderNavs: ->
      new Entities.NavsCollection [
        { name: 'Users',  url: '#users' }
        { name: 'Props',  url: '#props' }
        { name: 'Sign out',  url: '/signout' }
      ]

  App.reqres.setHandler 'nav:header:entities', ->
    API.getHeaderNavs()
