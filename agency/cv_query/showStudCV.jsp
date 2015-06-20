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
		
	
	String submit=request.getParameter("submit");
	
	
%>
<% db.fetchConfigDetails(); %>

<%
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
			username = rs.getString(1);
		//out.println(username+"<br/>");
		String agency_id="";
		rs.close();
		ResultSet re=db.execSQL("select agency_id from agency where username='"+username+"';");
		if(re.next())
			agency_id=re.getString(1);
		//out.println(agency_id+"<br/>");
		re.close();
		db.close();

		String package_id=request.getParameter("id");
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

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

      
       <table border="0" align="center" style = "text-align:center" >
          <tr>
            <td>
            <table border='1' name="table_query_placement_details" id='table_query_placement_details' class='sortable' cellpadding='5'>
            <tr border='0.5'><td>S.No.</td><td>Student Roll Number</td><td>Student Name</td><td>CPI</td><td>Programme</td><td>Department Name</td><td>Download CV</td></tr>
	   
            <%
				db.connect();int i=0;
				String la="<a href=\"../student_details/update.jsp?student_roll_number=";
				String ld="<a href=\"../student_details/update.jsp?student_roll_number=";
				String lb="\">";
				String lc="</a>";
				ResultSet rset=db.execSQL("select student_id from interested_students where agency_id="+agency_id+" and package_id='"+package_id+"';");

				while(rset.next())
				{

                                    String sql_temp="select status from eligible_students where student_id='"+rset.getString(1)+"' and agency_id="+agency_id+" and package_id='"+package_id+"';";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
					if(rr.next())
					{
                                            status=rr.getInt(1);
					}                                     

                                      rr.close();
                                                                   

					ResultSet rset1=db.execSQL("select * from student_record where student_id='"+rset.getString(1)+"';");

                                   
					if(rset1.next())
					{
						String st_dept_name="NA";
						int st_department_id=rset1.getInt("department_id");
						 
						
						ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
						if(st_dept.next())
						{
						    st_dept_name=st_dept.getString(1);
						}
						String sql_temp1="select programme_name from prog_record where prog_id="+rset1.getInt("program_id")+";";
						String pname="";

						ResultSet rrp=db.execSQL(sql_temp1);
						if(rrp.next())
						{
						    pname=rrp.getString(1);
						}                                     

						    rrp.close();


                                                i++;
                                               if(status==1)
                                                {
                                                     out.println("<tr><td>"+i+"</td><td>"+rset1.getString("student_roll_number")+"</td><td>"+rset1.getString("student_name")+"</td>");
                                                }
                                              else
                                               {
						la=ld+rset1.getString("student_roll_number")+lb;
						out.println("<tr><td>"+i+"</td><td>"+la+rset1.getString("student_roll_number")+lc+"</td><td>"+la+rset1.getString("student_name")+lc+"</td>");
                                               }
						if(Integer.parseInt(rset1.getString("programme_id"))==1||Integer.parseInt(rset1.getString("programme_id"))==2)
							out.println("<td>"+rset1.getString("cpi_6sem")+"</td>");
						else
							out.println("<td>"+rset1.getString("cpi_2sem")+"</td>");
						out.println("<td>"+pname+"</td>");
						out.println("<td>"+st_dept_name+"</td>");
                                                if(status==1)
                                                 out.println("<td>"+"Already Placed"+"</td></tr>");
                                                else
						out.println("<td><a href=\"process.jsp?roll="+rset1.getString("student_roll_number")+"&pid="+package_id+"\">Download CV</a></td></tr>");
					      
					}
					rset1.close();
				}
				rset.close();
				db.close();
			%>
		  
		   
            </table>
            </td>
          </tr>

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
