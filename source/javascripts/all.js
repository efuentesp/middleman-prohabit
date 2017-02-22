//= require jquery
//= require bootstrap-sprockets
//= require leaflet
//= require jquery.fitvids
//= require jquery.sequence
//= require jquery.bxslider
//= require main-menu
//= require template

$(document).ready(function(){
  $('.bx-photos-slider').bxSlider({
    auto: true,
    mode: 'fade',
    captions: true,
    pagerCustom: '#bx-photos-pager'
  });
});
