<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">

</script>
</head>
<%@page language="java" import="pack.DbBean,java.text.SimpleDateFormat"%> 
<%@ page language="java" import="java.util.*,java.util.Properties" %>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/session_validator.jsp"%>
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

<%@page language="java" import="java.util.*,gcom.*,java.lang.*,java.util.*,java.io.*" %>
<%  	
	 ResultSet rs;
         String tempPackage = null;
         String tempPackageName = null;
         String Content = "";
         String fetch_query="";	 
	 String companyName ="";
	 String fName="";
	 companyName = request.getParameter("companyName");
	 ServletOutputStream opt =null;
	 java.util.Date date = null;
	 SimpleDateFormat formatter = null;
	 String timestamp = "";
    	String department_name="";
    	String programme_name="";
    	String programme_id="";
    	String department_id="";
    	String ctcField="";
    	String ctcCur="";
    	String student_id="";
    	ResultSet det;
    	String ctc_query="";
         String path = gpath+"placement_uploads/status/";
         FileWriter writer = null;

	 if(companyName != null && companyName.equals("All"))
	 {
                String package_query = "select distinct package_id from placement_record";
       
                db.connect();
                rs= db.execSQL(package_query);
                 
                while(rs.next())
                {
                        Content = "";
                        tempPackage = rs.getString(1);

                        ResultSet tmp = db.execSQL("select package_name from package_details where package_id='"+tempPackage+"';"); 
                        if(tmp.next())
                                tempPackageName = tmp.getString(1);
                                

                        tmp.close();
                        fetch_query = "select student_name as Student_Name,student_roll_number as Roll_Number,contact_number as Cell,email as Email,s.department_id,s.programme_id  from placement_record p,student_record s where  p.package_id='"+tempPackage+"' and s.student_id=p.student_id"; 

                        try
	                        {

                                ResultSet all;
                                all =    db.execSQL(fetch_query); 
		

		
		
		                ResultSetMetaData allmd = all.getMetaData();
		                int columnCountall = allmd.getColumnCount();


		                for (int i=1; i<=columnCountall-2; i++) 
		                {
			                Content+=allmd.getColumnName(i);
			                        Content+=",";
		                }

				Content+="CTC Offered,";
				Content+="Programme,";
				Content+="Department";		
		                Content+="\n";
		                while (all.next()) 
		                {
			department_id=all.getString(5);
			programme_id=all.getString(6);
			if(programme_id.equals("1") || programme_id.equals("2"))
			{
				ctcField="ctc";
			}
			else if(programme_id.equals("3") || programme_id.equals("4"))
			{
				ctcField="ctc_mtech";
			}
			else if(programme_id.equals("5"))
			{
				ctcField="ctc_msc";
			}
			else if(programme_id.equals("7"))
			{
				ctcField="ctc_phd";
			}
			ctc_query="select "+ctcField+" from package_details where package_id='"+tempPackage+"';";
			
			det = db.execSQL(ctc_query);
			if(det.next())
				ctcCur = det.getString(1);
			det.close();
			
			det = db.execSQL("select department_name from department_record where department_id="+department_id+";");
			if(det.next())
				department_name = det.getString(1);
			det.close();
			
			det = db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
			if(det.next())
				programme_name = det.getString(1);
			det.close();
			                for (int i=1; i<=columnCountall-2; i++) 
			                {
				                Content+=all.getString(i);
			                                Content+=",";
			                }
					Content+=ctcCur;
					Content+=",";
					Content+=programme_name;
					Content+=",";
					Content+=department_name;
			                Content+="\n";

		               }
		                all.close();


                        }
	                catch (Exception e) 
	                {
                                e.printStackTrace();
	                }
	                date = new java.util.Date();
			formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			timestamp = formatter.format(date);
	                fName=tempPackageName.replaceAll(" ","_");
	                fName=fName.replaceAll("/","-");
//change here**************
		        String filename=path+fName+"_"+timestamp+".csv";
	                writer = new FileWriter(filename);
	                writer.append(Content);
	                writer.close();   
                }	 
	 db.close();
	                try
		        {
                        Process p = Runtime.getRuntime().exec(gpath+"placement_new/root/placement_record/statusZip.sh");
                        String s=null;
                        BufferedReader stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
							while ((s = stdInput.readLine()) != null) 
							{
							System.out.println(s);
							}
		        File myfile = new File(path+"AllOrg_Status.zip");
			BufferedInputStream bufin=null;
			ServletOutputStream myOut=null;
			myOut = response.getOutputStream();
			//set response headers
			response.setContentType("application/pdf");
			
			response.addHeader(
			"Content-Disposition","attachment; filename="+"AllOrg_Status.zip" );
			
			response.setContentLength( (int) myfile.length( ) );
			
			FileInputStream input = new FileInputStream(myfile);
			bufin = new BufferedInputStream(input);
			int readBytes = 0;
			
			//read from the file; write to the ServletOutputStream
			while((readBytes = bufin.read( )) != -1)
			myOut.write(readBytes);
	
			//close the input/output streams
			if (myOut != null)
			myOut.close( );
			if (bufin != null)
			bufin.close( );
		        }
		        catch(Exception e)
		        {
			        e.printStackTrace();
		        }
	 
	 }
	 
	 else if(companyName != null)
	 {
	 
	         fetch_query = "select student_name as Student_Name,student_roll_number as Roll_Number,contact_number as Cell,email as Email,s.department_id,s.programme_id  from placement_record p,student_record s,package_details pk where pk.package_name='"+companyName+"' and pk.package_id=p.package_id and s.student_id=p.student_id";

       
        try
	 {
	 
	        db.connect();
		rs= db.execSQL(fetch_query); 
		ResultSetMetaData rsmd = rs.getMetaData();

		int columnCount = rsmd.getColumnCount();
                Content = "";
		for (int i=1; i<=columnCount-2; i++) 
		{
			Content+=rsmd.getColumnName(i);

			        Content+=",";
		}
				Content+="CTC Offered,";
				Content+="Programme,";
				Content+="Department";	
		Content+="\n";

		while (rs.next()) 
		{
			department_id=rs.getString(5);
			programme_id=rs.getString(6);
			if(programme_id.equals("1") || programme_id.equals("2"))
			{
				ctcField="ctc";
			}
			else if(programme_id.equals("3") || programme_id.equals("4"))
			{
				ctcField="ctc_mtech";
			}
			else if(programme_id.equals("5"))
			{
				ctcField="ctc_msc";
			}
			else if(programme_id.equals("7"))
			{
				ctcField="ctc_phd";
			}
			ctc_query="select "+ctcField+" from package_details where package_name='"+companyName+"';";
			
			det = db.execSQL(ctc_query);
			if(det.next())
				ctcCur = det.getString(1);
			det.close();
			System.out.println(ctcCur);
			det = db.execSQL("select department_name from department_record where department_id="+department_id+";");
			if(det.next())
				department_name = det.getString(1);
			det.close();
			
			det = db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
			if(det.next())
				programme_name = det.getString(1);
			det.close();
			                for (int i=1; i<=columnCount-2; i++) 
			                {
				                Content+=rs.getString(i);
			                                Content+=",";
			                }
					Content+=ctcCur;
					Content+=",";
					Content+=programme_name;
					Content+=",";
					Content+=department_name;
			                Content+="\n";

		      }
		rs.close();


    }

	catch (Exception e) 
	{
		e.printStackTrace();
	}
	

	
	 
	      try
		{
			date = new java.util.Date();
			formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			timestamp = formatter.format(date);
                        companyName=companyName.replaceAll(" ","_");
                        companyName=companyName.replaceAll("/","_");
		//change here**************
		        String filename=companyName+"_"+timestamp+".csv";

			//out.println(Content);
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			opt = response.getOutputStream();
			response.reset();
			//response.setContentType("application/text");
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[10000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				opt.write(buf, 0, len);
			}
			bis1.close();
			opt.flush(); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	db.close();	
        }		
%>
