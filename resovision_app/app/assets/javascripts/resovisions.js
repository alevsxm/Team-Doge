$(function() {
	$('.show-ziglet').on('click', function(){
		var player = $(this).parent().find('.player'); 
		console.log(player); 

			player.css('visibility', 'visible'); 
	})
	$('.record-ziglet').on('click', function(){
		var recorder = $(this).parent().find('.recorder'); 
		console.log(recorder); 

			recorder.css('visibility', 'visible'); 
	})
  	
}); 
