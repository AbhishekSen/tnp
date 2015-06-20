<%@page language="java" import="java.util.*,gcom.*,javazoom.upload.*" %>
<%@page language="java" import="java.io.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>

<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script src="../js/sorttable.js"></script>

</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>

<%@ include file="../utils/session_validator.jsp"%>
<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();


        db.fetchConfigDetails(); //newly added
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");
	String student_roll_number="";
	String student_id="0";
	String username="";
	db.connect();
	ResultSet rsac=db.execSQL("select username from session where session_id='"+sid+"'");
	rsac.next();
	username=rsac.getString(1);
	rsac.close();
	ResultSet rsad=db.execSQL("select student_id,student_roll_number,program_id from student_record where username='"+username+"';");
	rsad.next();
	student_id=rsad.getString("student_id");
	student_roll_number=rsad.getString("student_roll_number");
	String program_id=rsad.getString("program_id");
	rsad.close();
	db.close();
%>




<%
	String[] agency_ids=null;
	String[] agencys=null;
	String[] pids=null;
	String[] cvs_1=null;
	String[] cvs_2=null;
	String[] cvs_1_ag=null;
	String[] cvs_1_pk=null;
	String[] cvs_2_ag=null;
	String[] cvs_2_pk=null;
	String submit = "";
MultipartFormDataRequest mrequest = null;
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.

          mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         int id = 0;
         if (mrequest != null && request != null)
         {

	//inserting into interested_students table
	agency_ids=mrequest.getParameterValues("agency_id");
	String[] temp = null;
	if(agency_ids != null)
	{
	        agencys = new String[agency_ids.length];
	        pids = new String[agency_ids.length];	        
	        for(int i=0;i<agency_ids.length;i++)
	        {
	                temp=agency_ids[i].split(":");
	                if(temp != null)
	                {
	                        if(temp[0] != null)     agencys[i]=temp[0];
	                        if(temp[1] != null)     pids[i]=temp[1];
	                }
                }
        }
	cvs_1=mrequest.getParameterValues("cvs_1");
	cvs_2=mrequest.getParameterValues("cvs_2");
	if(cvs_1 != null)
	{
	        cvs_1_ag = new String[cvs_1.length];
	        cvs_1_pk = new String[cvs_1.length];	        
	        for(int i=0;i<cvs_1.length;i++)
	        {
	                temp=cvs_1[i].split(":");
	                if(temp != null)
	                {
	                        if(temp[0] != null)     cvs_1_ag[i]=temp[0];
	                        if(temp[1] != null)     cvs_1_pk[i]=temp[1];
	                }
                }
        }
        
        if(cvs_2 != null)
	{
	        cvs_2_ag = new String[cvs_2.length];
	        cvs_2_pk = new String[cvs_2.length];	        
	        for(int i=0;i<cvs_2.length;i++)
	        {
	                temp=cvs_2[i].split(":");
	                if(temp != null)
	                {
	                        if(temp[0] != null)     cvs_2_ag[i]=temp[0];
	                        if(temp[1] != null)     cvs_2_pk[i]=temp[1];
	                }
                }
        }

	submit=mrequest.getParameter("submit");
	String sql_copy="";
        String cv_app="";
        String f_name="";
        String s_name="";

	//if(submit!=null)
	//{
		db.connect();
		ResultSet r_fd=db.execSQL("select agency_id from agency where cv_final_date>curdate() or (cv_final_date=curdate() and cv_final_time>=curtime());");
		int i_ag=0;
		while(r_fd.next())
			i_ag=db.updateSQL("delete from interested_students where student_id='"+student_id+"' and agency_id='"+r_fd.getString("agency_id")+"';");
		r_fd.close();
		int i_id=0;

		while(agency_ids!=null && i_id<agency_ids.length)
		{		       
			i_ag*=db.updateSQL("insert into interested_students(agency_id,student_id,package_id) values ('"+agencys[i_id]+"','"+student_id+"','"+pids[i_id]+"');");
			i_id++;
		}
		i_id=0;
		while(cvs_1!=null && i_id<cvs_1.length)
		{		        
			i_ag*=db.updateSQL("update interested_students set cv=0 where student_id="+student_id+" and agency_id="+cvs_1_ag[i_id]+" and package_id="+cvs_1_pk[i_id]+";");
			i_id++;
		}
		i_id=0;
		while(cvs_2!=null && i_id<cvs_2.length)
		{
		       
			i_ag*=db.updateSQL("update interested_students set cv=1 where student_id="+student_id+" and agency_id="+cvs_2_ag[i_id]+" and package_id="+cvs_2_pk[i_id]+";");
			i_id++;
		}
		db.close();

                 i_id=0;
                 
                while(agency_ids!=null && i_id<agency_ids.length)
                 {
                    db.connect();
                     sql_copy="";
                     cv_app="";
                    sql_copy+="select cv from interested_students where student_id='"+student_id+"' and agency_id='"+agencys[i_id]+"' and package_id='"+pids[i_id]+"';" ;
                               
                    ResultSet rs5=db.execSQL(sql_copy);
                     while(rs5.next())
                      {
                         cv_app=rs5.getString(1);
                      }
                   if(cv_app.equals("0"))
                     {
                       f_name=gpath+"placement_uploads/student/uploads/"+student_roll_number+".pdf";
                       s_name=gpath+"placement_uploads/agency/"+student_roll_number+"_"+agencys[i_id]+"_"+pids[i_id]+".pdf";
                     }
                   else if(cv_app.equals("1"))
                    {
                       f_name=gpath+"placement_uploads/student/uploads/"+student_roll_number+"_1.pdf";
                       s_name=gpath+"placement_uploads/agency/"+student_roll_number+"_"+agencys[i_id]+"_"+pids[i_id]+".pdf";
                     }
                     System.out.println(f_name);
                                          System.out.println(s_name);
		  File file1=new File(f_name);
                  File file2=new File(s_name);
			if(file1.exists())
			  {
			      if(!file2.exists())
                               {
                                   file2.createNewFile();
                                 
                                   InputStream in = new FileInputStream(file1);
                                   OutputStream out1 = new FileOutputStream(file2);
                                   byte[] buf = new byte[1024];
                                   int len;
                                   while ((len = in.read(buf)) > 0){
                                   out1.write(buf, 0, len);
                                   }
                                  in.close();
                                  out1.close();
                               }
		          }
                          i_id++;
                         rs5.close();
                         db.close();
               }
	//}
}
}
           
	
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>

<div id="organizationDetail">
        <center><b><strong>Successful Application Submission</strong><b></center>
        <div align='center' ><table id="org_det" class='imagetable'><tr><th>S.No.</th><th>Organization Name</th><th>CV Version Selected</th></tr>

<% 
    
     String temp="";
     String temp1="";
     int index=0;
     int i=1;
     String org_name="";
     String pkg_name="";
     String cv_sel="";
      while(agency_ids!=null && index<agency_ids.length)
        {
            temp="";
            temp1="";
            org_name="";
            cv_sel="";
            db.connect();
           temp+="select agency_name from agency where agency_id='"+agencys[index]+"';";
           ResultSet rsjb=db.execSQL(temp);

	   rsjb.next();
	   org_name=rsjb.getString(1);
	   rsjb.close();
	   
	   temp="select package_name from package_details where package_id='"+pids[index]+"';";
	   rsjb=db.execSQL(temp);           
	   rsjb.next();
	   pkg_name=rsjb.getString(1);
	   rsjb.close();
	   
	   	              
           temp1+="select cv from interested_students where student_id='"+student_id+"' and agency_id='"+agencys[index]+"' and package_id='"+pids[index]+"';";
            ResultSet rsab=db.execSQL(temp1);
	   rsab.next();
	   cv_sel=rsab.getString(1);
	   rsab.close();
           db.close();
           index++;
           out.println("<tr>");
           out.println("<td> "+i+"</td><td align=\"center\">");
           out.println(org_name+"/"+pkg_name+"</td>");
           if(cv_sel.equals("0"))
            out.println("<td align=\"center\">CV1</td>"); 
            else if(cv_sel.equals("1"))
           out.println("<td align=\"center\">CV2</td>"); 
             i++;
           out.println("</tr>");
      }
%>

</table></div>
</div>
</body>
</html>

