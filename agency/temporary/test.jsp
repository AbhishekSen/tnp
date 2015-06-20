<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value="/opt/IITG-PROJECT/SW-IIT/placement/agency/temporary/up_test/" />
</jsp:useBean>

<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
</head>
<body>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%
      int num_rows=0;
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
        
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
        

                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
				 UploadFile file = (UploadFile) files.get("uploadfile");
				
				 file.setFileName("test_"+file.getFileName());
				String fname=file.getFileName();
                    
					File file1=new File("/opt/IITG-PROJECT/SW-IIT/placement/agency/temporary/up_test/"+fname);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									response.sendRedirect("error.jsp");
								}
							}
                   
                    upBean.store(mrequest, "uploadfile");
					
                }
                else
                 
                {
                  out.println("upload fail1");
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

<form name="test" method="post" action="test.jsp" enctype="multipart/form-data">
<input type="file" name="uploadfile">
<br/>
<input type="submit" name="submit" value="submit">
</form>

</body>

</div> 
</html>
