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
      16676
    ]
    [
      'Mulheres'
      7654
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
      1404
    ]
    [
      'Mulheres'
      171
    ]
    commonOptions
  )

  $('#piechart_patrimonio').loadChart(
    [
      'Genero'
      'Candidaturas'
    ]
    [
      'Patrimônio total dos Homens'
      14980600670.33
    ]
    [
      'Patrimônio total das Mulheres'
      1267967077.89
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
      124690971.72
    ]
    [
      'Mulheres'
      15372761.6
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )
