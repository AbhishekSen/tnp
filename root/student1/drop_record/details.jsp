<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>
<% db.fetchConfigDetails(); %>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%!
int j=0;
String student_roll_number="";
%>
<%

	int student_id=0;
	//String submit="";
	String username="";
	student_roll_number=request.getParameter("student_roll_number");
	if(student_roll_number!=null)
	{
		int num_rows=0;
		int num_rows1=0;
		
		String sql_get_data="select student_id, username from student_record where student_roll_number='"+student_roll_number+"';";
		db.connect();
		ResultSet rs=db.execSQL(sql_get_data);
		if(rs.next())
		{
			student_id=rs.getInt(1);
			username=rs.getString(2);
		}
		rs.close();
		
		db.close();
		
		if(student_id!=0)
		{
			String main_record=" delete from student_record where student_id="+student_id+" and student_roll_number="+student_roll_number+";";
			db.connect();
			num_rows=db.updateSQL(main_record);
			db.close();	
	
			String main_record1=" delete from login where username='"+username+"' ;";
			db.connect();
			num_rows1=db.updateSQL(main_record1);
			db.close();	

				if( num_rows1==1 && num_rows==1)
					{
						response.sendRedirect("sucess.jsp");
					 

					}	
					
				else
						response.sendRedirect("error.jsp");
                                
                                
			}
			else
				response.sendRedirect("error.jsp");
		}	
		

%>
