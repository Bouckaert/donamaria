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
    google.visualization.PieChart
    [
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
    ]
    commonOptions
  )

  $('#piechart_eleitos').loadChart(
    google.visualization.PieChart
    [
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
    ]
    commonOptions
  )

  $('#piechart_patrimonio').loadChart(
    google.visualization.PieChart
    [
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
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )

  $('#piechart_recursos').loadChart(
    google.visualization.PieChart
    [
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
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )
