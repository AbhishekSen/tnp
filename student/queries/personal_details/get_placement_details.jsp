<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/sql_convert_date.jsp"%>
<%@ include file="../../utils/roll_info_client/web/index.jsp"%>

<%
	String button_value=request.getParameter("q0");


	String check_student_roll_number=request.getParameter("q1");
	String student_roll_number=request.getParameter("q2");
	
	
//out.println(button_value+check_student_roll_number+student_roll_number);

	
	
	
	try 
	{ 			
out.println(getinfo(student_roll_number));
  	}	
	
	catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	}

%>


