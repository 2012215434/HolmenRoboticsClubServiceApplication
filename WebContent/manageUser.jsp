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
<link href="css/manageUser.css" rel="stylesheet">
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>
<script src='js/bootstrap.min.js'></script>
<script src='js/npm.js'></script>
<script src='js/transition.js'></script>
<script>
window.onload=function()
{
	var x = document.getElementsByClassName("AUser");
	if(x[0]==null)
	{
		userForm.action="http://localhost:8080/Demo1/showAllUser.do";
		userForm.submit();
	}
}
 	function showSearchUser()
	{
 		if(document.getElementById('showSearchUserBtn').className=="btn btn-default")
 		{
 			document.getElementById('showSearchUserBtn').className="btn btn-default active";
 	 		document.getElementById('showAddUserBtn').className="btn btn-default";
 			document.getElementById('searchUser').style.marginLeft = "220%";
 			document.getElementById('searchUser').className ='showSearchUser';
 			document.getElementById('addUser').className ='hideAddUser';
 			document.getElementById('addUser').style.left = "-900px";
 			document.getElementById('searchUser').style.marginLeft = "0%";
 			document.getElementById('searchUser').style.width = "100%";
 		}
	} 
	
	function showAddUser()
	{
		if(document.getElementById('showAddUserBtn').className="btn btn-default")
		{
			document.getElementById('showSearchUserBtn').className="btn btn-default";
	 		document.getElementById('showAddUserBtn').className="btn btn-default active";
			document.getElementById('searchUser').className ='hideSearchUser';
			document.getElementById('addUser').className ='showAddUser';
			document.getElementById('searchUser').style.marginLeft = "-220%";
			document.getElementById('searchUser').style.width = "100%";
			document.getElementById('addUser').style.left = "150px";
		}
	}
	
	function seePassword()
	{
		if(document.getElementById('password').type=='password')
		{
			document.getElementById('password').type='text';
		}
		else
		{
			document.getElementById('password').type='password';
		}
	}
	
	function checkType()
	{
		if(document.getElementById('userType').value.length==2)
		{
			if(document.getElementById('userType').value=='st'||document.getElementById('userType').value=='sp'||document.getElementById('userType').value=='vo')
			{
				document.getElementById('userType').parentNode.parentNode.className="form-group has-error has-feedback";
				document.getElementById('right').style.visibility="hidden";
				document.getElementById('wrong').style.visibility="visible";

			}
			else
			{
				document.getElementById('userType').parentNode.parentNode.className="";
				document.getElementById('right').style.visibility="hidden";
				document.getElementById('wrong').style.visibility="hidden";

			}
		}
		
		if(document.getElementById('userType').value=='student')
		{
			document.getElementById('userType').parentNode.parentNode.className="form-group has-success has-feedback";
			document.getElementById('right').style.visibility="visible";
			document.getElementById('wrong').style.visibility="hidden";
		}
		else if(document.getElementById('userType').value=='sponsor')
		{
			document.getElementById('userType').parentNode.parentNode.className="form-group has-success has-feedback";
			document.getElementById('right').style.visibility="visible";
			document.getElementById('wrong').style.visibility="hidden";
		}
		else if(document.getElementById('userType').value=='volunteer')
		{
			document.getElementById('userType').parentNode.parentNode.className="form-group has-success has-feedback";
			document.getElementById('right').style.visibility="visible";
			document.getElementById('wrong').style.visibility="hidden";
		}
		else
		{
			document.getElementById('userType').parentNode.parentNode.className="";
			document.getElementById('right').style.visibility="hidden";
			document.getElementById('wrong').style.visibility="hidden";
		}
	}
	function select(s)
	{
		document.getElementById('userTypeBtn').innerHTML=s+"<span class='caret'>";
		
		document.getElementById('userTypeBtn').parentNode.parentNode.style.width="95px";
		
		document.getElementById('userType').value=s;
	}
	
	function showUser()
	{ 	
		if(document.getElementById('userNameInput').value=="")
		{
			userForm.action="http://localhost:8080/Demo1/showAllUser.do";
		}

		else
		{
			document.getElementById('userNameInput2').value=document.getElementById('userNameInput').value;
			userForm.action="http://localhost:8080/Demo1/searchUser.do";
		}
		userForm.submit();
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
         <ul class="nav navbar-nav" style="margin:0 auto; text-align:center">
  <li role="presentation"><a href="#" onclick="location='http://localhost:8080/Demo1/welcome&login.jsp'">Home</a></li>
  <li role="presentation" onclick="location='http://localhost:8080/Demo1/calendar.jsp'"><a href="#">Calendar</a></li>
  <li role="presentation" class="active"  onclick="location='http://localhost:8080/Demo1/manageUser.jsp'"><a href="#">Manage user</a></li>
  <li role="presentation"  onclick="location='http://localhost:8080/Demo1/manageEvent.jsp'"><a href="#">Manage event</a></li>
    <li role="presentation" onclick="location='http://localhost:8080/Demo1/checkDonation.jsp'"><a href="#">Check donation</a></li>
</ul>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="http://localhost:8080/Demo1/logout.do">
            <button type="submit" class="btn btn-success">Logout</button>
          </form>
        </div>
      </div>
    </nav><br><br><br>
<div class="container" style="position:relative;width:600px; margin:0 auto;">
<div style="width:210px;margin:0 auto">
<div class="btn-group" role="group" aria-label="...">
  <button type="button" id="showSearchUserBtn" class="btn btn-default active" onclick="showSearchUser()">Search user</button>
  <button type="button" id="showAddUserBtn" class="btn btn-default" onclick="showAddUser()">&nbsp;Add user&nbsp;&nbsp;</button>
</div>
</div>
<br><br>
<div id="searchUser">
  	<form name="userForm">
  	<input type="text" id="userNameInput2" value="" name="userName" class="form-control" placeholder="user name" style="display:none"/>
    </form>
  <div id="searchUserGroup" class="input-group">
    <input type="text" id="userNameInput" value="" name="userName" class="form-control" placeholder="user name">
    <span class="input-group-btn">
        <button class="btn btn-primary" onclick="showUser()" type="button">Search</button>
    </span>
  </div>
  <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>
							userName
						</th>
						<th>
							userType
						</th>
						<th>
							valid
						</th>
						<th>
						</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="count" scope="session" value="${-1}"/>
					<c:forEach items="${user}" var="user1" varStatus="status">
					<c:choose>
					<c:when test="${(count=count+1)%8==0}">
					<tr class="AUser">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==1}">
					<tr class="AUser success">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==2}">
					<tr class="AUser">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==3}">
					<tr class="AUser warning">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==4}">
					<tr class="AUser" >
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==5}">
					<tr class="AUser info">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==6}">
					<tr class="AUser">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					<c:when test="${(count)%8==7}">
					<tr class="AUser danger">
						<td>
							${user1.userName}
						</td>
						<td>
							${user1.userType}
						</td>
						<td>
							${user1.valide}
						</td>
						<td>
						<form action="http://localhost:8080/Demo1/deleteUser.do">
							<input name="userName" style="display:none" value="${user1.userName}"/>
							<button class="btn btn-primary" type="submit">delete</button>
						</form>
						</td>
					</tr>
					</c:when>
					</c:choose>
					</c:forEach>			
				</tbody>
			</table>
		</div>
	</div>
  </div>
  </div>
  <div id="addUser" style="width:300px;position:absolute; top:100px; left:1100px">
    <form  action="http://localhost:8080/Demo1/addUser.do">
  <div class="input-group">
    <span class="input-group-addon" >User Name</span>
    <input type="text" class="form-control" id="userName" name="userName" placeholder="" aria-describedby="basic-addon1" value="" >
  </div><br><br>
  <div class="input-group">
    <span class="input-group-addon" >&nbsp;Password&nbsp;</span>
    <input type="password" class="form-control" id="password" name="password" placeholder="" aria-describedby="basic-addon1" value="" >
    <span class="input-group-btn">
        <button class="btn btn-default" type="button" onclick="seePassword()"><span class="glyphicon glyphicon-eye-open"></span></button>
    </span>
  </div><br><br>
<div  style="width:108px; margin:0 auto">
<!--   <div class="input-group">
    <span class="input-group-addon" >&nbsp;User Type&nbsp;</span>
     <input type="text" class="form-control" name="userType" id="userType"  aria-describedby="userType" onkeyup="setTimeout(checkType, 500)">
    <span class="glyphicon glyphicon-ok form-control-feedback" id="right" aria-hidden="true" style="visibility:hidden"></span>
    <span class="glyphicon glyphicon-remove form-control-feedback" id="wrong" aria-hidden="true" style="visibility:hidden"></span>
  </div>  -->
  <div class="btn-group">
  <button type="button" id="userTypeBtn" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    User Type <span class="caret"></span>
  </button>
  <ul class="dropdown-menu">
    <li ><a onclick="select('student')">student</a></li>
    <li><a onclick="select('volunteer')">volunteer</a></li>
    <li><a onclick="select('sponsor')">sponsor</a></li>
  </ul>
</div>
</div>
<input name="userType" id="userType"  aria-describedby="userType" style="visibility:hidden" ></input>
<br>
  <div class="input-group" style="margin:0 auto;">
    <button type="submit" class="btn btn-default">submit</button>
  </div>
  </form>
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
