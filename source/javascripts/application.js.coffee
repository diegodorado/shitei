$(window).bind "load", ->

  $("nav.main ul").lavaLamp
    fx: "easeOutBack"
    speed: 700
    indicator: "nav.main .indicator"
    activeClass: "active"

  $("nav.menu ul").lavaLamp
    fx: "easeOutBack"
    speed: 700
    indicator: "nav.menu .indicator"
    activeClass: "active"
    widthSetter: "b"

$ ->
  $("#debug").on 'click', (ev)->
    ev.preventDefault()
    $('body').toggleClass 'debug'


  $("#delivery").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').show()


  $("#lightbox").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').hide()





  $("#home-slides").cycle
    fx: "fade"
    aspect: true
    speed: 300
    timeout: 2000
    fit: 1
    width: '100%'
    pause: true
    pager:  '#home-slides-nav'
    pauseOnPagerHover: true
    activePagerClass: 'active'
    pagerAnchorBuilder: (idx, slide) ->
      "#{@pager} .slide-item:nth-child(#{idx+1})"


  fix_menu_widths()
  
fix_menu_widths = ->
  #prorratea el ancho de los items del menu
  widths = []
  $("nav.menu").addClass 'not-ready'
  $("nav.menu span").each ->
    widths.push $(@).width()
  $("nav.menu").removeClass 'not-ready'
  t =  widths.reduce (x,y) -> x + y
  widths = widths.map (w) -> w/t*100
  $("nav.menu li").each (i, el)->
    $(el).width widths[i]+"%"

