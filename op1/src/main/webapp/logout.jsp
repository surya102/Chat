<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
session.invalidate();
%>
<p> Logout Successful</p>
<a href="login.jsp">Click Here to Login</a>
</body>
</html>