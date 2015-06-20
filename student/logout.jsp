<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>IIT Guwahati</title>
</head>
<body topmargin="0" leftmargin="0">

<%
if (request.getSession(false) != null )
	session.invalidate() ;
	
	response.sendRedirect("../index.jsp");
	
%>


<%

/*
<div align="center">
  <center>

<table border="0" width="750">
  <tr>
    <td width="100%" align="right"><a href="index.htm" target="_top">Home</a></td>
  </tr>
  <tr>
    <td width="100%"></td>
  </tr>
  <tr>
    <td width="100%">&nbsp;
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p></td>
  </tr>
  <tr>
    <td width="100%" align="center">You have been logged out sucessfully<br><br>
<a href="index.htm">click here to login back</A>
</td>
  </tr>
</table>

  </center>
</div>
*/
%>
</body>

</html>
