(function(window) {
  //init calendar
  var options = {
    height: 740,
    width: '100%',
    navHeight: 25,
    labelHeight: 25,
    baseUrl: '/scrums/reports/',
    onMonthChanging: function(dateIn) {
      //this could be an Ajax call to the backend to get this months events
      //var events = [  { "EventID": 7, "StartDate": new Date(2009, 1, 1), "Title": "10:00 pm - EventTitle1", "URL": "#", "Description": "This is a sample event description", "CssClass": "Birthday" },
      //        { "EventID": 8, "StartDate": new Date(2009, 1, 2), "Title": "9:30 pm - this is a much longer title", "URL": "#", "Description": "This is a sample event description", "CssClass": "Meeting" }
      //];
      //$.jMonthCalendar.ReplaceEventCollection(events);
      return true;
    },
    onEventLinkClick: function(event) { 
      // alert("event link click");
      return true; 
    },
    onEventBlockClick: function(event) { 
      // alert("block clicked");
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
      // alert(date.toLocaleDateString());
      return true; 
    }
  };
  $.jMonthCalendar.Initialize(options);

  /**
   * @page scrum/feature
   */
  //set template
  $("#ftype-detail").setTemplateElement("template-ftype-detail");

  //init tabs
  $(".f-create .nav").delegate("a", "click", function(e) {
    e.preventDefault();
    $(this).tab("show");
  });

  //init date
  $("#f-datepickers input").datepicker();

  //init ftype change
  $(".ftype-buttons").delegate(".btn", "click", function(e) {
    var option = $(this).data("option");
    $(this).parents(".ftype-list").find("[name=ftype]").val(option.id);
    option.rulers && $("#ftype-detail").processTemplate({"rulers": option.rulers});
    $("#ftype-detail").fadeIn();
  });
  
})(window);