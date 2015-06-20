<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../utils/session_validator.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	String sid = null;
	String username=null;
	String comp_name=null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");

        db.fetchConfigDetails(); //newly added
	db.connect();
	ResultSet rs=db.execSQL("select username from session where session_id='"+sid+"';");
	if(rs.next())
		username=rs.getString(1);
	rs.close();
	ResultSet re=db.execSQL("select agency_name,agency_id from agency where username='"+username+"';");
	if(re.next())
		comp_name=re.getString(1);
	String agency_id=re.getString(2);
	re.close();
	db.close();
	
%>
<%
             String sql_count="select count(*) from schedule where agency_id='"+agency_id+"' ;";
             db.connect();
             ResultSet rs5= db.execSQL(sql_count);
             rs5.next();
             int num1=rs5.getInt(1);   
         String[][] db_events = new String[num1][11];
           int i5=0;
             if(num1!=0)
              {
                  
		String sql_schedule="select * from schedule where agency_id='"+agency_id+"' ;";
		db.connect();
		ResultSet res5= db.execSQL(sql_schedule);
		i5=0;
		while(res5.next()) 
		{
                  int agency_id_2=res5.getInt("agency_id");
                  ResultSet rs_ag_name=db.execSQL("select agency_name from agency where agency_id="+agency_id_2+";");
                  rs_ag_name.next();
                  String agency_name=rs_ag_name.getString("agency_name");
                  rs_ag_name.close();

                  db_events[i5][0]=res5.getString("recurring");
                  db_events[i5][1]= res5.getString("date_from"); //dt_from; //res5.getString("starting_time");
                  db_events[i5][2]=res5.getString("starting_time");
                  db_events[i5][3]=res5.getString("date_to");
                  db_events[i5][4]=res5.getString("end_time");
                  //db_events[i5][5]=agency_name+", Profile: "+res5.getString("company_profile");
                  db_events[i5][6]=res5.getString("description");
                  db_events[i5][7]=res5.getString("venue");
                  db_events[i5][8]=res5.getString("eligibility_criteria");
                  db_events[i5][9]=res5.getString("departments");
		  i5++;
		}
		res5.close();
		db.close();
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

      
    
   <form method="post" name="form_placement_record" id="form_placement_record" action="">
  <p>&nbsp;</p>



<%

     if(num1==0)
     { 
       out.println("<p align=\'center\'><strong><h1 style = 'padding-left: 8%;'>");
       out.println("There is currently no data available in "+comp_name+"s schedule.");
       out.println("</h1></strong></p>");
     }
   else
    {
	
	out.println("<p align=\"center\"><strong><h1><u>");
       out.println("&nbsp;Schedule of "+comp_name+":");
       out.println("</u></h1></strong></p></br>");
       i5=0;
       while(i5<num1)
        { 
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;From: "+db_events[i5][1]+", "+db_events[i5][2]); //+"/"+db_events[i5][2]+"/"+db_events[i5][3]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;To: "+db_events[i5][3]+", "+db_events[i5][4]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Description: "+db_events[i5][6]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Venue: "+db_events[i5][7]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Eligibility Criteria: "+db_events[i5][8]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Departments: "+db_events[i5][9]);
           out.println("</h1></p>");
           out.println("<p>");
           out.println("-------------------------");
           out.println("</p>");
           i5++;
        }
    }
%>

<p>&nbsp;</p>

<p><br>
  </p>
</p>
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
