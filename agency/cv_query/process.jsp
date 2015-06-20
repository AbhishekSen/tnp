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
	int sm123=0;
	String student_roll_number=request.getParameter("roll");
	
	String username="";
	db.connect();
	String package_id = request.getParameter("pid");
		/********************************************/
		ResultSet rset= db.execSQL("select username from session where session_id = '"+sid+"';");
			if(rset.next()) 
				username = rset.getString(1);
			String agen_id="";
		rset.close();
		/********************************************/
		ResultSet reet=db.execSQL("select agency_id from agency where username='"+username+"';");
			if(reet.next())
				agen_id=""+reet.getInt(1);
		reet.close();
		/********************************************/
		String stud_id="";
		ResultSet rst=db.execSQL("select student_id from student_record where student_roll_number='"+student_roll_number+"';");
			if(rst.next())
				stud_id=""+rst.getInt(1);
		rst.close();
		/********************************************/
		ResultSet rrt=db.execSQL("select count(*) from interested_students where agency_id='"+agen_id+"' and student_id='"+stud_id+"' and package_id='"+package_id+"';");
			if(rrt.next())
				sm123=rrt.getInt(1);
		rrt.close();
		/********************************************/
	db.close();
	if(sm123!=1)
	{
		response.sendRedirect("error.jsp");
	}
	else
	{
		
                db.connect();
                ResultSet rs = db.execSQL("select cv from interested_students where agency_id='"+agen_id+"' and student_id='"+stud_id+"' and package_id='"+package_id+"';");
		String cv_no="";
                if(rs.next())
                {
                    if(rs.getInt("cv")==1)
                        cv_no="_1";
                }
                rs.close();
                db.close();
               
		 String filename=student_roll_number+""+cv_no+".pdf";
		
		String filepath=gpath+"placement_uploads/student/uploads/";
	
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
	}
   
%>
