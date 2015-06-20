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
    String tempPackage = null;
    String tempPackageName = null;
    String Content = "";
    String department_name="";
    String programme_name="";
    String programme_id="";
    String department_id="";
    String ctcField="";
    String ctcCur="";
    String student_id="";
    ResultSet det;
    String ctc_query="";
if (MultipartFormDataRequest.isMultipartFormData(request))
{
         // Uses MultipartFormDataRequest to parse the HTTP request.

     mrequest = new MultipartFormDataRequest(request);
     submit = mrequest.getParameter("submit");
}
        String fetch_query="";
        String package_name = mrequest.getParameter("package_name");
         db.connect(); 
         out.println("<center><table><tr>");
         out.println("<td><input type='button' value='Back' onClick='return getPlacementStats();'></td>");
         out.println("<td><input type='button' value='Export All To CSV' onClick='return exportTables(\"All\");'></td>");
         out.println("</tr></table></center>");
        if(package_name == null || package_name == "" || package_name.equals("0"))
        {
        String package_query = "select distinct package_id from placement_record";
       
        
        rs= db.execSQL(package_query); 
        while(rs.next())
        {
        tempPackage = rs.getString(1);
        ResultSet tmp = db.execSQL("select package_name from package_details where package_id='"+tempPackage+"';"); 
        if(tmp.next())
                tempPackageName = tmp.getString(1);
        tmp.close();
        fetch_query = "select student_name as Student_Name,student_roll_number as Roll_Number,contact_number as Cell,email as Email,s.department_id,s.programme_id from placement_record p,student_record s where  p.package_id='"+tempPackage+"' and s.student_id=p.student_id"; 

            try
	         {

                ResultSet all;
                all = db.execSQL(fetch_query); 
		


		
		ResultSetMetaData allmd = all.getMetaData();
		int columnCountall = allmd.getColumnCount();

		out.println("<center><table class='advanced'>");
		out.println("<tr colspan='2'><td colspan='7'><a href='#' onClick='return exportTables(\""+tempPackageName+"\")'><b>"+tempPackageName+"  </b></a></td> </tr>");
		out.println("<tr>");
		for (int i=1; i<=columnCountall-2; i++) 
		{
			out.println("<td><b>" + allmd.getColumnName(i) + "</b></td>");
		}
		out.println("<td><b>CTC Offered</b></td>");
		out.println("<td><b>Programme</b></td>");
		out.println("<td><b>Department</b></td>");
		out.println("</tr");
		while (all.next()) 
		{
			department_id=all.getString(5);
			programme_id=all.getString(6);
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
			ctc_query="select "+ctcField+" from package_details where package_id='"+tempPackage+"';";
			
			det = db.execSQL(ctc_query);
			if(det.next())
				ctcCur = det.getString(1);
			det.close();
			
			det = db.execSQL("select department_name from department_record where department_id="+department_id+";");
			if(det.next())
				department_name = det.getString(1);
			det.close();
			
			det = db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
			if(det.next())
				programme_name = det.getString(1);
			det.close();
			out.println("<tr>");
			for (int i=1; i<=columnCountall-2; i++) 
			{
				out.println("<td>" + all.getString(i) + "</td>" );
			}
			out.println("<td>" + ctcCur + "</td>" );
			out.println("<td>" + programme_name + "</td>" );
			out.println("<td>" + department_name + "</td>" );
			out.println("</tr>");
		}
		all.close();

		out.println("</table><center>");
		out.println("<br>");


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
            
        }
        }
        else
        {
        fetch_query = "select student_name as Student_Name,student_roll_number as Roll_Number,contact_number as Cell,email as Email,s.department_id,s.programme_id from placement_record p,student_record s,package_details pk where pk.package_name='"+package_name+"' and pk.package_id=p.package_id and s.student_id=p.student_id";
       

        try
	 {


		

		
		rs= db.execSQL(fetch_query); 
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();

		out.println("<center><table class='advanced'>");
		out.println("<tr colspan='2'><td colspan='7'><a href='#' onClick='return exportTables(\""+package_name+"\")'><b>"+package_name+"  </b></a></td> </tr>");
		out.println("<tr>");
		for (int i=1; i<=columnCount-2; i++) 
		{
			out.println("<td><b>" + rsmd.getColumnName(i) + "</b></td>");
		}
		out.println("<td><b>CTC Offered</b></td>");
		out.println("<td><b>Programme</b></td>");
		out.println("<td><b>Department</b></td>");
		out.println("</tr");
		while (rs.next()) 
		{
			department_id=rs.getString(5);
			programme_id=rs.getString(6);
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
			ctc_query="select "+ctcField+" from package_details where package_name='"+package_name+"';";
			
			det = db.execSQL(ctc_query);
			if(det.next())
				ctcCur = det.getString(1);
			det.close();
			
			det = db.execSQL("select department_name from department_record where department_id="+department_id+";");
			if(det.next())
				department_name = det.getString(1);
			det.close();
			
			det = db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
			if(det.next())
				programme_name = det.getString(1);
			det.close();
			out.println("<tr>");
			for (int i=1; i<=columnCount-2; i++) 
			{
				out.println("<td>" + rs.getString(i) + "</td>" );
			}
			out.println("<td>" + ctcCur + "</td>" );
			out.println("<td>" + programme_name + "</td>" );
			out.println("<td>" + department_name + "</td>" );
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
