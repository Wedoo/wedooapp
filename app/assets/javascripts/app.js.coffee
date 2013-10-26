$document = $(document)

format_rut = (rut) ->
  clean_rut = rut.toUpperCase().replace(/[^\dK]/, '')
  return '' if clean_rut.length < 1
  result = "-" + clean_rut[clean_rut.length - 1]
  i = clean_rut.length - 2
  while i >= 0
    result = '.' + result if (clean_rut.length - i - 2) % 3 == 0 && i < clean_rut.length - 2
    result = clean_rut[i] + result
    i--
  result

$document.on 'change', 'input[data-validate~="rut"]', ->
  $this = $(this)
  val = $this.val()
  $this.val(format_rut val)
  
  
$document.on 'click', 'a[data-twitter-sharer], a[data-facebook-sharer]', (e) ->
  service = if $(this).data('twitter-sharer') then 'twitter' else 'facebook'
  window.open( this.href, service, 'height=400,width=550,left=100,top=100,resizable=yes,location=no,status=no,toolbar=no' );
  e.preventDefault()
  
  
# Turbolinks loading
$document.on 'page:fetch', ->
  $('#loading-indicator').show().animate({top: 0}, 300)

$document.on 'page:receive', ->
  $('#loading-indicator').hide().css('top', '-50px')