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
		response.sendRedirect("../../logout.jsp");		
%>
<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet res= db.execSQL(sql_username);
		if(res.next()) 
		{
		username = res.getString(1);
		}
		
		res.close();
		db.close();
	
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	String student_roll_number=request.getParameter("student_roll_number");
        
	int student_id=0;
	int department_id=0;
	int programme_id=0;
	int program_id=0;

%>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String roll_no="";
		
        String name=request.getParameter("student_name");
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex"); 
        String category=request.getParameter("category");
        String dept_name=request.getParameter("department_name");
        String prog_name=request.getParameter("program_name");
        String jee_rank=request.getParameter("rank");
        String hostel=request.getParameter("hostel");
        String room_no=request.getParameter("room");
		String email1=request.getParameter("email1");
        String email2=request.getParameter("email2");
        String mobile1=request.getParameter("mobile1");
        String mobile2=request.getParameter("mobile2");
        String address=request.getParameter("address");
        String pin=request.getParameter("pin");
        String telephone=request.getParameter("telephone");
        String x_board=request.getParameter("x_board");
        String x_medium=request.getParameter("x_medium");
        String x_class=request.getParameter("x_class");
        String x_marks=request.getParameter("x_marks");
        String x_year=request.getParameter("x_year");
        String xii_board=request.getParameter("xii_board");
        String xii_medium=request.getParameter("xii_medium");
        String xii_class=request.getParameter("xii_class");
        String xii_marks=request.getParameter("xii_marks");
        String xii_year=request.getParameter("xii_year");
        String gap=request.getParameter("gap");
        String gap_reason=request.getParameter("reason");
        String cpi=request.getParameter("cpi");
        String backlog=request.getParameter("backlog");
        String sem1=request.getParameter("sem1");
        String sem2=request.getParameter("sem2");
        String sem3=request.getParameter("sem3");
        String sem4=request.getParameter("sem4");
        String sem5=request.getParameter("sem5");
        String sem6=request.getParameter("sem6");
        String sem7=request.getParameter("sem7");
        String core=request.getParameter("core");
        String govt=request.getParameter("govt");
        String IT=request.getParameter("IT");
        String management=request.getParameter("management");
        String dream_company=request.getParameter("dream_company"); 
	
			
%> <%	
	
		String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		
		if(rs.next()) 
		{
			roll_no=""+rs.getInt(2);
			name=rs.getString(3);
			dob=rs.getString(4);
			sex=rs.getString(5);
			category=rs.getString(6);
			department_id=rs.getInt(7);
			programme_id=rs.getInt(8);
			jee_rank=rs.getString(9);
        	hostel=rs.getString(10);
       		room_no=rs.getString(11);
			email1=rs.getString(12);
            email2=rs.getString(13);
        	mobile1=rs.getString(14);
       		mobile2=rs.getString(15);
       		address=rs.getString(16);
       		pin=rs.getString(17);
      		telephone=rs.getString(18);
        	x_board=rs.getString(19);
       		x_medium=rs.getString(20);
          	x_marks=rs.getString(21);
       		x_year=rs.getString(22);
        	xii_board=rs.getString(23);
        	xii_medium=rs.getString(24);
        	xii_marks=rs.getString(25);
        	xii_year=rs.getString(26);
        	gap=rs.getString(27);
		gap_reason=rs.getString(28);
		if(programme_id==1 || programme_id==2) // for betch/bdes
        	   cpi=rs.getString(29);
                else if(programme_id==3 || programme_id==4 || programme_id==5 || programme_id==6) // for Mtech/mdes/ma/msc
                   cpi=rs.getString(44);
                else
                   cpi="N/A"; 
	//	cpi=rs.getString(29);
        	backlog=rs.getString(30);
        	sem1=rs.getString(31);
        	sem2=rs.getString(32);
        	sem3=rs.getString(33);
        	sem4=rs.getString(34);
        	sem5=rs.getString(35);
        	sem6=rs.getString(36);
        	sem7=rs.getString(37);
        	core=rs.getString(38);
        	govt=rs.getString(39);
			IT=rs.getString(40);
        	management=rs.getString(41);
			dream_company=rs.getString(42);
		program_id=rs.getInt(45);
			
		}
		rs.close();
		
		db.close();
		if(!roll_no.equals(student_roll_number)){response.sendRedirect("error.jsp");}
	

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<style type="text/css">
.aa {
	color: #333;
}
.aa {
	color: #333;
}
</style>

<title>Training &amp; Placement Cell</title>
<meta charset="iso-8859-1">

<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />
<!--[if lt IE 9]>
<link href="../layout/styles/ie/ie8.css" rel="stylesheet" type="text/css" media="all">
<script src="../layout/scripts/ie/css3-mediaqueries.min.js"></script>
<script src="../layout/scripts/ie/html5shiv.min.js"></script>
<![endif]-->
</head>
<body onLoad="load_events()">

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
      
         <table width="80%" align="center" class="aa" border="1">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2 align="center">General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="100%" height="300" align="center" border="1">
                    <tr>
                      <td width="50%"><strong>Student roll number</strong></td>
                      <td width="50%"><%=student_roll_number%></td>
                    </tr>
                    <tr>
                      <td><strong>Name</strong></td>
                      <td><%=name%></td>
                    </tr>
                    <tr>
                      <td><strong>Date of Birth</strong></td>
                      <td><%=dob%></td>
                    </tr>
                    <tr>
                      <td><strong>Sex</strong></td>
                      <% String sex_value=get_unique_field("select sex_value from sex where sex_id='"+sex+"';",db);%>
                      <td><%=sex_value%></td>
                    </tr>
                    <tr>
                      <td><strong>Category</strong></td>
                      <td><%=category%></td>
                    </tr>
                    <tr>
                      <td><strong>Department</strong></td>
                      <% 
                        String department_name=get_unique_field("select department_name from department_record where department_id="+department_id+";",db);
                      %>
                      <td><%=department_name%></td>
                    </tr>
                    <tr>
                      <td><strong>Programme</strong></td>
                      <% 
                         String programme_name=get_unique_field("select programme_name from prog_record where prog_id="+program_id+";",db);
                       %>
                      <td><%=programme_name%></td>
                    </tr>
<%--
                    <tr>
                      <td><strong>Email</strong></td>
                      <td><%=email1%>@iitg.ernet.in</td>
                      <td><%=email2%></td>
                    </tr>

                    <tr>
                      <td><strong>Mobile Number</strong></td>
                      <td><%=mobile1%></td>
                      <td><%=mobile2%></td>
                    </tr>
--%>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <p>&nbsp;</p>
                <center>
                  <table width="100%" height="414" align="center" cellpadding="5" cellspacing="5" border="1">
                    <tr align="center" width="100%">
                      <h4><strong>Academic Details</strong></h4>
<p>&nbsp;</p>
                      
                    </tr>
                    <tr>
                      <td width="20%" ><strong>Level</strong></td>
                      <td width="20%" ><strong>Board/Institution</strong></td>
                      <td width="20%" ><strong>Medium</strong></td>
                      <td width="20%" ><strong>% of Marks</strong></td>
                      <td width="20%" ><strong>Year of Passing</strong></td>
                    </tr>
                    <tr>
                      <td><strong>X STD</strong></td>
                      <td><%=x_board%></td>
                      <td><%=x_medium%></td>
                      <td><%=x_marks%></td>
                      <td><%=x_year%></td>
                    </tr>
                    <tr>
                      <td><strong>XII STD</strong></td>
                      <td><%=xii_board%></td>
                      <td><%=xii_medium%></td>
                      <td><%=xii_marks%></td>
                      <td><%=xii_year%></td>
                    </tr>
                    <tr>
                      <td><strong>Gap in Study</strong></td>
                      <td><%=gap%> <strong>year</strong></td>
			<td><strong>Backlog(if any)</strong></td>
                      <td width="105"><%=backlog%></td>
                   

                    </tr>
                    <tr>
                      <td width="174"><strong>CPI</strong></td>
                      <td width="141"><%=cpi%></td>
                    </tr>
                    <tr align="center" border="0"><td style="border:none"></td><td style="border:none"></td>
                      <td  style="border:none"><h5><strong>SPI in all semesters</strong></h5></td>
                       </tr>
                    <%
                      if(programme_id==1 || programme_id==2) // For BTech/Bdes
                      {
                    %>
                    <tr>
                      <td><strong>1st Sem</strong></td>
                      <td><strong>2nd Sem</strong></td>
                      <td><strong>3rd Sem</strong></td>
                      <td width="122"><strong>4th Sem</strong></td>
                      <td width="128"><strong>5th Sem</strong></td>                    
                    </tr>
                    <tr>
                      <td><%=sem1%></td>
                      <td><%=sem2%></td>
                      <td><%=sem3%></td>
                      <td><%=sem4%></td>
                      <td><%=sem5%></td>                      
                    </tr>
                    <tr>
                    <td ><strong>6th Sem</strong></td>
                      <%-- <td><strong>7th Sem</strong></td> --%>
                    </tr>
                    <tr>
                    <td><%=sem6%></td>
                      <%--<td><%=sem7%></td> --%>
                    </tr>
                    <%
                      } 
                      else // for others
                      {
                    %>
                     <tr>
                       <td><strong>1st Sem</strong></td>
                       <td><strong>2nd Sem</strong></td>  
                     </tr>
                     <tr>
                       <td><%=sem1%></td>
                       <td><%=sem2%></td>
                     </tr>
                    <% 
                      } 
                    %> 
                    <tr>                      
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                </center>
              </div>
              
              
            </div></td>
          </tr>
          <tr>
            <td align="right">
          </tr>
          </td>
        </table>
      
</ul></div></div>
<div class="clear"><!-- Footer -->
</div>
<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%; background:#000;">
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
