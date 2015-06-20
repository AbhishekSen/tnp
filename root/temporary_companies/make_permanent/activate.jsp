<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
<script type="text/javascript">

function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
   

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
<%@ include file="../../utils/drop_down_2.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />

<%!
int j=0;
String agency_name=null;
%>
<%
        db.fetchConfigDetails(); //newly added
	//out.println("rohan 1");
	 
	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR);
	//out.println(year);
 
//int agency_id=0;
 
	String company_id=request.getParameter("company_id");
	String username="";
	String password="";
	String company_name="";
	String company_address="";
	String company_website="";
	String category="";
	String sector="";
	String head_hr_name="";
	String head_hr_email="";
	String head_hr_mobile="";
	String head_hr_phone="";
	String head_hr_fax="";
	String fcp_name="";
	String fcp_email="";
	String fcp_mobile="";
	String fcp_phone="";
	String fcp_fax="";
	String scp_name="";
	String scp_email="";
	String scp_mobile="";
	String scp_phone="";
	String scp_fax="";
	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	 
	 


	if(submit!=null && company_id!=null )
		{				
			int num_rows=0;
			int num_rows1=0;
			int num_rows2=0;
			if(!company_id.equals("0") )
			{	
			
				String sql_get_data="select * from temporary_company where company_id="+company_id+";" ;
				db.connect(); 
				ResultSet rs= db.execSQL(sql_get_data);
				if(rs.next()) 
				{
				username=rs.getString("username");
				password=rs.getString("password");
				company_name=rs.getString("company_name");
				company_address=rs.getString("company_address");
				company_website=rs.getString("company_website");
				category=rs.getString("category");
				sector=rs.getString("sector");
				head_hr_name=rs.getString("head_hr_name");
				head_hr_email=rs.getString("head_hr_email");
				head_hr_mobile=rs.getString("head_hr_mobile");
				head_hr_phone=rs.getString("head_hr_phone");
				head_hr_fax=rs.getString("head_hr_fax");
				fcp_name=rs.getString("fcp_name");
				fcp_email=rs.getString("fcp_email");
				fcp_mobile=rs.getString("fcp_mobile");
				fcp_phone=rs.getString("fcp_phone");
				fcp_fax=rs.getString("fcp_fax");
				scp_name=rs.getString("scp_name");
				scp_email=rs.getString("scp_email");
				scp_mobile=rs.getString("scp_mobile");
				scp_phone=rs.getString("scp_phone");
				scp_fax=rs.getString("scp_fax");
				}
				else
				{
					rs.close();
					db.close();
				}
					
				rs.close();
				db.close();
			
				String login_record=" insert into login(username, password, role_id)"+" values ('"+username+"', '"+password+"', '1');";
				String agency_record=" insert into agency (agency_name,agency_website,agency_address,agency_phone,agency_mobile,agency_fax, agency_profile, nature_business,agency_email,agency_person,username, password,category,sector,head_hr_name,head_hr_email,head_hr_phone,head_hr_mobile,head_hr_fax,scp_name,scp_email,scp_phone,scp_mobile,scp_fax)"+
			" values ('"+company_name+"','"+company_website+"','"+company_address+"','"+fcp_phone+"','"+fcp_mobile+"','"+fcp_fax+"','"+sector+"','"+category+"','"+fcp_email+"','"+fcp_name+"','"+username+"','"+password+"','"+category+"','"+sector+"','"+head_hr_name+"','"+head_hr_email+"','"+head_hr_phone+"','"+head_hr_mobile+"','"+head_hr_fax+"','"+scp_name+"','"+scp_email+"','"+scp_phone+"','"+scp_mobile+"','"+scp_fax+"');";
				
				String main_record=" delete from temporary_company where company_id="+company_id+" ;";
				db.connect();
				num_rows=db.updateSQL(login_record);
				if(num_rows==1)
				{
					num_rows1=db.updateSQL(agency_record);
					if(num_rows1==1)
					{
						num_rows2=db.updateSQL(main_record);
						if(num_rows2==1)
						{
							db.close();	
							response.sendRedirect("success.jsp");
						}
						else
						{
							db.close();	
							//out.println(agency_record);
							response.sendRedirect("error.jsp");
						}
					}
					else
					{
						db.close();	
						//out.println(agency_record);
						response.sendRedirect("error.jsp");
					}
				}
				else
				{
					db.close();	
					//out.println(agency_record);
					response.sendRedirect("error.jsp");
				}

                                
			}
			else
				response.sendRedirect("error2.jsp");
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
    <img alt="small logo" src="../../images/logo-top.gif" height="116" width="115"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
     <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../main.jsp"> Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
  <p>&nbsp;</p>
<table width="456" align="center">
<tr>
<td >
Choose Organization:
</td><td><%! String agency_list ;%>
<% agency_list =drop_down("select company_name,company_id from temporary_company  ;",db) ; %>
<select name="company_id" id="company_id">
<option value="0">------------------select----------------</option>
<%=agency_list%>
</select>	
</td></tr>
 
 
</table>
<p>&nbsp;</p>
<table width="72" height="32" border="0" align="center">
  <tr>
    <td><input class="center" type="submit" value="Make Permanent" name="submit"  id="submit" size="15" ></td>
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
