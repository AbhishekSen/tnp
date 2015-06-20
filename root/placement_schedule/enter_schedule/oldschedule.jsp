<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>


</head>


<body onLoad="document.form_placement_record.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>

<%!
int j=0;
String company_name=null;
%>
<%
        db.fetchConfigDetails(); //newly added
	//out.println("rohan 1");
	 
	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR);
 
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	
	//String company_name=request.getParameter("company_name");
        String agency_id=request.getParameter("company_name");
        String sql_count="select count(*) from schedule where agency_id="+Integer.parseInt(agency_id)+" ;";
        db.connect();
        ResultSet rs5= db.execSQL(sql_count);
        rs5.next();
        int num1=rs5.getInt(1);   

        String[][] db_events = new String[num1][11];
        int i5=0;
        if(num1!=0)
        {                  
		String sql_schedule="select * from schedule where agency_id="+Integer.parseInt(agency_id)+" ;";
		db.connect();
		ResultSet res5= db.execSQL(sql_schedule);
		i5=0;
		while(res5.next()) 
		{
		db_events[i5][0]=res5.getString("recurring");
		db_events[i5][1]=res5.getString("date_from");
		db_events[i5][2]=res5.getString("starting_time");
		db_events[i5][3]=res5.getString("date_to");
		db_events[i5][4]=res5.getString("end_time");
		db_events[i5][5]=res5.getString("company_profile");
		db_events[i5][6]=res5.getString("description");
		db_events[i5][7]=res5.getString("venue");
		db_events[i5][8]=res5.getString("eligibility_criteria");
		db_events[i5][9]=res5.getString("departments");//.replaceAll("\n",">>");
		i5++;
//out.println(i);
		}
		res5.close();
		db.close();
              }
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
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="116" width="115"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../../placement_record/main.jsp">Placement Record</a>
      <a href="../main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
            <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
<form method="post" name="form_placement_record" id="form_placement_record" action="edit.jsp">
  <p>&nbsp;</p>

<% if(num1==0)
     { 
       out.println("<p align=\"center\"><strong><h1>");
       out.println("There are no previous schedule for this company");
       out.println("</h1></strong></p>");
     }
   else
    {
      out.println("<p align=\"center\"><strong><h1>");
       out.println("Previous schedule of the company is: ");
       out.println("</h1></strong></p></br>");
       i5=0;
       while(i5<num1)
        { 
           out.println("<p><h2>");
           out.println("Date From: "+db_events[i5][1]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("Start Time: "+db_events[i5][2]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("Date To: "+db_events[i5][3]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("End Time: "+db_events[i5][4]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("Description: "+db_events[i5][6]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("Venue: "+db_events[i5][7]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("Eligibility: "+db_events[i5][8]);
           out.println("</h2></p>");
           out.println("<p><h2>");
           out.println("departments: "+db_events[i5][9]);
           out.println("</h2></p>");
           out.println("<p>");
           out.println("-------------------------");
           out.println("</p>");
           i5++;
        }
    }
%>

<p>&nbsp;</p>

<p><br>
  </p>
</p>
</form>
    <p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name
  </div> 
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
