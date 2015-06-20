
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<% //db.fetchConfigDetails(); %>
<%
	String sid = null; 
	//String student_roll_number=request.getParameter("student_roll_number");
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>

<%
	db.fetchConfigDetails();
	String student_roll_number=request.getParameter("student_roll_number");
/*	db.connect();
	ResultSet rus= db.execSQL(sql_username);
	if(rus.next())
	{
		username = rus.getString(1);
	}
	rus.close();
	db.close();*/
	int prog_id=0;
	int duration=0;
	String sql_dep_id="select programme_id from student_record where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet rs1= db.execSQL(sql_dep_id);
	if(rs1.next())
	{
		prog_id = rs1.getInt(1);
	}
	rs1.close();
	db.close();
	db.connect();
	ResultSet rs2=db.execSQL("select programme_duration from programme_record where programme_id="+prog_id+";");
	if(rs2.next())
	{
		duration=rs2.getInt(1);
		if(duration==4)
		{
			response.sendRedirect("edit_b.jsp?student_roll_number="+student_roll_number);
		}
		else if(duration==2)
		{
			response.sendRedirect("edit_m.jsp?student_roll_number="+student_roll_number);
		}
		else
		{
			response.sendRedirect("error2.jsp");
		}
	}
	else
	{
		response.sendRedirect("error2.jsp");
	}
	rs2.close();

%>





