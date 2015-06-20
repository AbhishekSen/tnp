<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">

</script>
</head>
<%@page language="java" import="pack.DbBean,javazoom.upload.*"%> 

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>


<%
    MultipartFormDataRequest mrequest = null;
    String submit = null;
    ResultSet rs;
	ResultSet srs;
    String tempPackage = null;
    String tempPackageName = null;
    String tempDepartment=null;
    String Content = "";
    String department_name="";
    String programme_name="";
    String programme_name_input=null;
    String programme_id="";
    String department_id="";
    String ctcField="";
    String ctcCur="";
    String student_id="";
	String rollNo="";
	String name="";
	String email="";
	String emailAlternative="";
    ResultSet det;
	ResultSet drs;	
    String ctc_query="";
	String fetch_department_query="";
	String agency_id=null;
	String agency_profile=null;
        String package_name=null;
        String tempDepartmentId=null;
	String tempProgrammeId=null;
	String agency_name=null;
if (MultipartFormDataRequest.isMultipartFormData(request))
{
         // Uses MultipartFormDataRequest to parse the HTTP request.

     mrequest = new MultipartFormDataRequest(request);
     submit = mrequest.getParameter("submit");
}
        String fetch_query="";
	String package_id="";
	String fetch_student_query="";
	String program_id="";
        programme_name_input = mrequest.getParameter("programme_name");
         db.connect(); 
         out.println("<center><table><tr>");
         out.println("<td><input type='button' value='Back' onClick='return getPlacementStatsByDepartment();'></td>");
         out.println("<td><input type='button' value='Export All To CSV' onClick='return exportTablesByDepartment(\"All\");'></td>");
         out.println("</tr></table></center>");
        if(programme_name_input == null || programme_name_input == "" || programme_name_input.equals("0"))
        {
	              int columnCount = 4; //number of attributes in fetch_student_query
       			ResultSet studentrs,temp;
		out.println("<center><table class='advanced'>");
out.println("<tr colspan='2'><td colspan='8'><a href='#' onClick='return exportTablesByDepartment(\""+programme_name_input+"\")'><b>All Students  </b></a></td> </tr>");
		out.println("<tr>");
			//	out.println(programme_name_input);
		out.println("<td><b>Roll Number</b></td>");		
		out.println("<td><b>Name</b></td>");
		out.println("<td><b>Email</b></td>");
		out.println("<td><b>Email Alternative</b></td>");
		out.println("<td><b>Package Name</b></td>");
		out.println("<td><b>Company Name</b></td>");
		out.println("<td><b>CTC Offered</b></td>");
		out.println("<td><b>Company Sector</b></td>");
		out.println("</tr");
	 studentrs= db.execSQL("select student_id from student_record where job_status=1;"); 
        while(studentrs.next())
        {
	       	student_id = studentrs.getString(1);

		temp=db.execSQL("select package_id from placement_record where student_id='"+student_id+"';");
		while(temp.next())
		{
			package_id=temp.getString(1);
	
			fetch_student_query = "select student_roll_number, student_name, email, email_alternative from student_record where student_id='"+student_id+"';";
			rs= db.execSQL(fetch_student_query);
		
			//System.out.println(student_id);
	fetch_department_query = "select department_id, programme_id, program_id from student_record where student_id='"+student_id+"';";
			drs= db.execSQL(fetch_department_query);
			drs.next();
			department_id = drs.getString(1);
			programme_id = drs.getString(2);
			program_id= drs.getString(3);
			drs.close();

	fetch_query = "select package_name from package_details where package_id='"+package_id+"';";
			srs= db.execSQL(fetch_query);
			srs.next();
			package_name=srs.getString(1);
			srs.close();
			try
			 {
		


				if(rs.next()) 
				{
					//System.out.println("Inside if");
					if(programme_id.equals("1") || programme_id.equals("2"))
					{
						ctcField="ctc";
					}
					else if(programme_id.equals("3") || programme_id.equals("4"))
					{
						ctcField="ctc_mtech";
					}
					else if(programme_id.equals("5"))
					{
						ctcField="ctc_msc";
					}
					else if(programme_id.equals("7"))
					{
						ctcField="ctc_phd";
					}
					//System.out.println("ctcfield : "+ctcField);
					ctc_query="select "+ctcField+" from package_details where package_name='"+package_name+"';";
			
					det = db.execSQL(ctc_query);
					//System.out.println("Printing");
					if(det.next())
						ctcCur = det.getString(1);
					det.close();
			
					det = db.execSQL("select agency_id from package_details where package_name='"+package_name+"';");
					if(det.next())
						agency_id = det.getString(1);
						//out.println(agency_id);
					det.close();
			
					det = db.execSQL("select agency_profile,agency_name from agency where agency_id='"+agency_id+"';");
					if(det.next())
						agency_profile = det.getString(1);
						agency_name= det.getString(2);
						//out.println(agency_profile);
					det.close();
					out.println("<tr>");
					for (int i=1; i<=4; i++) 
					{
						out.println("<td>" + rs.getString(i) + "</td>" );
								
					}
					out.println("<td>" + package_name + "</td>" );
					out.println("<td>" + agency_name + "</td>" );
					out.println("<td>" + ctcCur + "</td>" );
					out.println("<td>" + agency_profile + "</td>" );
					/*out.println("<td>" + department_name + "</td>" );*/
					out.println("</tr>");
				}
			
		  	  }
	
		catch(SQLException e) 
		{ 
			String err=("<b>Error</b>");
			err+="<br>";
			err+=e.toString();

		} 
		catch (Exception e) 
		{
			String err=("<b>Error</b>");
			err+="<br>";
			err+=e.toString();

		}
		rs.close();
		}
		temp.close();
			  
	}
	studentrs.close();
		out.println("</table><center>");
		out.println("<br>");
        }
        else
        {

        rs= db.execSQL("select department_id, programme_id, prog_id from prog_record where programme_name ='"+programme_name_input+"';"); 
	//out.println("I'm Here");
        rs.next();
      	package_name=null;
       	tempDepartmentId = rs.getString(1);
	tempProgrammeId = rs.getString(2);
	program_id=rs.getString(3);
	//out.println(tempDepartmentId);
	//out.println(tempProgrammeId);
       /* fetch_query = "select SR.student_roll_number,SR.student_name,SR.email,SR.email_alternative, PD.package_name from student_record as SR, placement_record as PR, package_details as PD where SR.student_id = PR.student_id and PR.package_id = PD.package_id and SR.department_id = '"+tempDepartmentId+"' and SR.programme_id = '"+tempProgrammeId+"' and SR.job_status = 1";*/
        fetch_query = "select SR.student_roll_number,SR.student_name,SR.email,SR.email_alternative, PD.package_name from student_record as SR, placement_record as PR, package_details as PD where SR.student_id = PR.student_id and PR.package_id = PD.package_id and SR.program_id = '"+program_id+"' and SR.job_status = 1";

        try
	 {

		rs= db.execSQL(fetch_query); 
		int columnCount = 5;   //number of attributes in fetch_query
	/*	ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();*/

		out.println("<center><table class='advanced'>");
out.println("<tr colspan='2'><td colspan='8'><a href='#' onClick='return exportTablesByDepartment(\""+programme_name_input+"\")'><b>"+programme_name_input+"  </b></a></td> </tr>");
		out.println("<tr>");
		//out.println(programme_name_input);
		out.println("<td><b>Roll Number</b></td>");		
		out.println("<td><b>Name</b></td>");
		out.println("<td><b>Email</b></td>");
		out.println("<td><b>Email Alternative</b></td>");
		out.println("<td><b>Package Name</b></td>");
		out.println("<td><b>Company Name</b></td>");
		out.println("<td><b>CTC Offered</b></td>");
		out.println("<td><b>Company Sector</b></td>");
		out.println("</tr");
		while (rs.next()) 
		{
			department_id=tempDepartmentId;
			programme_id=tempProgrammeId;
			if(programme_id.equals("1") || programme_id.equals("2"))
			{
				ctcField="ctc";
			}
			else if(programme_id.equals("3") || programme_id.equals("4"))
			{
				ctcField="ctc_mtech";
			}
			else if(programme_id.equals("5"))
			{
				ctcField="ctc_msc";
			}
			else if(programme_id.equals("7"))
			{
				ctcField="ctc_phd";
			}
			package_name=rs.getString(5);
			ctc_query="select "+ctcField+" from package_details where package_name='"+package_name+"';";
			
			det = db.execSQL(ctc_query);
			if(det.next())
				ctcCur = det.getString(1);
			det.close();
			
			det = db.execSQL("select agency_id from package_details where package_name='"+package_name+"';");
			if(det.next())
				agency_id = det.getString(1);
				//out.println(agency_id);
			det.close();
			
			det = db.execSQL("select agency_profile,agency_name from agency where agency_id='"+agency_id+"';");
			if(det.next())
				agency_profile = det.getString(1);
				agency_name= det.getString(2);
				//out.println(agency_profile);
			det.close();
			out.println("<tr>");
			for (int i=1; i<=columnCount; i++) 
			{
				out.println("<td>" + rs.getString(i) + "</td>" );
			}
			out.println("<td>" + agency_name + "</td>" );
			out.println("<td>" + ctcCur + "</td>" );
			out.println("<td>" + agency_profile + "</td>" );
			/*out.println("<td>" + department_name + "</td>" );*/
			out.println("</tr>");
		}
		rs.close();

		out.println("</table><center>");
		out.println("<br>");

	
  	  }
	catch(SQLException e) 
	{ 
		String err=("<b>Error</b>");
		err+="<br>";
		err+=e.toString();

		//throw new ServletException("Your query is not working: " + str , e); 
	} 
	catch (Exception e) 
	{
		String err=("<b>Error</b>");
		err+="<br>";
		err+=e.toString();

	}
	}

			db.close();
   
%>

</html>
