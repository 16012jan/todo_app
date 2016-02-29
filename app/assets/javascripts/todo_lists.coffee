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

window.addTask = (el, id) ->
  parent = $(el).parents('.add-task').parents('main.todo')
  lists = parent.find('.list-items')
  input = parent.find('#task')
  text = input.val()
  if text
    $.post('todo_lists/' + id + '/items/add_item',
      text: text).done (data) ->
        lists.append(data)
        return
  else
    alert("Please add title item before send it")

window.deleteTodo = (el, id) ->
  if confirm('Are your sure delete this item?')
    parent = $(el).parents('main.todo')
    parent.remove()
   $.ajax
      url: '/todo_lists/' + id
      type: 'DELETE'
      success: (result) ->
        parent.remove()
        return
