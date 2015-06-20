<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
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

function addRowDOM(tblId)
{
  var tblBody = document.getElementById(tblId).tBodies[0];
  var newRow = tblBody.insertRow(-1);
  var newCell0 = newRow.insertCell(0);
  var newInput = document.createElement('input');
  newInput.type = 'text';
  newInput.value = '';
  newInput.name='student_roll_number';
  newInput.style.color = 'blue';
  newCell0.appendChild(newInput);
  var newCell1 = newRow.insertCell(1);
  //newCell1.appendChild(document.createTextNode('cell 1 - just plain text'));
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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="main.jsp">Placement Record</a>
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
            <img src="../images/bot.gif" alt="" width="181" height="243" />
    </div>
</div></td>
<strong>Placement Record</strong>

<form name="searchform"  method="post" id="searchform" action="record.jsp">
  <table width="511" height="117" border="0" align="center">

    <tr>
      <td>Student  roll number </td>
      <td><table width="300" border="0" id="table_stud">
        <tr>
          <td><input type="text" name="student_roll_number" id="student_roll_number">
            <a onclick="addRowDOM('table_stud')" href='#'>Add Student</a></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td>Select Company</td>
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
