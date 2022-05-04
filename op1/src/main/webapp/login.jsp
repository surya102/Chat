<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login to Talk</title>
<link rel="stylesheet" href="css/loginstyle.css">
<script>
function func() {
	var q = document.getElementById('1').value;
	var q2 = document.getElementById('2').value;
	if (q === "") {
		alert("Enter login name");
		q = document.getElementById('1').value;
	}
	else if (q2 === "") {
		alert("Enter password");
		q2 = document.getElementById('2').value;
	}
	else {
		alert("Login Details Submitted");
	}
}
function closing(){
	var c=confirm("Do you want to close the tab");
	if(c){close();}
}
</script>
</head>
<body>
<h1> LOGIN </h1> 
  <div class="open">
  <div class="form">
  	<div class="login">LOGIN</div>
     <form class="inform" action="logcheck.jsp" method="post">
     <input type="text" class="box" placeholder="USERNAME" name="userid" id='1'>
     <br>
     <input type="password" class="box" placeholder="PASSWORD" name="pass" id='2'>
     <br><button class="whole" onclick="func()">LOGIN</button>
     </form>
     <button class="whole" onclick="closing()">CLOSE</button>
     <button class="whole" onclick="window.location.href='home.jsp';">SIGN UP</button>
  </div>
  </div>
</body>
</html>