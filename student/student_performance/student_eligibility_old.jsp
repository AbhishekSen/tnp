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

function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(2);
  
    arr[0] = 1;
	 


	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("student_roll_number").value;


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
	// alert("rohan1");
		call_xml_http_request1('data','get_details.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	 
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

   if (ptr.check_student_roll_number.checked == 1 )
  {
     //alert(ptr.student_roll_number.value.length);
	   if (ptr.student_roll_number.value.length == 0 )
   		{
  			 message+="Please select the Student roll number.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.student_roll_number.select();
			 }
		}
   }

 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 {
		return true;
	 }

}





</script>
<script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script>




</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
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
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../instructions/info.jsp">Instructions</a>
      <a href="../student_registration/student_registration.jsp">Register </a>
      <a href="../student_registration/edit.jsp" >Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="student_eligibility.jsp" >Check Eligibility</a>
      <a href="../schedule/agency_date.jsp" >Company Dates</a>
      <a href="../companies_visiting/list.jsp">Companies Visiting</a>
      <a href="../agency_query/placement_query.jsp" >Company Details</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
      <a href="../placement_status/status.jsp">Placement Status</a>
      <a href="../average_package/average_package.jsp">Average Package</a>
      <a href="../ppts/get_pdf.jsp">Company PPT's</a>
      <a href="../browse.jsp">Download Company Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a> 
	  <img name="bot" src="images/bot.gif" width="181" height="243" border="0" id="bot" alt="" /></div>
  </div>
  <div id="content"> 
    <div class="feature">
      <form name="form_query_placement" id="form_query_placement">
        <br>
        <b><u>Search appropriate fields:</u></b><br>
        <br>
        <table align="center">
          <tr>
            <td>Student roll number:</td>
            <td><input type="text" name="student_roll_number" id="student_roll_number"></td>
          </tr>
          <td><div name="agency_name_details" id="agency_name_details"></div></td>
          </tr>
        </table>
        <table width="74" border="0" align="center">
          <tr>
            <td width="64"><input type="button" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data"></td>
          </tr>
        </table>
        <p><br>

          <br>
          <br>
              
          .<br>
          <br>
        </p>
      </form>
      <div name='div_get_placement_details' id='div_get_placement_details'></div>



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
