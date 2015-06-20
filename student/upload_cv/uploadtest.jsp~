<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.lang.*,java.io.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>

<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/student/uploads/";
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>

<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

var time = 3000;
var numofitems = 7;


function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
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
				
function closesubnav(event)
{
  if ((event.clientY <48)||(event.clientY > 107))
  {
    for (var i=1; i<= numofitems; i++)
	{
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}




</script>

<script src="../js/datetimepicker.js"></script>
</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<% //db.fetchConfigDetails(); %>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	

        db.fetchConfigDetails();
	String temp="select username from session where session_id='"+sid+"'";	
	db.connect();
	ResultSet r=db.execSQL(temp);
	String uname="";
	String roll_no="";
	if(r.next())
	{uname=r.getString(1);}
	temp="select student_roll_number from student_record where username='"+uname+"'";
	ResultSet r1=db.execSQL(temp);
	if(r1.next())
	{
		roll_no=""+r1.getInt(1);
	}
	db.close();
	r.close();
	r1.close();	
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%/*

		
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
					file.setFileName(roll_no+".pdf");

					long file_size=file.getFileSize();
					String conttype=""+file.getContentType();
					String req1="application/pdf";
                    if (file != null )
					{ //out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
					
						if(conttype.equals(req1)&&file_size<=153600)
						{
						   String f_name="placement/student/uploads/"+roll_no+".pdf";
							File file1=new File(f_name);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									response.sendRedirect("error.jsp");
								}
							}
							upBean.store(mrequest, "uploadfile");
							response.sendRedirect("success.jsp");
						}
						else
						{
							response.sendRedirect("error2.jsp");
						}
                    }
					else
					{
						response.sendRedirect("error.jsp");}
                	}
                else
                {
                  out.println("<br>No uploaded files");
				  
                }
	     }
         else out.println("<BR> todo="+todo);
      }
*/
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
   <div id="utility"> 
    <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> 
  </div> 
  <div id="globalNav"> 

 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink">
      <div id="globalLink2"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    </div> 
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div>
  <div id="pageNav">
    <div id="sectionLinks">      
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp" >Edit Registration Details</a>
	  <a href="upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp" >Check Eligibility</a><a href="../agency_query/placement_query.jsp" >Organization Information</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
   <%--   <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a>
<img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" /></div>
     
     </div>
  <div id="content"> 
    <div class="feature">
<form method="post" action="upload.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="5" cellpadding="5" align="center" class="style1">
    <tr><td><%/*
      <td align="left"><p><b>Select a file to upload :</b></p></td>
    </tr>
    <tr>
      <td align="left">
        <input type="file" name="uploadfile" size="50"></td>
    </tr>
    <tr>
      <td align="left">
		<p>
		  <input type="hidden" name="todo" value="upload">
		  <input type="submit" name="Submit" value="Upload CV1">
		  <input type="reset" name="Reset" value="Cancel"> 
		  </p>
		<p>To upload CV2 go <a href="upload1.jsp">here</a>.</p>*/%>
		<p>Your present uploaded CV1 is <a href="down_cv.jsp?cv_id=0">here</a>.</p>
		<p>Your present uploaded CV2 is <a href="down_cv.jsp?cv_id=1">here</a>.</p></td>
    </tr>
  </table>
  <p><br>
    <br>
</p>
  <p>&nbsp;</p><!--
  <p align="center"><strong>Note: Limit of file size is 150kb for each CV and the file should be in PDF format.</strong></p>-->
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
  <p align="center">&nbsp;</p>
</form>

 

    <p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name
  </div> 
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
