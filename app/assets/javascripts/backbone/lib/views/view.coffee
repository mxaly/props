@Props.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,
    addOpacityWrapper: (init = true, options = {}) ->
      _.defaults options,
        className: 'form-sync-cover loading'

      @$el.toggleWrapper options, @cid, init

    templateHelpers: ->
      appRoute: (path) ->
        "#{path}"
