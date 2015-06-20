<html>
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="css/emx_nav_left.css" type="text/css">
</head>
<body onmousemove="closesubnav(event);"> 
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="utils/session_validator.jsp"%>
<%@ include file="utils/get_unique_field.jsp"%>
<%@ include file="utils/encode_sql.jsp"%>
<%@ include file="utils/table.jsp"%>
<%@ include file="utils/drop_down.jsp"%>
<%@ include file="utils/drop_down2.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../logout.jsp");
%>
<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
		{
		username = rs.getString(1);
		}
		
		rs.close();
		db.close();
	
%>

<%/*
	db.connect();
	ResultSet rset404=db.execSQL("select is_registered,is_first,is_filled from agency where username='"+username+"';");
	rset404.next();
	int is_reg=rset404.getInt(1);
	int is_first=rset404.getInt(2);
	int is_fill=rset404.getInt(3);
	rset404.close();
	db.close();
	if(is_first==0)
		response.sendRedirect("change_password/change_password.jsp");*/
	/*else if(is_registered==0)
		response.sendRedirect("");
	else if(is_fill==0)
		response.sendRedirect("");
		*/
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></div>
 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action="">
    </form> 
    <div id="globalLink"> <a href="main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome , <%=username%></h2>
    <img alt="small logo" src="images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="instructions.jsp">Instructions</a><a href="edit_details/edit.jsp">Edit Job Application Form</a>
      <a href="vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a><a href="student_eligibility/eligibility.jsp">Eligible Students</a>
      <a href="student_details/student_details.jsp">Students Details Query</a>
      <a href="cv_query/cv_query.jsp">CV Query</a>
      <a href="calendar/view.jsp">Organization Schedule</a><a href="uploads/upload.jsp">Upload Organization Literature</a>
      <a href="change_password/change_password.jsp">Change Password</a>
      <a href="../logout.jsp">Logout</a></div>
  </div>
  <div id="siteInfo">
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
