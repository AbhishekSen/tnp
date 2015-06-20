
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ include file="/student/sessionvalidate.jsp"%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%

    
	db.fetchConfigDetails();
	String username="";
	String sql_username="select username from session where session_id = '"+sid+"';" ;
	db.connect();
	ResultSet rus= db.execSQL(sql_username);
	if(rus.next())
	{
		username = rus.getString(1);
	}
	rus.close();

	String prog_id="0";
	int duration=0;
	String sql_dep_id="select programme_id from student_record where username='"+username+"';";


	ResultSet ra= db.execSQL(sql_dep_id);
	if(ra.next())
	{
		prog_id =""+ ra.getInt(1);
	}
	ra.close();

	ResultSet rs2=db.execSQL("select programme_duration from programme_record where programme_id='"+prog_id+"';");
        //out.println("select programme_duration from programme_record where programme_id='"+prog_id+"';");
	if(rs2.next())
	{
		duration=rs2.getInt(1);
		if(duration==4)
		{
			ResultSet rrss=db.execSQL("select count(*) from print_status where username='"+username+"';");
			int count11=0;
			if(rrss.next())
			   count11=rrss.getInt(1);
			rrss.close();
                        if(count11<1)
                         {

			    response.sendRedirect("edit_b.jsp");
			    %>
                              <script type="text/javascript">
                               window.close();
                              </script>
                            <%
                         }
			 else
			  {
			    response.sendRedirect("bth1.jsp");
			  }
		}
		else if(duration==2)
		{
			ResultSet rrsss=db.execSQL("select count(*) from print_status where username='"+username+"';");
			int count111=0;
			if(rrsss.next())
			   count111=rrsss.getInt(1);
			rrsss.close();
			if(count111<1)
			 {
			    response.sendRedirect("edit_m.jsp");
			    %>
			    <script type="text/javascript">
                               window.close();
                            </script> 
                            <%
			 }
			  else
			 {
			    response.sendRedirect("mth1.jsp");
			 }
		}
	       else if(duration==0)
		{
			ResultSet rrsss=db.execSQL("select count(*) from print_status where username='"+username+"';");
			int count111=0;
			if(rrsss.next())
			   count111=rrsss.getInt(1);
			rrsss.close();
			if(count111<1)
			 {
			  response.sendRedirect("edit_p.jsp");
			  /*>
                             <script type="text/javascript">
                               window.close();
                             </script>
                          <% */
			 }
			  else
			 {
			    response.sendRedirect("pth.jsp");
			 }
		}
		else
		{
			response.sendRedirect("error2.jsp");
		}
	}
	else
	{
		response.sendRedirect("error2.jsp");
	}
	rs2.close();

	db.close();
    
%>





