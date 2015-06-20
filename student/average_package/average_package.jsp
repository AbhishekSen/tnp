<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">


function validate_empty(ptr_name)
{alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);


	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please select  department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			     //	ptr.department_name.select();
			 }
		}
 if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please select  program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			    //	ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 { //alert(message);
		return true;
	 }

}


</script>





</head>
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>

<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> </div>
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
  <img alt="small logo" src="../images/logo-top.gif" height="116" width="115"/></div> 
  <div id="pageNav"> 
  <div id="sectionLinks"> 
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp" >Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp" >Check Eligibility</a>
      <a href="../schedule/agency_date.jsp" >Organization Dates</a>
      <a href="../companies_visiting/list.jsp">Companies Visiting</a>
      <a href="../agency_query/placement_query.jsp" >Company Details</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
   <%--   <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a>
      <img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" />
    </div>
</div></td>
<form name="form_query_placement" id="form_query_placement" method="post" action="get_details.jsp">
  <p><strong>Select Appropriate Fields
  </strong></p>
  <p>&nbsp;</p>
  <table align="center">
    <tr>
      <td>Choose Program:</td>
      <td><select name="programme_name" id="programme_name" >
        <%!String program_list;%>
        <% String program_list=drop_down("select programme_name from programme_record;",db); %>
        <option value="0">-------------select--------------</option>
        <%=program_list%>
      </select></td>
    </tr>
    <tr>
      <td> Choose Department: </td>
      <td><select name="department_name" id="department_name">
        <%!String department_list;%>
        <% department_list=drop_down("select department_name from department_record;",db); %>
        <option value="0">---------------------select-------------------</option>
        <%=department_list%>
      </select></td>
    </tr>
  </table>
.
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input type="submit" name="submit" id="submit" value="Get Details"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
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
