<%@ page language="java" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/session_validator.jsp"%>
<% //db.fetchConfigDetails(); %>
<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();


	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	

        db.fetchConfigDetails();	
	db.connect();
	String path=request.getParameter("id");
               
		String filename="Eligible_Students.zip";
		
		String filepath=gpath+"placement_uploads/student/uploads/";
	
	        Process p = Runtime.getRuntime().exec(gpath+"placement/agency/cv_query/test1.sh All");
                String s=null;
                        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
							while ((s = stdInput.readLine()) != null) 
							{
							System.out.println(s);
							}

		File myfile = new File(filepath+filename);
	
		if(!myfile.exists())
		{
			response.sendRedirect("error2.jsp");
		}
		else
		{
			BufferedInputStream buf=null;
			ServletOutputStream myOut=null;
			myOut = response.getOutputStream( );
			//set response headers
			response.setContentType("application/pdf");
			
			response.addHeader(
			"Content-Disposition","attachment; filename="+filename );
			
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

   
%>
