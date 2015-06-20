<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
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
	var arr = new Array(4);
  
    arr[0] = 1; 

	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("department_name").value;
	
	arr[2]=document.getElementById("program_name").value;
	
	
	
	arr[3]=document.getElementById("year").value;
	
	


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'4',url ,div_tag_name );
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
	 
		call_xml_http_request1('data','get_placement_details1.jsp','div_get_placement_details1');
		sortables_init();
		//alert("rohan");
	//}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please enter the department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.department_name.select();
			 }
		}
    if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please enter the program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return true ;
	 } 
	 else
	 { alert(message);
		return false;
	 }

}





</script>
<script src="../../js/datetimepicker.js"></script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

</head>
<body onLoad="document.form_query_placement.department_id.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<%@page language="java" import="java.sql.*"%>





<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
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

<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>

<script src="../../js/xmlhttprequest.js"></script>

<% db.fetchConfigDetails(); %>

<%

	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR); 

        
	String department_name=request.getParameter("department_name");
     
	
	String program_name=request.getParameter("program_name");
	  
	
   %>


<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink"></div> 
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
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div>
  <div id="pageNav">
    <div id="sectionLinks"> 
    <a href="../../web/student/student_registration/student_registration.jsp" target="_blank">Register</a>
    <a href="placement_record/placement_record.jsp" target="_blank">Edit Registration Details</a>
    <a href="student_registration/student_registration.jsp" target="_blank">Upload CV</a> 
    <a href="agency/temporary/register.jsp" target="_blank">Check Eligibility</a> 
    <a href="agency_final_date/bulk_student_departure.jsp" target="_blank">Exam Schedule</a> 
    <a href="drop_agency/placement_record.jsp" target="_blank">Organization's Registered </a> 
    <a href="attendance/placement_record.jsp" target="_blank">Agency Exam appearance</a> 
    <a href="temporary/placement_record.jsp" target="_blank">Download Organization Information</a> 
    <a href="temporary_drop_agency/placement_record.jsp" target="_blank">Vacancies</a> 
    <a href="write/index_single_upload.jsp" target="_blank">*********</a> 
    <a href="read/index_single_upload.jsp" target="_blank">*********</a> 
    <a href="download_student/download_student.jsp" target="_blank">*********</a> 
    <a href="download_agency/download_agency.jsp" target="_blank">*********</a> 
    <a href="department_modify/department_modify.jsp" target="_blank">*********</a> 
    <a href="../logout.jsp">LOGOUT</a>
     
    </div>
    <div class="relatedLinks">
      
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
      <form method="post" name="form_query_placement" id="form_query_placement" onSubmit="return true">
        <p><strong>Select Appropriate Fields</strong></p>
        <table align="center">
          <tr>
            <td> Select department</td>
            <td><p>
              <select name="department_name" id="department_name">
                <%!String department_list;%>
                <% db.connect();
                    department_list=drop_down("select department_name from department_record;",db);
                   db.close(); %>
                <option value="0">-----------------------select----------------------</option>
                <%=department_list%>
              </select>
            </p></td>
          <tr>
            <td height="33"><p>Select Program</p></td>
            <td><select name="program_name" id="program_name" >
              <%!String program_list;%>
              <% db.connect();
               String program_list=drop_down("select programme_name from programme_record;",db);
               db.close(); %>
              <option value="0">-----------------------------------------------select-----------------------------------------------------</option>
              <%=program_list%>
            </select></td>
          </tr>
          <input type="hidden" name="year" id="year" value="<%=year%>">
        </table>
        <table width="65" height="32" border="0" align="center">
          <tr>
            <td><input type="button" class="center" name="button" id="button" onClick="get_data()" value="Get Data"></td>
          </tr>
        </table>
        <p>&nbsp;  </p>
        <p>&nbsp;</p>
      </form>
<div name='div_get_placement_details1' id='div_get_placement_details1'></div>
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
