# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  
  if $('#fb__update_currency_content').length > 0
    setInterval(updateCurrencyInfo, 10000);

updateCurrencyInfo = ->
  $.ajax(url: "updated_index_with_ajx").done (html) ->
    $("#fb__update_currency_content").html html
