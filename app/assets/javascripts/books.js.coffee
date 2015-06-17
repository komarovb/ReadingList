# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###
$ ->
  $('#n-book-btn').on 'click', (e) ->
  	$('.n-modal').modal('show')
  	$(".addbook").each(function(index,value){
			$(this).on('click',selectBook);
		});
###

app =
	Initialize: () ->
		app.setUpListeners
	setUpListeners: () ->
		$('#n-book-btn').on 'click', (e) ->
  			$('.n-modal').modal('show')

app.Initialize