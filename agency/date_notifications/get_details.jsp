<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rus= db.execSQL(sql_username);
		if(rus.next()) 
		{
		username = rus.getString(1);
		}
		
		rus.close();
		db.close();
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>
<%
	String button_value=request.getParameter("q0");
	String display1="<p align='center' class='result'>" ;
	String display2="<br></p>" ;


	String agency_name=request.getParameter("q1");
	
	

	try 
	{ 
	
		int agency_id=0;
		sql_username="select agency_id from agency where username = '"+username+"'  and agency_name='"+agency_name+"';" ;
		db.connect();
		ResultSet rust= db.execSQL(sql_username);
		if(rust.next()) 
		{
		agency_id= rust.getInt(1);
		}
		
		rust.close();
		db.close();
		
	String get_date="select final_agency_date from agency where agency_name='"+agency_name+"';";
	db.connect();
	ResultSet re=db.execSQL(get_date);
	re.next();
	
String	agency_date=re.getString(1);
	re.close();
	db.close();
		
		
		
		if(agency_date!=null && agency_id!=0)
		{agency_date=sql_convert_date(agency_date);
			out.println(display1+" Final Agency Date is :"+agency_date+display2);
		}
		else
		{out.println(display1+"No date is alloted  to the company yet"+display2);
		response.sendRedirect("error1.jsp");
		}

  	}	
catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	}

%>


