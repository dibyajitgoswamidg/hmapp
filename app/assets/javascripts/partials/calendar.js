$(document).ready(function() {
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next,today',
      center: 'title',
      right: 'prevYear,nextYear'
    },
    events: [
    {
      title  : 'Week Off',
      start  : '2019-04-27',
      end    : '2019-04-28'
    }
  ]
  });
});
