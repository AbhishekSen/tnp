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
<%@ include file="../sessionvalidate.jsp"%>

<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

	db.fetchConfigDetails();
	db.connect();
	
	String filename=request.getParameter("filename");
	
	String username="";
	db.connect();
		/********************************************/
		ResultSet rset= db.execSQL("select username from session where session_id = '"+sid+"';");
			if(rset.next()) 
				username = rset.getString(1);			
		rset.close();				
	db.close();
	
		
                
                System.out.println("I am here babe");
		
		String filepath=gpath+"placement_uploads/root/company_ppt/";
	
		File myfile = new File(filepath+filename);
	
		if(!myfile.exists())
		{
			out.println("<p><File does not Exist/p>");
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
