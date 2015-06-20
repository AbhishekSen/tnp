<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.servlet.ServletFileUpload,org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<html>
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<%@page language="java" import="pack.DbBean"%>
<%@page language="java" import="java.io.*"%>
<%@page language="java" import="java.util.*"%>
<%@page language="java" import="org.apache.commons.io.*"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"></jsp:useBean>
<%
//DbBean db = new DbBean();
db.fetchConfigDetails();
%>
	
<title>Untitled Document</title>
<%@ include file="utils/upload.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%
if(request.getContentLength()>3253000)
	response.sendRedirect("otherfile.jsp?fault=3");
Cookie[] cookie=request.getCookies();
Cookie mycookie=null;
for(int i=0;i<cookie.length;i++)
	{//out.println(cookie[i]);
	 if(cookie[i].getName().equals("extn"))
	 	mycookie=cookie[i];
	}
		
%>
<%@ include file="utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../logout.jsp");
%>
<%
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
		{
		username = rs.getString(1);
		}
		
		rs.close();
		db.close();
	
%>
<%
  		String filename=username;
  
  out.println(filename);					
  %>
<%
if(store_upload(request,response,filename,"/uploads/"))
	{

		response.sendRedirect("otherfile.jsp?fault=4");
	}
else
	{response.sendRedirect("otherfile.jsp?fault=2");	
	}
%>
<body>

</body>
</html>
