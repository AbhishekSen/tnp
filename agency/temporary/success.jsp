<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!--placement\agency\temporary   -->
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training and Placement Cell IIT Guwahati</title>

<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />
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
<script type="text/javascript">
var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function change_data()
{
	var i;
	i=document.getElementById("content");
	var str="Now i've changed this whole feature!!!"
	str+= "<br>This may just be <BR> useful in AJAX.<br><br>Let us see!!";
	i.innerHTML=str;
	document.getElementById("infobar").innerHTML="<h3 id=\"infotitle\">Data Changed! </h3><br><br><br> <a href=\"javascript:clearinfo()\" id=\"infohide\">Hide</a><br>";
	document.getElementById("pagecell1").style.top='180px';
	var j=document.styleSheets[0];
	alert(document.getElementById("infobar").style.position);
	alert(document.getElementById("infobar").offsetHeight);
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112px';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}
function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency\n" ;
	
  if (ptr.agency_email.value.length == 0 )
        message+="Please enter the Email. \n" ;
		
  if (ptr.agency_person.value.length == 0  )
        message+="Please enter the Person \n" ;
		
  if (ptr.agency_website.value.length == 0)
  		message+="Please enter the Website of Posting \n" ;
		
   

		
	
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
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>





</head>
<body onLoad="showNewRecords();">
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />



<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_agency_details1.agency_details1" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="agency_website" param="agency_website" />
<jsp:setProperty name="obj_placement_record" property="agency_email" param="agency_email" />
<jsp:setProperty name="obj_placement_record" property="agency_person" param="agency_person" />
<jsp:setProperty name="obj_placement_record" property="agency_phone" param="agency_phone" />
<jsp:setProperty name="obj_placement_record" property="agency_mobile" param="agency_mobile" />
<jsp:setProperty name="obj_placement_record" property="agency_fax" param="agency_fax" />
<jsp:setProperty name="obj_placement_record" property="average_package" param="average_package" />
 

<%
        db.fetchConfigDetails(); //newly added
 

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	String agency_website=obj_placement_record.getAgency_website();
	String agency_email=obj_placement_record.getAgency_email();
	String agency_person=obj_placement_record.getAgency_person();
	String agency_phone=obj_placement_record.getAgency_phone();
	String agency_mobile=obj_placement_record.getAgency_mobile();
	String agency_fax=obj_placement_record.getAgency_fax();
	String average_package=obj_placement_record.getAverage_package();
 
//out.println(confirmation);

	if(submit!=null && agency_name!=null && agency_website!=null && agency_email!=null && agency_person!=null && agency_mobile!=null&& average_package!=null  )
		{				
			int num_rows=0;//,agency_id=0,student_id=0;
			
	
	 
	
	
 
	//out.println(j);
	 
		
		{	 
			//out.println(confirmation);
				String main_record=" insert into temporary_agency(agency_name,agency_website,agency_person,agency_email,agency_phone,agency_fax,agency_mobile,average_package)"+" values ('"+agency_name+"','"+agency_website+"','"+agency_person+"','"+agency_email+"','"+agency_phone+"','"+agency_fax+"','"+agency_mobile+"',"+Double.parseDouble(average_package)+");";
				//out.println(main_record);
				db.connect();
				num_rows=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows==1)
					{
						out.println(display1+"Record Added in Agency Record"+display2);
					 

					}
				else
				out.println(display1+"Could not add record in Agency Record"+display2);
			 }	
		
	}
	
	
%>


<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Registration Form</a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Cell</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li><a href="http://iitg.ernet.in" target="_blank" title="IIT Guwahati">IIT Guwahati Home</a>
       
      </li>
      <li><a href="http://iitg.ernet.in/placement" target="_blank" title="Training & Placement Cell">T&P Cell</a>
        
      </li>
     
      <li><a href="http://www.iitg.ernet.in/acad/courses_syllabee.php"  target="_blank" title="Courses Offered">Courses Offered & Syllabi</a></li>
	<li><a href="../../index.jsp"  target="_blank" title="Placement Portal">Back to home page</a></li>
    </ul>
  </nav>
</div>
<!-- content -->
<div class="wrapper row3" style="width:100%;">

<!-- ################################################################################################ -->
<div id="container">

    <!-- ################################################################################################ -->
    <div id="portfolio"  class="three_quarter; nowrap">
      <ul class="clear">
      
      
       
						 
    <p align="center"><strong>Thank You For Registering!!</strong>  </p>
    <p align="center"><strong>You will be contacted soon by the Training and Placement Cell - IIT Guwahati</strong></p><br/>
    <p><strong>Steps following initial registration:</strong></p>
      <ul> 
          <li><strong>You will be receiving login credentials from noreply@iitg.ernet.in. </strong></li>
          <li><strong>After receiving the credentials, kindly visit https://auto.iitg.ernet.in/tnp and log on to company login.</strong></li>
          <li><strong>After successful login, fill the job announcement form and salary details.</strong></li>    
          <li><strong>Any document and pdf having other details about the organization can be uploaded in organization literature tab.</strong></li>
          <li><strong>Placement cell will be approving your profile and thereafter you can view the eligible student details.</strong></li>
          <li><strong>Please feel free to contact placement cell in case of any queries.</strong></li>
    </ul>
    <br/>
    <p align="center"><strong>Contact details of Training and Placement Cell-
    <br/>Email: placement@iitg.ernet.in
    <br/>Phone: 0361 2582175</strong></p><br/>   
					</div> 
      
</ul></div>
<div class="clear"><!-- Footer -->
</div>
<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%; background:#000">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Cell, IIT Guwahati
    </center></p>
    
  </div>
</div>
<!-- Scripts -->
<script src="../../js/jquery-latest.min.js"></script>
<script src="../../js/jquery-ui.min.js"></script>
<script>window.jQuery || document.write('<script src="../layout/scripts/jquery-latest.min.js"><\/script>\
<script src="../layout/scripts/jquery-ui.min.js"><\/script>')</script>
<script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
<script src="../../layout/scripts/jquery-mobilemenu.min.js"></script>
<script src="../../layout/scripts/custom.js"></script>
</body>
</html>









