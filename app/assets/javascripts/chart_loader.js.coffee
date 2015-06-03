window.$.fn.loadChart = (type, data, options, format) ->
  drawChart = (type, element, data, options, format) ->
    parsed_data = google.visualization.arrayToDataTable(data)
    if format
      formatter = new (google.visualization.NumberFormat)(prefix: 'R$')
      formatter.format parsed_data, 1
    id = element.attr('id')
    chart = new (type)(document.getElementById(id))
    chart.draw parsed_data, options
    return

  google.load 'visualization', '1', packages: [ 'corechart' ]
  google.setOnLoadCallback drawChart type, $(this), data, options, format
