<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
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

function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
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

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
  <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
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
      <a href="../instructions.jsp">Instructions</a>
      <a href="../agency_details/register.jsp">Job Application Form</a>
      <a href="../edit_details/edit.jsp">Edit Job Application Form</a>
      <a href="../vacancies/add_vacancy.jsp">Add More Vacancies</a>
      <a href="../change_final_date/change_date.jsp">Request For Change in Final Date </a>
      <a href="eligibility.jsp">Eligible Students</a>
      <a href="../student_details/student_details.jsp">Students Details Query</a>
      <a href="../cv_query/cv_query.jsp">CV Query</a>
      <a href="../calendar/view.jsp">Company Schedule</a>
      <a href="../date_notifications/date.jsp">Final Date</a>
      <a href="../uploads/upload.jsp">Upload Company Literature</a>
      <a href="../change_password/change_password.jsp">Change Password</a>
      <a href="../../logout.jsp">Logout</a>
      <img src="" alt="" width="179" height="455" />
    </div>
	</div> 
    <div id="content"> 
    <div class="feature">
<form name="form_query_placement" id="form_query_placement">
  <p>&nbsp;</p>
  <table align="center">
    <tr>
      <td > Company Name: </td>
      <td><%! String agency_list ;%>
        <% agency_list =get_unique_field("select agency_name from agency where username='"+username+"';",db) ; %>
        <input name="agency_name" id="agency_name" type="text" value="<%=agency_list%>"></td>
    </tr>
    <td><div name="agency_name_details" id="agency_name_details"></div></td></tr>
						
						
	</table>	
.
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input type="button" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>
<div name='div_get_placement_details' id='div_get_placement_details'></div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </div> 
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
