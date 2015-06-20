<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>


</head>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.lang.*" %>

<body>
<%@page language="java" import="pack.DbBean"%> 
<script type="text/javascript">
<!--

function get_details()
{
	var i=0;
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("new_details").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("POST","get_details.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("cname="+document.getElementById("text_box").value);
}


function update_db(num)
{
	var bigm="";
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp1=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp1=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp1.onreadystatechange=function()
	{
		if (xmlhttp1.readyState==4 && xmlhttp1.status==200)
		{
			alert(xmlhttp1.responseText);
			//document.getElementById("new_details").innerHTML=xmlhttp1.responseText;
		}
	}
	checkhour(document.getElementById("hours"+num));
	checkmin(document.getElementById("mins"+num));
	bigm+="agency_id="+document.getElementById("hid"+num).value+"&cv_final_date="+document.getElementById("cv_final_date"+num).value;
	bigm+="&cv_final_hour="+document.getElementById("hours"+num).value+"&cv_final_min="+document.getElementById("mins"+num).value;
	bigm+="&am_pm="+/*document.getElementById("am_pm"+num).options[*/document.getElementById("am_pm"+num).selectedIndex/*].value*/+"&submit=s";
	xmlhttp1.open("POST","update_details.jsp",true);
	xmlhttp1.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp1.send(bigm);

}

function checkhour(item)
{
	if(item.value=="")
		item.value="";
	else if(parseInt(item.value)!=item.value || parseInt(item.value)>12 || parseInt(item.value)<1)
	{
		//alert("Please Type  a number between 1 and 12");
		if(item.value.length==1 && parseInt(item.value)==item.value);
		else
		item.value="12";
	}
}

function checkmin(item)
{
	if(item.value=="")
		item.value="";
	else if(parseInt(item.value)!=item.value || parseInt(item.value)>59 || parseInt(item.value)<0)
	{
		//alert("Please Type  a number between 0 and 59");
		if(item.value.length==1 && parseInt(item.value)==item.value);
		else
		item.value="00";
	}
}

//-->
</script>

<script src="../js/datetimepicker.js"></script>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>


<%
/*
db.fetchConfigDetails();
db.connect();
ResultSet rs=db.execSQL("select x_percentage,student_id from student_record;");
while(rs.next())
{
    String s="0";
    if(rs.getString(1)==null)
        s="0";
    else
        s=rs.getString(1).replace("%","").replace(" ","").replace("`","");
    char[] sa=s.toCharArray();
    s="";
    int poi=0;
    for(int i=0;i<sa.length;i++)
    {
        if((sa[i]>='0' && sa[i]<='9'))
            s=s+sa[i];
        else if(sa[i]=='.')
        {
            poi++;
            if(poi==1)
                s=s+sa[i];
        }
    }
    if(s.equals(""))
        s="0";
    out.println("update student_record set x_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs.getInt("student_id")+"';");
    int h=db.updateSQL("update student_record set x_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs.getInt("student_id")+"';");

}
rs.close();
ResultSet rs1=db.execSQL("select xii_percentage,student_id from student_record;");
while(rs1.next())
{
    String s="0";
    if(rs1.getString(1)==null)
        s="0";
    else
        s=rs1.getString(1).replace("%","").replace(" ","").replace("`","");
    char[] sa=s.toCharArray();
    s="";
    int poi=0;
    for(int i=0;i<sa.length;i++)
    {
        if((sa[i]>='0' && sa[i]<='9'))
            s=s+sa[i];
        else if(sa[i]=='.')
        {
            poi++;
            if(poi==1)
                s=s+sa[i];
        }
    }
    if(s.equals(""))
        s="0";
    out.println("update student_record set xii_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs1.getInt("student_id")+"';");
    int h=db.updateSQL("update student_record set xii_percentage='"+Float.parseFloat(s)+"' where student_id='"+rs1.getInt("student_id")+"';");

}
rs1.close();
db.close();
//
	String submit=request.getParameter("submit");
	//out.println(submit);
	if(submit!=null)
	{
		String cv_final_date=request.getParameter("cv_final_date");
		String cv_final_hour=request.getParameter("cv_final_hour");
		String am_pm=request.getParameter("am_pm");
		String cv_final_min=request.getParameter("cv_final_min");
		String agency_id=request.getParameter("agency_id");
		String[] fd=cv_final_date.split("-");
		int hour=0;
		if(am_pm.equals("0"))
			if(cv_final_hour.equals("12"))
				hour=0;
			else
				hour=Integer.parseInt(cv_final_hour);
		else
			if(cv_final_hour.equals("12"))
				hour=12;
			else
				hour=12+Integer.parseInt(cv_final_hour);
		db.connect();
		//out.println("update agency set cv_final_date='"+fd[2]+"-"+fd[1]+"-"+fd[0]+"', cv_final_time='"+hour+":"+cv_final_min+":00' where agency_id='"+agency_id+"';");
		int r=db.updateSQL("update agency set cv_final_date='"+fd[2]+"-"+fd[1]+"-"+fd[0]+"', cv_final_time='"+hour+":"+cv_final_min+":00' where agency_id='"+agency_id+"';");
		db.close();
	}
*/
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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>

<form>
  <p align="center">Enter Organization or Username of Organization<input type="text" name="text_box" id="text_box" onkeyup="get_details();" onkeydown="get_details();"/><input type="button" name="get" value="Get Details" onClick="get_details()"/></p>
	<div id="new_details">
	
	</div>
</form>

<table align="bottom"><tr>
    <td colspan="2" height="20">   
<div id="siteInfo" style="position:absolute;bottom:0;"><a href="#">About Us</a> | <a href="#">Site
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
