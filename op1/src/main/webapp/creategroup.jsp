<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create</title>
</head>
<body>
<%
try{
	Connection c=connection.connects();
	String name=(String)session.getAttribute("user");
	String gr_name=request.getParameter("new");
	if(gr_name!=null && gr_name!=""){
	PreparedStatement pst=c.prepareStatement("select * from groups where groupname=(?)");
	pst.setString(1,gr_name);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){response.sendRedirect("invalidgrp.jsp");}
	else{
		// create table name for logged users;
		String grp="create table "+gr_name+"_users"+"(username varchar not null)";
		Statement p1=c.createStatement();
		p1.executeUpdate(grp);
		
		// create table for group and store name of users and messages
		Statement p2=c.createStatement();
		String grp2="create table "+gr_name+"(username varchar not null,message varchar)";
		p2.executeUpdate(grp2);
		//insert logged in users to users table
	    PreparedStatement p=c.prepareStatement("insert into "+gr_name+"_users values(?)");
		p.setString(1,name);
	    p.executeUpdate();
	    
	    PreparedStatement two=c.prepareStatement("insert into groups values(?)");
	    two.setString(1,gr_name);
	    two.executeUpdate();
	    session.setAttribute("user1",name);
	    session.setAttribute("check",gr_name);
	    response.sendRedirect("group.jsp");
	}}
	else{response.sendRedirect("invalidgrp.jsp");}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>