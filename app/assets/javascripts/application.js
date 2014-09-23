// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
jQuery(document).ready(function() {
    $('.datepicker').data({behaviour: "datepicker"}).datepicker({ dateFormat: 'yyyy-mm-dd'});
});
//$('.datepicker').datepicker({ dateFormat: 'yyyy-mm-dd'});
//var nowTemp = new Date();
//var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
 

$(document).ready(function() {

   var docHeight = $(window).height();
   var footerHeight = $('#colophon').height();
   var footerTop = $('#colophon').position().top + footerHeight;

   if (footerTop < docHeight) {
    $('#colophon').css('margin-top', 10+ (docHeight - footerTop) + 'px');
   }
  });