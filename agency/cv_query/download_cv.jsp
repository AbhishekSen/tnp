<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import = "java.io.File,java.io.*" %>
<%@ page import="java.util.zip.*,java.util.zip.ZipOutputStream,java.util.zip.ZipException" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
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
			
%>
<% db.fetchConfigDetails(); %>

<%
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
			username = rs.getString(1);
		//out.println(username+"<br/>");
		String agency_id="";
		String agency_name="";
		rs.close();
		ResultSet re=db.execSQL("select agency_id,agency_name from agency where username='"+username+"';");
		if(re.next())
			agency_id=re.getString(1);
			agency_name=re.getString(2);
		//out.println(agency_id+"<br/>");
		re.close();
		db.close();
		String package_id=request.getParameter("pid");
		String package_name="";
		db.connect();
		ResultSet pkg = db.execSQL("select package_name from package_details where package_id='"+package_id+"';");
		if(pkg.next())
			package_name=pkg.getString(1);
		pkg.close();
		agency_name=agency_name.replaceAll(" ","_");
		agency_name=agency_name.replaceAll("/","_");    //new
		package_name=package_name.replaceAll(" ","_");
		package_name=package_name.replaceAll("/","_");  //new
                
		
				String pth=gpath+"placement_uploads/student/uploads/"+agency_name+"("+package_name+")" ;
			        File directory = new File(pth);
				if(!directory.exists())
                                {
				   File f4=new File(pth);
				   f4.mkdir( );
				}

				ResultSet rset=db.execSQL("select student_id,cv from interested_students where agency_id="+agency_id+";");
				//out.println("select student_id from interested_students where agency_id="+agency_id+" and package_id="+package_id+";");
				while(rset.next())
				{

				    int cv=0;
				    cv=rset.getInt(2);
                                    String sql_temp="select status from eligible_students where student_id='"+rset.getString(1)+"' and agency_id="+agency_id+" and package_id="+package_id+";";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
					if(rr.next())
					{
                                            status=rr.getInt(1);
					}                                     

                                      rr.close();
                                                                   
				if(status!=1)
				  {
					ResultSet rset1=db.execSQL("select * from student_record where student_id='"+rset.getString(1)+"';");

                                   
					if(rset1.next())
					{
					 
						String roll="";
						String src1="";
						String src2="";
						String src=gpath+"placement_uploads/student/uploads/";
						String des=pth;
						
						roll=rset1.getString("student_roll_number");
						src1=gpath+"placement_uploads/student/uploads/"+roll+".pdf";
						src2=gpath+"placement_uploads/student/uploads/"+roll+"_1.pdf";

						des+="/"+roll+".pdf";
						File f1 = new File(src1);
						File f2 = new File(src2);
						File f3= new File(des);
						
						  if(cv==0)
						    {
						      if(f1.exists())
							{

							    InputStream in1 = new FileInputStream(f1);
							    OutputStream ot1 = new FileOutputStream(f3);
							    byte[] buf = new byte[1024];
							    int len;
							    while ((len = in1.read(buf)) > 0)
							    {
									ot1.write(buf, 0, len);
							    }
							    in1.close();
							    ot1.close();

							}
						      }
						      else
						      {
						      if(f2.exists())
							{

							    InputStream in2 = new FileInputStream(f2);
							    OutputStream ot2 = new FileOutputStream(f3);
							    byte[] buf = new byte[1024];
							    int len;
							    while ((len = in2.read(buf)) > 0)
							    {
									ot2.write(buf, 0, len);
							    }
							    in2.close();
							    ot2.close();

							}
						      }

							String s=null;
						   try
						   {
						   Process p = Runtime.getRuntime().exec(gpath+"placement/agency/cv_query/test1.sh "+agency_name+"("+package_name+")");
							BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
							while ((s = stdInput.readLine()) != null) 
							{
							//System.out.println(s);
							}

						    } 
							catch (IOException e) 
							{  
							e.printStackTrace();  
							System.out.println("ERROR.RUNNING.CMD");  
							}
							finally
							{
							//   p.destroy();
							}

	
					      
					}
					rset1.close();
				    }
				}
				rset.close();
				db.close();



  		String filepath=gpath+"placement_uploads/student/uploads/";
		String filename=agency_name+"("+package_name+").zip";
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

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

</html>
