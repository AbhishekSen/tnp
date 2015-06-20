<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	
	String age_name="";	
	String agency_id="";	
        String package_id="";
	String type="";

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
	//String strPropPath="/opt/tomcat7/webapps/placement/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/agency/company_literature/";        


%>
<% db.fetchConfigDetails(); %>
<%
		String username="";
		String sql_username1="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs5= db.execSQL(sql_username1);
		if(rs5.next()) 
		{
		username = rs5.getString(1);
		}
		
		rs5.close();
		db.close();
	
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

<script src="../js/datetimepicker.js"></script>
<script type="text/javascript">
 function getstat()
 {
  if(document.getElementById("uploadfile").value.length==0)
  {
   alert("Please select a file to be uploaded !!");
   return false;
  }
 }

function confirm1()
{
 // alert("yes");
   var where_to= confirm("Do you really want to delete the file??");

    if (where_to)
    {
	return true;
    }
    else
    {
	return false;
    }
}

</script>

</head>



<body onload = "showNewRecords();">
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*,java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
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

    
 <%
		  out.println("<br><br> <center>");
	db.connect();
	int gency_id=0;
	ResultSet rset=db.execSQL("select agency_id from agency where username='"+username+"';");
	if(rset.next())
	{
		gency_id=rset.getInt(1);
	}
	rset.close();
	int ccounApr=0;
	int ccounTmp=0;
	int which=0;
	//Fetching approved profiles
	ResultSet rset1=db.execSQL("select count(*) from package_details where agency_id="+gency_id+";");
	if(rset1.next())
		ccounApr=rset1.getInt(1);
	rset1.close();

        //Fetching approved profiles
                	                out.println("<center>");
        out.println("<p><b>Click the below profiles to see and upload the corresponding literature:</b></p><br>");
        out.println("<table border=1>");
	ResultSet rset2=db.execSQL("select package_id,package_name from package_details where agency_id="+gency_id+";");

	while(rset2.next())
	{
	                out.println("<tr>");
	                out.println("<td>");
	               	out.println("<a href='uploadcl.jsp?id=" +rset2.getInt(1)+ "&agencyid="+gency_id+"'>" +rset2.getString(2)+ "</a>");
			out.println("</td>");
			out.println("</td>");
	                out.println("</tr>");
        }
	rset2.close();
        out.println("</table><br>");
                        	                out.println("</center>");
        db.close();
 %>
      
   
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
