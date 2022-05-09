<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html "about:legacy-compat">
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="refresh" content="20"/>
<title>Home</title>
<script>
function func2(){
	var q=document.getElementById('hold').value;
	console.log(q);
	if(document.getElementById('1')=="" || document.getElementById('2')==""){
		alert("FILL THE LOGIN DETAILS");
	}
	else if(q == "select friend"){
		alert("SELECT FRIEND TO CHAT");
	}
	else{
		document.getElementById('5').innerHTML=q;
	}
}
function concl1(){
 	var q=document.getElementById('get1').value;
	if(q=="" || q.equals("Enter a Name for Group")) alert('Enter a Name for Group')
}
function concl2(){
  	var q=document.getElementById('get2').value;
	if(q=="" || q.equals("Enter Group Name")) alert("Enter Group Name")
}
</script>
</head>
<body>
<h2>CHAT</h2>
<%String name1=(String)session.getAttribute("name");
%><p name="whole">Welcome <%=name1 %></p><% 
%>
<%session.setAttribute("user",name1); %>
<form action="action.jsp" method="post">
<p id='3' name="send2"><%=name1 %></p><%%>
<select name="hold">
<option>Select friend</option>
<%
try{
	Connection c=connection.connects();
	Statement st=c.createStatement();
	ResultSet r=st.executeQuery("select username from userdb");
	while(r.next()){
		//System.out.println(name1);
		%>
		<option name="ok"><%=name1+" - "+r.getString(1) %></option>
	<% }
	
	
}catch(Exception e){
	System.out.println(e);
}
%>
</select>
<button onclick="func2()">CHAT</button>
<br>
<p id='5'>Chat Person</p>
</form>
<h2>GROUP CHAT</h2>
<p>Create a Group </p>
<form action="creategroup.jsp">
<input type="text" placeholder="Enter a Name for Group" name="new" id='get1'>
<button onclick="concl1()">Create a Group</button> 
</form>
<p>Join a Group</p>
<form action="join.jsp">
<input type="text" placeholder="Enter Group Name" name="old" id='get2'>
<button onclick="concl2()">Join Group</button>
</form>
<form action="logout.jsp">
<button>LOGOUT</button>
</form>
</body>
</html>