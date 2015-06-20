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

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement/placement.properties";
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


<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>

<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel='stylesheet' href='../../stylesheet/style.css'>
<link rel="stylesheet" href="../../stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
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


<div id = "container">
            <div id = "header">
              <div>
              <div id="globalLink" style = "float:left;width:40%;"> 
                   <br/> <span id="spancompany"><u>Welcome <%=username%></u></span>
                </div>
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                       <ul class="SlidingMenu Horizontal">
                        <li><a href="../instructions.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></li>
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
                <%--<div id = "search">
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
						  <li><a href='../instructions.jsp'>Instructions</a></li>
						  <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
						  <li><a href="../vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="../change_password/change_password.jsp">Change Password</a></li>
						  <li><a href="../../logout.jsp">Logout</a></li>
						 
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
                <div class="feature">

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
                  </div>
                </div>
              </div>
              <div id = "footer">
              <span>&copy; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
