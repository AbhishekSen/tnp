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


</script>
</head>
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
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ page import="java.util.*" %>

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
	  <a href="../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
     
    </div>
  </div>
    <div id="content"> 
    <div class="feature">
  
<%
	db.fetchConfigDetails(); //newly added
	String display1="<div align='center' class='result'>" ;
	String display2="<br></div>" ;
	out.println(display1+"Details of the Company literature is as follows --"+display2);   
	out.println(display1+""+display2);   

       		out.println("<table border='0' align='center' cellpadding='5' cellspacing='5' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='sortable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
                        out.println("<th>Company Name</th>");
			out.println("<th>Profile Name</th>");
			out.println("<th>File Name</th>");
                        out.println("</tr>");
	 

         db.connect();
     
   ResultSet rs=db.execSQL("select cl.file_name,pd.package_name,a.agency_name from company_literature as cl,package_details as pd, agency as a where cl.agency_id=pd.agency_id and cl.agency_id=a.agency_id and cl.package_id=pd.package_id order by cl.agency_id;");
   int i=1;
   while(rs.next())
   {
      //int agency_id=rs.getInt(1);
      String filename=rs.getString(1);
      String profile_name=rs.getString(2);
      String agency_name=rs.getString(3);
      out.println("<tr><td>"+i+"</td><td>"+agency_name+"</td><td>"+profile_name+"</td><td><a href=\"process.jsp?filename="+filename+"\">Click to download </a></td></tr>");
      i++;
  }         
     rs.close();
     db.close();
  
     out.println("</table>");   
%>
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
