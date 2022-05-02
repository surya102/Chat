<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
try{
	Connection c=connection.connects();
	String s=request.getParameter("hold");
	if(s.equals("Select friend")){response.sendRedirect("chatact.jsp");}
	session.setAttribute("receiver",s);
	response.sendRedirect("main.jsp");
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>