<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html "about:legacy-compat">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
var messages=[]
function func() {
	var q = document.getElementById('1').value;
	var q2 = document.getElementById('2').value;
	if (q === "") {
		alert("Enter login name");
		q = document.getElementById('1').value;
	}
	else if (q2 === "") {
		alert("Enter password");
		q2 = document.getElementById('2').value;
	}
	else {
		alert("Submitted");
	}
}
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

</script>
</head>
<body>
<form id="log" action="verifylogin.jsp" method="post">
login
<input id = '1' type="text" name="1">
<br>
password 
<input id = '2' type="password" name="2">
<br>
<button onclick="func()">submit</button>
</form>
<form action="action.jsp" method="post">
<%String name1=(String)session.getAttribute("name2");%>
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
		<option name="ok"><%=name1+"-"+r.getString(1) %></option>
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
</body>
</html>