<%@ page language="java" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/session_validator.jsp"%>

<%@ page language="java" import="java.util.*,java.util.Properties" %>

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
	int sm123=0;
	String cv_id=request.getParameter("cv_id");
if(cv_id!=null)
if(cv_id.equals("0") || cv_id.equals("1") )
{
	
	String student_roll_number="";
	
	String username="";
	db.connect();
		/********************************************/
		ResultSet rset= db.execSQL("select username from session where session_id = '"+sid+"';");
			if(rset.next()) 
				username = rset.getString(1);
		rset.close();
		/********************************************/
		ResultSet reet=db.execSQL("select student_roll_number from student_record where username='"+username+"';");
			if(reet.next())
				student_roll_number=""+reet.getInt(1);
		reet.close();
		/********************************************/
		String cv_no="";
                String filename="";
                if(cv_id.equals("1"))
	        {
                 cv_no="_sign";
                 filename+=student_roll_number+cv_no+".jpeg";
		}
                if(cv_id.equals("0"))
                 {
                    filename+=student_roll_number+"_img.jpeg";
                 }
		String filepath=apath+"tnp/image_uploads/";
	
		File myfile = new File(filepath+filename);
	
		if(!myfile.exists())
		{
			out.println("File doesnot exist.");
		}
		else
		{
			BufferedInputStream buf=null;
			ServletOutputStream myOut=null;
			myOut = response.getOutputStream( );
			//set response headers
			response.setContentType("image/jpeg");
			if(cv_id.equals("0"))
			        response.addHeader("Content-Disposition","attachment; filename="+student_roll_number+"_img.jpeg" );
			else if(cv_id.equals("1"))
         			response.addHeader("Content-Disposition","attachment; filename="+student_roll_number+"_sign.jpeg" );
			
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
