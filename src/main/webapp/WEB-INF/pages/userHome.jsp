<%@page session="false"%>
<html>
<head>
<title>${title}</title>
<style type="text/css">
table.ui-datepicker-calendar tbody td.highlight > a {
    background: repeat-x scroll 50% bottom #FFEB80;
    color: #363636;
    border: 1px solid #FFDE2E;
}
</style>
</style>
</head>
<body>
<br/>
   <h1>${message}</h1>
   <table style="width: 100%;">
   <tr>
   		<td style="width: 80%">
   		</td>
   		<td>
   			<div id="datepicker"></div>
   		</td>
		<td style="width: 2%">
   		<td>
   </tr>
   </table>
      
<div id="userEventDialogBoxId" title="Event Details">
  <p></p>
</div>

   <script>
   var events = [ 
    { Title: "Five K for charity", Date: new Date("05/13/2016") }, 
    { Title: "Dinner", Date: new Date("05/25/2016") }, 
    { Title: "Meeting with manager", Date: new Date("06/01/2016") }
];

$( "#userEventDialogBoxId" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });

$( "#datepicker" ).datepicker({
    beforeShowDay: function(date) {
        var result = [true, '', null];
        var matching = $.grep(events, function(event) {
            return event.Date.valueOf() === date.valueOf();
        });
        
        if (matching.length) {
            result = [true, 'highlight', null];
        }
        return result;
    },
    onSelect: function(dateText) {
        var date,
            selectedDate = new Date(dateText),
            i = 0,
            event = null;
        
        while (i < events.length && !event) {
            date = events[i].Date;

            if (selectedDate.valueOf() === date.valueOf()) {
                event = events[i];
            }
            i++;
        }
        if (event) {
           // alert(event.Title);
		   $("#userEventDialogBoxId p").text(event.Title);
		   $( "#userEventDialogBoxId" ).dialog( "open" );
        }
    }
});
</script>
</body>
</html>