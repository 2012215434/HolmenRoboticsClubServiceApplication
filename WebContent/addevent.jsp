<!DOCTYPE html>
<html>
<head>

<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/jumbotron.css" rel="stylesheet">
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/bootstrap.js'></script>
<script>
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}
window.onload=function() 
{
/*  	 alert(document.cookie);  
 */ 	
 	/* Wed Nov 11 2015 00:00:00 GMT+0000 */
 	var starttime1 = getCookie('starttime');
 	starttime1=starttime1.split(' ');
 	var starttime2 = starttime1[3]
 	if(starttime1[1]=="Jan")
 	{
 		starttime2+="-01-";
 	}
 	else if(starttime1[1]=="Feb")
 	{
 		starttime2+="-02-";
 	}
 	else if(starttime1[1]=="Mar")
 	{
 		starttime2+="-03-";
 	}
 	else if(starttime1[1]=="Apr")
 	{
 		starttime2+="-04-";
 	}
 	else if(starttime1[1]=="May")
 	{
 		starttime2+="-05-";
 	}
 	else if(starttime1[1]=="Jun")
 	{
 		starttime2+="-06-";
 	}
 	else if(starttime1[1]=="Jul")
 	{
 		starttime2+="-07-";
 	}
 	else if(starttime1[1]=="Aug")
 	{
 		starttime2+="-08-";
 	}
 	else if(starttime1[1]=="Sep")
 	{
 		starttime2+="-09-";
 	}
 	else if(starttime1[1]=="Oct")
 	{
 		starttime2+="-10-";
 	}
 	else if(starttime1[1]=="Nov")
 	{
 		starttime2+="-11-";
 	}
 	else if(starttime1[1]=="Dec")
 	{
 		starttime2+="-12-";
 	}	
  	/* Tue Oct 06 2015 00:00:00 GMT+0000 */
 	starttime2+=starttime1[2];
 	starttime2+=" ";
 	starttime2+=starttime1[4];
 	
 /* 	------------------------------------------------------------------ */
 	
 	var endtime1 = getCookie('endtime');
 	endtime1 = endtime1.split(" ");
 	var endtime2 = endtime1[3];
 	if(endtime1[1]=="Jan")
 	{
 		endtime2+="-01-";
 	}
 	else if(endtime1[1]=="Feb")
 	{
 		endtime2+="-02-";
 	}
 	else if(endtime1[1]=="Mar")
 	{
 		endtime2+="-03-";
 	}
 	else if(endtime1[1]=="Apr")
 	{
 		endtime2+="-04-";
 	}
 	else if(endtime1[1]=="May")
 	{
 		endtime2+="-05-";
 	}
 	else if(endtime1[1]=="Jun")
 	{
 		endtime2+="-06-";
 	}
 	else if(endtime1[1]=="Jul")
 	{
 		endtime2+="-07-";
 	}
 	else if(endtime1[1]=="Aug")
 	{
 		endtime2+="-08-";
 	}
 	else if(endtime1[1]=="Sep")
 	{
 		endtime2+="-09-";
 	}
 	else if(endtime1[1]=="Oct")
 	{
 		endtime2+="-10-";
 	}
 	else if(endtime1[1]=="Nov")
 	{
 		endtime2+="-11-";
 	}
 	else if(endtime1[1]=="Dec")
 	{
 		endtime2+="-12-";
 	}	
  	/* Tue Oct 06 2015 00:00:00 GMT+0000 */
 	endtime2+=endtime1[2];
 	endtime2+=" ";
 	endtime2+=endtime1[4];

	document.getElementById("starttime").value=starttime2;
	document.getElementById("endtime").value=endtime2;
	
   document.getElementById("username").value=getCookie('userName');
   document.getElementById("userType").value=getCookie('userType');
}

function fillType(type)
{
	document.getElementById("type").value=type;
	
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
          <a class="navbar-brand" href="#">Robotics Club</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav><br><br><br>
<div class="container" style="width:600px; margin:0 auto;">
  <form action="http://localhost:8080/Demo1/addEvent.do">
  <div class="input-group">
    <span class="input-group-addon" >start time</span>
    <input type="text" class="form-control" id="starttime" name="starttime" aria-describedby="basic-addon1" value="" readonly>
  </div><br><br>
  <div class="input-group">
    <span class="input-group-addon" >end time</span>
    <input type="text" class="form-control" id="endtime" name="endtime" aria-describedby="basic-addon1" value="" readonly>
  </div><br><br>
  <div class="input-group">
    <span class="input-group-addon" >title</span>
    <input type="text" class="form-control" name="title"  aria-describedby="basic-addon1" value="">
  </div><br><br>
  <div class="input-group">
  <span class="input-group-addon" >location</span>
    <input type="text" class="form-control" name="location"  aria-describedby="basic-addon1" value="">
  </div><br><br>
  <div class="input-group">
    <span class="input-group-addon" id="basic-addon2">description</span>
    <textarea  rows="5" name="description"  style="width:100%;" ></textarea>
  </div><br>
  <div class="input-group"style="margin:0 auto;">
    <div class="btn-group" >
      <button type="button" class="btn btn-default">Event type</button>
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
      </button>
      <ul class="dropdown-menu">
        <li><a onclick="fillType('activity')">activity</a></li>
        <li><a onclick="fillType('class')">class</a></li>
      </ul>
    </div>
  </div><br>
  <div class="input-group" style="margin:0 auto;">
    <button type="submit" class="btn btn-default">submit</button>
  </div>
  <input id="username" name="username" style="visibility:hidden"></input>
  <input id="userType" name="userType" style="visibility:hidden"></input>
  <input id="type" name="type" style="visibility:hidden"></input>
  </form>

      <hr>
      <footer >
        <p>&copy; Holmen High School 2015</p>
      </footer>
</div> 

</body>
</html>
