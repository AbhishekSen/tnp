<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">
var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function change_data()
{
	var i;
	i=document.getElementById("content");
	var str="Now i've changed this whole feature!!!"
	str+= "<br>This may just be <BR> useful in AJAX.<br><br>Let us see!!";
	i.innerHTML=str;
	document.getElementById("infobar").innerHTML="<h3 id=\"infotitle\">Data Changed! </h3><br><br><br> <a href=\"javascript:clearinfo()\" id=\"infohide\">Hide</a><br>";
	document.getElementById("pagecell1").style.top='180px';
	var j=document.styleSheets[0];
	alert(document.getElementById("infobar").style.position);
	alert(document.getElementById("infobar").offsetHeight);
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112px';
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
function validate_empty(ptr)
{	
 var message="";
  if(ptr.agency_name.value=="0")
    message+="Please enter the Agency Name\n" ;
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
f		
  

		
	
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





</head>
<body onLoad="document.form_placement_record.agency_name.focus();">
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
					String main_record2=" update agency set password='"+new_password+"' where username='"+username+"';";
			
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
<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></div>
 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome , <%=username%></h2>
  <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav">
  <div id="sectionLinks"> 
      <a href="../instructions.jsp">Instructions</a>
      <a href="../agency_details/register.jsp">Job Application Form</a>
      <a href="../edit_details/edit.jsp">Edit Job Application Form</a>
      <a href="../vacancies/add_vacancy.jsp">Add  More Vacancies</a>
      <a href="../change_final_date/change_date.jsp">Request For Change in Final Date </a>
      <a href="../student_eligibility/eligibility.jsp">Eligible Students</a>
      <a href="../student_details/student_details.jsp">Students Details Query</a>
      <a href="../cv_query/cv_query.jsp">CV Query</a>
      <a href="../calendar/view.jsp">Company Schedule</a>
      <a href="../date_notifications/date.jsp">Final Date</a>
      <a href="../uploads/upload.jsp">Upload Company Literature</a>
      <a href="change_password.jsp">Change Password</a>
      <a href="../../logout.jsp">Logout</a></div>
  </div>
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
  <p align="center"><strong>Please fill all the fields correctly</strong></p>
  <p>&nbsp; </p>
  <table width="456" align="center">
    <tr>
      <td>Company Name</td>
      <td><%=agency_name%></td>
    </tr>
    <tr>
      <td>Username</td>
      <td><%=username%></td>
    </tr>
    <tr>
      <td>Old Password</td>
      <td><input type="password" name="password" id="password" ></td>
    </tr>
    <tr>
      <td>New Password</td>
      <td><input type="password" name="new_password" id="new_password" ></td>
    </tr>
    <tr>
      <td>Confirm New Password</td>
      <td><input type="password" name="conf_password" id="conf_password"></td>
    </tr>
  </table>
  <p>. </p>
  <table width="76" height="32" border="0" align="center">
    <tr>
      <td><input class="center" type="submit" value="Change Password" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
	


<tr>
  <td colspan="2" height="20">   
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
  GCom  </div> </td></tr></table>
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
