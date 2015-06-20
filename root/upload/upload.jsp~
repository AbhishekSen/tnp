<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<%@ page errorPage="ExceptionHandler.jsp" %>
<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ include file="../utils/session_validator.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/root/company_ppt/";	
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>
<%@ page language="java" import="java.sql.*,java.io.*"%>
<%@ page import="java.lang.*" %>
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
<body onLoad="call_fun();">

<%

    String file_name=request.getParameter("file_name");
    if(file_name!=null)
    {
        File file1=new File(gpath+"placement_uploads/root/company_ppt/"+file_name);
        if(file1.exists())
        {
            if(!file1.delete())
            {
                %>
                <script type="text/javascript">
                    function call_fun()
                    {
                    alert("Could not delete file. Please try again.");
                    }
                </script>
                <%
            }
            else
            {
                db.fetchConfigDetails();
                db.connect();
                int i=db.updateSQL("delete from company_ppt where file_name='"+file_name+"';");
                db.close();
                %>
                <script type="text/javascript">
                    function call_fun()
                    {
                    alert("File deleted.");
                    }
                </script>
                <%
            }
        }
    }
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         String agency_id=mrequest.getParameter("agency_id");
        String sql_agencyname="select agency_name from agency where agency_id='"+agency_id+"';" ;
        db.connect();
        ResultSet rsab=db.execSQL(sql_agencyname);
        rsab.next();
        String agen_name=rsab.getString(1);
        rsab.close();
        db.close();

         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
				 UploadFile file = (UploadFile) files.get("uploadfile");
                    if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "uploadfile");
                    
                    String main_record=" insert into company_ppt (file_name , agency_name,agency_id)"+" values ('"+file.getFileName()+"' , '"+agen_name+"','"+agency_id+"') ;";
                    db.connect();
                    int num_rows=db.updateSQL(main_record);
                    db.close();
                    if(num_rows==1)
                    {
                            response.sendRedirect("success.jsp");
                    }
                    else
                    {
                            response.sendRedirect("error.jsp");
                    }
                    //response.sendRedirect("success.jsp");
              }
                else
                {
                  response.sendRedirect("error.jsp");
                }
	     }
         else out.println("<BR> todo="+todo);
      }

%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
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
    <h2>Welcome Administrator</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
    <div class="relatedLinks">
      
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
<form method="post" action="upload.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="5" cellpadding="5" align="center" class="style1">
    <tr>
      <td align="left"><b>Select a file to upload :</b></td>
    </tr>
    <tr>
      <td align="left">
        <input type="file" name="uploadfile" size="50">
        </td>
        <td>
            <select name="agency_id" id="agency_id">
            <%
            db.fetchConfigDetails();
            db.connect();
            ResultSet rs=db.execSQL("select agency_id,agency_name from agency;");
            while(rs.next())
            {
                out.println("<option value=\""+rs.getString("agency_id")+"\">"+rs.getString("agency_name")+"</option>");
            }
            rs.close();
            db.close();
            %>
            </select>
        </td>
    </tr>
    <tr>
      <td align="left">
		<input type="hidden" name="todo" value="upload">
        <input type="submit" name="Submit" value="Upload">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
  

  <br>
  <br>
  <p>&nbsp;</p>
  <p align="center"><strong>Note: Please rename the ppt with the Company Name- Type as filename.</strong></p>
  <p>&nbsp;</p>
    <p>&nbsp;</p>
</form>
<table align="center">
    <tr><th>File Name</th><th>Organization Name</th><th>&nbsp;</th></tr>
    <%
        db.connect();
        ResultSet rr=db.execSQL("select * from company_ppt;");
        while(rr.next())
        {
            ResultSet rt=db.execSQL("select agency_name from agency where agency_id='"+rr.getString("agency_id")+"';");
            if(rt.next())
                out.println("<tr><td> "+rr.getString("file_name")+" </td><td> "+rt.getString(1)+" </td><td> <a href=\"upload.jsp?file_name="+rr.getString("file_name")+"\">delete</a></td></tr>");
            rt.close();
        }
        db.close();
    %>
</table>
 

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
