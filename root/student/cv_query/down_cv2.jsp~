<%/*
  out.println("Hello World!");*/
%>

<%@ page language="java" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/session_validator.jsp"%>
<% //db.fetchConfigDetails(); %>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

	
	int sm123=0;
	String  student_roll_number=request.getParameter("roll_no");
 String cv_id="1";
if(cv_id!=null)
if(cv_id.equals("0") || cv_id.equals("1") )
{
	
	
		String cv_no="";
                String filename="";
                if(cv_id.equals("1"))
	        {
                 cv_no="_1";
                 filename+=student_roll_number+cv_no+".pdf";
		}
                if(cv_id.equals("0"))
                 {
                    filename+=student_roll_number+".pdf";
                 }
		String filepath=gpath+"placement_uploads/student/uploads/";
	
		File myfile = new File(filepath+filename);
	
		if(!myfile.exists())
		{
			response.sendRedirect("error.jsp");
		}
		else
		{
			BufferedInputStream buf=null;
			ServletOutputStream myOut=null;
			myOut = response.getOutputStream( );
			//set response headers
			response.setContentType("application/pdf");
			
			response.addHeader(
			"Content-Disposition","attachment; filename="+student_roll_number+".pdf" );
			
			response.setContentLength( (int) myfile.length( ) );
			
			FileInputStream input = new FileInputStream(myfile);
			buf = new BufferedInputStream(input);
			int readBytes = 0;
			
			//read from the file; write to the ServletOutputStream
			while((readBytes = buf.read( )) != -1)
			myOut.write(readBytes);
	
			//close the input/output streams
			if (myOut != null)
			myOut.close( );
			if (buf != null)
			buf.close( );
		}
 }  
%>
