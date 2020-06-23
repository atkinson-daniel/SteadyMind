// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle

function change_color() {
  $( document ).ready(function() {
    $( ".simple-calendar .day div" ).each(function( index ) {
      if ($(this).text().trim() == "😟") {
        $(this).parent().css('background', '#83D5DB');
      };
      if ($(this).text().trim() == "😐") {
        $(this).parent().css('background', '#F2F2F2');
      };
      if ($(this).text().trim() == "😄") {
        $(this).parent().css('background', '#FB9C96');
      };
    });
  });
}

change_color();

function show_diary() {
  let timesClicked = 0
  $(document).ready(function() {
    $(".calendar-day").click(function(){
      timesClicked ++;
      if(timesClicked % 2 !== 0){
        const date = $(this).data('date');
        const newDate = new Date(date);
        const longDate = newDate.toDateString();
        $.ajax({
          type: 'GET',
          url: `http://localhost:3000/user_moods?date=${date}`,
          success: function(entry) {
            const user_entry = entry['data']['attributes']['entry'];
            $(".user-calendar").append("<section class='box-shadow card col-md-5 diary-log'> <span class='calendar-title'>Your Diary Entry On "+ longDate +"</span><br><br>" + user_entry + "</section>");
          }
        })
      }
      else {
        const diaryLog = document.querySelector('.diary-log');
        diaryLog.remove();
      }
    })
  })
}

show_diary();
