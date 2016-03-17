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
function check()
{
	document.getElementById('time').value=getNowFormatDate() ;
	
	donateForm.submit();
	
}

$(function() {
	$('.datepicker').pickadate({
		format: 'yyyy-mm-dd',
		});	
}); 
</script>


<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	
.donate-group
{
	width:340px;
	margin:0 auto;
	text-lign:center;
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
  <li role="presentation" onclick="location='http://localhost:8080/Demo1/manageEvent.jsp'"><a href="#">Manage event</a></li>
	<li role="presentation" class="active" id="li-checkDonation" onclick="location='http://localhost:8080/Demo1/checkDonation.jsp'"><a href="#">Check donation</a></li>
</ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div>
      </div>
    </nav><br><br><br>
<div class="container" style="position:relative;width:800px; margin:0 auto;">
 <form class="form-inline donate-group" name="donateForm" action="http://localhost:8080/Demo1/getTotalDonation.do">
  <div class="form-group">
    <div class="input-group">
      <input type="text" class="form-control datepicker" id="amount" name="date" style="width:250px;text-align:center">
    </div>
  </div>
  <button type="submit" class="btn btn-primary" >Check</button>
</form>
<br>
<div style="width:100px; margin:0 auto;">${amount}</div>
  <div style="position:fixed;bottom:0%;width:45%;">
      <hr>
      <footer>
        <p>&copy; Holmen High School 2015</p>
      </footer>
    </div>
</div> 

</body>
</html>
