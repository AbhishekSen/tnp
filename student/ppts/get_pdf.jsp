<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


</head>
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../sessionvalidate.jsp"%>




<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ page import="java.util.*" %>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rst= db.execSQL(sql_username);
		if(rst.next()) 
		{
		username = rst.getString(1);
		}
		
		rst.close();
		db.close();
	
%>


  
<%
	
	String display1="<div align='center' class='result'>" ;
	String display2="<br></div>" ;
        
	

		



	

	        out.println(display1+"<b>Details of the Organization literature is as follows:</b>"+display2);   
			out.println(display1+""+display2);   

       		out.println("<div align='center'><table align='center' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='imagetable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
                        out.println("<th>Organization Name</th>");
						out.println("<th>File Name</th>");
                        out.println("</tr>");
	 

         db.connect();
     
     ResultSet rs=db.execSQL("select agency_name , file_name from company_ppt ;");
	int i=1;
   while(rs.next())
   { 
   		String agency_name=rs.getString(1);
   		String filename=rs.getString(2);
     
       out.println("<tr><td>"+i+"</td><td>"+agency_name+"</td><td><a href='#' onClick='return getPlacement(\"" + filename + "\");'>Click to download </a></td></tr>");
	   i++;



   
  }
    
    
    rs.close();
     db.close();
  
    out.println("</table></div>");   
%>


</body>
</html>
