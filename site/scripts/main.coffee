submitForm = require './submit-form'

$ ->
  # Initialize FastClick and highlightjs on the body
  FastClick.attach document.body
  hljs.initHighlightingOnLoad()

  # Toggle menu open
  $('#menuToggle').on 'click', ->
    $('.menu').toggleClass 'open'
    $('.toggle .icon').toggleClass 'close'
  
  # Close menu if click outside of menu/header
  $(document).on 'click', (event) ->
    unless $(event.target).closest('#menuToggle').length
      $('.menu').removeClass 'open'
      $('.toggle .icon').removeClass 'close'

  # Mailchimp Signup Form
  submitForm '.signup', '#signup'
