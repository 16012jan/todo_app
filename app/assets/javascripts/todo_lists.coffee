# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.log 'ready'
  $('.new-todo').click () ->
    console.log 'click'
    $.get '/todo_lists/new', (data) ->
      $('.container-todo').append(data)
      return
