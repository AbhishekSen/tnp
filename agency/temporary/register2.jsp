<%@page language="java" import="java.util.*,gcom.*,java.lang.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

function validate_empty(ptr)
{	
 var message="";
  if (ptr.company_name.value.length == 0 )
  	message+="Please enter the Agency\n" ;
	
  if (ptr.company_address.value.length == 0 )
        message+="Please enter the Email. \n" ;
		
  if (ptr.company_website.value.length == 0  )
        message+="Please enter the Person \n" ;
		
  if (ptr.agency_website.value.length == 0)
  		message+="Please enter the Website \n" ;
  
  if (ptr.password.value.length == 0)
  		message+="Please enter the Password \n" ;
		
  if (ptr.password1.value.length == 0)
  		message+="Please Confirm the Password \n" ;
		
  if (ptr.username.value.length == 0)
  		message+="Please Enter Username \n" ;
		
  if (ptr.agency_mobile.value.length == 0)
  		message+="Please Enter Mobile number \n" ;

 		
	
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
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="page" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>



<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
  <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a></div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../../index.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>&nbsp;</h2>
  <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div></td>
  <!--onSubmit="return validate_empty(form_placement_record)" -->
<form method="post" name="form_placement_record" id="form_placement_record"  action="register3.jsp">


<%
	String company_name=request.getParameter("company_name");
	String company_address=request.getParameter("company_address");
	String company_website=request.getParameter("company_website");
	String company_about=request.getParameter("company_about");
	String category=request.getParameter("category");
	String sector=request.getParameter("sector");
	String category_other=request.getParameter("category_other");
	String sector_other=request.getParameter("sector_other");
	String head_hr_name=request.getParameter("head_hr_name");
	String head_hr_email=request.getParameter("head_hr_email");
	String head_hr_mobile=request.getParameter("head_hr_mobile");
	String head_hr_phone=request.getParameter("head_hr_phone");
	String head_hr_fax=request.getParameter("head_hr_fax");
	String fcp_name=request.getParameter("fcp_name");
	String fcp_email=request.getParameter("fcp_email");
	String fcp_mobile=request.getParameter("fcp_mobile");
	String fcp_phone=request.getParameter("fcp_phone");
	String fcp_fax=request.getParameter("fcp_fax");
	String scp_name=request.getParameter("scp_name");
	String scp_email=request.getParameter("scp_email");
	String scp_mobile=request.getParameter("scp_mobile");
	String scp_phone=request.getParameter("scp_phone");
	String scp_fax=request.getParameter("scp_fax");
	
	
	out.println("<input type=\"hidden\" name=\"company_name\" value=\""+company_name+"\">");
	out.println("<input type=\"hidden\" name=\"company_address\" value=\""+company_address.replace("\"","\\\"")+"\">");
	out.println("<input type=\"hidden\" name=\"company_website\" value=\""+company_website+"\">");
	out.println("<input type=\"hidden\" name=\"company_about\" value=\""+company_about+"\">");
	out.println("<input type=\"hidden\" name=\"category\" value=\""+category+"\">");
	out.println("<input type=\"hidden\" name=\"sector\" value=\""+sector+"\">");
	out.println("<input type=\"hidden\" name=\"category_other\" value=\""+category_other+"\">");
	out.println("<input type=\"hidden\" name=\"sector_other\" value=\""+sector_other+"\">");
	out.println("<input type=\"hidden\" name=\"head_hr_name\" value=\""+head_hr_name+"\">");
	out.println("<input type=\"hidden\" name=\"head_hr_email\" value=\""+head_hr_email+"\">");
	out.println("<input type=\"hidden\" name=\"head_hr_mobile\" value=\""+head_hr_mobile+"\">");
	out.println("<input type=\"hidden\" name=\"head_hr_phone\" value=\""+head_hr_phone+"\">");
	out.println("<input type=\"hidden\" name=\"head_hr_fax\" value=\""+head_hr_fax+"\">");
	out.println("<input type=\"hidden\" name=\"fcp_name\" value=\""+fcp_name+"\">");
	out.println("<input type=\"hidden\" name=\"fcp_email\" value=\""+fcp_email+"\">");
	out.println("<input type=\"hidden\" name=\"fcp_mobile\" value=\""+fcp_mobile+"\">");
	out.println("<input type=\"hidden\" name=\"fcp_phone\" value=\""+fcp_phone+"\">");
	out.println("<input type=\"hidden\" name=\"fcp_fax\" value=\""+fcp_fax+"\">");
	out.println("<input type=\"hidden\" name=\"scp_name\" value=\""+scp_name+"\">");
	out.println("<input type=\"hidden\" name=\"scp_email\" value=\""+scp_email+"\">");
	out.println("<input type=\"hidden\" name=\"scp_mobile\" value=\""+scp_mobile+"\">");
	out.println("<input type=\"hidden\" name=\"scp_phone\" value=\""+scp_phone+"\">");
	out.println("<input type=\"hidden\" name=\"scp_fax\" value=\""+scp_fax+"\">");
%>



  <p align="center"> <strong> Please Fill All The Fields For Registration.</strong></p>
  <table width="640" align="center" cellpadding="5" cellspacing="5">
    <tr>
      <td >Shortlist from Resumes</td>
      <td ><label>
        <input name="shortlist" type="radio" id="shortlist" onClick="activate3(this,'cpi')" value="1" >
      </label>
        Yes
        <label>
          <input name="shortlist" id="shortlist" type="radio" value="0" onClick="activate5(this,'cpi')" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >Aptitude test </td>
      <td ><label>
        <input name="aptitude_test" id="aptitude_test" type="radio" value="1" onClick="activate3(this,'aptitude_duration')" >
      </label>
        Yes
        <label>
          <input name="aptitude_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'aptitude_duration')" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >Technical Test </td>
      <td ><label>
        <input name="technical_test" id="technical_test" type="radio" value="1" onClick="activate3(this,'technical_duration')" >
      </label>
        Yes
        <label>
          <input name="technical_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'technical_duration')" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >Group Discussion</td>
      <td ><label>
        <input name="gd" id="gd" type="radio" value="1" >
      </label>
        Yes
        <label>
          <input name="gd" id="gd" type="radio" value="0" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >Personal Interview</td>
      <td ><label>
        <input name="interview" id="interview" type="radio" value="1" >
      </label>
        Yes
        <label>
          <input name="interview" id="interview" type="radio" value="0" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >Online Test </td>
      <td ><label>
        <input name="onlinel_test" id="technical_test" type="radio" value="1" onClick="activate3(this,'technical_duration')">
      </label>
        Yes
        <label>
          <input name="technical_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'technical_duration')" >
        </label>
        NO</td>
    </tr>
    <tr>
      <td >PPT</td>
      <td ><label>
        <input name="ppt" id="ppt" type="radio" value="1" onClick="activate3(this,'checkbox')" >
      </label>
        Yes
        <label>
          <input name="ppt" id="ppt" type="radio" value="0" onClick="activate5(this,'checkbox')">
        </label>
        NO</td>
    </tr>
    <tr>
      <td  >No. of rounds </td>
      <td  ><input type="text" name="no_of_rounds" id="no_of_rounds"></td>
    </tr>
  <tr>
    <td width="350">Preferred period of visit for Recruitment:</td>
    <td ><a href="javascript:NewCal('preferred_date_1','ddmmyyyy')" >
      <input readonly type="text" name="preferred_date_1" id="preferred_date_1">
      </a>(From)</td>
  <tr>
    <td >&nbsp;</td>
    <td ><a href="javascript:NewCal('preferred_date_2','ddmmyyyy')" >
      <input readonly type="text" name="preferred_date_2" id="preferred_date_2">
    </a> (to)</td>
  </tr>
  <tr>
    <td  >No. of executives </td>
    <td  ><input type="text" name="no_of_executive" id="no_of_executive"></td>
  </tr>
  <tr>
    <td  >No. of rooms </td>
    <td  ><input type="text" name="no_of_rooms" id="no_of_rooms"></td>
  </tr>
  <tr>
    <td >Other Requirements</td>
    <td ><label for="other_req"></label>
      <input type="text" name="other_req" id="other_req"></td>
  </tr>
</table>
  <table width="46" height="32" border="0" align="center">
    <tr>
      <td width="40"><input class="center" type="submit" value="Step 2/3" name="submit"  id="submit" size="15" ></td>
    </tr>
</table>
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
