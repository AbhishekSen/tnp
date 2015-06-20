<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!--placement\agency\uploads   -->
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
	String age_name="";	
	String type="";

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/agency/company_literature/";
%>

<% db.fetchConfigDetails(); %>


<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
<jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>

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
<body onLoad="showNewRecords();">

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>

<%
		int num_rows=0;
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
				 
				String username="";
				String sql_username="select username from session where session_id = '"+sid+"';" ;
				db.connect();
				ResultSet rs= db.execSQL(sql_username);
				if(rs.next()) 
				{
					username = rs.getString(1);
				}
				rs.close();
				ResultSet r1=db.execSQL("select agency_name from agency where username='"+username+"'");
				if(r1.next())
				{
					age_name=r1.getString("agency_name");
				}
				r1.close();
				 db.close();
				 file.setFileName(age_name+"_"+file.getFileName());
				String fname=file.getFileName();
                    if (file != null){ //out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
					File file1=new File(gpath+"placement_uploads/agency/company_literature/"+fname);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									response.sendRedirect("error.jsp");
								}
							}
                    upBean.store(mrequest, "uploadfile");
					

		
					String agency_id="";			

					String sql_get_data="select agency_id from agency where username='"+username+"';" ;
					db.connect(); 
					ResultSet res= db.execSQL(sql_get_data);
					if(res.next()) 
					{
						agency_id=res.getString(1);
				
					}
					res.close();
					db.close();
		
	
					String main_record=" insert into company_literature (file_name , agency_id)"+" values ('"+file.getFileName()+"' , '"+agency_id+"') ;";
			
			
					db.connect();
					num_rows=db.updateSQL(main_record);
					db.close();    
					}     	
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
						  <li><a href="../vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="student_details.jsp">Students Details Query</a></li>
						  <li><a href="cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="upload.jsp">Upload Organization Literature</a></li>
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
						  <div class="feature">
								<form method="post" action="upload.jsp" name="upform" enctype="multipart/form-data">
								  <br>
								  <br>
								  <p align="center"><strong>Error in uploading. Please try again.</strong></p>
								</form>
								<p align="center">&nbsp;</p>
								</div> 
						  </div>
					</div> 
                </div>
              </div>
              <div id = "footer">
              <span>\A9 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
