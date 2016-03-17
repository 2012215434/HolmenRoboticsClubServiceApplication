<%@ page language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="css/jumbotron.css" rel="stylesheet">
<link href="css/classic.css" rel="stylesheet">
<link href="css/classic.date.css" rel="stylesheet">
<link href="css/classic.time.css" rel="stylesheet"> 
<!-- <link href="css/default.css" rel="stylesheet">
<link href="css/default.date.css" rel="stylesheet">
<link href="css/default.time.css" rel="stylesheet">  -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
<script src='js/moment.min.js'></script>
<!-- <script src='js/jquery.min.js'></script> -->
<script src='js/fullcalendar.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<script src='js/npm.js'></script>
<script src='js/transition.js'></script>
<script src='js/picker.js'></script>
<script src='js/picker.date.js'></script>
<script src='js/picker.time.js'></script>
<script src='js/legacy.js'></script>
<script>
	$(function() {
		$('.datepicker').pickadate({
 			  format: 'yyyy-mm-dd',
			});	
}); 
/* 	window.onload=function()
	{
		var x = document.getElementsByClassName("event");
		if(x[0]==null)
		{
			eventForm.submit();
		}
	} */
	function showeventForm1()
	{
		document.getElementById("form1").style.visibility="visible";
		document.getElementById("form2").style.visibility="hidden";
		document.getElementById("showeventForm1").classList.add('active');
		document.getElementById("showeventForm2").classList.remove('active');
	}
	function showeventForm2()
	{
		document.getElementById("form2").style.visibility="visible";
		document.getElementById("form1").style.visibility="hidden";
		document.getElementById("showeventForm2").classList.add('active');
		document.getElementById("showeventForm1").classList.remove('active');
		document.getElementById("form2").style.transform="translateY(-100px)";
	}
</script>


<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
</style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
         <ul class="nav navbar-nav" style="margin:0 auto; text-align:center">
  <li role="presentation"><a href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp'">Home</a></li>
  <li role="presentation" onclick="location='http://localhost:8080/Demo1/calendar.jsp'"><a href="#">Calendar</a></li>
  <li role="presentation"  onclick="location='http://localhost:8080/Demo1/manageUser.jsp'"><a href="#">Manage user</a></li>
  <li role="presentation" class="active" onclick="location='http://localhost:8080/Demo1/manageEvent.jsp'"><a href="#">Manage event</a></li>
  <li role="presentation" onclick="location='http://localhost:8080/Demo1/checkDonation.jsp'"><a href="#">Check donation</a></li>
</ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div>
      </div>
    </nav><br><br><br>
<div class="container" style="position:relative;width:800px; margin:0 auto;">
<div style="width:350px;margin:0 auto;text-align:center">
<div class="btn-group" role="group" aria-label="...">
  <button type="button" id="showeventForm1" class="btn btn-default active" onclick="showeventForm1()">Search by date</button>
  <button type="button" id="showeventForm2" class="btn btn-default" onclick="showeventForm2()">&nbsp;Search by volunteer&nbsp;&nbsp;</button>
</div>
</div>
<br><br>
	<form name="eventForm1" action="http://localhost:8080/Demo1/findAllEventsByAdmin.do">
  	<div id="form1" class="input-group" style="width:260px;margin:0 auto;text-align:center">
    <input type="text" id="datepicker" name="date" class="datepicker form-control" placeholder="" style="text-align:center;">
    <span class="input-group-btn">
        <button class="btn btn-primary" type="submit">Search</button>
    </span>
  	</div>
  	</form>
  	<form name="eventForm2" action="http://localhost:8080/Demo1/findAllEventsByUsername.do">
  	<div id="form2" class="input-group" style="width:230px;margin:0 auto;text-align:center;visibility:hidden;-webkit-transform:translateY(-35px);">
    <input type="text"  name="volunteer" class="form-control" placeholder="" style="text-align:center;">
    <span class="input-group-btn">
        <button class="btn btn-primary" type="submit">Search</button>
    </span>
  	</div>
  	</form>
  	<br>
  	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table table-striped" style="text-align:center">
				<thead>
					<tr >
						<th style="width:75px;text-align:center">
							Event Id
						</th >
						<th style="text-align:center">
							Title
						</th>
						<th style="text-align:center">
							Description
						</th>
						<th style="text-align:center">
							Type
						</th>
						<th style="text-align:center">
							Volunteer
						</th>
						<th style="text-align:center">
							status
						</th>
						<th>
						</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="count" scope="session" value="${0}"/>
					<c:forEach items="${Events}" var="event" varStatus="status">
					<c:choose>
					<c:when test="${event.approvedstatus==true}">
					<tr class="event">
						<td>
							${event.eventID}
						</td>
						<td>
							${event.title}
						</td>
						<td>
							${event.description}
						</td>
						<td>
							${event.type}
						</td>
						<td>
							${event.username}
						</td>
						<td class="success">
							approved
						</td>
						<td>
						</td>
					</tr>
					</c:when>
					<c:when test="${event.approvedstatus==false}">
					<form action="http://localhost:8080/Demo1/approve.do">
					<tr class="event">
						<td>
							${event.eventID}<input style="display:none" name="eventID" value="${event.eventID}"/>
						</td>
						<td>
							${event.title}
						</td>
						<td>
							${event.description}
						</td>
						<td>
							${event.type}
						</td>
						<td>
							${event.username}
						</td>
						<td class="danger">
							<button class="btn btn-primary" type="submit">aprrove</button>
						</td>
							
					</tr>
					</form>
					</c:when>
					</c:choose>
					</c:forEach>			
				</tbody>
			</table>
		</div>
	</div>
  </div>
  <div style="position:fixed;bottom:0%;width:45%;">
      <hr>
      <footer>
        <p>&copy; Holmen High School 2015</p>
      </footer>
    </div>
</div> 

</body>
</html>
