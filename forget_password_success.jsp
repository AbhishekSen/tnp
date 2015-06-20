<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,java.io.*" %>
<%@ include file="utils/drop_down.jsp"%>
<%@page language="java" import="pack.DbBean"%>
<%@ include file="utils/get_unique_field.jsp"%>
<%@ include file="utils/encode_sql.jsp"%>
<jsp:useBean id="db" class="pack.DbBean" scope="page" />





<%
    db.fetchConfigDetails(); //newly added
	int agency_id=0;
	int student_id=0;
	int count=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String user_name=request.getParameter("user_name");	
	String email=request.getParameter("email");	
	String security_question=request.getParameter("security_question");	
	String answer=request.getParameter("answer");	
	String current_email="";
	String current_security_question="";
	String current_answer="";
//out.println(confirmation);

	if(submit!=null && user_name!=null && email!=null && !security_question.equals("0") && answer!=null)
		{				
	
	String sql_get_data="select count(*) from agency where username='"+user_name+"';" ;		
		db.connect(); 
			ResultSet rs= db.execSQL(sql_get_data);
			if(rs.next()) 
			{
				count=rs.getInt(1);
			}
			rs.close();
			db.close();
		if(count!=0)
		{
			sql_get_data="select agency_id,agency_email from agency where username='"+user_name+"';" ;
					db.connect(); 
					rs= db.execSQL(sql_get_data);
					if(rs.next()) 
					{agency_id=rs.getInt(1);
					current_email=rs.getString(2);
					}
					rs.close();
					db.close();

			sql_get_data="select question, answer from agency as A, security_questions as SQ, agency_security_questions as ASQ where A.agency_id=ASQ.agency_id and SQ.question_id=ASQ.question_id and A.agency_id='"+agency_id+"';";
					db.connect(); 
					rs= db.execSQL(sql_get_data);
					if(rs.next()) 
					{current_security_question=rs.getString(1);
	
					current_answer=rs.getString(2);
					}
					rs.close(); 
					db.close();	
				//if(user_name)
		}
		else
		{
			response.sendRedirect("error.jsp");
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

<form name="forget_password" method="post" id="forget_password" action="forget_password.jsp">
           <p align="center"> <strong> Please fill the form to recover your password.</strong></p>
   <table width="827" border="0" align="center">
    <tr>
      <td width="257" style="text-align: right"><span style = "color:red">*</span>Login User Name</td>
      <td width="560" style="text-align: left"><label for="user_name"></label>

        <input name="user_name" type="text" id="user_name" size="45" onKeyPress="return alpha(event)">
        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></td>
    </tr>
    <tr>
      <td style="text-align: right"><span style = "color:red">*</span>Email ID</td>
      <td style="text-align: left"><label for="email"></label>
        <input name="email" id="email" cols="51" rows="4" onKeyPress="return alpha(event)">
        </td>
    </tr>
<tr>
	<td style="text-align: right">Select Sequrity Question:
		</td><td style="text-align: left"><%! String security_question ;%>
		<% security_question =drop_down("select question from security_questions;",db) ; %>
		<select name="security_question" id="security_question">
		<option value="0">-----------------------------------------select-----------------------------------------</option>
		<%=security_question%>
		</select>	
	</td>
</tr>

    <tr>
      <td style="text-align: right"><span style = "color:red">*</span>Answer</td>
      <td style="text-align: left"><label for="answer"></label>

        <input name="answer" id="answer" rows="9" cols="51"  onKeyPress="return alpha(event)" >
        <span class="textareaMinCharsMsg">Maximum number of characters : 20.</span></td>

    </tr>
  </table>
<p align="center"><font color="green"></strong>Your request has been submitted.<strong></font></p>
<p align="center"><font color="green"></strong>Kindly check your mail.<strong></font></p>
<p align="center"><input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" ></p>
            </form>
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
