<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../logout.jsp");
%>
<% db.fetchConfigDetails(); %>
<%
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
<%
    String student_roll_number=request.getParameter("student_roll_number");
    String submit=request.getParameter("submit");
    int student_id=0;
    int agency_id=0;
    int num=0;
    int status=0;
    if(submit!=null)
      {
          String sql_temp="select agency_id from agency where username='"+username+"';" ;
          db.connect();
          ResultSet rs5= db.execSQL(sql_temp);
          if(rs5.next()) 
		{
		  agency_id = rs5.getInt(1);
		} 
           rs5.close();
          String sql_stud="select student_id from student_record where student_roll_number='"+student_roll_number+"';" ;
          ResultSet rst= db.execSQL(sql_stud);
            if(rst.next()) 
		{
		  student_id = rst.getInt(1);
		} 
           rst.close();
          String sql_count="select count(*) from interested_students where student_id="+student_id+" and agency_id="+agency_id+";" ;
           rs5= db.execSQL(sql_count);
           if(rs5.next()) 
		{
		  num = rs5.getInt(1);
		} 
           rs5.close();
         db.close();
    
       if(num==0)
        {
             response.sendRedirect("error1.jsp");
        }
      else
        {
           String sql_status="select status from eligible_students where student_id="+student_id+" and agency_id="+agency_id+";" ;
            db.connect();
            ResultSet rsab= db.execSQL(sql_status);
           if(rsab.next()) 
		{
		  status = rsab.getInt(1);
		} 
           rsab.close();
         db.close();
         
          if(status==1)
           {
               response.sendRedirect("error2.jsp");
           } 
         else
          {
             response.sendRedirect("update.jsp?student_roll_number="+student_roll_number);
          }         

        }
      }

%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%> 



<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
	jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity:0.5 });
	});
	function showNewRecords()
		{
			$('#slideUp').show();
			$('#slideUp').slideUp("slow");			
		}
 </script>
 
 <script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script> 

</head>



<body onload = "showNewRecords();">
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Welcome  <%=username%></a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
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
      <li class="last-child"><a href="../../logout.jsp" title="Logout">Logout</a></li>
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
            <li><a href="../instructions.jsp">Instructions</a></li>
            <li align="center"> <span style="color:darkgrey; text-align:center;"> Add Job Profile</span>
              <ul>
                <li><a href="../edit_detailsedit.jsp">Edit Job Application Form</a></li>
                <li><a href="../vacancies/add_vacancy.jsp">Job Profile & Salary Details</a></li>
              </ul>
            </li>
            <li><span style="color:darkgrey; text-align:center;">Students Details</span>
            <ul>
                <li><a href="../cv_query/cv_query.jsp">Eligible Students</a></li>
                <li><a href="../student_details/student_details.jsp">Using Roll No.</a></li>
            </ul>
            </li><li><a href="../calendar/view.jsp">Update Organization Schedule</a>
            </li><li><a href="../uploads/upload.jsp">Upload Organization Literature</a>
            </li><li><a href="../change_password/change_password.jsp">Change Password</a>
            </li><li><a href="../../logout.jsp">Logout</a>
            </li>
            
           
          
          </ul>
        </nav>
        <!-- /nav --><!-- /section --><!-- /section -->
        <!-- ########################################################################################## -->
    </aside>
</div>
    <!-- ################################################################################################ -->
    <div id="portfolio"  class="three_quarter">
      <ul class="clear">


      
      <form method="post" name="form_agency_registration" id="form_agency_registration" onSubmit="return validate_empty(form_agency_registration)" action="student_details.jsp">
              <p style = "padding-left:40%; color:#333" ><strong>Enter Roll Number</strong></p>
              <table width="459" height="42" align="center">
                <tr>
                  <td width="200">Student roll number</td>
                  <td width="351"><input type="text" name="student_roll_number" id="student_roll_number"></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <table width="65" height="32" border="0" align="center">
                <tr>
                  <td><div align="center">
               <input  type="submit" value="Get Details" name="submit"  id="submit" style="color:#333">
              <colgroup>
                </colgroup>
            </div></td>
                </tr>
              </table>
              <p>&nbsp;  </p>
              <p>&nbsp;</p>
            </form>
      
      
</ul></div></div>
<div class="clear"><!-- Footer -->
</div>
<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%; background:#000">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Team, IIT Guwahati
    </center></p>
    
  </div>
</div>
<!-- Scripts -->
<script src="../../js/jquery-latest.min.js"></script>
<script src="../../js/jquery-ui.min.js"></script>
<script>window.jQuery || document.write('<script src="../layout/scripts/jquery-latest.min.js"><\/script>\
<script src="../layout/scripts/jquery-ui.min.js"><\/script>')</script>
<script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
<script src="../../layout/scripts/jquery-mobilemenu.min.js"></script>
<script src="../../layout/scripts/custom.js"></script>
</body>
</html>
