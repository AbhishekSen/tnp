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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>


<link href="layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
<!--[if lt IE 9]>
<link href="layout/styles/ie/ie8.css" rel="stylesheet" type="text/css" media="all">
<script src="layout/scripts/ie/css3-mediaqueries.min.js"></script>
<script src="layout/scripts/ie/html5shiv.min.js"></script>
<![endif]-->
<!-- Slider -->
<link href="layout/scripts/responsiveslides.js-v1.53/responsiveslides.css" rel="stylesheet" type="text/css" media="all">
<!--link rel='stylesheet' href='stylesheet/style.css'>
<link rel="stylesheet" href="stylesheet/styles.css" type="text/css" media="screen" /--> 
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
<style type="text/css">
<!--
.style12 {font-family: Georgia, "Times New Roman", Times, serif}
.style13 {color: #006666;
	font-weight: bold;
}
-->
</style>
</head>
<body>

 <div id = "divMain" >
          <div id = "container">
            <div id = "header">
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                        <ul class="SlidingMenu Horizontal">
                        <li><a href="http://www.iitg.ernet.in">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement">Placement Cell</a></li>
                        <li><a href="https://webmail.iitg.ernet.in/">Webmail</a></li>
                      </ul>
                        <div class="ClearFix"></div>
                    </div>
                </div>
              <div  id = "headerTop">
                <div id ="title">
                  <span id = "spanTitleFirst">
                    Training & Placement Cell - 
                  </span>
                  <span id = "spanTitleSecond">
                    IIT Guwahati
                  </span>
                </div>
               <%-- <div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                     <div id = "indexCenter" class = "indexCenter">
                        <div id = "logo">
                          <img src = "images/logo-top.gif" alt= "IIT GUAWAHATI"/>
                        </div>
                        <div id = "login">
                          <div id = "leftLogin">
                            <span id = "adminLogin">
                                  Company Login
                            </span>
                            <div id = "adminLoginContent" style = "">
                              <div>
                                <div style= "float:left;padding-left:5%;">
                                  Already Registered? Please login
                                </div>
                                <div class = "divSpan">
                                  <span style = "margin-bottom:2%;">User name:</span>
                                  <span >Password: </span>
                                </div>  
                                <form name="login" method="post" action="process.jsp">
                                  <div class = "divInput">
                                    <input type = "text" name="username" required = "required"  maxlength="25" style = "margin-bottom:2%;width:90%;" />
                                    <input type = "password" name="password"  required = "required" maxlength="25" style = "margin-bottom:2px;width:90%;"/>
                                  </div>
                                  <div  class = "divSubmit">
                                    <input type = "submit" class = "button" name="login" id="login" value="Login">
                                  </div>
                                </form>

                              </div>

                             <div id = "companyRegistration2" style = "clear:both;">
                                For New Company Registration
                             <a href="agency/temporary/new_registration.jsp">Click Here</a>
                            </div>


                            </div>
                          </div>
                          <div style = "float:right;width:50%">
                            <span id = "studentLogin">
                                  Student Login  
                            </span>
                            
                            <div id = "studentLoginContent">
                              <div>
                                <div style= "float:left;padding-left:20%;">
                                  please enter login details
                                </div>
                                <div class = "divSpan">
                                  <span style = "margin-bottom:2%;">User name:</span>
                                  <span >Password: </span>
                                </div>  
                                <form name="login" method="post" action="process_stud.jsp">
                                  <div class = "divInput">
                                    <input type = "text" name="username" required = "required" maxlength="25"style = "margin-bottom:2%;width:90%;"/>
                                    <input type = "password" name="password"  required = "required" maxlength="25" style = "margin-bottom:2px;width:90%;"/>
                                  </div>
                                  <div class = "divSubmit">
                                    <input type = "submit" class = "button" name="login" id="login" value="Login">
                                  </div> 
                                  
                                </form>


                              </div>
                            </div>
                          </div>




                        </div>
                     </div>
                  </div>
             
           <div id="digi" name="digi" style="float: right">
                         <!-- Begin DigiCert/ClickID site seal HTML and JavaScript -->
<div id="DigiCertClickID_un9L8Fx-" data-language="en_US">
        <a href="http://www.digicert.com/ssl-certificate.htm"></a>
</div>
<script type="text/javascript">
var __dcid = __dcid || [];__dcid.push(["DigiCertClickID_un9L8Fx-", "3", "m", "black", "un9L8Fx-"]);(function(){var cid=document.createElement("script");cid.async=true;cid.src="//seal.digicert.com/seals/cascade/seal.min.js";var s = document.getElementsByTagName("script");var ls = s[(s.length - 1)];ls.parentNode.insertBefore(cid, ls.nextSibling);}());
</script>
<!-- End DigiCert/ClickID site seal HTML and JavaScript -->
                </div>
               <%--
                 <div id = "companyRegistration" style = "clear:both;">
                      <ul>
                        <li>
                          For New Company Registration
                          <a href="agency/temporary/new_registration.jsp">Click Here</a>
                        </li>
                      </ul>
                   </div>
               --%>
              </div>
              <div id = "footer">
                <span>© 2014  Indian Institute of Technology Guwahati. Queries to: placement[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>

