# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initiative_events = ->
  $('#goto-sign-button').on 'click', (e) ->
    $('#signInitiative input').removeAttr("disabled")
    $('#signInitiative')[0].scrollIntoView()
    $('#signInitiative input[type=text], #signInitiative input[type=email]').val("").first().focus()
    e.preventDefault()
  $('.wysihtml5').each (i, elem) ->
    $(elem).wysihtml5()
  
  $('form.active-inactive-form').each (i, elem) ->
    $(this).on 'click', 'label', (e) ->
      return if $(this).hasClass("active")
      $this = $(this)
      $this.trigger($this.parents('form').data('trigger'), $this.find('input'))
      e.preventDefault()

$(document).on 'page:change', ->
  # wysihtml5
  window['rangy'].initialized = false
  
  # otros eventos relevantes
  initiative_events()
  
$(document).on 'form:signs-active', (event, input) ->
  $input = $(input)
  value = $input.val()
  $elem = if (value == "true") then $('#signs-activation-confirmation') else $('#signs-deactivation-confirmation')
  $cancel = $elem.find('button.cancel')
  unless $cancel.data("handler")
    $cancel.data("handler", true).on 'click', ->
      i = $input.parent().index()
      $input.parents("div.btn-group").children().eq(1 - i).button("toggle")
  $elem.modal()
  
$ ->

  initiative_events()
  

this.InitiativesModule ||= {}
  
this.InitiativesModule.refresh_signs = (count) ->
  $('[data-signs-count]').each (i) -> 
    $this = $(this)
    $this.html(count + +$this.data("signs-count"))
