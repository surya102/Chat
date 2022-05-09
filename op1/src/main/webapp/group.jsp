<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %> 
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="10"/>
<title>Group Chat</title>
</head>
<body>
<h2>GROUP CHAT</h2>
<form action="logout.jsp">
<button>LOGOUT</button>
</form>
<% 
String grp=(String)session.getAttribute("check");
String user=(String)session.getAttribute("user1");
%><br>
<%
session.setAttribute("check",grp);
session.setAttribute("user1",user);
%>
<form action="deletegrp.jsp">
<button>DELETE GROUP</button>
</form>
<br>

<button onclick="window.location.href='chat.jsp';">GO BACK</button>
<p>GROUP NAME: <%=grp %></p>
<p>USER: <%=user %></p>
<p>GROUP USERS: </p>
<%
try{
	Connection c=connection.connects();
	String users=(String)session.getAttribute("check");
	//System.out.println(users);
	PreparedStatement got=c.prepareStatement("select * from groups where groupname =(?)");
	got.setString(1,users);
	ResultSet not=got.executeQuery();
	if(!not.next()){response.sendRedirect("chat.jsp");}
	else{
	users+="_users";	
	PreparedStatement pst=c.prepareStatement("select * from "+users);
	ResultSet rs=pst.executeQuery();
	%><ul><%
	while(rs.next()){
		%><li><%=rs.getString(1) %></li>
	<% }%></ul><%
	pst=c.prepareStatement("select * from "+grp);
	rs=pst.executeQuery();
	while(rs.next()){
		%><p><%=rs.getString(1)+" : "+rs.getString(2) %></p>
	<% }
	c.close();}
}catch(Exception e){
	e.printStackTrace();
}%>
<form>
<input type="text" placeholder="Enter a Message" name="send">
<button type="submit">Send Message</button>
<%
try{
	Connection c=connection.connects();
	String msg=request.getParameter("send");
	if(msg!="" && msg!=null && !msg.equals("Enter a Message")){
	PreparedStatement pst2=c.prepareStatement("insert into "+grp+" values((?),(?))");
	pst2.setString(1,user);
	pst2.setString(2,msg);
	pst2.executeUpdate();
	response.sendRedirect("group.jsp");
	}
	
}catch(Exception e){
	e.printStackTrace();
}
%>
</form>
</body>
</html>