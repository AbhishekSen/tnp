<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training and Placement Cell IIT Guwahati</title>

<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />
 <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>

<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
<script src="SpryAssets//SpryValidationTextarea.js" type="text/javascript"></script>

<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
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
			$('#slideUp').slideUp("fast");			
		}


function resetCaptcha()
{
    document.getElementById('imgCaptcha').src = 'captchaimage.jsp?' + Math.random();
  
}


	</script>

<script src="../js/datetimepicker.js"></script>
<script type="text/javascript">


function alpha(e)
{
	var k;
	if(e.keyCode ==0)
	{
 	   k = e.which;                        
	}
	else
	{
	   k = e.keyCode;                     
	}

        //ENABLING LEFT,RIGHT,UPPER,DOWN ARROW//
        if(k > 36 && k< 41  && e.charCode==0) 
       {
        return true;
       }
       return ((k > 63 && k < 91) || (k > 96 && k < 123) || (k > 43 && k < 58) || (k >39 && k<42) || k==13 || k == 8 || k == 9 || k == 32 || k==95 || k==46);

         /*
	 if(k==34 || k==92)
           alert("Please do not use single or double quotes or forward slash.");
	 return ((k > 63 && k < 92) || (k > 96 && k < 127) || (k > 41 && k <64) || (k >39 && k<42) ||(k >34 && k<40) || k==10 ||  k==13 || k == 8 || k == 9 || k == 27 || k == 32 || k == 33 || k==95 || k==46 );
         */ 

}



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
		
        document.form2.elements[i].value=alltrim(document.form2.elements[i].value);
    }
}


function isvalid(str)
{
  
  var i=0;
  for(i=0;i<str.length;i++)
  {
    var k=str.charAt(i);
   
    if(k=='\\' || k=='\'' || k=='\"' || k=='`')
    {
      return false;
    }
    
  }
  return true;
}

function check_agency_phone_fax(test)
{
        var len=0;
        var str="1234567890 -+";
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


function validate_empty()
{	
	var message="";

	findall();
     
	if(document.form2.company_name.value=="")
		message+="Please enter Company name\n";
	else{
	     if(!isvalid(document.form2.company_name.value))
	     {
		    message+="Please remove slashes and quotes from \"Company name\" field\n";
		    
	      }
	}

       if(document.form2.company_address.value=="")
                message+="Please enter Company address\n";
         else{
             if(!isvalid(document.form2.company_address.value))
             {
                    message+="Please remove slashes and quotes from \"Postal Address\" field\n";

              }
        }


        if(document.form2.company_website.value=="")
                message+="Please enter Company website\n";
        else{
             if(!isvalid(document.form2.company_website.value))
             {
                    message+="Please remove slashes and quotes from \"Website\" field\n";

              }
        }

	if(document.form2.company_about.value=="")
	  {
		message+="Please enter Company Brief write up\n";				
	  }	
	else
        {
	     if(!isvalid(document.form2.company_about.value))
	     {
		    message+="Please remove slashes and quotes from \"Brief write up on the Organisation\" field\n";
		    
	      }
	    var c_a=document.form2.company_about.value;
	    
	    if(c_a.length>480)
	    {
		     message+="Not more than 500 characters in\"Brief write up on the Organisation\" field\n";
		     

	    }
	    
	}	
	
	if(document.form2.category[6].checked==true)
	  {
		if(document.form2.category_other.value=="")
		  {
			message+="Please enter details of type of Organization in other field\n";


		  }
	      else{

		      if(!isvalid(document.form2.category_other.value))
			{
			  
			  message+="Please remove slashes and quotes from \"types of organization other\" field\n";
		    
			}
		  }

	  }



	if(document.form2.sector[7].checked==true )
	    {
		if(document.form2.sector_other.value=="")
		  {
		    message+="Please enter details of type of Sector\n";
		  }
	      else{
		    if(!isvalid(document.form2.sector_other.value))
			{
			  
			  message+="Please remove slashes and quotes from \"industry sector other\" field\n";
		    
			}
		  }
		
	    }

	if(document.form2.fcp_name.value=="")
		message+="Please enter FCP name\n";
	else{
	     if(!isvalid(document.form2.fcp_name.value))
	     {
		    message+="Please remove slashes and quotes from \"Name\" field\n";
		    
	      }
	}
	if(document.form2.fcp_designation.value=="")
		message+="Please enter FCP designation\n";
	else{
	     if(!isvalid(document.form2.fcp_designation.value))
	     {
		    message+="Please remove slashes and quotes from \"Designation\" field\n";
		    
	      }
	}
	if(document.form2.fcp_email.value=="")
		message+="Please enter FCP email\n";
	else{
	     if(!isvalid(document.form2.fcp_email.value))
	     {
		    message+="Please remove slashes and quotes from \"E-mail\" field\n";
		    
	      }
	}
	if(document.form2.fcp_mobile.value=="")
		message+="Please enter FCP Phone number\n";
	else{
	     if(!check_agency_phone_fax(document.form2.fcp_mobile.value))
	     {
		    message+="Please enter valid mobile number\n";
		    
	      }
	}

        if(document.form2.fcp_phone.value!="")
        {
           if(!check_agency_phone_fax(document.form2.fcp_phone.value))
             {
                    message+="Please enter valid phone number\n";

             }
        }

        if(document.form2.fcp_fax.value!="")
        {
           if(!check_agency_phone_fax(document.form2.fcp_fax.value))
             {
                    message+="Please enter valid fax number\n";

             }
        }

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

function enabletxt()
{
  var radioval=document.getElementById("category_6").checked;
  if(radioval==true)
  {
   document.getElementById("category_other").disabled=false; 
  }
  else
  {  
   document.getElementById("category_other").value=""; 
   document.getElementById("category_other").disabled=true; 
  } 
}

function enabletxt2()
{
  var radioval=document.getElementById("sector_7").checked;
  if(radioval==true)
  {
   document.getElementById("sector_other").disabled=false;
  }
  else
  {
   document.getElementById("sector_other").value=""; 
   document.getElementById("sector_other").disabled=true;
  }
}

</script>

</head>
<body onload = "showNewRecords();">
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="page" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>



<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>


<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Registration Form</a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>

<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li><a href="http://iitg.ernet.in" target="_blank" title="IIT Guwahati">IIT Guwahati Home</a>
       
      </li>
      <li><a href="http://iitg.ernet.in/placement" target="_blank" title="Training & Placement Cell">T&P Cell</a>
        
      </li>
     
      <li><a href="http://www.iitg.ernet.in/acad/courses_syllabee.php"  target="_blank" title="Courses Offered">Courses Offered & Syllabi</a></li>
     
    </ul>
  </nav>
</div>
<!-- content -->
<div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <div id="gallery" style="border:double">
                 <!--onSubmit="return validate_empty(form2)" -->
<form method="post" name="form2" id="form2" onSubmit="return validate_empty();" action="">
   <p align="center"><strong style="font-size:24px">Please fill the registration form</strong></p>
	<p  align = "center" style = "color:red"><strong>(* Marked fields are mandatory)</strong></p>
  <table width="90%" border="1" align="center">
    <tr>
      <td width="30%" style="text-align: right"><span style = "color:red">*</span>Name of the Company</td>
      <td width="70%" style="text-align: left"><label for="company_name"></label>
        <span id="sprytextfield1">
        <input name="company_name" type="text" id="company_name" size="45" onKeyPress="return alpha(event)">
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
    </tr>
    <tr>
      <td style="text-align: right"><span style = "color:red">*</span>Postal Address</td>
      <td style="text-align: left"><label for="company_address"></label>
        <span id="sprytextarea1">
        <textarea name="company_address" id="company_address" cols="51" rows="4" onKeyPress="return alpha(event)"></textarea>
        <span class="textareaRequiredMsg">A value is required.</span></span></td>
    </tr>
    <tr>
      <td style="text-align: right"><span style = "color:red">*</span>Website</td>
      <td style="text-align: left"><label for="company_about"></label>
        <span id="sprytextfield2">
        <input name="company_website" type="text" id="company_website" onKeyPress="return alpha(event)" value="ex: www.iitg.ernet.in" size="45">
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
    </tr>
    <tr>
      <td style="text-align: right"><span style = "color:red">*</span>Brief  write up on the Organisation(min-20 max-70 characters)</td>
      <td style="text-align: left"><label for="company_about"></label>
        <label for="company_about"></label>
        <span id="sprytextarea2">
        <textarea name="company_about" id="company_about" rows="9" cols="51"  onKeyPress="return alpha(event)" ></textarea>
        <span class="textareaRequiredMsg">A value is required.</span><span class="textareaMinCharsMsg">Minimum number of characters not met.</span><span class="textareaMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>

    </tr>
  </table>
 <br>
  <table width="90%" border="1" align="center">
    <tr style="text-align: center">
      <td width="50%"><strong><span style = "color:red">*</span>Type of Organization</strong></td>
      <td width="50%"><strong><span style = "color:red">*</span>Industry Sector</strong></td>
    </tr>
    <tr>
      <td height="100%"><table width="80%" border="1" align="center">
        <tr>
          <td width="50%" style="text-align: left"><input name="category" type="radio" id="category_2" value="Private" checked onClick="return enabletxt();">
            <strong>Private</strong></td>
          <td width="50%" style="text-align: left"><input type="radio" name="category" value="MNC(Indian Origin)" id="category_5" onClick="return enabletxt();">
            <strong>MNC(Indian Origin)</strong></td>
        </tr>
        <tr>
          <td style="text-align: left"><input type="radio" name="category" value="Govt." id="category_3" onClick="return enabletxt();">
            <strong>Govt.</strong></td>
          <td style="text-align: left"><input type="radio" name="category" value="MNC(Foreign origin)" id="category_0" onClick="return enabletxt();">
            <strong>MNC(Foreign origin)</strong></td>
        </tr>
        <tr>
          <td style="text-align: left"><input type="radio" name="category" value="PSU" id="category_4" onClick="return enabletxt();">
            <strong>PSU</strong></td>
          <td style="text-align: left"><input type="radio" name="category" value="NGO" id="category_1" onClick="return enabletxt();">
            <strong>NGO</strong></td>
        </tr>
       
        <tr><td><strong>
          <input type="radio" name="category" value="other" id="category_6" onClick="return enabletxt();" >
          Other:</strong></td><td>
          <input type="text" name="category_other" id="category_other" onkeypress="return alpha(event);" disabled>
      </td></tr>
       </table></td>
      <td><p><br>
      </p>
        <table width="100%" border="1" align="center">
          <tr>
            <td width="50%"><label>
              <input name="sector" type="radio" id="sector_0" value="Core Engg." checked onClick="return enabletxt2();">
              Core Engg.</label></td>
            <td width="204"><label>
              <input type="radio" name="sector" value="Analytics" id="sector_4" onClick="return enabletxt2();">
              Analytics</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="IT" id="sector_1" onClick="return enabletxt2();">
              IT</label></td>
            <td><label>
              <input type="radio" name="sector" value="Management" id="sector_5" onClick="return enabletxt2();">
              Management</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="Finance" id="sector_2" onClick="return enabletxt2();">
              Finance</label></td>
            <td><label>
              <input type="radio" name="sector" value="Education" id="sector_6" onClick="return enabletxt2();">
              Education</label></td>
          </tr>
          <tr>
            <td><label>
              <input type="radio" name="sector" value="Consulting" id="sector_3" onClick="return enabletxt2();">
              Consulting</label></td>
            <td><label>
              <input type="radio" name="sector" value="RandD" id="sector_8" onClick="return enabletxt2();">
              R&D </label></td>
          </tr>
	  <tr>
            <td><label>
              <input type="radio" name="sector" value="Oil and Gas" id="sector_9" onClick="return enabletxt2();">
              Oil and Gas</label></td>
            <td><label>
              <input type="radio" name="sector" value="E-Commerce" id="sector_10" onClick="return enabletxt2();">
              E-commerce</label></td>
          </tr>
	  <tr>
            <td><label>
              <input type="radio" name="sector" value="FMCG" id="sector_11" onClick="return enabletxt2();">
              FMCG</label></td>
            <td><label>
              <input type="radio" name="sector" value="Manufacturing" id="sector_12" onClick="return enabletxt2();">
              Manufacturing</label></td>
          </tr>
	  <tr>
            <td><label>
              <input type="radio" name="sector" value="Telecommunications" id="sector_13" onClick="return enabletxt2();">
              Telecomm.</label></td>
            <td>
                <p>&nbsp;  </p>
                </td>
          </tr>
           <tr>
            <td><strong>
          <input type="radio" name="sector" value="other" id="sector_7" onClick="return enabletxt2();">
          Other:</strong></td>
            <td>
                <label for="sector_other"></label>
          <input type="text" name="sector_other" id="sector_other" onkeypress="return alpha(event);" disabled>
                </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
 <br>
  <table width="90%" style="border:groove" align="center">
    <tr>
      <td width="100%"><table align="center">
        <tr>
          <td width="100%" style="text-align: center"><strong style="font-size:20px">Contact Details</strong></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="270"><table width="100%" border="1" align="center">
        <tr>
          <td width="50%" style="text-align: right"><strong><span style = "color:red">*</span>Name:</strong></td>
          <td width="50%" style="text-align: left"><label for="fcp_name"></label>
            <span id="sprytextfield3">
            <input type="text" name="fcp_name" id="fcp_name" onKeyPress="return alpha(event)">
            <span class="textfieldRequiredMsg">A value is required.</span></span></td>
        </tr>
        <tr>
          <td style="text-align: right"><strong><span style = "color:red">*</span>Designation:</strong></td>
          <td style="text-align: left"><label for="fcp_designation"></label>
            <span id="sprytextfield4">
            <input type="text" name="fcp_designation" id="fcp_designation" onKeyPress="return alpha(event)">
            <span class="textfieldRequiredMsg">A value is required.</span></span></td>
          </tr>
        <tr>
          <td style="text-align: right"><strong><span style = "color:red">*</span>E-mail:</strong></td>
          <td style="text-align: left"><label for="fcp_email"></label>
            <span id="sprytextfield5">
            <input type="text" name="fcp_email" id="fcp_email" onKeyPress="return alpha(event)">
            <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
          </tr>
        <tr>
          <td style="text-align: right"><strong><span style = "color:red">*</span>Mobile:</strong></td>
          <td style="text-align: left"><label for="fcp_mobile"></label>
            <span id="sprytextfield6">
            <input type="text" name="fcp_mobile" id="fcp_mobile">
            <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
          </tr>
        <tr>
          <td style="text-align: right"><strong>Phone:</strong></td>
          <td style="text-align: left"><label for="fcp_phone"></label>
            <input type="text" name="fcp_phone" id="fcp_phone"></td>
          </tr>
        <tr>
          <td style="text-align: right"><strong>Fax:</strong></td>
          <td style="text-align: left"><label for="fcp_fax"></label>
            <input type="text" name="fcp_fax" id="fcp_fax"></td>
          </tr>
      </table><br>
        <table width="50%" height="32" style="border:groove" align="center">
          <!-- For Captcha Implementation-->
          <tr style="text-align: center"><td align="center">
            <img src="captchaimage.jsp" id="imgCaptcha" style=""/><img src="refresh.gif" border=0 height="20px" width="20px" id="imgRefresh" title="Refresh image" onClick="setTimeout('resetCaptcha()', 300); return false;"></td>
          </tr>
          <tr style="text-align: center">
            <td><strong><span style = "color:red">*</span>Verification Code</strong></td>
          </tr>
          <tr style="text-align: center">
            <td><span id="sprytextfield7">
              <input id="input_captcha" type="text" name="input_cap" value="" />
              <span class="textfieldRequiredMsg">A value is required.</span></span></td>
          </tr>
          <tr style="text-align: center">
            <td width="40"> <input type="submit" value="Register" name="submit"  id="submit"></td>
          </tr>
        </table>
       </td>
    </tr>
  </table>
</form>
	
</div>
</div></div>

<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%; background:#000">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Cell, IIT Guwahati
    </center></p>
    
  </div>
</div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"], maxChars:100});
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["blur"]});
var sprytextarea2 = new Spry.Widget.ValidationTextarea("sprytextarea2", {validateOn:["blur"], minChars:20, maxChars:70});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {validateOn:["blur"]});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "none", {validateOn:["blur"]});
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "email", {validateOn:["blur"]});
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "integer", {validateOn:["blur"], minChars:10, maxChars:10});
var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "none", {validateOn:["blur"]});
</script>
</body>
</html>
