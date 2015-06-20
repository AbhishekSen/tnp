<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.io.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>IIT Guwahati</title>
</head>
<html>
<body topmargin="0" leftmargin="0">

<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%
	
if (request.getSession(false) != null )
{
	String sid = null; 
	sid = request.getSession(false).getId() ;
	String sql = "delete from session where session_id = '"+sid+"' " ;
                        db.fetchConfigDetails(); //newly added
			db.connect();
			db.updateSQL(sql);
			db.close() ;
	session.invalidate() ;
}
	response.sendRedirect("index.jsp");
%>
</body>
</html>
