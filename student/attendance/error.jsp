<html>
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
	document.getElementById("infobar").innerHTML="<font class=\"infotitle\">Data Changed! <br><br> <a href=\"javascript:clearinfo()\">Hide</a>";
	document.getElementById("pagecell1").style.top='160';
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
// -->
</script>
</head>
<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">GCom: The IITG Community - Welcome  </h1>
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> 
 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
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
  <div id="breadCrumb"></div> 
  <div id="pageName"> 
    <h2>Welcome..</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div>
  <div id="pageNav">
    <div id="sectionLinks"> <a href="../../web/student/student_registration/student_registration.jsp" target="_blank">Register </a> <a href="placement_record/placement_record.jsp" target="_blank">Edit Registration Details</a> <a href="student_registration/student_registration.jsp" target="_blank">Upload CV</a> <a href="queries/student_eligibility/student_eligibility.jsp">Check Eligibility</a> <a href="agency_final_date/bulk_student_departure.jsp" target="_blank">Exam Schedule</a> <a href="drop_agency/placement_record.jsp" target="_blank">Organization's Registered </a> <a href="attendance/placement_record.jsp" target="_blank">Agency Exam appearance</a> <a href="temporary/placement_record.jsp" target="_blank">Download Organization Information</a> <a href="queries/placement_query3/vacancies.jsp" target="_blank">Vacancies</a> <a href="queries/temporary_query/placement_query.jsp" target="_blank">Organization's Registered Temporarily</a> <a href="read/index_single_upload.jsp" target="_blank">*********</a> <a href="download_student/download_student.jsp" target="_blank">*********</a> <a href="download_agency/download_agency.jsp" target="_blank">*********</a> <a href="department_modify/department_modify.jsp" target="_blank">*********</a> <a href="../../../logout.jsp">LOGOUT</a>
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
  <div id="content"> 
    <div class="feature">
      <p align="center"><strong>Error in Operation !!</strong></p>
      <p align="center"><strong>Could not add record in Attendance register!!</strong></p>
      <p align="center"><strong>Please fill all the fields correctly and kindly try again.</strong></p>    
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
