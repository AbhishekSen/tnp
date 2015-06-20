<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

<style>
table.advanced a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table.advanced a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table.advanced a:active,
table.advanced a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table.advanced {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table.advanced th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table.advanced th:first-child{
	text-align: left;
	padding-left:20px;
}
table.advanced tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table.advanced tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table.advanced tr{
	text-align: center;
	padding-left:20px;
}
table.advanced tr td:first-child{
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table.advanced tr td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table.advanced tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table.advanced tr:last-child td{
	border-bottom:0;
}
table.advanced tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table.advanced tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table.advanced tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}


</style>

<script type="text/javascript" src="../../javascript/jquery.min.js"> </script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript">
function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
  if (ptr.student_roll_number.value.length == 0 )
        message+="Please enter the Student ID \n" ;
		
  if (ptr.basic.value.length == 0  )
        message+="Please select the Package \n" ;
		
  if (ptr.location_of_posting.value.length == 0)
  		message+="Please enter the Location of Posting \n" ;
		
  if (ptr.remarks.value.length == 0)
  		message+="Please enter the Remarks \n" ;
		

		
	
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
function getPlacementStats()
{

        var url = "placement_status.jsp";

        if(window.XMLHttpRequest)
        {
                httpRequest = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        httpRequest.open("GET",url,true);  
        httpRequest.onreadystatechange = showData; 
        httpRequest.send(url);
        return false;
}

function getPlacementStatsByDepartment()
{

        var url = "placement_status_by_department.jsp";

        if(window.XMLHttpRequest)
        {
                httpRequest = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        httpRequest.open("GET",url,true);  
        httpRequest.onreadystatechange = showData; 
        httpRequest.send(url);
        return false;

}


function showData()
{
        if(httpRequest.readyState == 4)
        {
                if(httpRequest.status == 200)
                {
                        var ele = document.getElementById("links");
                        ele.innerHTML = httpRequest.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest.status + ":" + httpRequest.statusText);
                }
        }
}

function getStats()
{

        var url = "getPlacementRecords.jsp";
        var form = new FormData(document.forms.namedItem("statsform"));
        if(window.XMLHttpRequest)
        {
                httpRequest = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        httpRequest.open("POST",url,true);  
        httpRequest.onreadystatechange = showData; 
        httpRequest.send(form);
        return false;
        
}

function getStatsByDepartment()
{

        var url = "getPlacementRecordsByDepartment.jsp";
        var form = new FormData(document.forms.namedItem("statsform"));
        if(window.XMLHttpRequest)
        {
                httpRequest = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        httpRequest.open("POST",url,true);  
        httpRequest.onreadystatechange = showData; 
        httpRequest.send(form);
        return false;
        
}

function exportTables(companyName){
        var url = "exportTables.jsp?companyName="+companyName;
        var downloadWindow = window.open(url,"Export Placement status","width=200,height=100,left=450,top=250,location=no,resizable=no",true);
        downloadWindow.focus();
        return false;
}
function exportTablesByDepartment(programme_name){
        var url = "exportTablesByDepartment.jsp?programme_name="+programme_name;
        var downloadWindow = window.open(url,"Export Placement status","width=200,height=100,left=450,top=250,location=no,resizable=no",true);
        downloadWindow.focus();
        return false;
}
</script>


<body onmousemove="closesubnav(event);"> 
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />




<%@ include file="../utils/session_validator.jsp"%>
<%
    	String sid = null; 
	sid = request.getSession(false).getId();
	if (session_validate(sid,db).equals("true") ) 
	   response.sendRedirect("../../logout.jsp");		
    
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="student_roll_number" param="student_roll_number" />
<jsp:setProperty name="obj_placement_record" property="basic" param="basic" />
<jsp:setProperty name="obj_placement_record" property="hra" param="hra" />
<jsp:setProperty name="obj_placement_record" property="others" param="others" />
<jsp:setProperty name="obj_placement_record" property="gross" param="gross" />
<jsp:setProperty name="obj_placement_record" property="take_home" param="take_home" />
<jsp:setProperty name="obj_placement_record" property="ctc" param="ctc" />
<jsp:setProperty name="obj_placement_record" property="location_of_posting" param="location_of_posting" />
<jsp:setProperty name="obj_placement_record" property="remarks" param="remarks" />

<%
int j=0;
String agency_name=request.getParameter("agency_name");
String student_roll_number=request.getParameter("student_roll_number");
String package_name=request.getParameter("package_name");

db.fetchConfigDetails(); //newly added

int agency_id=0;
int student_id=0;
int department_id=0;
int programme_id=0;
int package_id=0;

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	
	
	String basic=obj_placement_record.getBasic();
	String location_of_posting=obj_placement_record.getLocation_of_posting();
	String remarks=obj_placement_record.getRemarks();
	String hra=obj_placement_record.getHra();
	String others=obj_placement_record.getOthers();
	String gross=obj_placement_record.getGross();
	String take_home=obj_placement_record.getTake_home();
	String ctc=obj_placement_record.getCtc();
	String confirmation=request.getParameter("confirmation");
//out.println(confirmation);

	if(submit!=null && agency_name!=null && student_roll_number!=null && basic!=null && location_of_posting!=null && hra!=null&& others!=null&& gross!=null&& ctc!=null&& remarks!=null )
		{				
			int num_rows=0;//,agency_id=0,student_id=0;
			
			String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"';" ;
			db.connect(); 
			ResultSet rs_agency= db.execSQL(sql_get_data);
			if(rs_agency.next()) 
			{agency_id=rs_agency.getInt(1);}
			rs_agency.close();
			db.close();
			
			
			sql_get_data="select department_id , programme_id from student_record where student_roll_number='"+student_roll_number+"';" ;
			db.connect(); 
			ResultSet rstdn= db.execSQL(sql_get_data);
			if(rstdn.next()) 
			{
				department_id=rstdn.getInt(1);
				programme_id=rstdn.getInt(2);
			}
			rstdn.close();
			db.close();
			
	 		sql_get_data="select package_id from package_details where package_name='"+package_name+"';" ;		
			db.connect(); 
			ResultSet rsp= db.execSQL(sql_get_data);
			if(rsp.next()) 
			{
				package_id=rsp.getInt(1);
			}
			rsp.close();
			db.close();

			
			


	 sql_get_data="select student_id from student_record where student_roll_number='"+student_roll_number+"';" ;
			//out.println(sql_get_data);
			db.connect(); 
			ResultSet re= db.execSQL(sql_get_data);
			if(re.next()) 
			{student_id=re.getInt(1);}
			//out.println(old_department_id);
			re.close();  
			db.close();
	
	
	String get_number="select package_id from placement_record where student_id="+student_id+";";
	db.connect();
	ResultSet rs=db.execSQL(get_number);
	//out.println("*"+j+"*");
	j=0;
	while(rs.next())
	{
	j++;
	}
	rs.close();
	db.close();
	//out.println(j);
	if(j==2)
	{out.println(display1+"Student has been already registered for two companies"+display2);}
			
	if(j==1||j==0)		
		{	if(package_id!=0&&student_id!=0)
			{	
			//out.println(confirmation);
				String main_record=" insert into placement_record(package_id,student_id,location_of_posting,remarks,confirmation)"+" values ("+package_id+","+student_id+",'"+location_of_posting+"','"+remarks+"',"+Integer.parseInt(confirmation)+");";
				//out.println("rohan 3");
				db.connect();
				num_rows=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();
                               
		
                                if(num_rows==1)
					{
						response.sendRedirect("success.jsp");
					 

					}
				else
				response.sendRedirect("error.jsp");
			}
			else
				
				response.sendRedirect("error2.jsp");
		}	
		
	}
	
	
%>

	
	
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati</h1> 
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
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="main.jsp">Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
            <img src="../images/bot.gif" alt="" width="181" height="243" /></div>
</div>

  <div id="links">
  <p align="center"><strong>1.<a href="get_info.jsp"> Add new records.</a></strong></p>
  <p align="center"><strong>2. <a href="delete_records/delete.jsp">Delete existing records.</a></strong></p>
  <p align="center"><strong>3. <a href="#" onClick="return getPlacementStats();">View Placement Status for each Company</a></strong></p>
  <p align="center"><strong>4. <a href="#" onClick="return getPlacementStatsByDepartment();">View Placement Status for each Department</a></strong></p>
  </div>

   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">SiteMap</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    GCom  </div>
</div> 
<!--end pagecell1--> 





</body>
</html>
