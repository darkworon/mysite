// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
(function($){
	$.flash_alert = function(text,time){
  var id = Math.floor( Math.random( ) * (999 - 100 + 1) ) + 100;
  $('<div class="flash_alert" id="'+id+'" style="display:none;"><b>'+text+'</b></div>').prependTo('.flash').fadeIn("slow", function () {

    var timer;
	timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
	$('.flash #'+id).mouseenter(function(){
		clearTimeout(timer);
		$(this).fadeTo(0, 1);
	}).mouseleave(function(){
		timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
		$(this).fadeTo(0, 0.7);
	});

	$(".flash #"+id).click(function(){
      $(this).slideUp("slow", function(){
		clearTimeout(timer);
        $(this).remove();
      });
    });
  });
  }
	$.flash_info = function(text,time){
  var id = Math.floor( Math.random( ) * (999 - 100 + 1) ) + 100;
  $('<div class="flash_info" id="'+id+'" style="display:none;"><b>'+text+'</b></div>').prependTo('.flash').fadeIn("slow", function () {

    var timer;
	timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
	$('.flash #'+id).mouseenter(function(){
		clearTimeout(timer);
		$(this).fadeTo(0, 1);
	}).mouseleave(function(){
		timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
		$(this).fadeTo(0, 0.7);
	});

	$(".flash #"+id).click(function(){
      $(this).slideUp("slow", function(){
		clearTimeout(timer);
        $(this).remove();
      });
    });
  });
  }
  $.flash_notice = function(text,time){
  var id = Math.floor( Math.random( ) * (999 - 100 + 1) ) + 100;
  $('<div class="flash_notice" id="'+id+'" style="display:none;"><b>'+text+'</b></div>').prependTo('.flash').fadeIn("slow", function () {

    var timer;
	timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
	$('.flash #'+id).mouseenter(function(){
		clearTimeout(timer);
		$(this).fadeTo(0, 1);
	}).mouseleave(function(){
		timer = setTimeout(function() {
	$(".flash #"+id).slideUp("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
		$(this).fadeTo(0, 0.7);
	});

	$(".flash #"+id).click(function(){
      $(this).slideUp("slow", function(){
		clearTimeout(timer);
        $(this).remove();
      });
    });
  });
  }
  $.flash_error = function(text,time){
  var id = Math.floor( Math.random( ) * (999 - 100 + 1) ) + 100;
  $('<div class="flash_error" id="'+id+'" style="display:none;"><b>'+text+'</b></div>').prependTo('.flash').fadeIn("slow", function () {

    var timer;
	timer = setTimeout(function() {
	$(".flash #"+id).fadeOut("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
	$('.flash #'+id).mouseenter(function(){
		clearTimeout(timer);
		$(this).fadeTo(0, 1);
	}).mouseleave(function(){
		timer = setTimeout(function() {
	$(".flash #"+id).fadeOut("slow", function(){
        $(this).remove();
	  });
	}, time*1000);
		$(this).fadeTo(0, 0.7);
	});

	$(".flash #"+id).click(function(){
      $(this).fadeOut("slow", function(){
		clearTimeout(timer);
        $(this).remove();
      });
    });
  });
  }
})(jQuery);

