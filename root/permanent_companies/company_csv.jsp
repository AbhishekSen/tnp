<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.lang.*,java.util.*,java.io.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

</head>


<body onLoad="document.form_placement_record.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
	db.fetchConfigDetails();
		
			String Content="Agency name,field,Agency_website,contact person,mobile no,email,phone,fax,profile,designation,cpi,xth";
			Content+=",x12th,ctc Btech";
			Content+=",ctc Mtech,ctc Msc,ctc Phd,";
			Content+="program\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from agency");
			
			while(rs.next())
			{
				String arr="";
				int agency_id=rs.getInt("agency_id");
				String qu="select * from package_details where agency_id="+agency_id;
                                //System.out.println(qu);
				ResultSet st_dept=db.execSQL(qu);
				int package_id=0;
				String pk_name="";
				String jb_decp="";
				float cpi=0;
				float xi=0;
				float xii=0;
				float ctc_btech=0;
				float ctc_mtech=0;
				float ctc_msc=0;
				float ctc_phd=0;
				if(st_dept.next())
				    {
					package_id=st_dept.getInt("package_id");
					pk_name=st_dept.getString("package_name");
					jb_decp=st_dept.getString("job_designation");
					cpi=st_dept.getFloat("cpi");
					xi=st_dept.getFloat("x_percentage");
					xii=st_dept.getFloat("xii_percentage");
					ctc_btech=st_dept.getFloat("ctc");
					ctc_mtech=st_dept.getFloat("ctc_mtech");
					ctc_msc=st_dept.getFloat("ctc_msc");
					ctc_phd=st_dept.getFloat("ctc_phd");
					
				    }
				int pindex=0;
				
				ResultSet st_pg=db.execSQL("select * from package_extra_details where agency_id='"+agency_id+"';");
                                while(st_pg.next())
				    {
				     	  pindex=st_pg.getInt("program_index");
					  
					  ResultSet pgname=db.execSQL("select programme_name from prog_record where prog_id='"+pindex+"';");
					  if(pgname.next())
					    {
					     String pg=pgname.getString(1);
                                              if(arr.equals(""))
					       arr=pg ;
					      else
						arr=arr+"-"+pg;

					    }
				    
					 
				    }

                               

				Content+=rs.getString("agency_name").replaceAll(",","\t");;
				Content+=","+rs.getString("nature_business").replaceAll(",","\t");;
				Content+=","+rs.getString("agency_website").replaceAll(",","\t");;
				Content+=","+rs.getString("agency_person").replaceAll(",","\t");;
				Content+=","+rs.getString("agency_mobile");
				Content+=","+rs.getString("agency_email");
				Content+=","+rs.getString("agency_phone");
				Content+=","+rs.getString("agency_fax");
				Content+=","+pk_name.replaceAll(",","\t");
				Content+=","+jb_decp;
				Content+=","+cpi;
				Content+=","+xi;
				Content+=","+xii;
				Content+=","+ctc_btech;
				Content+=","+ctc_mtech;
				Content+=","+ctc_msc;
				Content+=","+ctc_phd;
				Content+=","+arr.replaceAll("-","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";

			}
			rs.close();

			db.close();
			
			String filename="company_details.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
	
		
		
		
		

	
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
 </td>
 <table align="center">
 </table>

  <tr>
    <td colspan="2" height="20">   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    GCom  </div> </td></tr></table>
</div> 
<!--end pagecell1--> 
<br> 
<script type="text/javascript">
    <!--
      var menuitem1 = new menu(7,1,"hidden");
			var menuitem2 = new menu(7,2,"hidden");
			var menuitem3 = new menu(7,3,"hidden");
			var menuitem4 = new menu(7,4,"hidden");
			var menuitem5 = new menu(7,5,"hidden");
			var menuitem6 = new menu(7,6,"hidden");
			var menuitem7 = new menu(7,7,"hidden");
    // -->
    </script> 
</body>
</html>
