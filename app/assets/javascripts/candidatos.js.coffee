$(document).ready ->
  $('.candidatura:last-child').removeClass "hide"

$(document).on "click", ".dropdown-menu li a", ->
  candidatura_id = this.id
  $(this).parents(".row").find(".candidatura").addClass "hide"
  $("#candidatura-"+candidatura_id).removeClass "hide"


$(document).on "click", ".dropdown-menu li a", ->
  $(this).parents(".dropdown").find(".btn:first").text($(this).text())
  $(this).parents(".dropdown").find(".btn:first").val($(this).data("value"))
