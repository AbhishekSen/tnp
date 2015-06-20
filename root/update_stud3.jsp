<%@page language="java" import="java.util.*,gcom.*,java.lang.*,java.io.*,javazoom.upload.*,java.sql.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>

<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/root/uploads/";
%>


<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="css/emx_nav_left.css" type="text/css">
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
// -->


</script>


</head>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="images/logo-top.gif" height="60" width="74"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="placement_record/main.jsp" >Placement Record</a>
      <a href="permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="student/main.jsp" >Student </a>
      <a href="change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="average_package/average_package.jsp" >Average Package Query</a>
      <a href="placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../logout.jsp">LOGOUT</a>
      <img src="images/bot.gif" alt="" width="177" height="298" />
    </div>
</div></td>

<%
	db.fetchConfigDetails();
		String file_name="";
			String prog=request.getParameter("prog");
		//String submit=request.getParameter("submit");
		//out.println(submit+request.getParameter("B.Des."));
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
					//String temp="select username from session where session_id='"+sid+"'";
					//db.connect();
					//ResultSet r=db.execSQL(temp);
					//String uname="";
					//String roll_no="";
					//if(r.next()){uname=r.getString(1);}
					//temp="select student_roll_number from student_record where username='"+uname+"'";
					//ResultSet r1=db.execSQL(temp);
					//if(r1.next()){roll_no=""+r1.getInt(1);}
					file_name=file.getFileName();
					//db.close();
					//r.close();
					//r1.close();
					//String conttype=""+file.getContentType();
					//String req1="application/pdf";
                    if (file != null )
					{ /*out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.*/
					


							File file1=new File(gpath+"placement_uploads/root/uploads/"+file_name);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									response.sendRedirect("error.jsp");
								}
							}
							upBean.store(mrequest, "uploadfile");
							//response.sendRedirect("success.jsp");
						//file1.close();
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




//String prog=request.getParameter("prog");
out.println("<form name=\"form1\" method=\"post\" action=\"update_stud2.jsp\" >");
out.println("<table width=\"360\" border=\"1\" align=\"center\">");
  out.println("<tr><td>Programme</td><td>Code</td></tr>");

	
	out.println("<input type='hidden' name='prog' value='"+prog+"'>");
	out.println("<input type='hidden' name='file_name' value='"+file_name+"'>");
	//out.println(prog);
	String submit=request.getParameter("submit");
	if(prog!=null&&file_name!=null)
	{
		db.connect();
		String sql_st="";
		if(prog.equals("1"))
		{
			sql_st="select * from prog_record where programme_id=1 or programme_id=2;";
		}
		else if(prog.equals("2"))
		{
			sql_st="select * from prog_record where programme_id=3 or programme_id=4;";
		}
		else if(prog.equals("3"))
		{
			sql_st="select * from prog_record where programme_id=5;";
		}
		else if(prog.equals("4"))
		{
			sql_st="select * from prog_record where programme_id=6;";
		}
		else if(prog.equals("5"))
		{
			sql_st="select * from prog_record where programme_id=7;";
		}
		ResultSet rs=db.execSQL(sql_st);
		while(rs.next())
		{
			out.println("<tr><td>"+rs.getString("programme_name")+"</td>");
			out.println("<td><input type=\"text\" name=\""+rs.getString("programme_name")+"\" id=\""+rs.getInt("prog_id")+"\"></td></tr>");
			
		}
		out.println("<tr><td><input type='submit' name='unames' value='Update Usernames'/></td></tr>");
		rs.close();
		db.close();
	}
    //<td>&nbsp;</td>
    //<td>
   //   <input type="text" name="1" id="1">
    //</td>
	
%>
<tr>
      <td align="left"></td>
    </tr>
    <tr>
      <td align="left">
        </td>
    </tr>
    <tr>
      <td align="left">

        <input type="submit" name="submit" value="Submit">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
</table>
<p>&nbsp;</p>
</form>
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
