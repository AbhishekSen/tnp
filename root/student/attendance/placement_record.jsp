<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
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
	
  if (ptr.student_roll_number.value.length == 0 )
        message+="Please enter the Student Roll no. \n" ;
		
  

		
	
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
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>





</head>
<body onLoad="document.form_placement_record.agency_name.focus();">
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
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>




<%!

String agency_name=null;
%>
<%
        db.fetchConfigDetails(); //newly added 
	int agency_id=0;
	int student_id=0;
  	int i=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String agency_name=request.getParameter("agency_name");
	String student_roll_number=request.getParameter("student_roll_number");
	String submit=request.getParameter("submit");
	 
	if(submit!=null && agency_name!=null && student_roll_number!=null )
		{				
			int num_rows=0;
			
	
	String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"' ;" ;
		
			db.connect(); 
			ResultSet rs= db.execSQL(sql_get_data);
			if(rs.next()) 
			{agency_id=rs.getInt(1);}
			rs.close();
			 
			db.close();

	 sql_get_data="select student_id from student_record where student_roll_number='"+student_roll_number+"';" ;
			
			db.connect(); 
			ResultSet re= db.execSQL(sql_get_data);
			if(re.next()) 
			{student_id=re.getInt(1);}
			
			re.close();  
			db.close();
	       

	
		if(agency_id!=0&&student_id!=0)
			{	
			      
				String main_record=" insert into appearance(student_id,agency_id)"+" values ("+student_id+","+agency_id+");";
				
				db.connect();
				num_rows=db.updateSQL(main_record);
		
				db.close();	
				if(num_rows==1)
					{      i++;
						response.sendRedirect("success.jsp");
					 

					}
				else
				response.sendRedirect("error.jsp");
			}
			else    {if(agency_id==0)
				out.println(display1+"Could not add record since Agency is temporarily registered"+display2);
		                  else
                                  {if(student_id==0)
                                    response.sendRedirect("stud_error.jsp");}
                                 }
}	
		
	
	
	
%>
<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a>
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
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
      <a href="../../permanent_companies/main.jsp" >Permanent Organizations</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organizations</a>
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
</div></td>
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
  <p><strong>Select Appropriate Fields</strong></p>
  <p>&nbsp; </p>
  <table width="456" align="center">
    <tr>
      <td > Choose Organization: </td>
      <td><%! String agency_list ;
             String temp_agency_list;%>
        <% agency_list =drop_down("select agency_name from agency;",db) ; %>
        <select name="agency_name" id="agency_name">
          <option value="0">------------------select----------------</option>
          <%=agency_list%>
        </select></td>
    </tr>
    <tr>
      <td>Student  roll number </td>
      <td><input type="text" name="student_roll_number" id="student_roll_number"></td>
    </tr>
  </table>
.
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
	
<%			if(submit!=null&&i>=1)
			{
				String table2="select distinct agency_id ,student_id from appearance where agency_id ="+agency_id+" and student_id="+student_id+";";
				out.println(create_table(table2,db));
			}
			
	%>	


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
