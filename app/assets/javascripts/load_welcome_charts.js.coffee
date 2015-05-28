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
          16676
        ]
        [
          'Mulheres'
          7654
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
        1404
      ]
      [
        'Mulheres'
        171
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
        14980600670.33
      ]
      [
        'Mulheres'
        1267967077.89
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
        124690971.72
      ]
      [
        'Mulheres'
        15372761.6
      ]
    ]
    $.extend({}, commonOptions, { pieSliceText: 'value' })
    true
  )
