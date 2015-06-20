<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%


String data=request.getParameter("q0");
//String year= request.getParameter("q1");
//String semester = request.getParameter("q2");
if (data != null)
{
	try
	 { 
                db.fetchConfigDetails(); //newly added
	//	db.connect(); 
		String answer="";
		int columnCount = 0 ;
		String sql="select agency_name"+
		            " from agency "+
               		 "where agency_name like '"+data+"%'; " ;


		String temp="";
		db.connect(); 
		ResultSet rs;
		rs= db.execSQL(sql); 
		ResultSetMetaData rsmd = rs.getMetaData();
		columnCount = rsmd.getColumnCount();
        
		StringBuffer result = new StringBuffer(1024);
		
		int num_rows=0 ;
		while (rs.next())
		{
		 num_rows+=1 ;
		}
		
		
        if (num_rows > 1)
		{
		 out.println("More than one Course matches the criteria  ");
		 out.flush() ;
		}
		else 
		{
          if (num_rows == 1)
		  {  
		   String str="";
		   rs.first();
		   result.append("<table>");
	       result.append("<tr>");
		   for (int i=1; i<=columnCount; i++) 
		   {
			result.append("<td>" + rs.getString(i) + "</td>" );
		   } 
		   result.append("</tr>");
		   rs.close();
		   db.close();
		   result.append("</table>");
		   str = result.toString();
		   out.println(str);
		  // out.println("exactly one row");
		   out.flush();	
		  }
		  else // number of rows <= 0 
		  {
		    out.println("There is no course with such a course number");
			out.flush();
		  }
         }  // number of rows <=1 
		// out.println("abhishek");

  	}	
	catch(SQLException e) 
	{ 
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	//	out.flush();
		//throw new ServletException("Your query is not working: " + str , e); 
	} 
	catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
	    out.println(err);
	//	out.flush();
	}
}
else
{
 out.println("");
 out.flush();
}

%>
