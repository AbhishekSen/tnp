<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(3);
  
    arr[0] = 1;
	arr[1]=document.getElementById("package_name").value;


	//1 to 2 the parameters for the query.

	arr[2]=document.getElementById("student_roll_number").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'3',url ,div_tag_name );
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
{//alert("hi");
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


	   if (ptr.student_roll_number.value.length == 0 )
   		{
  			 message+="Please select  Student roll number.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.student_roll_number.select();
			 }
		}
 
            if (ptr.package_name.value=="0" )
   		{
  			 message+="Please select Agency name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			
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
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../../utils/session_validator.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>

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
    <img alt="small logo" src="../images/logo-top.gif" height="116" width="115"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organizations</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organizations</a>
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
<form name="form_query_placement" id="form_query_placement">
  <p><strong>Select Appropriate Fields
  </strong></p>
  <table align="center">
    <tr>
      <td>Student roll number:</td>
      <td><input type="text" name="student_roll_number" id="student_roll_number"
							 ></td>
    </tr>
    <tr>
      <td> Choose Organization: </td>
      <td><%! String agency_list ;%>
        <% agency_list =drop_down("select package_name from package_details;",db) ; %>
        <select name="package_name" id="package_name">
          <option value="0">------------------select----------------</option>
          <%=agency_list%>
        </select></td>
    </tr>
  </table>
.
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input type="button" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<div name='div_get_placement_details' id='div_get_placement_details'></div>



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
