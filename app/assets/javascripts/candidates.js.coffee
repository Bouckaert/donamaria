$(document).ready ->
  $('.candidature:last-child').removeClass "hide"

$(document).on "click", ".dropdown-menu li a", ->
  candidature_id = this.id
  $(this).parents(".row").find(".candidature").addClass "hide"
  $("#candidature-"+candidature_id).removeClass "hide"


$(document).on "click", ".dropdown-menu li a", ->
  $(this).parents(".dropdown").find(".btn:first").text($(this).text())
  $(this).parents(".dropdown").find(".btn:first").val($(this).data("value"))
