<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<%@page language="java" import="pack.DbBean"%> 

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>


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
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>




<%!

String agency_name=null;
%>
<%
 
	int agency_id=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String agency_name=request.getParameter("agency_name");
	String submit=request.getParameter("submit");
	String  new_password=request.getParameter("new_password");
	String  password=request.getParameter("password");
	String conf_password=request.getParameter("conf_password");
		
			String sql_get_data="select agency_id ,agency_name  from agency where username='"+username+"' ;" ;
		
			db.connect(); 
			ResultSet rus= db.execSQL(sql_get_data);
			if(rus.next()) 
			{
				agency_id=rus.getInt(1);
				agency_name=rus.getString(2);
			}
			rus.close();
			 
			db.close();
	
			if(submit!=null && agency_id!=0)
			{	
			
				sql_get_data="select password from login where username='"+username+"';" ;
				String old_password="";
				db.connect(); 
				ResultSet re= db.execSQL(sql_get_data);
				if(re.next()) 
				{
					old_password=re.getString(1);
				}
			
				re.close();  
				db.close();
				
				if(old_password.equals(password) && new_password.equals(conf_password))
				{
				
					
					String main_record1=" update login set password='"+new_password+"' where username='"+username+"';";
					String main_record2=" update agency set password='"+new_password+"',is_first=1 where username='"+username+"';";
			
					db.connect();
					int num_rows1=db.updateSQL(main_record1);
					int num_rows2=db.updateSQL(main_record2);
					db.close();         	
					if(num_rows1==1 && num_rows2==1)
					{
						
						response.sendRedirect("success.jsp");
					}
					else
					{
					response.sendRedirect("error.jsp");
					}
				}
				else
				{
					response.sendRedirect("mismatch.jsp");
				}
			}


					   

%>

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
                <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
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

    <p align="center"><a href="change_security_question.jsp"><h4 align="center" style="color:#999"><u> Set your security question here</u></h4> </a>
</p>
    <form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validatePwd();" action="change_password.jsp" > 
  <p align="center"><strong>Please fill all the fields correctly</strong></p>
  <p>&nbsp; </p>
  <table width="456" align="center" border="0">
    <tr>
      <td>Organization Name</td>
      <td><%=agency_name%></td>
    </tr>
    <tr>
      <td>Username</td>
      <td><%=username%></td>
    </tr>
    <tr>
      <td>Old Password</td>
      <td><input type="password" name="password" id="password" required="required"></td>
    </tr>
    <tr>
      <td>New Password</td>
      <td><input type="password" name="new_password" id="new_password" required="required"></td>
    </tr>
    <tr>
      <td>Confirm New Password</td>
      <td><input type="password" name="conf_password" id="conf_password" required="required"></td>
    </tr>
  </table>
  <p>. </p>
  <table width="76" height="32" border="0" align="center">
    <tr>
      <td><input  type="submit" value="Change Password" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
  
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
