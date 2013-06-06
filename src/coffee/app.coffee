require.config
  baseUrl: "js/modules"
  paths: 
    'jquery': '../vendor/jquery-1.8.2.min'
    'jquery-ui': '../vendor/jquery-ui-1.9.2.custom.min'
    'routie': '../vendor/routie'
    'scroll': '../vendor/jquery.smooth-scroll.min'
    'rainbow': '../vendor/rainbow-custom.min'

  shim:
    'jquery-ui': ['jquery']
    'scroll': ['jquery']
    'rainbow':
      exports: 'Rainbow'
    'routie':
      exports: 'routie'

define (require) ->
  main: () ->
    $ = require('jquery')
    ui = require('jquery-ui')
    scroll = require('scroll')

    require('rainbow').color()

    $('a').smoothScroll afterScroll: -> window.location.hash = $(this).attr('href')

    screen = $('.screen')
    screen.resizable(
      minWidth: 100
      minHeight: 130
      maxWidth: screen.width()
      maxHeight: screen.height()
    ).on('resize', (e) -> 
      $(this).removeClass 'screen-tablet screen-mobile'
      $(this).addClass 'screen-tablet' if $(this).width() < 250
      $(this).addClass 'screen-mobile' if $(this).width() < 120
    )
    screen.find('#display').on 'scroll', (e) -> e.stopPropagation()

    $('.email').text '@'

    $('#feedback').on 'submit', (e) ->
      e.preventDefault()
      $(this).removeClass 'success error'
      $.ajax
        type: 'POST'
        data: $(this).serialize()
        url: "feedback.php"
        success: (data) => $(this).addClass 'success' 
        error: () => $(this).addClass 'error' 