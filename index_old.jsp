<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,java.io.*" %>

<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%

if (request.getSession(false) != null )
{
	String sid = null; 
	sid = request.getSession(false).getId() ;

           try{
                db.fetchConfigDetails(); //newly added
              	db.connect();
		
				String sql = "delete from session where session_id = \'"+sid+"\' " ;
				//System.out.println(sql);
				int num_rows=db.updateSQL(sql);
				if(num_rows==1)
					session.invalidate() ;
	     }
	     catch (SQLException sq)
             {
               out.println ("SQL Exception: "+sq.getMessage());
             }
	     catch (Exception e)
             {
               out.println ("Exception: "+e.getMessage());
             }
             finally
             {
               db.close ();
             }
    }
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Training &amp; Placement Cell, IIT Guwahati</title>
<link rel="shortcut icon" href="images/demo/favicon.ico" type="image/x-icon" />
<meta charset="iso-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<!--[if lt IE 9]>
<link href="layout/styles/ie/ie8.css" rel="stylesheet" type="text/css" media="all">
<script src="layout/scripts/ie/css3-mediaqueries.min.js"></script>
<script src="layout/scripts/ie/html5shiv.min.js"></script>
<![endif]-->
<!-- Slider -->
<link rel="icon" type="image/x-icon" href="images/iit_icon.ico"/>

<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css">
<script src='javascript/jquery.min.js'></script>
<script type="text/javascript" src="javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
  $(function(){ 
	  $('#adminLogin').click(function()
	  {
		$('#studentLogin').show();
		$('#studentLoginContent').hide();
		$('#adminLoginContent').show();
		$('#adminLogin').slideUp("fast");
	  });
	   $('#studentLogin').click(function()
	  {
		$('#adminLogin').show();
		$('#adminLoginContent').hide();
		$('#studentLoginContent').show();
		$('#studentLogin').slideUp("fast");
	  });
	  //$('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
	});
	</script>
	<script type="text/javascript">
	jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity:0.5 });
	});
 </script>

</head>
<body>
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
	    <p>
      <h1><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training &amp; Placement Cell</a></h1>
      <h2><a href="http://www.iitg.ernet.in/" target="_blank">Indian Institute of Technology Guwahati</a></h2>
    </hgroup>
	
    <!-- <div id="header-contact">
      <ul class="list none">
        <li><span class="icon-envelope"></span> <a href="#">info@domain.com</a></li>
        <li><span class="icon-phone"></span> +xx xxx xxxxxxxxxx</li>
      </ul>
    </div> -->
	<a href="http://www.iitg.ernet.in/" target="_blank"><img src="images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
  </header>
</div>
<!-- ################################################################################################ -->

<div class="wrapper row3">
  <div id="container">
    <!-- ################################################################################################ -->
    <div id="gallery">
      <section>
        <figure style="background:#999">
          <p align="center">&nbsp;<h2 style="color:#000" align="center">Welcome</h2>
		</p>
          <ul class="clear">
            <li class="one_half first">
            
            <div id="login-form">

        <h3>Recruiter Login</h3>

        <fieldset>

         <form name="login" method="post" action="process.jsp">
           
                    <footer class="clearfix"><span id="sprytextfield1">
                      <input name="username" type="text" id="username" size="25">
                      <span class="textfieldRequiredMsg">A value is required.</span></span><span id="sprypassword1">
                      <input name="password" type="password" value="password" size="25" value-"pass">
                      <span class="passwordRequiredMsg">A value is required.</span></span>
                      <input type="submit" value="Login"  name="login" id="login">

               

                    <p><span class="info">?</span><a href="forget_password.jsp">Forgot Password</a></p>
<div id = "companyRegistration2" style = "clear:both;">
                                For New Company Registration
                             <a href="agency/temporary/new_registration.jsp">Click Here</a>
                            </div>
                </footer>

            </form>

        </fieldset>
        </div>

</li>


            <li class="one_half"><div id="login-form">
 <h3>Student Login</h3>

        <fieldset>

            <form name="login" method="post" action="process_stud.jsp"><!-- JS because of IE support; better: placeholder="Password" -->

                

                 <footer class="clearfix"><span id="sprytextfield2">
                   <input name="username" type="text" id="username" size="25">
                   <span class="textfieldRequiredMsg">A value is required.</span></span><span id="sprypassword2">
                   <input name="password" type="password" value="password" size="25" value-"pass">
                   <span class="passwordRequiredMsg">A value is required.</span></span>
                   <input type="submit" value="Login"  name="login" id="login">
                      
                        <p><span></span></p>
                    </footer>

            </form>

        </fieldset>

    </div></li>
          </ul>
          
           <div id="DigiCertClickID_un9L8Fx-" data-language="en_US">
        <a href="http://www.digicert.com/ssl-certificate.htm"></a>
</div>
<script type="text/javascript">
var __dcid = __dcid || [];__dcid.push(["DigiCertClickID_un9L8Fx-", "3", "m", "black", "un9L8Fx-"]);(function(){var cid=document.createElement("script");cid.async=true;cid.src="//seal.digicert.com/seals/cascade/seal.min.js";var s = document.getElementsByTagName("script");var ls = s[(s.length - 1)];ls.parentNode.insertBefore(cid, ls.nextSibling);}());
</script></figure>
      </section></div></div></div>  
     
      <!--Footer -->
<div class="wrapper row4" style="position:absolute; top: 92%;">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Cell, IIT Guwahati
    </center></p>
    
  </div>
</div>
<!-- Scripts -->
<script src="js/jquery-latest.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script>window.jQuery || document.write('<script src="layout/scripts/jquery-latest.min.js"><\/script>\
<script src="layout/scripts/jquery-ui.min.js"><\/script>')</script>
<script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
<script src="layout/scripts/responsiveslides.js-v1.53/responsiveslides.min.js"></script>
<script src="layout/scripts/jquery-mobilemenu.min.js"></script>
<script src="layout/scripts/custom.js"></script>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"], hint:"Username"});
var sprypassword1 = new Spry.Widget.ValidationPassword("sprypassword1", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["blur"], hint:"Webmail Id"});
var sprypassword2 = new Spry.Widget.ValidationPassword("sprypassword2", {validateOn:["blur"]});
</script>
</body>
</html>
