<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
<script type="text/javascript">

function alltrim(str)
{
	//var strr="";
	return str.replace(/^\s+|\s+$/g, '');
	//alert(strr);
	//return strr;
}

function findall()
{
	
	var i=0;
	//alert("i="+i);
	//alert(form2.elements.length);
    for(i = 0; i < document.form_placement_record.elements.length; i++)
    {
		//alert("i="+i);
        document.form_placement_record.elements[i].value=alltrim(document.form_placement_record.elements[i].value);
    }
}

function validate_empty()
{	

	var message="";

	findall();
        
         
	if(document.form_placement_record.company_name.value=="")
		message+="Please enter Company name\n";
		
	
	if(message=="")
	{
		document.form_placement_record.action="drop.jsp";
		return true;
	}
	else
	{
		alert(message);
		document.form_placement_record.action=null;
		return false;
	}
}	 
</script>


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
	String submit=request.getParameter("submit");
	String company_name=request.getParameter("company_name");
	 
	if(submit!=null && company_name!=null )
		{				

			String main_record1=" delete from schedule where company_name='"+company_name+"' ;";
			db.connect();
			int num_rows1=db.updateSQL(main_record1);
			db.close();	
			
				if( num_rows1!=0 )
					{
						response.sendRedirect("success.jsp");
					 

					}	
					
				else
						response.sendRedirect("error.jsp");
                                
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
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div> 
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
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty()">
  <p>&nbsp;</p>
<table width="456" align="center">
<tr>
<td >
Choose Organization:
</td><td><%! String agency_list ;%>
<% agency_list =drop_down("select company_name from schedule  ;",db) ; %>
<select name="company_name" id="company_name">
<option value="">------------------select----------------</option>
<%=agency_list%>
</select>	
</td></tr>
 
 
</table>
<p>&nbsp;</p>
<table width="72" height="32" border="0" align="center">
  <tr>
    <td><input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" ></td>
  </tr>
</table>
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
