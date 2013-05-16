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





  fix_menu_widths()
  $(window).bind( "resize", home_slides).trigger 'resize'

home_slides =  ->
  
  $el = $("#home-slides")
  return if $el.size() is 0
  $el.css 'height', 'auto'
  $el.cycle
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
        
fix_menu_widths = ->
  #prorratea el ancho de los items del menu
  $el = $("nav.menu")
  return if $el.size() is 0
  widths = []
  $el.addClass 'not-ready'
  $el.find("span").each ->
    widths.push $(@).width()
  $el.removeClass 'not-ready'
  t =  widths.reduce (x,y) -> x + y
  widths = widths.map (w) -> w/t*100
  $el.find("li").each (i, li)->
    $(li).width widths[i]+"%"

