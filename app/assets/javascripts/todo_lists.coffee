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
   $.ajax
      url: '/todo_lists/' + id
      type: 'DELETE'
      success: (result) ->
        parent.remove()
        return

window.deleteItem = (el, id, todo_id) ->
  if confirm('Are your sure delete this item?')
    parent = $(el).parents('.list-icons').parents('.list-task')
    $.ajax
      url: '/todo_lists/' + todo_id + '/items/' + id
      type: 'DELETE'
      success: (result) ->
        parent.remove()
        return

window.completeItem = (el, id, todo_list_id) ->
  parent = $(el).parent('.item-title')
  $.ajax
    url: 'todo_lists/' + todo_list_id + '/items/' + id + '/complete'
    type: 'PATCH'
    success: (result) ->
      console.log (result)
      parent.addClass('compled');
      return

window.changeTitle = (keyCode, el, id) ->
  title = $(el).val()
  if (keyCode == 13)
    $.ajax
      url: 'todo_lists/' + id
      data: {todo_list: {title: title}}
      type: 'PATCH'
      success: (result) ->
        $(el).parents('section.header').find('h3.list-title').text(title)
        $(el).parents('section.header').find('input.title-input').hide()
        return

window.showInput = (el) ->
  $(el).parents('section.header').find('input.title-input').show()
