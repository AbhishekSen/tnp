<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

var time = 3000;
var numofitems = 7;



</script>

<script src="../../js/datetimepicker.js"></script>
</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<% //db.fetchConfigDetails(); %>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>







<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink">
      <div id="globalLink2"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    </div> 
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../main.jsp">Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
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
      <form method="post" name="form_agency_registration" id="form_agency_registration" action="details.jsp">
        <p><strong>Enter Roll Number</strong></p>
        <table width="459" height="42" align="center">
          <tr>
            <td width="200">Student roll number</td>
            <td width="351"><input type="text" name="student_roll_number" id="student_roll_number"></td>
          </tr>
        </table>
        <p>&nbsp;</p>
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
        <p>&nbsp;  </p>
        <p>&nbsp;</p>
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
