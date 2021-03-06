<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel='stylesheet' href='../../stylesheet/style.css'>
<link rel="stylesheet" href="../../stylesheet/styles.css" type="text/css" media="screen" /> 
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
			$('#slideUp').slideUp("slow");			
		}
</script>
<script type="text/javascript">
<!--
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
	document.getElementById("infobar").innerHTML="<font class=\"infotitle\">Data Changed! <br><br> <a href=\"javascript:clearinfo()\">Hide</a>";
	document.getElementById("pagecell1").style.top='160';
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
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
// -->
</script>
<script type="text/javascript">
function validate_empty1(ptr)                                       
{
var message=""; 
 if(ptr.agency_person.length==0)
       message+="Please enter  Name of Person\n" ;
	
 if (ptr.agency_email.length == 0 )
        message+="Please Enter Email Address  \n" ;  
		
 if (ptr.agency_address.length == 0 )
        message+="Please Enter  Address \n" ;
		
  if (ptr.agency_phone.length == 0 )
        message+="Please Enter Phone Number\n" ;
  
  if (ptr.agency_fax.length == 0 )
        message+="Please enter Fax Number \n" ;
		
  if (ptr.agency_mobile.lenght == 0 )
        message+="Please enter Mobile Number \n" ; 
 
 
 if (message.length > 0)
 {  
    alert(message);
    return false;
  } 
 else
 return true;
} 

</script>
</head>
<body>


<div id = "container">
            <div id = "header">
              <div>
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                      <ul class="SlidingMenu Horizontal">
                        <li><a href="../instructions.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></li>
                      </ul>
                      <div class="ClearFix"></div>
                    </div>
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
               <%--<div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                <div id = "divMain">
                 <div class = "mainMenu">
					<div id="VerticalSlidingMenu">
						<ul class="SlidingMenu">
						  <li><a href='../instructions.jsp'>Instructions</a></li>
						  <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
						  <li><a href="add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="../uploads/upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="../change_password/change_password.jsp">Change Password</a></li>
						  <li><a href="../../logout.jsp">Logout</a></li>
						 
						</ul>
					  </div>
                 </div>
                 <div class = "mainContainer" id="mainContainer">
          					<div id = "slideUp" style = "display:none;color:white;">
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          					</div> 
					 <div id = "center" class = "center">
						  <%@page language="java" import="pack.DbBean"%>
						  <%@page language="java" import="java.sql.*"%>
						  <jsp:useBean id="db" class="pack.DbBean" scope="session"/>
						  <p align="center"><strong>Details updated Successfully !!</strong></p>
						  <p align="center"><strong>Please Wait for admin approval !!</strong></p>
						  <p align="center"><strong>Thank you.</strong></p>    
					</div> 
                </div>
              </div>
              <div id = "footer">
              <span>� 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
