$(document).ready ->

  $input = $('#amount')
  $source_currency = $('#source_currency')
  $target_currency = $('#target_currency')


  $input.on 'focusout', ->
    $('#result').val("")
    enviar()
    return
  
  $source_currency.on 'focusout', ->
    $('#result').val("")
    enviar()
    return
  
  $target_currency.on 'focusout', ->
    $('#result').val("")
    enviar()
    return


  $('.change-values').click () ->
    sourceCurrency = $('#source_currency').val()
    targetCurrency = $('#target_currency').val()
    $('#source_currency').val targetCurrency
    $('#target_currency').val sourceCurrency
    enviar()
    return false;

  enviar = ->
    source_currency = $("#source_currency").val()
    target_currency = $("#target_currency").val()
    amount = $("#amount").val()
    if isValid(source_currency) and isValid(amount) and isValid(target_currency)
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
          source_currency: source_currency,
          target_currency: target_currency,
          amount: amount
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)
      return false;

  isValid = (value) ->
    return value != null and value.trim() != ''
