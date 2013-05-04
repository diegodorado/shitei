$ ->
  $("#debug").on 'click', (ev)->
    ev.preventDefault()
    $('body').toggleClass 'debug'


