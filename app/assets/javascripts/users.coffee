# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#user_ward_id', ->
  $.ajax(
    type: 'GET'
    url:  '/users/stations_select'
    data: {
      ward_id: $(this).val()
    }
  ).done (data) ->
    $('#user_station_id').html(data)