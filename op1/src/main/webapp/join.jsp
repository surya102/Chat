<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ger.connection" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Join Group</title>
</head>
<body>
<%
try{
	String user=request.getParameter("old");
	String name=(String)session.getAttribute("user");
	if(user!=null && user!=""){
		Connection c=connection.connects();
		PreparedStatement q=c.prepareStatement ("select * from groups where groupname=(?)");
		q.setString(1,user);
		ResultSet y=q.executeQuery();
		if(!y.next()){response.sendRedirect("invalidgrp.jsp");}
		PreparedStatement ps=c.prepareStatement("select * from "+user);
		ResultSet rs=ps.executeQuery();
		int Count=0;
		while(rs.next()){
			if(name.equals(rs.getString(1))){Count=1;break;}
		}
		if(Count==0){
			ps=c.prepareStatement("insert into "+user+"_users values(?)");
			ps.setString(1,name);
			ps.executeUpdate();
		}
		session.setAttribute("user1",name);
		session.setAttribute("check",user);
		response.sendRedirect("group.jsp");
		c.close();
	}
	else{
		response.sendRedirect("invalidgrp.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>