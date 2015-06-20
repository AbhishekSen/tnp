<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value="/opt/IITG-PROJECT/SW-IIT/placement/agency/temporary/company_writeup/" />
</jsp:useBean>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>


<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">


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
<body>

<%

String submit=request.getParameter("submit");

if(submit!=null)
{
  
      if(MultipartFormDataRequest.isMultipartFormData(request))
      {
        
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
        
        
		if(mrequest != null)
                  {
                
		        Hashtable files = mrequest.getFiles();
		        if ( (files != null) && (!files.isEmpty()) )
		        {
					 UploadFile file = (UploadFile) files.get("uploadfile");
				
					 file.setFileName("test_"+file.getFileName());
					 String fname=file.getFileName();
		            
						File file1=new File("/opt/IITG-PROJECT/SW-IIT/placement/agency/temporary/company_writeup/"+fname);
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
		          out.println("upload fail1");
		        }
                  }
	

      }

}
%>


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
  <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div></td>
 
<form method="post"  action="process1.jsp"  enctype="multipart/form-data" >
<center> 
<table width="600" height="400">

<tr>
 <td>Company write up:</td>
 <td><input type="file" name="uploadfile"></td>
</tr>
<tr>
 <td></td>
 <td><input type="submit" name="submit" value="submit"></td>
</tr>
<tr>
 <td><a href="success.jsp">Skip Company Write up</a></td>
</tr>

</table>
 
<center> 
  
 
  

</form>
	


<tr>
  <td colspan="2" height="20">   
  <div id="siteInfo"></div> </td></tr></table>
</div> 
<!--end pagecell1--> 
<br> 

</body>
</html>
