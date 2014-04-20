@Props = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.on 'initialize:before', (options) ->
    App.environment = options.environment
    App.current_user = new Backbone.Model({ name: 'Foo Bar', email: 'foo@email.com' })

  App.addRegions
    headerRegion: '#header-region'
    mainRegion:    '#main-region'

  App.addInitializer ->
    App.module('HeaderApp').start(App.current_user)

  App.rootRoute = ''

  App.reqres.setHandler 'default:region', -> App.mainRegion

  App.on 'initialize:after', ->
    @startHistory()

    @navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

  App
