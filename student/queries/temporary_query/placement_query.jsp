<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
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


 

function get_data()
{//alert("hi"+validate_empty("form_query_placement"));
	if(validate_empty("form_query_placement"))
	{alert("rohan1");
	}
		call_xml_http_request1('data','get_placement_details.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);
 
     //alert(ptr.student_roll_number.value.length);
	   if (ptr.agency_name.value.length == 0 )
   		{
  			 message+="Please select the agency.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.agency_name.select();
			 }
		}
    
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return true ;
	 } 
	 else
	 {
		return false;
	 }

}





</script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>





</head>
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>

<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
  <img alt="small logo" src="../../images/logo-top.gif" height="63" width="86"/></div>
  <div id="pageNav">
    <div id="sectionLinks"> <a href="../../web/student/student_registration/student_registration.jsp" target="_blank">Register </a> <a href="placement_record/placement_record.jsp" target="_blank">Edit Registration Details</a> <a href="student_registration/student_registration.jsp" target="_blank">Upload CV</a> <a href="queries/student_eligibility/student_eligibility.jsp">Check Eligibility</a> <a href="agency_final_date/bulk_student_departure.jsp" target="_blank">Exam Schedule</a> <a href="drop_agency/placement_record.jsp" target="_blank">Organization's Registered </a> <a href="attendance/placement_record.jsp" target="_blank">Organization Exam appearance</a> <a href="temporary/placement_record.jsp" target="_blank">Download Organization Information</a> <a href="queries/placement_query3/vacancies.jsp" target="_blank">Vacancies</a> <a href="queries/temporary_query/placement_query.jsp" target="_blank">Organization's Registered Temporarily</a> <a href="read/index_single_upload.jsp" target="_blank">*********</a> <a href="download_student/download_student.jsp" target="_blank">*********</a> <a href="download_agency/download_agency.jsp" target="_blank">*********</a> <a href="department_modify/department_modify.jsp" target="_blank">*********</a> <a href="../../../logout.jsp">LOGOUT</a>
      <!--     <a href="course_deletion/course_deletion.jsp" target="new">Course Deletion</a>
      <a href="sanctioned_strength/sanctioned_strength.jsp" target="new">sanctioned strength </a>
	   <a href="department_offering_programme/department_offering_programme.jsp" target="new">Department Offering Programme</a>
	    <a href="course_offerings_per_sem/course_offerings.jsp" target="new">Course offerings per Semester</a>
	   <a href="student_admission/student_admission.jsp" target="new">Student Admission(Single)</a>
	    <a href="student_departure/student_departure.jsp" target="new">Student Departure(Single)</a>
		 <a href="bulk_student_departure/bulk_student_departure.jsp" target="new">Student Departure(Multiple)</a> 
		 <a href="modify_student_details/modify_student_details.jsp" target="new">Modify Student Details</a> 
		 <a href="add_department/add_department.jsp" target="new">Add Department</a> 
		 <a href="add_programme/add_programme.jsp" target="new">Add Programme</a> 
		 <a href="course_curriculum_add/course_curriculum_add.jsp" target="new">Add Curriculum  &nbsp;&nbsp;&nbsp;
		 	(core courses)</a> 
		 <a href="course_curriculum_delete/course_curriculum_delete.jsp" target="new">Delete Curriculum (core courses) </a> 
		 <a href="elective_course_curriculum_add/elective_course_curriculum_add.jsp" target="_blank">Add Curriculum  &nbsp;&nbsp;&nbsp;
		 	(elective courses)</a>
		 <a href="elective_course_curriculum_delete/elective_course_curriculum_delete.jsp" target="_blank">Delete Curriculum (elective courses) </a> 
		 <a href="student_grades_entry/student_grades_entry.jsp" target="_blank">Grades Entry</a> 
		 <a href="student_grades_change/input_student_grades_change.jsp" target="_blank">Change Grades</a> 
		 <a href="student_course_registration/student_course_registration.jsp" target="_blank">Course Registration</a> 
		 <a href="faculty_advisor_student_registration/faculty_advisor_student_registration.jsp" target="_blank"> Course Registration (Faculty Advisor)</a> 
		<a href="student_course_drop/student_course_drop.jsp" target="_blank">Course Drop</a> 
		<a href="spi_cpi_calculation/spi_cpi_calculation.jsp" target="_blank">Spi Cpi Calculation</a> -->
    </div>
    <div class="relatedLinks">
      <h1>
        <!--   <a href="queries/student_course_registration/registration_query.jsp" target="_blank">Course Registration</a> 
	   <a href="queries/student_strength_query/student_strength_query.jsp" target="_blank">Student Strength</a> 
	   <a href="queries/spi_cpi_query/spi_cpi_query.jsp" target="_blank">SPI CPI Query</a> 
	   <a href="queries/student_grades/grades_query.jsp" target="_blank">Grades/Course Regist.</a> 
	   <a href="queries/curriculum_query/curriculum_query.jsp" target="_blank">Curriculum Query</a>  -->
      </h1>
    </div>
  </div>
  </td>
<form name="form_query_placement" id="form_query_placement">
  <p><strong>Select Appropriate Fields
  </strong></p>
  <table align="center">
    <tr>
      <td > Choose Organization: </td>
      <td><%! String agency_list ;%>
        <% agency_list =drop_down("select agency_name from temporary_agency  ;",db) ; %>
        <select name="agency_name" id="agency_name">
          <option value="0">------------------select----------------</option>
          <%=agency_list%>
        </select></td>
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
