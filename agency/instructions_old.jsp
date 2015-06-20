<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
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

<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel='stylesheet' href='../stylesheet/style.css'>
<link rel="stylesheet" href="../stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
		jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity: 0.5 });
		  
		});
		function showNewRecords()
		{
			$('#slideUp').show();
			$('#slideUp').slideUp("slow");			
		}
	</script>
</head>

<body onload = "showNewRecords();">
<div id = "container">
            <div id = "header">
              <div>
              <div id="globalLink" style = "float:left;width:40%;"> 
                   <br/> <span id="spancompany"><u>Welcome <%=username%></u></span>
                </div>
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                      <ul class="SlidingMenu Horizontal">
                        <li><a href="instructions.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></li>
                      </ul>
                      <div class="ClearFix"></div>
                    </div>
                </div>
              </div>
              <div  id = "headerTop">
                <div id ="title">
                  <span id = "spanTitleFirst">
                    Training & Placement Cell - 
                  </span>
                  <span id = "spanTitleSecond">
                    IIT Guwahati
                  </span>
                </div>
                 <%-- <div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                <div id = "divMain">
                 <div class = "mainMenu">
					<div id="VerticalSlidingMenu">
						<ul class="SlidingMenu">
						  <li><a href='instructions.jsp'>Instructions</a></li>
						  <li><a href="edit_details/edit.jsp">Edit Job Application Form</a></li>
						 <li><a href="vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						<!-- <li><a href="vacancies/jobProfile.jsp">Job Profile &amp; Salary Details</a></li> -->
						  <li><a href="student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="student_details/student_details.jsp">Students Details Query</a></li>
						  <li><a href="cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="uploads/upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="change_password/change_password.jsp">Change Password</a></li>
						  <li><a href="../logout.jsp">Logout</a></li>
						</ul>
					  </div>
                 </div>
                 <div class = "mainContainer" id="mainContainer">
          					<div id = "slideUp" style = "display:none;color:white;">
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          					</div> 
					 <div id = "center" class = "center">
					   <div class="feature" style = "padding:2%;text-align:justified;">
                            <p align="center"><strong><h1 style = "color:#25BCF2"><u>Instructions</u></h1></strong></p>
	<center><b><u>Mandatory Steps to start with:</u></b></center>
                             <ul class="instructions_ul">
         <li>Organizations/Companies are first requested to fill in all the details under the <B>Edit Job Application Form.</B></li>
         <li>Thereafter, under <B>Job Profile and Salary Details</B> tab, companies can add job profiles as per their requirements. There can be multiple job profiles offered. e.g- different work area, ctc etc.</li>
         <li>This information once filled will be first verified and then approved by the placement cell. Organizations are adviced to check <B>Job Profile and Salary Details</B> Tab to know current status of their profiles.[Approved or Temporary(Applied but not approved)] </li>
                 <li>Organizations may choose to upload any literature about themselves they would like the students to read, so that students may do so at the time of applying to the organization.</li>
                 <br>
	  <p><b>Note on filling up minor courses criteria:</b>There is a table to enter the eligible minor courses at the bottom of Job Profiles and salary details form.
		Left checkboxes indicate students' major departments, right check boxes indicate students' minor departments.
		e.g if students of Mechanical Dept who take CSE minor are eligible, then click left check box corresponsing to Mechanical Engg, and to the right of it click CSE checkbox.
		Likewise you can specify allowed minor courses for all major departments.</p>

	  <p><b>Note on updating profiles:</b>You will be able to add new profiles by clicking (Add new profile) link in Job profile and salary details page.
	  After adding a profile, you will see its link in the Temporary/Unpproved profiles sections in your Job profile page. After Admin approves your profile, it will be removed from there 
	  and displayed in permanent profiles section.</p>
	  <p>If you want to update an approved profile, click on its link, the form will open, make necessary changes and submit. Then you will see a link in the Approved and the Temporary sections for that profile
	  with suggested changes in the temporary one. If you want to make furthur changes to that same profile, <b>Please use temporay link to update, and not the approved one.</b>
	  Approved link should only be used to update a profile, if there is no existing temporary/unapproved version of it, which can easily be seen from temporary profile section in
	  Job Profile and Salary Details page</p>

        	<center><b><u>Subsequent Steps(Make sure you complete all mandatory steps before moving forward):</u></b></center>
        	<br>
         <li>The organization may choose to visit the campus for a Pre-Placement Talk (PPT) before the placement session begins in the first week of December, the dates for which could be mutually decided. PPTs are held on weekdays, after class hours (i.e. after 5 PM). </li>
         <li>The recruitment session would begin on the 1st of December 2012 and would continue till May 2013. Dates for visiting the campus for recruitment are allotted to the organizations based on several parameters but this is mostly dependent on the interest shown by both the companies and the candidates and other factors which include the CTC being offered.
The date thus decided will appear in the <B>Organization Schedule</B> Tab.
</li>
         <li>On a date decided by the Placement Cell (which would be before the organization visits the campus for placements), students will be informed about the organization's job profiles, salary structure, eligibility criteria etc. and shall be asked to apply to the organization and submit their CVs.</li>
     
         <li>Organizations will then get to view the list of students who have applied under the <B>Eligible Students Tab</B>.<bR/>
<B>Note:</B> Students who have already been placed will have the words <B>Already Placed</B> written against their names and are as per the placement cell's policies ineligible to sit for the selection process of the organization. 
</li>
         <li>The selection process would be conducted during the placement session on the date allotted to the organization.</li>

         <li>Organizations have to furnish the list of selected candidates as soon as possible after the completion of the selection procedure. As per the placement policies of the institute as soon as a student has been offered a job, he or she is ineligible to continue in the selection processes of other organizations or apply to other organizations.</li>
         <li>Before declaring their final list of results, organizations are advised to check if a student has already been placed through the <B>Eligible Students</B> tab as if this is the case, then the student is ineligible to receive another job offer. </li>

     </ul>
                            </p>
                            <p align="center">&nbsp;</p></div>
                    </div>
                </div>
              </div>
              <div id = "footer">
              <span>&#169; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
