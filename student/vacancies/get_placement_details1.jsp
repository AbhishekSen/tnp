<%@page language="java" import="java.util.*,gcom.*,javazoom.upload.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
  <%@page language="java" import="java.sql.*"%>
  
  
  <jsp:useBean id="db" class="pack.DbBean" scope="session"/>
  
<%@ include file="../sessionvalidate.jsp"%>
  <%@ include file="../utils/get_unique_field.jsp"%>
  <%@ include file="../utils/table.jsp"%>
  <%@ include file="../utils/encode_sql.jsp"%>

<%
        db.fetchConfigDetails(); //newly added
	String department_id="";
	String programme_id="";
	 
        if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.

         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         if(mrequest != null)
         {
         String department_name="";
	String programme_name="";	
	department_id=mrequest.getParameter("department_id");
	programme_id=mrequest.getParameter("programme_id");


		String sql_get_data="select department_name from department_record where department_id="+department_id+";" ;
		db.connect(); 
		ResultSet resd=db.execSQL(sql_get_data);
		if(resd.next()) 
		{
			department_name=resd.getString(1);
		}
		resd.close();
		
	
		sql_get_data="select programme_name from programme_record where programme_id="+programme_id+";" ;
		
		ResultSet resp= db.execSQL(sql_get_data);
		if(resp.next()) 
		{
			programme_name=resp.getString(1);
		}
		resp.close();
		db.close();	
		
		out.println("<center><b>Vacancy  Details For:</b></ceter>");
		out.println("<center><b>"+programme_name+" in  "+department_name+"</b></center>");
		
	
			
		db.connect();
		String stm = "select count(*) from package_extra_details where department_id='"+department_id+"' and programme_id='"+programme_id+"';";

		ResultSet rd= db.execSQL(stm);
		int num =0;
		if(rd.next())
		{
			num=rd.getInt(1);
		}
		rd.close();
		db.close();
		//out.println(num);
		if(num>0)
		{
			out.println("<div align='center'><table border='0' width= '80%' name='table_journal_int' id='table_journal_int' cellpadding='5' class='imagetable'>");
			out.println("<tr>");
			out.println("<th align='center'>S.No.</th>");
			out.println("<th align='center'>Agency name</th>");
			out.println("<th align='center'>Package name</th>");
			out.println("<th align='center'>Vacancies</th>");
			out.println("</tr>");
			int j=0;
			db.connect();
			ResultSet rd1=db.execSQL("select package_id from package_extra_details where department_id='"+department_id+"' and programme_id='"+programme_id+"' order by agency_id;");
			while(rd1.next())
			{
				ResultSet rd2=db.execSQL("select agency_id,package_name,vacancy from package_details where package_id="+rd1.getString(1)+";");
				if(rd2.next())
				{
					j++;
					String agency_id=rd2.getString("agency_id") ;
					String package_name=rd2.getString("package_name");
					String vacancy=rd2.getString("vacancy");
					String agency_name="";
					//j++;
					ResultSet rd3=db.execSQL("select agency_name from agency where agency_id="+agency_id+";");
					if(rd3.next())
					{
						agency_name=rd3.getString(1);
					}
					rd3.close();
					out.println("<tr>");
					out.println("<td align='center'>"+j+"</td>");
					out.println("<td align='center'>"+agency_name+"</td>");
					out.println("<td align='center'>"+package_name+"</td>");
					out.println("<td align='center'>"+vacancy+"</td>");	
					out.println("</tr>");
				}
				rd2.close();
			}
		  	out.println("</table></div>");
		 	rd1.close();
		 	db.close();
		}
		else if(num==0)
		{
			out.println("<p align='center'>&nbsp;</p>");
			out.println("<p align='center'>&nbsp;</p>");
			out.println("<p align='center'><b>  No matching results found  </b></p>");
			out.println("<p align='center'>&nbsp;</p>");
		}
	
	
       }
      }

%>
</table>
</body>
</html>
