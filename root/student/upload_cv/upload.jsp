<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<%@ page language="java" import="java.io.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

<script language="Javascript"><!--
  function doUpload()
  {
    document.upload.todo.value="upload";
	document.upload.submit();
  }

  //--></script>

</head>


<body onLoad="document.form_placement_record.agency_name.focus();">

<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();
	
%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>


<jsp:useBean id="upBean" scope="session" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="overwrite" value="true" />
  <jsp:setProperty name="upBean" property="filesizelimit" value="<%= 200*1024 %>" />
  <jsp:setProperty name="upBean" property="blacklist" value="*.zip,*.rar,*.exe,*.jsp" />
  <jsp:setProperty name="upBean" property="whitelist" value="*.pdf" />
</jsp:useBean>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../../student/main.jsp">Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
 </td>

  <div id="content"> 
    <div class="feature">
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                // Uses the bean now to store specified by jsp:setProperty at the top.
                upBean.setFolderstore(gpath+"placement_uploads/student/uploads");
                upBean.store(mrequest);
                // Displays info about uploaded files for this session.
                %>
                <b>Upload history : </b>
                <ul><font size="-2" face="Verdana, Arial, Helvetica, sans-serif">
                <%
                Vector history = upBean.getHistory();
                for (int i=0;i<history.size();i++)
                {
                    UploadParameters up = (UploadParameters) history.elementAt(i);
                    out.println("<li>Uploaded file : "+up.getFilename()+" ("+up.getFilesize()+" bytes)"+" Content Type : "+up.getContenttype());
                }
                upBean.setFolderstore(gpath+"placement_uploads/temp");
                upBean.resetStore();
                %>
                </font></ul>
                <%
	     }
         else out.println("<BR> todo="+todo);
      }
%>
<form method="post" action="upload.jsp" name="upload" enctype="multipart/form-data">
  <table width="70%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
      <td align="left"><b>Select files to upload :</b></td>
    </tr>
    <tr>
      <td align="left">i)Filesize limit allowed 200kb.<br/>ii)Files already present will be overwritten.<br/>iii) Files will be saved by their given names i.e., no change in filename occurs
        </td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile1" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile2" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile3" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile4" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile5" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile6" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile7" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile8" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile9" size="50"></td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="uploadfile10" size="50"></td>
    </tr>

    <tr>
      <td align="left">
        <input type="hidden" name="todo">
        <input type="button" name="Submit" value="Upload" onClick="doUpload()">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
  <br>
  <br>

  </form>


</div></div>
  <tr>
    <td colspan="2" height="20">   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    GCom  </div> </td></tr></table>
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
