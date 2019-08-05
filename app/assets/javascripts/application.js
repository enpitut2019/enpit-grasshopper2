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
//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require turbolinks
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function get_calendar_height() {
    return $(window).height() - 300;
}

$(document).ready(function() {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev',
            center: 'title',
            right: 'next',
        },
       
        //contentHeight: 300,
        //aspectRatio: 1,
        //height: window.innerHeight - 100, 
    
        /*windowResize: function () { 
            $('#calendar').fullCalendar('option', 'height', get_calendar_height());
        },*/
        //height: get_calendar_height,
    
        events: [
            {
                start: '2019-08-09',
                end: '2019-08-10',
			    rendering: 'background',
			    color: '#00FF00' 
            },
            {
                start: '2019-08-02',
                end: '2019-08-03',
			    rendering: 'background',
			    color: '#00FF00' 
            },
            {
                start: '2019-08-06',
                end: '2019-08-07',
			    rendering: 'background',
			    color: '#00FF00' 
            },
        ]     
    })

});