<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
<title>Training &amp; Placement Cell</title>
<meta charset="iso-8859-1">

<link rel="shortcut icon" href="../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css" />
<!--[if lt IE 9]>
<link href="../layout/styles/ie/ie8.css" rel="stylesheet" type="text/css" media="all">
<script src="../layout/scripts/ie/css3-mediaqueries.min.js"></script>
<script src="../layout/scripts/ie/html5shiv.min.js"></script>
<![endif]-->
<style type="text/css">
.wrapper.row3 #container #portfolio {
	text-align: justify;
}
</style>
</head>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="utils/session_validator.jsp"%>
<%@ include file="utils/get_unique_field.jsp"%>
<%@ include file="utils/encode_sql.jsp"%>
<%@ include file="utils/table.jsp"%>
<%@ include file="utils/drop_down.jsp"%>
<%@ include file="utils/drop_down2.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../logout.jsp");
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
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Welcome  <%=username%></a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/"><img src="../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>


<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li><a href="http://iitg.ernet.in" target="_blank" title="IIT Guwahati">IIT Guwahati Home</a>
       
      </li>
      <li><a href="http://iitg.ernet.in/placement" target="_blank" title="Training & Placement Cell">T&P Cell</a>
        
      </li>
     
      <li><a href="http://www.iitg.ernet.in/acad/courses_syllabee.php"  target="_blank" title="Courses Offered">Courses Offered & Syllabi</a></li>
      <li class="last-child"><a href="../logout.jsp" title="Logout">Logout</a></li>
    </ul>
  </nav>
</div>
<!-- content -->
<div class="wrapper row3" style="width:100%;">

<!-- ################################################################################################ -->
<div id="container">
  <div id="sidebar_1" class="sidebar one_quarter first" style="background:#DFDFDF;color:#000">
  <aside>
        <!-- ########################################################################################## -->
        <h2 align="center">Recruiter</h2>
        <nav>
          <ul>
            <li><a href="#">Instructions</a></li>
            <li align="center"> <span style="color:darkgrey; text-align:center;"> Add Job Profile</span>
              <ul>
                <li><a href="edit_details/edit.jsp">Edit Job Application Form</a></li>
                <li><a href="vacancies/add_vacancy.jsp">Job Profile & Salary Details</a></li>
              </ul>
            </li>
            <li><span style="color:darkgrey; text-align:center;">Students Details</span>
            <ul>
                <li><a href="cv_query/cv_query.jsp">Eligible Students</a></li>
                <li><a href="student_details/student_details.jsp">Using Roll No.</a></li>
            </ul>
            </li><li><a href="calendar/view.jsp">Update Organization Schedule</a>
            </li><li><a href="uploads/upload.jsp">Upload Organization Literature</a>
            </li><li><a href="change_password/change_password.jsp">Change Password</a>
            </li><li><a href="../logout.jsp">Logout</a>
            </li>
            
           
          
          </ul>
        </nav>
        <!-- /nav --><!-- /section --><!-- /section -->
        <!-- ########################################################################################## -->
    </aside>
</div>

  <!-- ################################################################################################ -->
    <div id="portfolio"  class="three_quarter" >
      <ul class="clear">

                
      
      <div id = "center" class = "center">
					   <div class="feature" style = "text-align:justified; color: #000; font-size: 20px;">
                         <strong><h1 style = "color:#333; text-align: center; font-style:normal;"><u>Instructions</u></h1></strong>
	<center>
	  <p><b><u>Mandatory Steps to start with:</u></b></p>
	</center>
                             <ul class="instructions_ul">
         <li>Organizations/Companies are first requested to fill in all the details under the <span class="aa"><B style="color:#F00">Edit Job Application Form</B></span><B>.</B></li>
         <li>Thereafter, under <B style="color:#F00">Job Profile and Salary Details</B> tab, companies can add job profiles as per their requirements. There can be multiple job profiles offered. e.g- different work area, ctc etc.</li>
         <li>This information once filled will be first verified and then approved by the placement cell.<a><img src="../images/img1.jpg" width="193" height="57" align="right" style="width='150px'; height='75';"/></a>Organizations are adviced tocheck <B style="color:#F00">Job Profile and Salary Details</B> Tab to know current status of their profiles.[Approved or Temporary(Applied but not approved)]</li>
                 <li>Organizations may choose to upload any literature about themselves they would like the students to read, so that students may do soatthe time of applying to the organization.</li>
                 <p><b  style="color:#F00">Note on filling up minor courses criteria:</b>There is a table to enter the eligible minor courses at the bottom of Job Profiles and salary details form.
                   Left checkboxes indicate students' major departments, right check boxes indicate students' minor departments.
                   e.g if students of Mechanical Dept who take CSE minor are eligible, then click left check box corresponsing to Mechanical Engg, and to the right of it click CSE checkbox.
                   Likewise you can specify allowed minor courses for all major departments.</p>

	  <p><b style="color:#F00">Note on updating profiles:</b>You will be able to add new profiles by clicking (Add new profile) link in Job profile and salary details page.
	  After adding a profile, you will see its link in the Temporary/Unpproved profiles sections in your Job profile page. After Admin approves your profile, it will be removed from there 
	  and displayed in permanent profiles section.</p>
	  <p>If you want to update an approved profile, click on its link, the form will open, make necessary changes and submit. Then you will see a link in the Approved and the Temporary sections for that profile
	  with suggested changes in the temporary one. If you want to make furthur changes to that same profile, <b style="color:#F00">Please use temporay link to update, and not the approved one.</b>
	  Approved link should only be used to update a profile, if there is no existing temporary/unapproved version of it, which can easily be seen from temporary profile section in
	  Job Profile and Salary Details page</p>

        	<center><b><u>Subsequent Steps(Make sure you complete all mandatory steps before moving forward):</u></b></center>
        	<br>
         <li>The organization may choose to visit the campus for a Pre-Placement Talk (PPT) before the placement session begins in the first week of December, the dates for which could be mutually decided. PPTs are held on weekdays, after class hours (i.e. after 5 PM). </li>
         <li>The recruitment session would begin on the 1st of December 2014 and would continue till May 2015. Dates for visiting the campus for recruitment are allotted to the organizations based on several parameters but this is mostly dependent on the interest shown by both the companies and the candidates and other factors which include the CTC being offered.
The date thus decided will appear in the <B style="color:#F00">Organization Schedule</B> Tab.
</li>
         <li>On a date decided by the Placement Cell (which would be before the organization visits the campus for placements), students will be informed about the organization's job profiles, salary structure, eligibility criteria etc. and shall be asked to apply to the organization and submit their CVs.</li>
     
         <li>Organizations will then get to view the list of students who have applied under the <B style="color:#F00">Eligible Students Tab</B>.<bR/>
<B>Note:</B> Students who have already been placed will have the words <B style="color:#F00">Already Placed</B> written against their names and are as per the placement cell's policies ineligible to sit for the selection process of the organization. 
</li>
         <li>The selection process would be conducted during the placement session on the date allotted to the organization.
          
         </li>

         <li>Organizations have to furnish the list of selected candidates as soon as possible after the completion of the selection procedure. As per the placement policies of the institute as soon as a student has been offered a job, he or she is ineligible to continue in the selection processes of other organizations or apply to other organizations.</li>
         <li>Before declaring their final list of results, organizations are advised to check if a student has already been placed through the <B style="color:#F00">Eligible Students</B> tab as if this is the case, then the student is ineligible to receive another job offer. </li>

     </ul>
                          
      </div>
        </div>
  <%@include file="footer.jsp" %>
      <!-- Scripts -->
      <script src="../js/jquery-latest.min.js"></script>
      <script src="../js/jquery-ui.min.js"></script>
      <script>window.jQuery || document.write('<script src="../layout/scripts/jquery-latest.min.js"><\/script>\
<script src="../layout/scripts/jquery-ui.min.js"><\/script>')</script>
      <script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
      <script src="../layout/scripts/jquery-mobilemenu.min.js"></script>
      <script src="../layout/scripts/custom.js"></script>
      </ul>
    </div>
</div>
</div></body>
</html>
