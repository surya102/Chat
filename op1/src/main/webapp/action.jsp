<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check</title>
</head>
<body>

<%
try{
	Connection c=connection.connects();
	String s=request.getParameter("hold");
	if(s.equals("Select friend")){response.sendRedirect("notvalidselect.jsp");}
	session.setAttribute("receiver",s);
	response.sendRedirect("main.jsp");
	c.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>