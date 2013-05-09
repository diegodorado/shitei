$ = jQuery

$.fn.lavaLamp = (o) ->
  
  o = $.extend(
    target: "li"
    fx: "swing"
    speed: 500
    activeClass: "active"
    indicator: ""
    widthSetter: "a"
  , o or {})
  
  @each ->
    
    move = ($el, cbType) ->
      $el or= $active
      dims =
        left: $el.find(o.widthSetter).position().left
        width: $el.find(o.widthSetter).width()
      $indicator.stop().animate dims, o.speed, o.fx
      
      $lt.removeClass o.activeClass
      $el.addClass o.activeClass

    $indicator = $(o.indicator)
    $lt = $(o.target, this)
    $active = $(o.target + "." + o.activeClass, this).first()
    $active = $(o.target, this).first() if $active.length is 0
    
    $lt.bind "mouseenter", ->
      move $(@)

    $(@).bind "mouseleave", ->
      move()
      
    move($active)
