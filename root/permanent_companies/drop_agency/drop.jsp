<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>DELETE AGENCY FORM</title>
<script type="text/javascript">

function show_confirm()
{
    var con = confirm("Are you sure you want to delete the selected package/agency");
    if (con ==true)
    {
	return true;
    }
    else
    {
	return false;
    }
}
function validate_empty(ptr)
{
 	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	//message+="Please enter the Agency ID\n" ;
	  	message+="Please enter the Package ID\n" ;
   
 if (message.length > 0)
 {
    alert(message);
    return false ;
 } 
}




</script>
<script src="../../js/datetimepicker.js"></script>
<script src="../../js/xmlhttprequest.js"></script>

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
<%@ include file="../../utils/drop_down_33.jsp"%>
<%@ include file="../../utils/drop_down_2.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />

<%!
int j=0;
String agency_name=null;
%>

<%
        db.fetchConfigDetails(); //newly added
        
	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR);
	//out.println(year);
 
	
	String username="";
 	String agency_id="";
	String package_id="";
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	 
        if(submit!=null && agency_name!=null )
	{	
	   int flag=0;			
	   int num_rows=0;
	   int num_rows1=0;
	   int num_rows2=0;
           int num_rows3=0;
	String data[]=agency_name.split(":");
	if(data != null && data.length > 0){ 
		if(data.length == 2)
		{
			agency_id=data[0];
			package_id=data[1];
		}
		else
		{
			agency_id=data[0];
			flag=1;	
		}
	}			
	
        /*   String sql_get_data="select agency_id, username from agency where agency_id='"+agency_name+"';" ; //agency id will come in agency_name variable
	   db.connect(); 
	   ResultSet rs= db.execSQL(sql_get_data);
	   if(rs.next()) 
	   {
	      agency_id=rs.getInt(1);
	      username=rs.getString(2);
	   }
	   rs.close();
	   db.close(); */

  	  if(agency_id!="0")
	   {	
	      int cnt=0;
	      db.connect();			
              if(flag==0)
              {
              String sql_get_data="select count(*) from package_details where agency_id="+agency_id+" ;";
	      ResultSet rs= db.execSQL(sql_get_data);
	      if(rs.next()) 
	      {
			cnt=rs.getInt(1);
	      }
	      rs.close();
              db.updateSQL("delete from eligible_students where agency_id="+agency_id+" and package_id="+package_id+";");         
              db.updateSQL("delete from interested_students where agency_id="+agency_id+" and package_id="+package_id+";");         
              db.updateSQL("delete from agency_currency where agency_id="+agency_id+" and package_id="+package_id+";"); 
              db.updateSQL("delete from company_literature where agency_id="+agency_id+" and package_id="+package_id+";"); 


              String main_record2="delete from package_details where agency_id="+agency_id+" and package_id="+package_id+";";	     
	      num_rows2=db.updateSQL(main_record2);
	     			

	
              String main_record3=" delete from package_extra_details where agency_id="+agency_id+" and package_id="+package_id+";";
	      num_rows3=db.updateSQL(main_record3);

	      if((cnt-1)==0)
	      {
              	db.updateSQL("delete from schedule where agency_id="+agency_id+" ;");         
	      	String main_record="delete from agency where agency_id="+agency_id+" ;";
	      	num_rows=db.updateSQL(main_record);
	        String main_record1="delete from login where username='"+username+"' ;";
	        num_rows1=db.updateSQL(main_record1);
	      }
	   
              db.close();
				
	      if( num_rows1==1 && num_rows==1 && ((cnt-1)==0))
	      {
		response.sendRedirect("success.jsp?id=0");
	      }	
	      else if(num_rows1==0 && num_rows==0 && ((cnt-1)!=0))
	      {
		response.sendRedirect("success.jsp?id=1");
	      }	
	      else
		response.sendRedirect("error.jsp");
             }
             else if(flag==1)
             {
	      db.connect();			
               
              db.updateSQL("delete from eligible_students where agency_id="+agency_name+" ;");         
              db.updateSQL("delete from interested_students where agency_id="+agency_name+" ;");         
              db.updateSQL("delete from agency_currency where agency_id="+agency_name+" ;"); 
              db.updateSQL("delete from company_literature where agency_id="+agency_name+" ;"); 
              db.updateSQL("delete from schedule where agency_id="+agency_name+" ;");         

              String main_record2="delete from package_details where agency_id="+agency_name+" ;";	     
	      num_rows2=db.updateSQL(main_record2);
	     			
	      String main_record1="delete from login where username='"+username+"' ;";
	      num_rows1=db.updateSQL(main_record1);
	
              String main_record3=" delete from package_extra_details where agency_id="+agency_name+" ;";
	      num_rows3=db.updateSQL(main_record3);
	
	      String main_record="delete from agency where agency_id="+agency_name+" ;";
	      num_rows=db.updateSQL(main_record);
              db.close();
				
	      if( num_rows1==1 && num_rows==1)
	      {
		response.sendRedirect("success.jsp");
	      }	
	      else
		response.sendRedirect("error.jsp");             	
             }
             }
	     else
		response.sendRedirect("error.jsp");
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
      <a href="../../placement_record/main.jsp">Placement Record</a>
      <a href="../main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp" >Change Date Requests</a>
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
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(form_placement_record)">
  <p>&nbsp;</p>
<table width="456" align="center">
<tr>
<td >
Choose Organization:
</td><td>
<%!
 String agency_list ;
 String agg ;
%>
<% agency_list =drop_down_all("select a.agency_name,p.agency_id,p.package_name,p.package_id from agency as a,package_details as p where p.agency_id=a.agency_id ;",db) ; %>
<select name="agency_name" id="agency_name">
<option value="0">------------------select----------------</option>
<%=agency_list%>
<%
   agg=drop_down("select agency_name,agency_id from agency where agency_id NOT IN(select agency_id from package_details)  ;",db);

%> 
<%=agg%>
</select>	
</td></tr>
 
 
</table>
<p>&nbsp;</p>
<table width="72" height="32" border="0" align="center">
  <tr>
    <td><input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15"  onclick="return show_confirm()" ></td>
  </tr>
</table>
<p><br>
  </p>
</p>
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
