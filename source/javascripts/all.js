//= require jquery
//= require bootstrap-sprockets
//= require leaflet
//= require jquery.fitvids
//= require jquery.sequence
//= require jquery.bxslider
//= require main-menu
//= require template

$(document).ready(function(){
  $('.photos-slider').bxSlider({
    auto: true,
    mode: 'fade',
    captions: true
  });
});
