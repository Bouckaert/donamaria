jQuery ->
  data = []
  data.push(
    [
      'Representante'
      'Total Doado'
    ]
  )
  $('.donations > div').each ->
    data.push(
      [
        $(this).data('id').toString()
        $(this).data('total')
      ]
    )
  options =
    colors: [
      '#ae81ff'
    ]
    hAxis:
      textPosition: 'none'
    legend :'none'
  $('#user-donations-graph').loadChart(
    google.visualization.BarChart
    data
    options
  )
