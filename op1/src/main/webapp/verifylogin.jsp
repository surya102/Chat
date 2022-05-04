<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ger.connection" %>
<%@page import="java.sql.*" %>
<%try{
	Connection c=connection.connects();
	String uname=request.getParameter("1");
	String pass=request.getParameter("2");
	if(uname==""){response.sendRedirect("chat.jsp");}
	String inp="select name from userdb where username=? and password=?";
	PreparedStatement st=c.prepareStatement(inp);
	st.setString(1,uname);st.setString(2,pass);
	ResultSet rs=st.executeQuery();
	if(rs.next()){
		session.setAttribute("name2",uname);
		response.sendRedirect("chat.jsp");
	}
	else{
		response.sendRedirect("chatact.jsp");
	}
}catch(Exception e){e.printStackTrace();}%>