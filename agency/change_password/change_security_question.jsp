<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
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

	String submit=request.getParameter("submit");
	String security_question=request.getParameter("security_question");
	String answer=request.getParameter("answer");	
			//out.println(security_question);	
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
			
			
				if(!security_question.equals("0"))
				{
					 db.connect();				
					String question_id_query="select count(*) from agency_security_questions where agency_id = '"+agency_id+"';";
					rs = db.execSQL(question_id_query);
					rs.next();
					int count=rs.getInt(1);
					rs.close();
					System.out.println(security_question);					

					question_id_query="select question_id from security_questions where question = '"+security_question+"';";
					rs = db.execSQL(question_id_query);
					rs.next();
					String question_id=rs.getString(1);
					rs.close();
					if(count==0)
					{
						String update_security_question = "insert into agency_security_questions values('"+agency_id+"','"+question_id+"','"+answer+"');";
						int num_rows3 = db.updateSQL(update_security_question);

					
						db.close();         	
						if(num_rows3==1)
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
						String update_security_question = "update agency_security_questions set question_id='"+question_id+"', answer='"+answer+"' where agency_id='"+agency_id+"';";
						int num_rows3 = db.updateSQL(update_security_question);

					
						db.close();         	
						if(num_rows3==1)
						{
						
							response.sendRedirect("success.jsp");
						}
						else
						{
						response.sendRedirect("error.jsp");
						}
						
					}
				}
				else
				{
					response.sendRedirect("mismatch.jsp");
				}
			}


					   

%>


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

    <p align="center"><a href="change_security_question.jsp"><h4 align="center" style="color:#999"> Set your security question here</h4> </a>
</p>
<form method="post" name="update_security_question" id="update_security_question" onSubmit="" action="change_security_question.jsp" > 
 

  <table width="500" align="center">
	<p align="center"><strong>Select question and fill the corresponding answer.</strong></p>
	<tr>
	<td style="text-align: right"><span style = "color:red">*</span><strong>Select Security Question:</strong>
		</td><td style="text-align: center"><%! String security_question ;%>
		<% security_question =drop_down("select question from security_questions;",db) ; %>
		<select name="security_question" id="security_question" required="required">
		<option value="0">-----------------------------------------select-----------------------------------------</option>
		<%=security_question%>
		</select>	
	</td>
</tr>
	   <tr>
          <td style="text-align: right"><span style = "color:red">*</span><strong>Answer</strong></td>
          <td><label for="answer"></label>
            <input type="text" name="answer" id="answer" required="required"></td>
          </tr>

	</table>
 <tr>
     <td><p align="center"><input  type="submit" value="Set" name="submit"  id="submit" size="15" ></p><td>
    </tr>
<p>&nbsp; </p>
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









