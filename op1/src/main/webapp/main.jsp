<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script>
</script>
<meta http-equiv="refresh" content="10"/>
<meta charset="ISO-8859-1">
<title>Chat</title>
<script>
</script>
</head>
<body>
<button onclick="window.location.href='chat.jsp';">GO BACK</button>
<br><br>
<form>
<input id='1' name="1" type="text" placeholder="Enter text message">
<button type="submit" onclick="check()">Send message</button>
<%
String s2=(String)session.getAttribute("receiver");
String arr[]=s2.split(" - ");
String name1=arr[0],name2=arr[1];
%>
<p>SENDER <%=name1 %></p>
<p>RECEIVER <%=name2 %></p> 
<div id="ref">
<% 
try{
	Connection c=connection.connects();
	ResultSet r;
	
    PreparedStatement p1=c.prepareStatement("select * from message where sender=(?) and receiver=(?) or sender=(?) and receiver=(?)");
    p1.setString(1,name1);
    p1.setString(2,name2);
    p1.setString(3,name2);
    p1.setString(4,name1);
	r=p1.executeQuery();
	while(r.next())
	{  %>
	    <div>
		<p><%=r.getString(1)+"  :  "+r.getString(2) %></p></div><%		
	}	
	c.close();
}catch(Exception e2){e2.printStackTrace();}
%>
</div>
<%
try{
	String s=(String)request.getParameter("1");
	if(s!=null && s!="" && s.equals("Enter text message")==false){
	Connection c=connection.connects();
	PreparedStatement p=c.prepareStatement("insert into message values(?,?,?)");
	p.setString(1,name1);
	p.setString(2,s);
	p.setString(3,name2);
	p.executeUpdate();
	response.sendRedirect("main.jsp");
}}
catch(Exception e1){e1.printStackTrace();
//finally{System.out.println("executed");}
}
%>
</form>
</body>
</html>