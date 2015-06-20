<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>PLACEMENT RECORD FORM</title>
<script type="text/javascript">

function validate_empty()
{

	   if (document.searchform.student_roll_number.value.length == 0 )
   		{
  			    alert("Please enter student roll number");
      			document.searchform.student_roll_number.focus();
      			return false;

		}
 
	   if (document.searchform.package_name.value ==0 )
   		{
  			    alert("Please Select Package name");
      			document.searchform.package_name.focus();
      			return false;

		}
		
			   if (document.searchform.agency_name.value ==0 )
   		{
  			    alert("Please Select Agency name");
      			document.searchform.agency_name.focus();
      			return false;

		}
}
 
</script>
<style type="text/css">
<!--
.style5 {font-size: medium}
-->
</style>
<body onmousemove="closesubnav(event);"> 
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />




<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati</h1> 
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
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="getinfo.jsp" target="_blank">Placement Record</a>
      <a href="../drop_agency/drop.jsp" target="_blank">Drop Organization</a>
	  <a href="../attendance/placement_record.jsp" target="_blank">Organization Exam Appearance</a>
	  <a href="../temporary_drop_agency/tempdrop.jsp" target="_blank">Drop Temporary Agency</a>
      <a href="../cv_download/download.jsp" target="_blank">CV Query</a>
      <a href="../placement_query/placement_query.jsp" target="_blank">Student Query</a>
      <a href="../placement_query1/agency_year.jsp" target="_blank">Organization Query</a>
      <a href="../second_card/second_card.jsp" target="_blank">Second Card Query</a>
      <a href="../agency_date/agency_date.jsp" target="_blank">Organization Date Query</a>
      <a href="../eligibility_query/eligibility_query.jsp" target="_blank">Student Eligibilty Query</a>
      <a href="../change_final_date/change_date.jsp" target="_blank">Change Date Requests</a>
      <a href="../student_performance/student_eligibility.jsp" target="_blank">Attendence Query</a>
      <a href="../placement_query3/placement_query1.jsp" target="_blank">Organization Query by Deptt/Prog</a>
      <a href="../temporary_query/placement_query.jsp" target="_blank">Temporary Organization Query</a>
      <a href="../average_package/average_package.jsp" target="new">Average Package Query</a>
      <a href="../make_permanent/activate.jsp" target="new">Activate Temporary Organization's</a>
      <a href="../../logout.jsp">LOGOUT</a>
    </div>
</div></td>
<strong>Placement Record</strong>
<form name="searchform"  method="post" id="searchform" action="record.jsp" onSubmit="return validate_empty()">
  <table width="511" height="117" border="0" align="center">
    <tr>
      <td width="208" height="51" class="style5">Choose Organization</td>
      <td width="293"><%! String agency_list ;%>
        <% agency_list =drop_down("select agency_name from agency;",db) ; %>
        <select name="agency_name" id="agency_name">
          <option value="0">------------------select----------------</option>
          <%=agency_list%>
        </select></td>
    </tr>
    <tr>
      <td>Student  roll number </td>
      <td><input type="text" name="student_roll_number" id="student_roll_number"></td>
    </tr>
    <tr>
      <td>Select Package</td>
      <td><select name="package_name" id="package_name" >
        <%!String package_list;%>
        <% String package_list=drop_down("select package_name from package_details;",db); %>
        <option value="0">-------------select--------------------</option>
        <%=package_list%>
      </select></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="200" border="0" align="center">
    <tr>
      <td><div align="center">
        <input type="submit" name="submit" value="Submit">
        <colgroup>
          </colgroup>
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>

  






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
