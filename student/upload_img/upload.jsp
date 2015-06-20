<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*,java.lang.*,java.io.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>


<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <%--
  <jsp:setProperty name="upBean" property="folderstore" value="placement/student/uploads/" />
  --%>
</jsp:useBean>

<head>
<script type="text/javascript" src="../../javascript/jquery.min.js"> </script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/img_sign_upload.js"> </script>
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
</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../sessionvalidate.jsp"%>
<%


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


<div id="content"> 


<div id="formDiv1">
<form id="uploadF1" action="" method="POST"  onsubmit="return uploadIMGCheck(1);" name="upform1" enctype="multipart/form-data">
<p><b>Select a file to upload :</b></p>

        <input id="uploadfile1" type="file" name="uploadfile" size="50"></td>
  
		<p>
		  <input type="hidden" name="todo" value="upload">
		  <input type="submit" name="Submit" value="Upload Image" onClick="return getstat(1);">
		  <input type="reset" name="Reset" value="Cancel"> 
		  </p>
		<p><strong>To upload Signature go <a href="#" onclick = "return showIMGForm(2);">here</strong></a>.</p>
<p align="center"><strong>Note: Limit of file size is 50kb for each image and signature and the file should be in ".jpeg" format.</strong></p>
<p align="center"><strong><font size="2" color="red">Dimension of the Image in pixels(px): Width X Height (130X120).</font></strong></p>
</form>
</div>

<!-- end formDiv1 --> 
 
<div id="formDiv2" style = "display: none">
<form id="uploadF2" action="" method="POST"  onsubmit="return uploadIMGCheck(2);" name="upform2" enctype="multipart/form-data">
<p><b>Select a file to upload :</b></p>

        <input id="uploadfile2" type="file" name="uploadfile" size="50"></td>
  
		<p>
		  <input type="hidden" name="todo" value="upload">
		  <input type="submit" name="Submit" value="Upload Signature" onClick="return getstat(2);">
		  <input type="reset" name="Reset" value="Cancel"> 
		  </p>
		<p><strong>To upload Image go <a href="#" onclick = "return showIMGForm(1);">here</strong></a>.</p>		  
<p align="center"><strong>Note: Limit of file size is 50kb for each image and signature and the file should be in ".jpeg" format.</strong></p>
<p align="center"><strong><font size="2" color="red">Dimension of the Signature in pixels(px): Width X Height (130X50).</font></strong></p>
</form>
</div> 



<!-- end formDiv2 -->
		<p><font color="black" size=2><strong>Check your current uploaded files below: </strong></font></p>
		<p>Your present uploaded Image is <a href="#"  onclick="downloadIMG(0);">here</a>.</p>
		<p>Your present uploaded Signature is <a href="#" onclick="downloadIMG(1);">here</a>.</p>
                


</div> 
<!--end pagecell1--> 

</body>
</html>
