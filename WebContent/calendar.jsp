<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/jumbotron.css" rel="stylesheet">
    <link href="css/event.css" rel="stylesheet">
    <link href="css/classic.css" rel="stylesheet">
<link href="css/classic.date.css" rel="stylesheet">
<link href="css/classic.time.css" rel="stylesheet"> 
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/bootstrap.js'></script>
<script src='js/picker.js'></script>
<script src='js/picker.date.js'></script>
<script src='js/picker.time.js'></script>
<script src='js/legacy.js'></script>

<script>
$(function() {
	$('.datepicker').pickadate({
		format: 'yyyy-mm-dd',
		});	
	$('.timepicker').pickatime({
		format: 'HH:i:00',
		formatSubmit: 'HH:i:00',
	});	
}); 
var overlap=false;
function getCookie(cname) 
{
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

function setUserType()
{
	if("${user.userType}"!="")
	{
		document.cookie="userType="+"${user.userType}";
	}
}
	$(document).ready(function() 
	{
/* 		$.post( "searchUser.do?userName="+getCookie('userName'), {}, function( data )
	   			{
	   		 	alert(data);

	   			} );  */
/* 		alert('a'+getCookie('userName')+'a'); */
		if(document.getElementById('signClassSuccessOrNorTemp').innerHTML=="false")
		{
			document.getElementById('alert').classList.remove('alert-danger');	
			document.getElementById('alert').classList.add('alert-success');
			document.getElementById('alert').classList.add('alertShow');
			document.getElementById('alert').innerHTML="Sign up the class successfully";
		}
	    else if(document.getElementById('signClassSuccessOrNorTemp').innerHTML=="true")
		{
	    	document.getElementById('alert').classList.remove('alert-success');	
			document.getElementById('alert').classList.add('alert-danger');
			document.getElementById('alert').classList.add('alertShow');		
			document.getElementById('alert').innerHTML="You can't sign up two classes at the same time!";
		}
		
		setUserType();
		if(getCookie('userType')=="admin")
		{
			document.getElementById('li-manageUser').style.display="block";
			document.getElementById('li-manageEvent').style.display="block";
			document.getElementById('li-donate').style.display="none";
			document.getElementById('li-checkDonation').style.display="block";
		}
		else if(getCookie('userType')=="volunteer"||getCookie('userType')=="student")
		{
			document.getElementById('li-manageUser').style.display="none";
		document.getElementById('li-manageEvent').style.display="none";
		document.getElementById('li-donate').style.display="none";
		document.getElementById('li-checkDonation').style.display="none";
			
		}
		else if(getCookie('userType')=="sponsor")
		{
			document.getElementById('li-manageUser').style.display="none";
			document.getElementById('li-manageEvent').style.display="none";
			document.getElementById('li-donate').style.display="block";
			document.getElementById('li-checkDonation').style.display="none";
		}
		if(getCookie('show')=="true")
		{
			var s = document.getElementById("startDateTime").value;
			var e = document.getElementById("endDateTime").value;
			var arrays = s.split(' ');
			var arraye = e.split(' ');
			document.getElementById("startDate").value=arrays[0];
			document.getElementById("startTime").value=arrays[1].split('.')[0];
			document.getElementById("endDate").value=arraye[0];
			document.getElementById("endTime").value=arraye[1].split('.')[0];
			document.getElementById('eventDisplay').className="eventShow";
			judge();
		}
		else
		{
			document.getElementById('eventDisplay').className="event";
		}
		
		document.cookie="show=false";
		
		$('#calendar').fullCalendar
		({
			header: 
			{
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			/* defaultDate: '2015-11-11 10:00:00', */
			defaultDate: getNowFormatDate() ,
			businessHours: true, // display business hours
			editable: true,
			selectable: true,
			selectHelper: true,
			select: function(start, end) 
			{
				var eventData = 
				{
						start: start,
						end: end
				};
				document.cookie="starttime="+String(eventData.start);
				document.cookie="endtime="+String(eventData.end);
/* 				document.cookie="userType=admin";*/
				if(getCookie('userType') =="admin")
				{	
					document.getElementById('addEventDisplay').className="addEventShow";
					fillTime();
					document.getElementById("signForTeachingOrActicity").innerHTML="Add event";
					document.getElementById("type").value="activity";
				}
				else if(getCookie('userType') =="volunteer")
				{
					document.getElementById('addEventDisplay').className="addEventShow";
					fillTime();
					document.getElementById("signForTeachingOrActicity").innerHTML="Sign up class to teach";
					document.getElementById("type").value="class";
				}
			},  
			editable: true,
			eventLimit: true, // allow "more" link when too many events
 			eventClick: function(calEvent) {

			document.cookie="show=true";
		        /* getData(calEvent.id);

		        // change the border color just for fun
		        $(this).css('border-color', 'red'); */

		    }, 
			events: 'Http://localhost:8080/Demo1/findAllEvents.do?username='+getCookie('userName')});
	});

  	function judge()
	{
		var a = "${events.username}";
		if(getCookie('userName')==a)
		{
		 	document.getElementById("cancelBtn1").style.display="";
		}
	}  
	
	function getNowFormatDate() 
	{
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var hou = date.getHours();
	    var min = date.getMinutes();
	    var sec = date.getSeconds();
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (hou <= 9) {
	    	hou = "0" + hou;
	    }
	    if (min <= 9) {
	    	min = "0" + min;
	    }
	    if (sec <= 9) {
	    	sec = "0" + sec;
	    }
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = year + seperator1 + month + seperator1 + strDate
	            + " " + hou + seperator2 + min
	            + seperator2 + sec;
	    return currentdate;
	}
	
	function unshow()
	{
		document.cookie="show=false";
		document.getElementById('eventDisplay').className="eventUnshow";
	}
	
	function unshowAdd()
	{
		document.getElementById('addEventDisplay').className="addEventUnshow";
	}
	
	function signUp()
	{
	 	if(getCookie('userType')=="student")
		{
			document.getElementById('userName').value=getCookie('userName') ;
			signUpForm.action="http://localhost:8080/Demo1/addSignUpClasses.do";
			signUpForm.submit();
		} 
/* 	 	else if(getCookie('userType')=="volunteer")
		{
			document.getElementById('userName').value=getCookie('userName') ;
			signUpForm.action="http://localhost:8080/Demo1/addSignUpClasses.do";
			signUpForm.submit();
		} */
	}
	
	function cancel()
	{
		if(getCookie('userType')=="student")
		{
			document.getElementById('userName').value=getCookie('userName') ;
			signUpForm.action="http://localhost:8080/Demo1/cancelSignUpClasses.do";
			signUpForm.submit();
		} 
/* 	 	else if(getCookie('userType')=="volunteer")
		{
			document.getElementById('userName').value=getCookie('userName') ;
			signUpForm.action="http://localhost:8080/Demo1/cancelSignUpClasses.do";
			signUpForm.submit();
		} */
	}
	
	function cancelClass()
	{
		cancelClassForm.action="http://localhost:8080/Demo1/deleteEvents.do";
		cancelClassForm.submit();
	}
	
	function changeTime()
	{
		document.getElementById("startDateTime").value=document.getElementById("startDate").value+" "+document.getElementById("startTime").value;
		document.getElementById("endDateTime").value=document.getElementById("endDate").value+" "+document.getElementById("endTime").value;
		changeTimeForm.submit();
	}
	function fillTime() 
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
	
	#eventDisplay
	{ 
		position:fixed; 
		width:35%; 
		left:32%; 
		top:12%; 
		z-index:10;
	}
	
	#addEventDisplay
	{ 
		position:fixed; 
		width:25%; 
		left:37%; 
		top:12%; 
		z-index:10;
	}

	.panel
	{
		margin-left:1%;
		margin-right:1%;
	}
	.panel.panel-primary
	{
		margin-top:2.5%;
	}
    .panel.panel-default
    {
      margin-top:-10px
    }
     .panel.panel-success
    {
      margin-top:-10px
    }

</style>
</head>
<body>
<div id="signClassSuccessOrNorTemp" style="display:none">${IsSignUpEventsAtThisTime}</div>
<div class="alert alert-danger" id="alert"></div>
<div class="event" id="eventDisplay">
<div style="width:30px;height:30px;text-align:center;margin-left:98%" onclick="unshow()"><span class="glyphicon glyphicon-remove-circle" style="margin-top:12px;font-size: 25px;"></span></div>
  <div style="-moz-border-radius: 15px;      /* Gecko browsers */
    -webkit-border-radius: 15px;   /* Webkit browsers */
    border-radius:15px;            /* W3C syntax */background-color: white;
		box-shadow: 8px 8px 10px #888888;padding-top:0.5px;padding-bottom:0.5px; margin-top:0%" >
  <div class="panel panel-primary" >
    <div class="panel-heading"><h3 class="panel-title" align="center">${events.title}</h3></div>
  </div>
  <form name="changeTimeForm" action="http://localhost:8080/Demo1/updateSchedule.do">
  <input name="eventID" style="display:none" value="${events.eventID}"/>
  <input id="startDateTime" name="starttime" style="display:none" value="${events.starttime}"/>
  <input id="endDateTime" name="endtime" style="display:none" value="${events.endtime}"/>
  </form>
  <div class="panel panel-success" style="float:left;">
    <div class="panel-heading">
      <h3 class="panel-title">Start time</h3>
    </div>
    <div class="panel-body">
      <input id="startDate" class="datepicker" value="" style="width:95px;text-align:center;margin-right:5px"/><input id="startTime" class="timepicker" value="00:00:00" style="width:75px;text-align:center"/>
    </div>
  </div>
  <div class="panel panel-success" style=" float:right;">
    <div class="panel-heading">
      <h3 class="panel-title">End time</h3>
    </div>
    <div class="panel-body">
      <input id="endDate" class="datepicker" value="" style="width:95px;text-align:center;margin-right:5px"/><input id="endTime" class="timepicker" value="00:00:00" style="width:75px;text-align:center"/>
    </div>
  </div>
<br><br><br><br><br>
  <div class="panel panel-default" >
    <div class="panel-heading">
      <h3 class="panel-title">location</h3>
    </div>
    <div class="panel-body">
      ${events.location}
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">type</h3>
    </div>
    <div class="panel-body">
      ${events.type}
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">description</h3>
    </div>
    <div class="panel-body">
      ${events.description}
    </div>
   </div>
   <form name="signUpForm">
   <input id="eventID" name="eventID" style="display:none" value="${events.eventID}"/>
   <input id="userName" name="userName" style="display:none"/>
   <input id="starttime1" name="starttime" style="display:none" value="${events.starttime}"/>
   <input id="endtime1" name="endtime" style="display:none" value="${events.starttime}"/>
   </form>
   <form name="cancelClassForm">
   <input id="eventID1" name="eventID" style="display:none" value="${events.eventID}"/>
   </form>
   <c:choose>
   <c:when test="${events.type=='class'&&flag=='false'}">
   <div id="singUpBtn" class="input-group" style="margin:0 auto;">
     <button onclick="signUp()" class="btn btn-primary" style="margin-bottom:15px;">Sign up</button>
   </div>
   </c:when>
    <c:when test="${events.type=='class'&&flag=='true'}">
    <div id="cancelBtn" class="input-group" style="margin:0 auto;">
     <button onclick="cancel()" class="btn btn-primary" style="margin-bottom:15px;">cancel</button>
   </div>
   </c:when>
   </c:choose>
   <div id="cancelBtn1" class="input-group" style="margin:0 auto;display:none;text-algin:center">
   <div style="text-align:center"><button onclick="changeTime()" class="btn btn-primary" style="margin-bottom:10px;">change time</button></div>
     <div style="text-align:center"><button onclick="cancelClass()" class="btn btn-primary" style="margin-bottom:10px;">cancel</button></div>
    </div> 
  </div>
</div> 

<div class="addEvent" id="addEventDisplay" >
<div style="width:30px;height:30px;text-align:center;margin-left:98%" onclick="unshowAdd()"><span class="glyphicon glyphicon-remove-circle" style="margin-top:12px;font-size: 25px;"></span></div>
  <div style="-moz-border-radius: 15px;      /* Gecko browsers */
    -webkit-border-radius: 15px;   /* Webkit browsers */
    border-radius:15px;            /* W3C syntax */background-color: white;
		box-shadow: 8px 8px 10px #888888;padding:10px 8px 0px 8px; margin-top:0%" >
  <div class="panel panel-primary" >
    <div class="panel-heading"><h3 class="panel-title" align="center" id="signForTeachingOrActicity"></h3></div>
  </div>
  <form action="http://localhost:8080/Demo1/addEvent.do">
  <div class="input-group" >
    <span class="input-group-addon" >start time</span>
    <input type="text" class="form-control" id="starttime" name="starttime" aria-describedby="basic-addon1" value="" readonly>
  </div><br>
  <div class="input-group" >
    <span class="input-group-addon" >end time&nbsp;</span>
    <input type="text" class="form-control" id="endtime" name="endtime" aria-describedby="basic-addon1" value="" readonly>
  </div><br>
  <div class="input-group">
    <span class="input-group-addon" >&nbsp;&nbsp;&nbsp;&nbsp;title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
    <input type="text" class="form-control" name="title"  aria-describedby="basic-addon1" value="">
  </div><br>
  <div class="input-group">
  <span class="input-group-addon" >&nbsp;location&nbsp;&nbsp;</span>
    <input type="text" class="form-control" name="location"  aria-describedby="basic-addon1" value="">
  </div><br>
  <div class="input-group" id="description1" >
    <span class="input-group-addon" id="basic-addon2">description</span>
    <textarea id="description-text" class="description2" rows="5" name="description"  style="width:100%;height:104%" ></textarea>
  </div><br>
 <!--  <div class="input-group"style="margin:0 auto;">
    <div class="btn-group" >
      <button type="button" class="btn btn-default" id="typeBtn">Event type</button>
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
      </button>
      <ul class="dropdown-menu">
        <li><a onclick="fillType('activity')">activity</a></li>
        <li><a onclick="fillType('class')">class</a></li>
      </ul>
    </div>
  </div><br> -->
  <div class="input-group" style="margin:0 auto;">
    <button type="submit" class="btn btn-default">submit</button>
  </div>
  <br>
  <input id="username" name="username" style="display:none"></input>
  <input id="userType" name="userType" style="display:none"></input>
  <input id="type" name="type" style="display:none"></input>
  </form>
</div>
</div> 

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <!-- <div class="navbar-header">
          <a class="navbar-brand" href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp#'">Robotics Club</a>
        </div> -->
        <ul class="nav navbar-nav" style="margin:0 auto; text-align:center">
  <li role="presentation"><a href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp'">Home</a></li>
  <li role="presentation" class="active" onclick="location='http://localhost:8080/Demo1/calendar.jsp'"><a href="#">Calendar</a></li>
  <li role="presentation" id="li-manageUser" onclick="location='http://localhost:8080/Demo1/manageUser.jsp'"><a href="#">Manage user</a></li>
  <li role="presentation" id="li-manageEvent"   onclick="location='http://localhost:8080/Demo1/manageEvent.jsp'"><a href="#">Manage event</a></li>
  <li role="presentation" id="li-donate"   onclick="location='http://localhost:8080/Demo1/donate.jsp'"><a href="#">Donate</a></li>
  <li role="presentation" id="li-checkDonation" onclick="location='http://localhost:8080/Demo1/checkDonation.jsp'"><a href="#">Check donation</a></li>
</ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div>
      </div>
    </nav><br><br><br>
 <div >
     	<div id='calendar' style="margin-top:-50px"></div>

      <hr>

      <footer>
        <p>&copy; Holmen High School 2015&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact admin: <a href="mailto:gu.yifan@gmail.com">gu.yifan@gmail.com</a></p>
      </footer>
    </div> 
</body>
</html>
