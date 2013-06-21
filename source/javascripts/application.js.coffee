$(window).bind "load", ->

  $("nav.social .more").on 'click', (ev)->
    ev.preventDefault()
    $('.main-phone').toggleClass 'on'

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

  $("#delivery, #delivery-phone").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').height($('body').outerHeight(true)).show()

  $("#lightbox").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').hide()


  $(window).bind( "resize", home_slides).trigger 'resize'


  $('.franquicias-box, .contact-box').addClass 'pie'

  if (window.PIE)
    $('.pie').each () -> PIE.attach(@)

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