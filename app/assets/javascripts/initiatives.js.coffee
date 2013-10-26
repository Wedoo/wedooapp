# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class ActivationToggle
  constructor: (@form) ->
    @form = $(@form)
    @event = @form.data('trigger')
    that = this
    $(@form).on 'click', 'label', (e) ->
      $this = $(this)
      return if $this.hasClass('active')
      $this.trigger(that.event, that)
      e.preventDefault()

  toggle: ->
    @form.find('label').not('.active').button('toggle')
    
  value: ->
    @form.find('label.active input').val() == "true"
      
  

initiative_events = ->
  $('#goto-sign-button').on 'click', (e) ->
    $('#signInitiative input').removeAttr("disabled")
    $('#signInitiative')[0].scrollIntoView()
    $('#signInitiative input[type=text], #signInitiative input[type=email]').val("").first().focus()
    e.preventDefault()
    
  $('.wysihtml5').each (i, elem) ->
    $(elem).wysihtml5()
  
  $('form.active-inactive-form').each (i, elem) ->
    new ActivationToggle this
      
  $spam_selector = $('input[name=initiative\\[spam_receiver_selected\\]]')
  if $spam_selector.length > 0
    if $spam_selector.filter(':checked').val() != 'commission'
      $('#select-commission').hide()
    $spam_selector.on 'change', ->
      if $(this).val() == 'commission'
        $('#select-commission').show()
      else
        $('#select-commission').hide()

$(document).on 'page:change', ->
  # wysihtml5
  window['rangy'].initialized = false
  
  # otros eventos relevantes
  initiative_events()
  
$ ->
  initiative_events()
  
  
$(document).on 'form:signs-active', (event, at) ->
  value = at.value()
  $elem = if (value) then $('#signs-deactivation-confirmation') else $('#signs-activation-confirmation')
  unless $elem.data('handler')
    $elem.data('handler', true).on 'hide.bs.modal', ->
      at.toggle()
  $elem.modal()
  

$(document).on 'form:spam-active', (event, at) ->
  value = at.value()
  $elem = if (value) then $('#spam-deactivation-confirmation') else $('#spam-activation-confirmation')
  unless $elem.data('handler')
    $elem.data('handler', true).on 'hide.bs.modal', ->
      at.toggle()
  $elem.modal()

$(document).on 'form:donations-active', (event, at) ->
  value = at.value()
  $elem = if (value) then $('#donations-deactivation-confirmation') else $('#donations-activation-confirmation')
  unless $elem.data('handler')
    $elem.data('handler', true).on 'hide.bs.modal', ->
      at.toggle()
  $elem.modal()



this.InitiativesModule ||= {}
  
this.InitiativesModule.refresh_signs = (count) ->
  $('[data-signs-count]').each (i) -> 
    $this = $(this)
    $this.html(count + +$this.data("signs-count"))

$(document).ready ->
  $(".ajax-donations-container").load $(".ajax-donations-container").attr("load-parameter")
  $("#paypal-next").click ->
    $(".ajax-donations-container form").submit()
  $("#next-to-campaigns").click ->
    $("#select_accounts").submit()
  $("#next-to-the-end").click ->
    $("#form-campaigns-list").submit()
  $("#donations-activation-adwords-paso-2").modal()  if adwords_step is 2
