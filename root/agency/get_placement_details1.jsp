<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
  <%@page language="java" import="java.sql.*"%>
  
  
  <jsp:useBean id="db" class="pack.DbBean" scope="session"/>
  
 
 <%@ include file="../utils/session_validator.jsp"%>
  <%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	//out.println(sid);
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

 
  
  <%@ include file="../utils/drop_down.jsp"%>
  <%@ include file="../utils/get_unique_field.jsp"%>
  <%@ include file="../utils/table.jsp"%>
  <%@ include file="../utils/encode_sql.jsp"%>

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
	  <a href="../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
</div></td>
<%
      db.fetchConfigDetails(); //newly added
	int department_id=0;
	int programme_id=0;
	 
    String department_name="";
	String programme_name="";	
	department_name=request.getParameter("department_name");
	programme_name=request.getParameter("programme_name");
	
	if(department_name=="" || department_name=="")
	{
		StringBuffer result = new StringBuffer(1024);
		
		result.append("<form name='form11' id='form11' action='placement_query.jsp'>");
								
	    result.append("<table border='1' width= '80%' cellpadding='5' align='center'>");
		
		result.append("<br><br>");
		
		result.append("Please Enter the Details Properly");
		
		result.append("<br><br>");
		
		result.append("<input type='submit' class='center' align='right' name='placement_query' "+"id='placement_query' value='Back'>");
		
		result.append("</form>");	
								
		result.append("</table>"); 
								
		out.println(result.toString());

	}
	else
	{  

	
	String sql_get_data="select department_id from department_record where department_name='"+department_name+"';" ;
		db.connect(); 
		ResultSet resd=db.execSQL(sql_get_data);
		if(resd.next()) 
		{
			department_id=resd.getInt(1);
		}
		resd.close();
		db.close();
	
		sql_get_data="select programme_id from programme_record where programme_name='"+programme_name+"';" ;
		db.connect(); 
		ResultSet resp= db.execSQL(sql_get_data);
		if(resp.next()) 
		{
			programme_id=resp.getInt(1);
		}
		resp.close();
		db.close();	
		
	out.println("<p align='center'>Vacancy  Details For:-</p>");
	out.println("<p align='center'>"+programme_name+" in  "+department_name+"</p>");
	out.println("<p align='center'>&nbsp;</p>");
	
			
	/*db.connect();
	String stm = "select package_id , package_name , vacancy from package_details where department_id="+department_id+" and programme_id="+programme_id+";";
	
		//out.println(stm);
	ResultSet rd= db.execSQL(stm);
	int num =0;
	while(rd.next())
	{
	num++;
	}
	rd.first();
	//out.println(num);
	if(num>0)
	{
		out.println("<table border='0' width= '80%' name='table_journal_int'"+
			" id='table_journal_int' cellpadding='5' align='center'>");
		out.println("<tr>");
		out.println("<th align='center'>S.No.</th>");
		out.println("<th align='center'>Package name</th>");
		out.println("<th align='center'>Vacancies</th>");
		out.println("</tr>");
		int j=0;
		
		
		do
		{
		if(j==0) rd.first();
		 String package_id=rd.getString("package_id") ;
		 String package_name=rd.getString("package_name");
		 String vacancy=rd.getString("vacancy");
		j++;
		out.println("<tr>");
		out.println("<td align='center'>"+j+"</td>");
		out.println("<td align='center'>"+package_name+"</td>");
		out.println("<td align='center'>"+vacancy+"</td>");	
		out.println("</tr>");
		}while(rd.next());
	  out.println("</table>");
	  
	 db.close();
	}
	if (num==0)
	{
	out.println("<p align='center'>&nbsp;</p>");
	out.println("<p align='center'>&nbsp;</p>");
	out.println("<p align='center'>--  No matching results found  --</p>");
	out.println("<p align='center'>&nbsp;</p>");
	}
	
		}*/
		
		db.connect();
		String stm = "select count(*) from package_extra_details where department_id='"+department_id+"' and programme_id='"+programme_id+"';";

		ResultSet rd= db.execSQL(stm);
		int num =0;
		if(rd.next())
		{
			num=rd.getInt(1);
		}
		rd.close();
		db.close();
		//out.println(num);
		if(num>0)
		{
			out.println("<div align='center'><table border='0' width= '80%' name='table_journal_int' id='table_journal_int' cellpadding='5' class='imagetable'>");
			out.println("<tr>");
			out.println("<th align='center'>S.No.</th>");
			out.println("<th align='center'>Agency name</th>");
			out.println("<th align='center'>Package name</th>");
			out.println("<th align='center'>Vacancies</th>");
			out.println("</tr>");
			int j=0;
			db.connect();
			ResultSet rd1=db.execSQL("select package_id from package_extra_details where department_id='"+department_id+"' and programme_id='"+programme_id+"' order by agency_id;");
			while(rd1.next())
			{
				ResultSet rd2=db.execSQL("select agency_id,package_name,vacancy from package_details where package_id="+rd1.getString(1)+";");
				if(rd2.next())
				{
					j++;
					String agency_id=rd2.getString("agency_id") ;
					String package_name=rd2.getString("package_name");
					String vacancy=rd2.getString("vacancy");
					String agency_name="";
					//j++;
					ResultSet rd3=db.execSQL("select agency_name from agency where agency_id="+agency_id+";");
					if(rd3.next())
					{
						agency_name=rd3.getString(1);
					}
					rd3.close();
					out.println("<tr>");
					out.println("<td align='center'>"+j+"</td>");
					out.println("<td align='center'>"+agency_name+"</td>");
					out.println("<td align='center'>"+package_name+"</td>");
					out.println("<td align='center'>"+vacancy+"</td>");	
					out.println("</tr>");
				}
				rd2.close();
			}
		  	out.println("</table></div>");
		 	rd1.close();
		 	db.close();
		}
		else if(num==0)
		{
			out.println("<p align='center'>&nbsp;</p>");
			out.println("<p align='center'>&nbsp;</p>");
			out.println("<p align='center'><b>  No matching results found  </b></p>");
			out.println("<p align='center'>&nbsp;</p>");
		}
	
	
       }

%>




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
