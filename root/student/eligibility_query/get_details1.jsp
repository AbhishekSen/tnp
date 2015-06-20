<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>
<%
        db.fetchConfigDetails(); //newly added
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String agency_name=request.getParameter("q1");
	String username=request.getParameter("q2");
	           out.println(display1+"Following Students are eligible "+display2);   
       out.println("<table border='0' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='sortable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
			out.println("<th>Student Roll Number</th>");
			out.println("<th>Student Name</th>");
			out.println("<th>Cpi upto 6th sem</th>");
			out.println("<th>Department & Programme</th>");
                        out.println("<th>Remark</th>");
			out.println("</tr>");
	 
	String get_cpi="select cpi,agency_id from agency where username='"+username+"';";
	db.connect();
	ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
	re.next();
String cpi=re.getString(1);
String agency_id="";
agency_id=""+re.getInt("agency_id");
	re.close();
	db.close();
  if(cpi!=null && cpi!="null"){  
   db.connect();
   ResultSet ra=db.execSQL("select student_id from interested_students where agency_id="+agency_id+";");
   ResultSet rs=db.execSQL("select student_roll_number,student_name,cpi_6sem,cpi_2sem,program_name,programme_id from student_record where cpi_6sem >= "+cpi+";");
   
	int i=1;
   while(rs.next())
   { 
   	ResultSet rs1=db.execSQL("select package_id from package_details where agency_id="+agency_id);
	String stud_roll_no="";
	stud_roll_no=""+rs.getInt("student_roll_number");
    out.println("<tr><td>"+i+"</td><td>"+stud_roll_no+"</td><td>"+rs.getString("student_name")+"</td><td>");
	if(rs.getInt("programme_id")==1||rs.getInt("programme_id")==2)
		out.println(rs.getString("cpi_6sem")+"</td>");
	else
		out.println(rs.getString("cpi_2sem")+"</td>");
	out.println("<td>"+rs.getString("program_name")+"</td></tr>");
	i++;
	rs1.close();

  }
    
    rs.close();
     db.close();
  }
       
%>


