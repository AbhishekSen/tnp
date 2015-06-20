<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

</head>

<script type="text/javascript">

function ask_confirm()
{
	var msg="Set Username as '";
	msg+=document.form2.username.value;
	msg+="'?";
	if(document.form2.username.value=="")
	{
		document.form2.action=null;
		alert("Please type a valid username.");
		return false;
	}
	else
	{
		var where_to= confirm(msg);
		if(where_to==true)
		{
			document.form2.action="add_uname.jsp";
			return true;
		}
		else
		{
			document.form2.action=null;
			return false;
		}
	}
	
}

</script>

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
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp">Student </a>
      <a href="../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
 </td>
  <form name="form2" method="post" onSubmit="return ask_confirm();">
  	<%
		db.fetchConfigDetails();
		
		String student_roll_number=request.getParameter("roll_no");
		String submit=request.getParameter("submit");
		String update=request.getParameter("update");
		//String stud_name="";
		String username=request.getParameter("username");
		if(submit!=null&&student_roll_number!=null)
		{
			db.connect();
			ResultSet rs=db.execSQL("select student_name,program_name from student_record where student_roll_number="+student_roll_number+";");
			if(rs.next())
			{
				out.println("<p align=\"center\">"+rs.getString("student_name")+"</p>");
				out.println("<p align=\"center\">"+rs.getString("program_name")+"</p>");
				out.println("<input type=\"hidden\" name=\"roll_no\" value=\""+student_roll_number+"\">");
			}
			rs.close();
			db.close();
		}
		else if(update!=null&&student_roll_number!=null&&username!=null)
		{
			db.connect();
			int ij=db.updateSQL("update student_record set username='"+username+"' where student_roll_number="+student_roll_number+";");
			db.close();
			if(ij!=0)
			{
				response.sendRedirect("edit_student_details/edit.jsp?student_roll_number="+student_roll_number);
			}
			else
			{
				response.sendRedirect("sel_roll.jsp");
			}
		}
	%>
    <p align="center"><b>Username</b>
      <label for="username"></label>
      <input type="text" name="username" id="username">
    </p>
    <p align="center">
      <input type="submit" name="update" id="update" value="Submit">
    </p>
  </form>
  <p align="center">&nbsp;</p>

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
