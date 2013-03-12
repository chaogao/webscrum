(function(window) {
  //init calendar
  var options = {
    height: 300,
    width: 500,
    navHeight: 20,
    labelHeight: 25,
    baseUrl: window.location.href.split("?")[0] + "?date=",
    onMonthChanging: function(dateIn) {
      //this could be an Ajax call to the backend to get this months events
      //var events = [  { "EventID": 7, "StartDate": new Date(2009, 1, 1), "Title": "10:00 pm - EventTitle1", "URL": "#", "Description": "This is a sample event description", "CssClass": "Birthday" },
      //        { "EventID": 8, "StartDate": new Date(2009, 1, 2), "Title": "9:30 pm - this is a much longer title", "URL": "#", "Description": "This is a sample event description", "CssClass": "Meeting" }
      //];
      //$.jMonthCalendar.ReplaceEventCollection(events);
      return true;
    },
    onEventLinkClick: function(event) { 
      alert("event link click");
      return true; 
    },
    onEventBlockClick: function(event) { 
      alert("block clicked");
      return true; 
    },
    onEventBlockOver: function(event) {
      //alert(event.Title + " - " + event.Description);
      return true;
    },
    onEventBlockOut: function(event) {
      return true;
    },
    onDayLinkClick: function(date) { 
      // alert(date.toLocaleDateString());
      return true; 
    },
    onDayCellClick: function(date) { 
      alert(date.toLocaleDateString());
      return true; 
    }
  };
  $.jMonthCalendar.Initialize(options);
})(window);