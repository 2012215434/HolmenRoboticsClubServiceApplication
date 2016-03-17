<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Holmen Robotics Club</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron.css" rel="stylesheet">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
   <script>
   function getUserName()
   {
		document.cookie="userName="+document.getElementById("userName").value;
		document.cookie="show=false";
   }
   
   function login()
   {  
	   getUserName();
	   var n = document.getElementById("userName").value;
	   var p = document.getElementById("password").value;
/* 	   $.ajax({
		   type : "get",  
           url : "test1.do?userName="+n+"&"+"password="+p,  
           dataType:"json",
           success:function(data){alert(data);},
	   });  */
	   
	   $.post( "login.do?userName="+n+"&"+"password="+p, {}, function( data )
	   {
		   if(data=="calendar")
		{
			   window.location.href="http://localhost:8080/Demo1/skipToCalendar.do?userName="+n;
		}
	   } ); 
	   
   }
   
   function test1()
   {
  	   $.post( "login.do?userName=ivan&password=ivan", {}, function( data )
	   			{
	   			alert( data );

	   			} );  
/*  	   $.ajax({
		   type : "get",  
           url : "login1.do?userName=ivan&password=ivan",  
           dataType:"json",
           success:function(data){alert(data);},
	   });   */
   }
   </script>
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
            <button onclick="login()" class="btn btn-success" style="float:right;margin:10px 0px 10px 10px">Login</button>
            <div class="form-group" style="width:150px;float:right;margin:10px 0px 10px 10px">
              <input type="password" id="password"  value="" placeholder="password" class="form-control">
            </div>
            <div class="form-group" style="width:150px;float:right;margin:10px 0px 10px 10px">
              <input type="text"  id="userName"  value="" placeholder="userName" class="form-control">
            </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Welcome!</h1>
        <p>
        This web service is for
         Holmen High School Robotics Club, in order to 
         help them to compete in the FIRST Robotics Competition
          for January 2016
        </p>
        <p><a class="btn btn-primary btn-lg" href="http://localhost:8080/Demo1/calendar_guest.jsp" role="button">Eevents calendar &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Our School</h2>
          <p>Holmen High School is a high school located in Holmen, Wisconsin as part of the Holmen School District. As of 2014, the school enrollment was 1160. The current facility was opened in 1994 and was expanded in 2000. Holmen High School is now a WIAA Division 1 school in sports and is a North Central Association Renaissance School.</p>
          <p><a class="btn btn-default" href="http://www.holmen.k12.wi.us/Domain/23" role="button">School website &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>The Competition</h2>
          <p>FIRST Robotics Competition (FRC) is an international high school robotics competition. Each year, teams of high school students and mentors work during a six-week period to build game-playing robots that weigh up to 120 pounds (54 kg). Robots complete tasks such as scoring balls into goals, frisbees into goals and inner tubes onto racks.</p>
          <p><a class="btn btn-default" href="http://www.usfirst.org/" role="button">Official website &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Our Mission</h2>
          <p>The Robotics Club's mission is to increase enthusiasm towards, and knowledge of, robotics by providing students of Holmen High School a hands-on and multi-disciplinary collaborative experience in designing, building, and programming robots.</p>
          <p><a class="btn btn-default" href="http://www.holmen.k12.wi.us/Domain/422" role="button">View more &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Holmen High School 2015&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact admin: <a href="mailto:gu.yifan@gmail.com">gu.yifan@gmail.com</a></p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
