<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ger.connection"  %>
<%@ page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Group</title>
</head>
<body>
<%
//System.out.println(user_name+":"+gr_name+":");
		
try{
	String user_name=(String)session.getAttribute("user1");
	String gr_name=(String)session.getAttribute("check");gr_name=gr_name.trim();
	Connection c=connection.connects();
	PreparedStatement c2=c.prepareStatement("delete from groups where groupname = (?)");
	c2.setString(1,gr_name);
	c2.executeUpdate();
	c2=c.prepareStatement("drop table "+gr_name);
	c2.executeUpdate();
	c2=c.prepareStatement("drop table "+gr_name+"_users");
	c2.executeUpdate();
	session.invalidate();
	out.println("Group Deleted Successfully");
	%><a href="login.jsp">Go to Home </a><%
}
catch(Exception e){e.printStackTrace();}
%>
</body>
</html>