$.fn.loadChart = (header, data1, data2, options, format) ->
  drawChart = (element, header, data1, data2, options, format) ->
    parsed_data = google.visualization.arrayToDataTable([
      header
      data1
      data2
    ])
    if format
      formatter = new (google.visualization.NumberFormat)(prefix: 'R$')
      formatter.format parsed_data, 1
    id = element.attr('id')
    chart = new (google.visualization.PieChart)(document.getElementById(id))
    chart.draw parsed_data, options
    return

  google.load 'visualization', '1', packages: [ 'corechart' ]
  google.setOnLoadCallback drawChart $(this), header, data1, data2, options, format

jQuery ->
  commonOptions = 
    backgroundColor: 'transparent'
    'width': 500
    'height': 500
    'colors': [
      'f0bf00'
      '#746181'
    ]
    'legend': position: 'bottom'

  $('#piechart_candidatos').loadChart(
    [
      'Genero'
      'Candidaturas'
    ]
    [
      'Homens'
      $('#candidates-statistics').data('men')
    ]
    [
      'Mulheres'
      $('#candidates-statistics').data('women')
    ]
    commonOptions
  )

  $('#piechart_eleitos').loadChart(
    [
      'Genero'
      'Candidaturas'
    ]
    [
      'Homens'
      $('#elected-candidates-statistics').data('men')
    ]
    [
      'Mulheres'
      $('#elected-candidates-statistics').data('women')
    ]
    commonOptions
  )

  $('#piechart_patrimonio').loadChart(
    [
      'Genero'
      'Candidaturas'
    ]
    [
      'Homens'
      $('#patrimonies-statistics').data('men')
    ]
    [
      'Mulheres'
      $('#patrimonies-statistics').data('women')
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )

  $('#piechart_recursos').loadChart(
    [
      'Genero'
      'Candidaturas'
    ]
    [
      'Homens'
      $('#revenues-statistics').data('men')
    ]
    [
      'Mulheres'
      $('#revenues-statistics').data('women')
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )
