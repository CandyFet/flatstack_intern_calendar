var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  });
};

var anchorPicker = function(){
  $('.anchor').each(function(){
    $(this).daterangepicker({
      singleDatePicker: true,
      showDropdowns: true
    }, function(start, end, label){
      $('.anchor-hidden').val(start.format('YYYY-MM-DD HH:mm'));
    });
  });
};
$(document).on('turbolinks:load', date_range_picker);