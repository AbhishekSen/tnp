<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

var time = 3000;
var numofitems = 7;


function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}

 function check_phone(test)
{	
	var len=0;
	var str="1234567890-";
	for(i=0;i<test.length;i++)
	{
		for(j=0;j<str.length;j++)
		{
			if(test.charAt(i)==str.charAt(j))
			len++;
		}
	}
	
	if(len==test.length)
	return 1
	else
	return 0;
}


 

function validate_empty(ptr)
{	
 var message="";
 

  if (ptr.student_roll_number.value.length == 0 )
  	message+="Please enter the roll no \n" ;

	
  if (message.length > 0)
 {
    alert(message);
    return false ;
 } 
 else
 {
	return true;
 }

}

</script>

<script src="../../js/datetimepicker.js"></script>
</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>

<% db.fetchConfigDetails(); %>



<%

	String student_roll_number=request.getParameter("student_roll_number");
	String student_cpi=request.getParameter("student_cpi");
	String student_uname=request.getParameter("student_uname");
	String student_name=request.getParameter("student_name");
	String student_programme=request.getParameter("student_programme");
	String submit=request.getParameter("submit");
	if(submit!=null)
	{
		if(student_roll_number!=null&&student_cpi!=null&&student_uname!=null&&student_name!=null&&student_programme!=null&&student_roll_number!=""&&student_cpi!=""&&student_uname!=""&&student_name!=""&&student_programme!="")
		{
			db.connect();
			int count=0;
			/*String cnt="0";
			ResultSet re1=db.execSQL("select count(*) from student_record where student_roll_number="+student_roll_number+" or username='"+student_uname+"';");
			if(re1.next())
			{
				cnt=""+re1.getString(1);
			}
			re1.close();
			if(!(cnt.equals("0")))
			{
				response.sendRedirect("error2.jsp");
			}*/
			count=0;
			float f=Float.parseFloat(student_cpi);
			ResultSet re2=db.execSQL("select * from prog_record where prog_id="+student_programme+";");
			if(re2.next())
			{
				//if(re2.getInt("duration")==2)
				if(re2.getInt("duration")==2 || re2.getInt("duration")==0)
				{
					if(f<5)
					{
						count=db.updateSQL("insert into student_record (student_roll_number,student_name,username,is_activated,cpi_2sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','0','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');");
					}
					else
					{
						count=db.updateSQL("insert into student_record (student_roll_number,student_name,username,is_activated,cpi_2sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','1','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');");
					}
				}
				else
				{
					if(f<5)
					{
						count=db.updateSQL("insert into student_record (student_roll_number,student_name,username,is_activated,cpi_6sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','0','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');");
					}
					else
					{
						count=db.updateSQL("insert into student_record (student_roll_number,student_name,username,is_activated,cpi_6sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','1','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');");
					}
				}
			}
			re2.close();
			db.close();
			if(count==0)
			{
				response.sendRedirect("error3.jsp");
			}
			else
			{
				response.sendRedirect("success.jsp");
			}
		}
		else
		{
		response.sendRedirect("error1.jsp");
		}
	}
	
%>


<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink">
      <div id="globalLink2"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    </div> 
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
     </div>
  </div>
  <div id="content"> 
    <div class="feature">
      <form method="post" name="form_agency_registration" id="form_agency_registration" action="add.jsp">
        <table height="42" align="center">
          <tr>
            <td>Student roll number</td>
            <td><input type="text" name="student_roll_number" id="student_roll_number"></td>
          </tr>
		  <tr>
            <td>Student Name</td>
            <td><input type="text" name="student_name" id="student_name"></td>
          </tr>
		  <tr>
            <td>Student Username</td>
            <td><input type="text" name="student_uname" id="student_uname"></td>
          </tr>
		  <tr>
            <td>Student CPI</td>
            <td><input type="text" name="student_cpi" id="student_cpi"></td>
          </tr>
		  <tr>
            <td>Programme</td>
            <td>
				<select name="student_programme" id="student_programme">
					<%
						db.connect();
						ResultSet rs1=db.execSQL("select prog_id,programme_name from prog_record;");
						while(rs1.next())
						{
							out.println("<option value=\""+rs1.getInt(1)+"\">"+rs1.getString(2)+"</option>");
						}
						rs1.close();
						db.close();
					%>
				</select>
			</td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <table width="65" height="32" border="0" align="center">
          <tr>
            <td><div align="center">
        <button type="submit" name="submit" value="Submit" >Add Student</button>
        <colgroup>
          </colgroup>
      </div></td>
          </tr>
        </table>
        <p>&nbsp;  </p>
        <p>&nbsp;</p>
      </form>


    <p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name
  </div> 
</div> 
<!--end pagecell1--> 
<br> 
<script type="text/javascript">
    <!--
      var menuitem1 = new menu(7,1,"hidden");
			var menuitem2 = new menu(7,2,"hidden");
			var menuitem3 = new menu(7,3,"hidden");
			var menuitem4 = new menu(7,4,"hidden");
			var menuitem5 = new menu(7,5,"hidden");
			var menuitem6 = new menu(7,6,"hidden");
			var menuitem7 = new menu(7,7,"hidden");
    // -->
    </script> 
</body>
</html>
