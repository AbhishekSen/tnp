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
<%@ page import="java.util.*" %>
<%
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;


	String agency_name=request.getParameter("q1");
	
	
//out.println(button_value+agency_name);

	

	
	//out.println(agency_date);
	//out.println("*"+student_id+"*");
	//String programme_id=null;

//	if(check_department_name.equals("true"))
//	{
//		department_id=get_unique_field("select department_id from department_record where department_name='"+
//		encode_sql(department_name)+"' ;",db);
//	}
//
//	if(check_programme_name.equals("true"))
//	{
//		programme_id=get_unique_field("select programme_id from programme_record where programme_name='"+
//		encode_sql(programme_name)+"' ;",db);
//	}
//out.println(display1+"Student is eligible for the following companies"+display2);
	try 
	{ 
        db.fetchConfigDetails(); //newly added		
	String get_date="select final_agency_date from agency where agency_name='"+agency_name+"';";
	db.connect();
	ResultSet re=db.execSQL(get_date);
	re.next();
	
String	agency_date=re.getString(1);
	re.close();
	db.close();
		
		
		
		if(agency_date!=null)
		{agency_date=sql_convert_date(agency_date);
			out.println(display1+" Final Agency Date is :"+agency_date+display2);
		}
		else
		{out.println(display1+"No date is alloted  to the company yet"+display2);}

  	}	
catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	}

%>


