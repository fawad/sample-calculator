$(document).ready ->
  $('.submit-btn').on 'click', (e) ->
    operator = $(this).attr('operator')
    $('#calculation_operator').val operator
    operand_one = $('#calculation_operand_one').val()
    operand_two = $('#calculation_operand_two').val()
    e.preventDefault()
    $.ajax
      type: 'POST'
      url: '/calculations'
      data: calculation: {operator: operator, operand_one: operand_one, operand_two: operand_two}
      dataType: 'script'
