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
function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(2);
  
    arr[0] = 1;



	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("agency_name").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'2',url ,div_tag_name );
	//alert("hurray");
}


function activate(check_box,activate_tag)
{
	if(check_box.checked==1)
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
		document.getElementById(activate_tag).disabled=true;
}


function get_data()
{//alert("hi"+validate_empty("form_query_placement"));
	if(validate_empty("form_query_placement"))
	{//alert("rohan1");
		call_xml_http_request1('data','get_details.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

   //alert(ptr.student_roll_number.value.length);
	   if (ptr.agency_name.value== null)
   		{
  			 message+="Please select the Agency name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.agency_name.select();
			 }
		}
   

 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 {//alert("hi");
		return true;
	 }

}





</script>
<script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script>





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
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp">Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp">Check Eligibility</a><a href="../agency_query/placement_query.jsp" >Organization Information</a>
      <a href="../vacancies/vacancies.jsp">Vacancies</a>
     <%-- <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../logout.jsp">LOGOUT</a>
      <img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" />
      </h1>
    </div>
  </div>
  </td>
  
  <p align="center"><strong>Following Organization's Have Registered So Far and their tentative dates are as follows</strong>  </p>
  <p>
    <%  
  String display1="<div align='center' class='result'>" ;
	   String display2="<br></div>" ;
	   
       out.println("<table align='center' cellpadding='5' cellspacing='5' border='0' name='table_query_placement_details'"+"id='table_query_placement_details' class='sortable' >");
       out.println("<tr>");
   	   out.println("<th>Sl.No.</th>");
       out.println("<th>Company Name</th>");
	   out.println("<th>Company Profile</th>");
	   out.println("<th>Final Date</th>");
	   out.println("</tr>");	
	   
	    db.fetchConfigDetails(); //newly added 
	    String sql_get_data="select agency_name , agency_profile , final_agency_date from agency order by agency_id;" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		int i=0;
		String agency_name="";
		String agency_profile="";
		String final_agency_date="";
		while(rs.next()) 
		{
				agency_name=rs.getString(1);
				agency_profile=rs.getString(2);
				final_agency_date=rs.getString(3);
				i++;
             	out.println("<tr><td>"+i+"</td><td>"+agency_name+"</td><td>"+agency_profile+"</td><td>"+final_agency_date+"</td></tr>");
				
		}
		rs.close();
		db.close();
		out.println("</table>");
		
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
