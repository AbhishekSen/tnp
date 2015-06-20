<%@page language="java" import="java.util.*,gcom.*" %>
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

function load_events()
{
	document.getElementById("btech_table").style.display="none";
	document.getElementById("mtech_table").style.display="none";
	document.getElementById("msc_table").style.display="none";
	document.getElementById("phd_table").style.display="none";
	document.getElementById("ma_table").style.display="none";
}

function activate_btech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("btech_table").style.display="block";	
	}
	else
	{
		document.getElementById("btech_table").style.display="none";
	}
}

function activate_mtech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("mtech_table").style.display="block";	
	}
	else
	{
		document.getElementById("mtech_table").style.display="none";
	}
}

function activate_msc(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("msc_table").style.display="block";	
	}
	else
	{
		document.getElementById("msc_table").style.display="none";
	}
}

function activate_phd(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("phd_table").style.display="block";	
	}
	else
	{
		document.getElementById("phd_table").style.display="none";
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
<body onLoad="load_events();">
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
<form method="post" name="form_placement_record" id="form_placement_record"  action="success.jsp">
  <p align="center"> <strong> Please Fill All The Fields For Registration.</strong></p>
  <table width="640" height="302" align="center" cellpadding="5" cellspacing="5">
    <tr>
      <td height="32" width="350" >Job description</td>
      <td width="307" ><input name="job_description" id="job_description" type="text" ></td>
    </tr>
    <tr>
      <td height="32" >Job designation </td>
      <td ><input name="job_designation" id="job_designation" type="text"></td>
    </tr>
    <tr>
      <td height="32" >Place of posting </td>
      <td ><input name="location_of_posting" id ="location_of_posting" type="text"></td>
    </tr>
    <tr>
      <td height="32">CTC :</td>
      <td><input name="ctc1" id="ctc1" type="text">
        ( Lacs p.a.)</td>
    </tr>
    <tr>
      <td height="32">Gross</td>
      <td><input name="gross" id="gross" type="text"></td>
    </tr>
    <tr>
      <td height="32">Bonus/Perks/Incentive (if any)</td>
      <td><input name="bonus" id="bonus" type="text"></td>
    </tr>
    <tr>
      <td height="31" >Bond</td>
      <td ><label>
        <input name="bond" id="bond" type="radio" value="1" onClick="activate3(this,'bond_duration')">
        </label>
        Yes
        <label>
          <input name="bond" type="radio" id="bond" onClick="activate5(this,'bond_duration')" value="0" checked>
          </label>
        NO</td>
    </tr>
    <tr>
      <td height="32" >(if Yes, give details)</td>
      <td><input type="text" name="bond_details" size="45" id="bond_details"></td>
    </tr>
    <tr>
      <td  >Cpi(minimum):</td>
      <td  ><input type="text" name="cpi" id="cpi" disabled="disabled"></td>
    </tr>
    <tr>
      <td  >Other Requirements</td>
      <td  ><input type="text" name="cpi" id="cpi" disabled="disabled"></td>
    </tr>
  </table>
  <table width="640" height="126" align="center" cellpadding="5" cellspacing="5">
    <tr>
      <td width="132" height="32">Department</td>
      <td width="471">Please Select your choices:</td>
    </tr>
    <tr>
      <td height="40">&nbsp;</td>
      <td nowrap><p>
        <input type="checkbox" name="btech" id="btech" onClick="activate_btech(this)" value="1">
        <label for="btech" >B.Tech.</label>
      </p>
        <table border="1" align="center" id="btech_table">
          <tr>
            <td width="218"><label>
              <input type="checkbox" name="btech_chkbox" value="1" id="btech_chkbox">
              Computer Science & Engineering</label></td>
            <td width="238"><label>
              <input type="checkbox" name="btech_chkbox" value="2" id="btech_chkbox">
              Electronics & Communication Engineering</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="3" id="btech_chkbox">
              Mechanical Engineering</label></td>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="4" id="btech_chkbox">
              Civil Engineering</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="5" id="btech_chkbox">
              Biotechnology</label></td>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="6" id="btech_chkbox">
              Chemical Engineering</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="9" id="btech_chkbox">
              Chemical Science and Technology</label></td>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="8" id="btech_chkbox">
              Engineering Physics</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="7" id="btech_chkbox">
              Mathematics & Computing</label></td>
            <td><label>
              <input type="checkbox" name="btech_chkbox" value="10" id="btech_chkbox">
              Electronics and Electrical Engineering</label></td>
          </tr>
        </table>
        <p>
          <label>
            <input type="checkbox" name="bdes" value="11" id="bdes">
            B.Des.</label>
        </p>
        <p>
          <input type="checkbox" name="mtech" id="mtech" onClick="activate_mtech(this)" value="1">
          <label for="mtech">M.Tech.</label>
        </p>
        <table border="1" name="mtech_table" id="mtech_table">
          <tr>
            <td width="233">Biotechnology</td>
            <td width="318"><p>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="24" id="mtech_chkbox">
                Biotechnology</label>
              <br>
              <br>
            </p></td>
          </tr>
          <tr>
            <td>Chemical Engineering</td>
            <td><label>
              <input type="checkbox" name="mtech_chkbox" value="25" id="mtech_chkbox">
              Petroleum Refinery Engineering</label></td>
          </tr>
          <tr>
            <td>Civil Engineering</td>
            <td><label>
              <input type="checkbox" name="mtech_chkbox" value="19" id="mtech_chkbox">
            </label>
              <label>Structural Engineering</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="20" id="mtech_chkbox">
                Water Resources Engineering and Management</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="21" id="mtech_chkbox">
                Geotechnical Engineering</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="22" id="mtech_chkbox">
                Environmental Engineering</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="23" id="mtech_chkbox">
                Transportation System Engineering</label></td>
          </tr>
          <tr>
            <td>Computer Science &amp; Engineering</td>
            <td><label>
              <input type="checkbox" name="mtech_chkbox" value="12" id="mtech_chkbox">
              Computer Science and Engineering</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="13" id="mtech_chkbox">
                Information Security</label></td>
          </tr>
          <tr>
            <td>Electronics and Communication Engineering</td>
            <td><label>
              <input type="checkbox" name="mtech_chkbox" value="14" id="mtech_chkbox">
              Digital Signal Processing</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="15" id="mtech_chkbox">
                VLSI</label></td>
          </tr>
          <tr>
            <td>Mechanical Engineering</td>
            <td><label>
              <input type="checkbox" name="mtech_chkbox" value="16" id="mtech_chkbox">
              Machine Design</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="17" id="mtech_chkbox">
                Fluids and Thermal Sciences</label>
              <br>
              <label>
                <input type="checkbox" name="mtech_chkbox" value="18" id="mtech_chkbox">
                Computer Assisted Manufacturing</label></td>
          </tr>
        </table>
        <p>
          <label>
            <input type="checkbox" name="mdes" value="26" id="mdes">
            M.Des.</label>
        </p>
        <p>
          <input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1">
          <label for="msc">M.Sc.</label>
        </p>
        <table border="1" id="msc_table" name="msc_table">
          <tr>
            <td>
              <label>
                <input type="checkbox" name="msc_chkbox" value="27" id="msc_chkbox">
                Mathematics</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="msc_chkbox" value="28" id="msc_chkbox">
              Physics</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="msc_chkbox" value="29" id="msc_chkbox">
              Chemistry</label></td>
          </tr>
        </table>
        <p>
          <input name="ma" type="checkbox" id="ma" value="30">
          <label for="MA">M.A. in Development Studies</label>
        </p>
        <p>
          <input type="checkbox" name="phd" id="phd" onClick="activate_phd(this)" value="1">
          <label for="phd">Ph.D.</label>
        </p>
        <table width="450" border="1" id="phd_table" name="phd_table">
          <tr>
            <td><p>
              <label>
                <input type="checkbox" name="phd_chkbox" value="31" id="phd_chkbox">
                Computer Science and Engineering</label>
              <br>
              <br>
            </p></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="32" id="phd_chkbox">
              Electronics and Communication Engineering</label>
              <br></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="33" id="phd_chkbox">
              Mechanical Engineering</label>
              <br></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="34" id="phd_chkbox">
              Civil Engineering</label>
              <br></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="35" id="phd_chkbox">
              Design</label>
              <br></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="36" id="phd_chkbox">
              Biotechnology</label>
              <br></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="37" id="phd_chkbox">
              Chemical Engineering</label>
              <br></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="38" id="phd_chkbox">
              Mathematics</label>
              <br></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="39" id="phd_chkbox">
              Physics</label>
              <br>
              <br></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="40" id="phd_chkbox">
              Chemistry</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="41" id="phd_chkbox">
              HSS</label></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="42" id="phd_chkbox">
              Centre for Energy</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="43" id="phd_chkbox">
              Centre for Environment</label></td>
            <td><label>
              <input type="checkbox" name="phd_chkbox" value="14" id="phd_chkbox">
              Centre for Nanotechnology</label></td>
          </tr>
        </table>
        <p>&nbsp;</p></td>
    <tr>
      <td height="32">No. of vacancy :</td>
      <td><input name="vacancy1" id="vacancy1" type="text"></td>
    </table>
  <table width="46" height="32" border="0" align="center">
    <tr>
      <td width="40"><input class="center" type="submit" value="Finish" name="submit"  id="submit" size="15" ></td>
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
