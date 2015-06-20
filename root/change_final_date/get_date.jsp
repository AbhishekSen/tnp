
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>


<%@ page import="java.util.*" %>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>

<%      
	String clicked=request.getParameter("q0");
	String agency_name=request.getParameter("q1");
	Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);
String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;

if(agency_name !=null )

{
	
	try 
	{ 
	String sql_final_date="select final_agency_date from agency "+
		" where agency_name='"+agency_name+"';";
                  
		//out.println(sql_final_date);
		String final_agency_date=get_unique_field(sql_final_date,db);
StringBuffer result = new StringBuffer(1024);

		String sql_agency_id="select agency_id from agency "+
		" where agency_name='"+agency_name+"';";
                  
		//out.println(sql_final_date);
		String agency_id=get_unique_field(sql_agency_id,db);
StringBuffer result2 = new StringBuffer(1024);

	String sql_requested_date="select date_request from date_requests "+
		" where agency_id="+agency_id+";";
                  
		//out.println(sql_final_date);
		String requested_date=get_unique_field(sql_requested_date,db);
StringBuffer result1 = new StringBuffer(1024);
			

if (final_agency_date!=null)
		
              { 
                final_agency_date=sql_convert_date(final_agency_date);
		result.append(display1+"Date alloted to the company is :"+final_agency_date+display2);
		result.append("\n \n");
		result.append(display1+"Date requested by  the company is :"+requested_date+display2);
		
		
			result.append("<form name='form_fix_date' id='form_fix_date' onSubmit='return validate_empty2(this)'>");
			result.append("<br><br><tr><td>Final Date:</td><td>"+
			"<input readonly type=\"text\" name=\"final_date\" id=\"final_date\" "+
			"onClick=\"alert('Please select a date from the calendar');\">"+
			"</td><td>"+
			"<a href=\"javascript:NewCal('final_date','ddmmyyyy')\" ><img class=\"cal\" alt=\"Pick a"+
			" date\" src=\"../images/cal.gif\"/></a></td></tr>");


			result.append("</table>");
			result.append("<br><br>");
			result.append("<input type='hidden' id='ageny_name' name='agency_name' value='"+agency_name+"' >");
	   		result.append("<input type='submit' class='center' name='submit_final_date' "+
	   		"id='submit_final_date' value='Set Date'>");
			result.append("<br><br>");
	   		result.append("<input type='reset' class='center' name='submit_final_date' "+
	   		" id='submit_final_date' value='    Reset   '>");
			result.append("<br><br>");
			result.append("</form>");

			out.println(result.toString());
		//out.println("Date alloted to the company is:"+final_agency_date);
		
		}
	else
	{
			result.append(display1+"No Date is alloted to the company is yet, Set Date as per your choice : :"+display2);
			result.append(display1+"Date requested by  the company is :"+requested_date+display2);
			result.append("<form name='form_fix_date' id='form_fix_date' onSubmit='return validate_empty2(this)'>");
			result.append("<br><br><tr><td>Final Date:</td><td>"+
			"<input readonly type=\"text\" name=\"final_date\" id=\"final_date\" "+
			"onClick=\"alert('Please select a date from the calendar');\">"+
			"</td><td>"+
			"<a href=\"javascript:NewCal('final_date','ddmmyyyy')\" ><img class=\"cal\" alt=\"Pick a"+
			" date\" src=\"../images/cal.gif\"/></a></td></tr>");


			result.append("</table>");
			result.append("<br><br>");
			result.append("<input type='hidden' id='ageny_name' name='agency_name' value='"+agency_name+"' >");
	   		result.append("<input type='submit' class='center' name='submit_final_date' "+
	   		"id='submit_final_date' value='Set Date'>");
			result.append("<br><br>");
	   		result.append("<input type='reset' class='center' name='submit_final_date' "+
	   		" id='submit_final_date' value='    Reset   '>");
			result.append("<br><br>");
			result.append("</form>");

			out.println(result.toString());
	}
		//out.println("Date alloted to the company is:"+final_agency_date);
		

  	}	
	/*catch(SQLException e) 
	{ 
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
		//throw new ServletException("Your query is not working: " + str , e); 
	} */
	catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	}
}
else
	out.println("<br><h4>The field is Empty</h4>");
%>



