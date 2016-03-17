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
window.onload=function()
{
	if(document.getElementById("donateSuccessOrNot").innerHTML=="true")
	{
		document.getElementById("alert").classList.add("showAlert");
	}
}
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
function donate()
{
	document.getElementById('username').value=getCookie('userName');
	document.getElementById('time').value=getNowFormatDate() ;
	
	donateForm.submit();
	
}
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
	position:relative;
	width:300px;
	margin:0 auto;
	text-lign:center;
	top:10px;
}
.amount
{
	width:160px;
	-webkit-transition: width .5s; /* For Safari 3.1 to 6.0 */
    transition: width .5s;
}
.amount:hover
{
	width:170px;
}
.alert
{
	position:relative;
	top:-140px;
	text-align:center;
}

.showAlert
{
	-webkit-animation:show 5s;
}
@-webkit-keyframes show
{
	0% {top:-140px;}
	25% {top:-85px;}
	75% {top:-85px;}
	100% {top:--140px;}
}
</style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
         <ul class="nav navbar-nav" style="margin:0 auto; text-align:center">
  <li role="presentation"><a href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp'">Home</a></li>
  <li role="presentation" onclick="location='http://localhost:8080/Demo1/calendar.jsp'"><a href="#">Calendar</a></li>
	<li role="presentation" class="active"  id="li-donate" onclick="location='http://localhost:8080/Demo1/donate.jsp'"><a href="#">Donate</a></li>
</ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div>
      </div>
    </nav><br><br><br>
<div class="container" style="position:relative;width:800px; margin:0 auto;">
<form class="form-inline donate-group" name="donateForm" action="http://localhost:8080/Demo1/donate.do">
  <div class="form-group amount">
    <!-- <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label> -->
    <div class="input-group">
      <div class="input-group-addon">$</div>
      <input type="text" class="form-control" id="amount" name="amount" placeholder="Amount">
      <input type="text" class="form-control" id="time" name="time" style="display:none">
      <input type="text" class="form-control" id="username" name="username" style="display:none">
      <div class="input-group-addon">.00</div>
    </div>
  </div>
  <button type="button" class="btn btn-primary" onclick="donate()">Donate</button>
</form>
  <div style="position:fixed;bottom:0%;width:45%;">
      <hr>
      <footer>
        <p>&copy; Holmen High School 2015 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact admin: <a href="mailto:gu.yifan@gmail.com">gu.yifan@gmail.com</a></p>
      </footer>
    </div>
</div> 
<div id="donateSuccessOrNot" style="display:none">${success}</div>
<div class="alert alert-success" id="alert">Donate successfully</div>
</body>
</html>
