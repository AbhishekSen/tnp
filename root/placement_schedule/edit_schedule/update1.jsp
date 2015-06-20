<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell</title>
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>

<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">
<!--
var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function change_data()
{
	var i;
	i=document.getElementById("content");
	var str="Now i've changed this whole feature!!!"
	str+= "<br>This may just be <BR> useful in AJAX.<br><br>Let us see!!";
	i.innerHTML=str;
	document.getElementById("infobar").innerHTML="<h3 id=\"infotitle\">Data Changed! </h3><br><br><br> <a href=\"javascript:clearinfo()\" id=\"infohide\">Hide</a><br>";
	document.getElementById("pagecell1").style.top='180px';
	var j=document.styleSheets[0];
	alert(document.getElementById("infobar").style.position);
	alert(document.getElementById("infobar").offsetHeight);
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112px';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}

// -->

function get_sure()
{
  var x=confirm("Are you sure to delete that schedule ? ");
  return x;
}

</script>


</head>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/sql_convert_date.jsp"%>

<%@ include file="../../utils/session_validator.jsp"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	
%>
<body onmousemove="closesubnav(event);"> 
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
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
    <%--  <a href="../../change_final_date/change_date.jsp" >Change Date Requests</a> --%>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
</div>
<%
        db.fetchConfigDetails(); //newly added
 

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
        String schedule_id=request.getParameter("schedule_id");
	String submit2=request.getParameter("submit2");
	String delete2=request.getParameter("delete2");
        String date_from=request.getParameter("date_from");
	String starting_time=request.getParameter("starting_time");
        String date_to=request.getParameter("date_to");
	String end_time=request.getParameter("end_time");
	String agency_id=request.getParameter("company_name");
	String description=request.getParameter("description");
	String venue=request.getParameter("venue");
	String eligibility_criteria=request.getParameter("eligibility_criteria");
	String departments=request.getParameter("departments");


        if(submit2!=null)
	{				
	  int num_rows=0;
	
          String main_record=" update schedule set date_from='"+date_from+"',starting_time='"+starting_time+"',date_to='"+date_to+"',end_time='"+end_time+"',description='"+description+"',venue='"+venue+"',eligibility_criteria='"+eligibility_criteria+"',departments='"+departments+"' where schedule_id='"+schedule_id+"';";        				
				
	  db.connect();
	  num_rows=db.updateSQL(main_record);
	  db.close();	
	  if(num_rows==1 )
	  {			
		response.sendRedirect("success.jsp");
	  }
	  else
		response.sendRedirect("error.jsp");		
	}

        if(delete2 !=null)
        {
          int num_rows2=0;
          db.connect();
          num_rows2=db.updateSQL("delete from schedule where schedule_id='"+schedule_id+"';");    
          db.close();
          if(num_rows2==1 )
          {
                response.sendRedirect("success_delete.jsp");
          }
          else
                response.sendRedirect("error.jsp");
        } 

    	if(submit2==null)
	{
		String sql_get_data="select * from schedule where schedule_id='"+schedule_id+"';" ;
		db.connect(); 
		
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
                        date_from=rs.getString(3);
                        starting_time=rs.getString(4);
                        date_to=rs.getString(5);
                        end_time=rs.getString(6);
                        description=rs.getString(8);
                        venue=rs.getString(9);
                        eligibility_criteria=rs.getString(10);
                        departments=rs.getString(11);                     
		}
		rs.close();
		db.close();
		
	}
	%>
<form method="post" name="form_placement_record" id="form_placement_record">
  <p align="center"> <strong> Please Fill All The Fields </strong></p>
  <table width="560" height="399" align="center">
 
    <tr>
      <td width="250">*Date From</td>
      <td width="298">
          <input readonly type="text" name="date_from" id="date_from" onclick="displayCalendar(document.forms[1].date_from,'dd-mm-yyyy',this)" value="<%=date_from%>" >
      </td>
    </tr>
    <tr>
      <td>Start Time</td>
      <td><input type="text" name="starting_time" value="<%=starting_time%>">HH:MM (AM/PM)</td>
    </tr>
    <tr>
      <td width="250">*Date To</td>
      <td width="298">
          <input readonly type="text" name="date_to" id="date_to" onclick="displayCalendar(document.forms[1].date_to,'dd-mm-yyyy',this)" value="<%=date_to%>" >
      </td>
    </tr>
    <tr>
      <td >End Time</td>
      <td><input name="end_time" value="<%=end_time%>" type="text">HH:MM (AM/PM)</td>
    </tr>
    <tr>
      <td >Description</td>
      <td ><input type="text" name="description" value="<%=description%>"></td>
    </tr>
    <tr>
      <td >Venue</td>
      <td ><label>
        <input type="text" name="venue" value="<%=venue%>">
      </label></td>
    </tr>
    <tr>
      <td >Eligibility Criteria </td>
      <td ><label>
        <input type="text" name="eligibility_criteria" value="<%=eligibility_criteria%>">
      </label></td>
    </tr>
    <tr>
      <td >Departments</td>
      <td ><label>
        <input name="departments" id="departments" value="<%=departments%>">
      </label></td>
    </tr>
  </table>
  .
  <table width="76" height="32" border="0" align="center">
    <tr>
      <td><input class="center" type="submit" value="Submit" name="submit2"  id="submit2" size="15" ></td>
      <td><input class="center" type="submit" value="Delete" name="delete2"  id="delete2" size="15" onClick="return get_sure();" ></td>
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
