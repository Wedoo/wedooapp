
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

$(document).on 'change', 'input[data-validate~="rut"]', ->
  $this = $(this)
  val = $this.val()
  $this.val(format_rut val)
  