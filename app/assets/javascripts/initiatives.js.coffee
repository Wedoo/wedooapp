# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initiative_events = ->
  $('#goto-sign-button').on 'click', (e) ->
    $('#signInitiative')[0].scrollIntoView()
    $('#signInitiative input[type=text]').first().focus()
    e.preventDefault()


$(document).on 'page:change', ->
  # wysihtml5
  window['rangy'].initialized = false
  
  # otros eventos relevantes
  initiative_events()
  
$ ->
  $('.wysihtml5').each (i, elem) ->
    $(elem).wysihtml5()
  initiative_events()
  

this.InitiativesModule ||= {}
  
this.InitiativesModule.refresh_signs = (count) ->
  $('[data-signs-count]').each (i) -> 
    $this = $(this)
    $this.html(count + +$this.data("signs-count"))
