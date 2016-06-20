class Dashing.Smartcitizen extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    if data
      # reset classes
      console.log data.name
      $('.name').text "#{data.name}"
