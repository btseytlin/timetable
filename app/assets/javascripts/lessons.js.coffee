# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
detail = (obj) ->
  result = ""
  result += i + ' = ' + v + '\n'  for i, v of obj when obj.hasOwnProperty(i)
  
$(document).ready ->
	$('#new_lesson').on("ajax:success", (e, data, status, xhr) ->
		$('.notice').append 'Success'
		).bind "ajax:error", (e, xhr, status, error) ->
			$('.notice').append '<p>ERROR:'+error+'</p>'
			
	$(".edit_lesson").on("ajax:success", (e, data, status, xhr) ->
		$('.notice').append 'Success'
		).bind "ajax:error", (e, xhr, status, error) ->
			$('.notice').append '<p>ERROR:'+error+'</p>'
	$("a").on("ajax:success", (e, data, status, xhr) ->
		$('.notice').append 'Success'
		).bind "ajax:error", (e, xhr, status, error) ->
			$('.notice').append '<p>ERROR:'+error+'</p>'