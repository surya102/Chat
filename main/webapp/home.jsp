<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration page</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h1> Registration form</h1>
<div class="container">
   <form action="register" method="post">
   <div class="box">
      <p id="align">Name : <input type="text" name="name" id="read" required></p>
   </div> 
   <div class="box">
     <p id="align">Enter UserName : <input type="text" name="uname" id="read" required></p>
   </div> 
   <div class="box">
      <p id="align">Password : <input type="password" name="password" id="read" required></p>
   </div> 
   <div class="box">
      <p id="align">Email id : <input type="email" name="email" id="read" required></p>
   </div> 
   <div class="box">
      <p id="align">Phone no : <input type="text" name="phone" id="read"></p>
   </div>   
   <div class="box">
       <input type="submit" name="submit">
       <br><br>
       <input type="submit" value="cancel" name="Cancel"> 
   </div>
   </form>
</div>   <br>
<a href="chat.jsp" style=margin-left:200px;>ALREADY A USER?</a>
</body>
</html>