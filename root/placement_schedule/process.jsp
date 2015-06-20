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

</head>
<body onLoad="document.form_placement_record.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<% db.fetchConfigDetails();%>



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

 

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String agency_name=obj_placement_record.getAgency_name();
	String agency_website=obj_placement_record.getAgency_website();
	String agency_email=obj_placement_record.getAgency_email();
	String agency_person=obj_placement_record.getAgency_person();
	String agency_phone=obj_placement_record.getAgency_phone();
	String agency_mobile=obj_placement_record.getAgency_mobile();
	String agency_fax=obj_placement_record.getAgency_fax();
	String agency_profile=request.getParameter("agency_profile");
 
//out.println(confirmation);

	if(submit!=null && agency_name!=null && agency_website!=null && agency_email!=null && agency_person!=null && agency_mobile!=null  )
		{				
			int num_rows=0;
			
			
	
	 
	
	
 
	
	 
		
		{	 
			
				String main_record=" insert into temporary_agency(agency_name,agency_website,agency_person,agency_email,agency_phone,agency_fax,agency_mobile,agency_profile, username, password)"+" values ('"+agency_name+"','"+agency_website+"','"+agency_person+"','"+agency_email+"','"+agency_phone+"','"+agency_fax+"','"+agency_mobile+"','"+agency_profile+"', '"+username+"', '"+password+"');";
				
				
				
				db.connect();
				num_rows=db.updateSQL(main_record);
				db.close();	
				if(num_rows==1 )
					{			
						//out.println(password);
							response.sendRedirect("success.jsp");
					 

					}
				else
					response.sendRedirect("error.jsp");
			 }	
		
	}
	
	
%>
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> 
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
  <tr>
    <td colspan="2" height="20">   
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
  GCom  </div> </td></tr></table>
</div> 
<!--end pagecell1--> 

</body>
</html>
