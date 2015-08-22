// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require FileSaver
//= require turbolinks
//= require_tree .

var wireEvents = function() {
  $('.color-controls .palette tr td').click(function(event) {
    $('.color-controls .current').css('background-color', $(event.target).closest('td').css('background-color'));
  });

  $('.floor-plan-show svg').click(function(event) {
    var element = $(event.target);
    element.css('fill', $('.color-controls .current').css('background-color'));
  });

  $('a.action-download').click(function(event) {
    var svgContent = new Blob([$('.floor-plan-show svg').parent().html()], {type: 'image/svg+xml'});
    var title = $('.floor-plan-image').data('file-name');
    saveAs(svgContent, title + '.svg')
    return false;
  });
};

$(document).on('page:change', wireEvents);
