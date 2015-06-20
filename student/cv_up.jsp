<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");
	db.fetchConfigDetails();		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="utils/encode_sql.jsp"%>
<%@ include file="utils/get_unique_field.jsp"%>
<%@ include file="utils/sql_convert_date.jsp"%>


<%@ page import="java.util.*,java.io.*" %>
<%
	String roll=request.getParameter("roll");
	File myfile = new File("C:/");
	
%>