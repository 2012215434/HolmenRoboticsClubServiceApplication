<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jumbotron.css" rel="stylesheet">
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: getNowFormatDate(),
			businessHours: true, // display business hours
			editable: true,
			selectable: true,
			selectHelper: true, 		
/*  			select: function(start, end) {
				var eventData;

					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true

				$('#calendar').fullCalendar('unselect');
			},  */
			editable: true,
			eventLimit: true, // allow "more" link when too many events
/* 			eventClick: function(calEvent) {


		        getData(calEvent.id);

		        // change the border color just for fun
		        $(this).css('border-color', 'red');

		    }, */
			events: 'Http://localhost:8080/Demo1/findAllEvents.do'});
			/* events: [
				{
					title: 'All Day Event',
					start: '2015-02-01'
				},
				{
					title: 'Long Event',
					start: '2015-02-07',
					end: '2015-02-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2015-02-11',
					end: '2015-02-13'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T10:30:00',
					end: '2015-02-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2015-02-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2015-02-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2015-02-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2015-02-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			]
		}); */
		
	});
	
	
/* 	function ShowDialog() 
	{
	      var  iWidth=560;
	      var  iHeight=300;
	      var  iTop=(window.screen.height-iHeight-100)/2;
	      var  iLeft=(window.screen.width-iWidth)/2;
	      var returnValue=window.showModalDialog("", "newwindow", "dialogHeight:"+iHeight+"px; dialogWidth:"+iWidth+"px; toolbar:no; menubar:no; scrollbars:no; resizable:no; location:no; status:no;left:200px;top:100px;");
	      document.getElementById("TextBox1").innerText=returnValue;
	} */
/* 	function getData()
	{
		$.post("Http://localhost:8080/Demo1/findAllEvents.do?start=2015-09-27&end=2015-11-08", function(data, status){
	        alert("Data: " + data + "\nStatus: " + status);
	        sub1=data.substring(0,data.indexOf("Http://localhost:8080/Demo1/findEventByID.do?"));
	        sub2=data.substring(data.indexOf("Http://localhost:8080/Demo1/findEventByID.do?"),data.indexOf("overlap")-3);
	        sub3=data.substring(data.indexOf("overlap")-3);
	        sub4=data.substring(data.indexOf("id")+4,data.indexOf("title")-2);


	        sub2="Http://localhost:8080/Demo1/findEventByID.do?"+"id="+sub4;
	        data=sub1+sub2+sub3;
	        alert(data);
	        return
	    });
	} */
	
 	function getData(a)
	{
		$.post(a, function(data, status){
	        alert("Data: " + data + "\nStatus: " + status);
	        return data;
	    }); 
	} 
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = year + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	}
	
</script>


<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <ul class="nav navbar-nav" style="margin:0 auto; text-align:center">
  <li role="presentation"><a href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp'">Home</a></li>

</ul>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/login.do">
            <div class="form-group">
              <input type="text" name="userName" id="userName" value="" placeholder="userName" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" name="password" value="" placeholder="password" class="form-control">
            </div>
            <button type="submit" onclick="getUserName()" class="btn btn-success">Login</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav><br><br><br>
 <div class="container">
     
     	<div id='calendar'></div>

      <hr>

      <footer>
        <p>&copy; Holmen High School 2015</p>
      </footer>
    </div> 


</body>
</html>
