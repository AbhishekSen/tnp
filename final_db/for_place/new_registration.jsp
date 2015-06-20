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
<!--
function is_float(str)
{
	//alert("in float");
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
	if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(new_key==".")
		{
			j++;
		}
		else if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
		if(j>1)
		{
			return false;
		}
	}
	return true;
}

function is_int(str)
{
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
	if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
	}
	return true;
}

function alltrim(str)
{
	//var strr="";
	return str.replace(/^\s+|\s+$/g, '');
	//alert(strr);
	//return strr;
}

function findall()
{
	
	var i=0;
	//alert("i="+i);
	//alert(form2.elements.length);
    for(i = 0; i < document.form2.elements.length; i++)
    {
		//alert("i="+i);
        document.form2.elements[i].value=alltrim(document.form2.elements[i].value);
    }
}



function validate_empty()
{	
	var message="";

	findall();
     
	if(document.form2.company_name.value=="")
		message+="Please enter Company name\n";
		
	if(document.form2.company_address.value=="")
		message+="Please enter Company address\n";

	if(document.form2.company_about.value=="")
		message+="Please enter Company details\n";

	if(document.form2.company_website.value=="")
		message+="Please enter Company website\n";

	if(document.form2.category[6].checked==true)
		if(document.form2.category_other.value=="")
			message+="Please enter details of type of Organization\n";

	if(document.form2.sector[7].checked==true )
		if(document.form2.sector_other.value=="")
			message+="Please enter details of type of Sector\n";

	if(document.form2.fcp_name.value=="")
		message+="Please enter FCP name\n";

	if(document.form2.fcp_designation.value=="")
		message+="Please enter FCP designation\n";

	if(document.form2.fcp_email.value=="")
		message+="Please enter FCP email\n";

	if(document.form2.fcp_mobile.value=="" && document.form2.fcp_phone.value=="")
		message+="Please enter FCP Phone number\n";
      
	if(message=="")
	{
                var dd=document.getElementById('input_captcha').value;
                //alert(dd); 
                if(dd=="")
                {
                  alert("Please enter  Verification Code");
                  document.form2.input_cap.focus();
                  return false;
                }

                document.form2.action="process.jsp";
                document.form2.submit();
		return true;
	}
	else
	{
		alert(message);
		document.form2.action=null;
		return false;
	}
}	 

//-->

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
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cel</a><a href="http://webmail.iitg.ernet.in">l</a> 
  </div> 
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
  <img alt="small logo" src="../images/logo-top.gif" height="63" width="86"/></div></td>
  <!--onSubmit="return validate_empty(form2)" -->
<form method="post" name="form2" id="form2" onSubmit="return validate_empty();" action="">
  <p align="center"> <strong> Please Fill All The Fields For Registration.</strong></p>

  <table width="600" border="0" align="center">
    <tr>
      <td width="179">*Name of the Company</td>
      <td width="411"><label for="company_name"></label>
        <input name="company_name" type="text" id="company_name" size="45"></td>
    </tr>
    <tr>
      <td>*Postal Address</td>
      <td><label for="company_address"></label>
        <textarea name="company_address" id="company_address" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td>*Website</td>
      <td><label for="company_about"></label>
        <input name="company_website" type="text" id="company_website" size="45"></td>
    </tr>
    <tr>
      <td>*Brief  write up on the Organisation (50-70 words)</td>
      <td><label for="company_about"></label>
        <label for="company_about"></label>
        <input name="company_about" type="text" id="company_about" size="60"></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="787" border="1" align="center">
    <tr>
      <td width="377"><strong>*Type of Organization</strong></td>
      <td width="394"><strong>*Industry Sector</strong></td>
    </tr>
    <tr>
      <td height="194"><table width="372" border="0">
        <tr>
          <td width="153"><input name="category" type="radio" id="category_2" value="Private" checked>
            <strong>Private</strong></td>
          <td width="209"><input type="radio" name="category" value="MNC(Indian Origin)" id="category_5">
            <strong>MNC(Indian Origin)</strong></td>
        </tr>
        <tr>
          <td><input type="radio" name="category" value="Govt." id="category_3">
            <strong>Govt.</strong></td>
          <td><input type="radio" name="category" value="MNC(Foreign origin)" id="category_0">
            <strong>MNC(Foreign origin)</strong></td>
        </tr>
        <tr>
          <td><input type="radio" name="category" value="PSU" id="category_4">
            <strong>PSU</strong></td>
          <td><input type="radio" name="category" value="NGO" id="category_1">
            <strong>NGO</strong></td>
        </tr>
        </table>
        <p><strong>
          <input type="radio" name="category" value="other" id="category_6">
          Other:</strong>
          <input type="text" name="category_other" id="category_other">
      </p></td>
      <td><p><br>
      </p>
        <table width="350" border="0" align="center">
          <tr>
            <td width="136"><label>
              <input name="sector" type="radio" id="sector_0" value="Core Engg." checked>
              Core Engg.</label></td>
            <td width="204"><label>
              <input type="radio" name="sector" value="Analytics" id="sector_4">
              Analytics</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="IT" id="sector_1">
              IT</label></td>
            <td><label>
              <input type="radio" name="sector" value="Management" id="sector_5">
              Management</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="Finance" id="sector_2">
              Finance</label></td>
            <td><label>
              <input type="radio" name="sector" value="Education" id="sector_6">
              Education</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="Consulting" id="sector_3">
              Consulting</label></td>
            <td><p>&nbsp;</p></td>
          </tr>
        </table>
        <p><strong>
          <input type="radio" name="sector" value="other" id="sector_7">
          Other:</strong>
          <label for="sector_other"></label>
          <input type="text" name="sector_other" id="sector_other">
  <br>
        </p></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="806" border="0" align="center">
    <tr>
      <td width="796"><table width="302" border="0" align="center">
        <tr>
          <td><strong>Contact Details:</strong></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td><table width="302" border=".5" align="center">
        <tr>
          <td width="72"><strong>*Name:</strong></td>
          <td width="220"><label for="fcp_name"></label>
            <input type="text" name="fcp_name" id="fcp_name"></td>
        </tr>
        <tr>
          <td><strong>*Designation:</strong></td>
          <td><label for="fcp_designation"></label>
            <input type="text" name="fcp_designation" id="fcp_designation"></td>
          </tr>
        <tr>
          <td><strong>*E-mail:</strong></td>
          <td><label for="fcp_email"></label>
            <input type="text" name="fcp_email" id="fcp_email"></td>
          </tr>
        <tr>
          <td><strong>*Mobile:</strong></td>
          <td><label for="fcp_mobile"></label>
            <input type="text" name="fcp_mobile" id="fcp_mobile"></td>
          </tr>
        <tr>
          <td><strong>*Phone:</strong></td>
          <td><label for="fcp_phone"></label>
            <input type="text" name="fcp_phone" id="fcp_phone"></td>
          </tr>
        <tr>
          <td><strong>Fax:</strong></td>
          <td><label for="fcp_fax"></label>
            <input type="text" name="fcp_fax" id="fcp_fax"></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="46" height="32" border="0" align="center">

  <!-- For Captcha Implementation-->
    <tr>
        <td align="center" width="28%">
              <img src="captchaimage.jsp" style=""/>
        </td>
    </tr>
    <tr><td><strong>*Enter the verification &nbsp;code</strong></td> </tr>
    <tr><td><input id="input_captcha" type="text" name="input_cap" value="" size="10"/></td> </tr> 

    <tr>
      <td width="40"><input type="submit" value="Register" name="submit"  id="submit"></td>
    </tr>
</table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
	


<tr>
  <td colspan="2" height="20">   
  <div id="siteInfo"></div> </td></tr></table>
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
