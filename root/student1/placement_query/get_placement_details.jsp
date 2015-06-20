<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
  <%@page language="java" import="java.sql.*"%>
  
  
  <jsp:useBean id="db" class="pack.DbBean" scope="session"/>
  
 
 <%@ include file="../../utils/session_validator.jsp"%>
  <%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	//out.println(sid);
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

 
  
  <%@ include file="../../utils/drop_down.jsp"%>
  <%@ include file="../../utils/get_unique_field.jsp"%>
  <%@ include file="../../utils/table.jsp"%>
  <%@ include file="../../utils/encode_sql.jsp"%>

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
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
</div></td>
<%
    db.fetchConfigDetails(); //newly added
	 
    String stud_roll_number=null; 
	
	stud_roll_number=request.getParameter("student_roll_number");
	
	if(stud_roll_number=="" || stud_roll_number==null)
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
	out.println("<p align='center'>Student Details :-</p>");
	out.println("<p align='center'>&nbsp;</p>");
	out.println("<p align='center'>"+stud_roll_number+"</p>");
	out.println("<p align='center'>&nbsp;</p>");
	out.println("<p align='center'>&nbsp;</p>");
	
			
	db.connect();
	String stm = "select * from student_record where student_roll_number='"+stud_roll_number+"';";
	
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
		out.println("<th align='center'>Student name</th>");
		out.println("<th align='center'>Roll number</th>");
		out.println("</tr>");
		int j=0;
		
		
		do
		{
		if(j==0) rd.first();
		 String student_id=rd.getString("student_id") ;
		 String student_name=rd.getString("student_name");
		 String student_roll_number=rd.getString("student_roll_number");
		j++;
		out.println("<tr>");
		out.println("<td align='center'>"+student_id+"</td>");
		out.println("<td align='center'>"+student_name+"</td>");
		out.println("<td align='center'>"+student_roll_number+"</td>");	
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
