/*
 This is a manifest file that'll be compiled into application.js, which will include all the files
 listed below.

 Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
 or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.

 It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 the compiled file.

 WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
 GO AFTER THE REQUIRES BELOW.

 = require jquery
 = require jquery_ujs
 = require_tree .
 */

$(document).ready(function(){
    $('a[name=modal]').click(function(e) {
        e.preventDefault();
        var id = $(this).attr('href');
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        $('#mask').css({'width':maskWidth,'height':maskHeight});

        $('#mask').fadeIn(1000);
        $('#mask').fadeTo("slow",0.8);

        var winH = $(window).height();
        var winW = $(window).width();

        $(id).css('top',  winH/2-$(id).height()/2);
        $(id).css('left', winW/2-$(id).width()/2);

        $(id).fadeIn(1000);

    });

    $('.window .close').click(function (e) {
        e.preventDefault();
        $('#mask, .window').fadeOut(1000);
    });

    $('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });
});

