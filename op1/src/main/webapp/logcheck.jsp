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
	String user=request.getParameter("userid");
	String pass=request.getParameter("pass");
	PreparedStatement pst=c.prepareStatement("select name from userdb where username=(?) and password=(?)");
	pst.setString(1,user);
	pst.setString(2,pass);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		session.setAttribute("name",user);
		response.sendRedirect("chat.jsp");
	}
	else{
		response.sendRedirect("chatact.jsp");
	}
	c.close();
}
catch(Exception e) {e.printStackTrace();
}
%>
</body>
</html>