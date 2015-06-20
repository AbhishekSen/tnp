<html>
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
</script>
<script type="text/javascript" src="../js/datetimepicker.js"></script>
<script type="text/javascript" src="../js/xmlhttprequest.js"></script>

<script type="text/javascript">
var xmlHttp 
var div_tag_name 
function showHint(data , data_array, len, url , div_name)
{ div_tag_name= div_name ; 
   
 //alert(data.length);
 if (data.length > 0 )
 { //alert(data.length);
  //  str = encodeURIComponent(str) ;
    //alert("rohan");
    var query_string = "q0=" +data;
	var temp="";
	//alert(query_string);
	//alert(query_string);
	//alert(data_array[1]);
//	alert(data_array[2]);
//	alert(data_array[3]);
//	alert(data_array[4]);
//	alert(url);
//	alert(div_name); 
	//alert("len=="+len);
	if (len > 1)  // means there is some data pased in the array  .
	{	
	 	query_string+="&";
         
     	for (var i=0; i < len ; i++)
     	{ 
	 		 data_array[i] = encodeURIComponent(data_array[i]) ;
	 		// temp="q"+i+"="data_array[i] ;
	  	   temp="q"+i+"="+ data_array[i];
		   
		   //alert("temp"+temp);
		if (i == (len-1 ))	  
	  		 	{query_string +=temp  ;
	  		        }   
                       
                        else
	  		{
	   			temp+="&";	 
	   			query_string +=temp ;
                               
	  		}
     	}		  // end of the for loop 
//alert("query_string==="+query_string);
    } // end of if data_array is passed  
        
 temp ="&qlength="+len ;
 query_string +=temp ; 

  //var query_string ="q="+data;
 // alert(query_string);
// alert(div_name);
//alert("xmlHttp.readyState=="+xmlHttp.readyState);
//alert("xmlHttp.status=="+xmlHttp.status);
  xmlHttp=GetXmlHttpObject(stateChanged) ;
  xmlHttp.open("POST", url , false) ;
  xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
 	//alert(query_string);
 xmlHttp.send(query_string) ;
  }
else
 {  
 // document.getElementById(div_name).innerHTML="wait ......." ;
 } 
} 
 // writing the response recived in the div tag . 
 
function stateChanged() 
{ 
      if (xmlHttp.readyState < 4)
	  {
		//document.getElementById(div_tag_name).innerHTML= xmlHttp.readyState;  
		//document.getElementById("wait").innerHTML="wait ......." ;  
	  }
	  
      if (xmlHttp.readyState==4 )
      { 
        
   //  alert(xmlHttp.responseText);
		 if (xmlHttp.status == 200) 
		 {
            	//document.getElementById("wait").innerHTML=""  ;
           document.getElementById(div_tag_name).innerHTML=xmlHttp.responseText  ;
		  // alert(xmlHttp.getAllResponseHeaders());
		//  alert("xmlHttp.responseText=="+xmlHttp.responseText);
		 }
		 else 
		 {
		 	alert("There was a problem retrieving the data:\n" +xmlHttp.statusText + xmlHttp.status);
		 }
      } 
	
	  
} 

function GetXmlHttpObject(handler)
{ 
 var objXmlHttp=null  ;
 
 if (navigator.userAgent.indexOf("Opera")>=0)
 {
  alert("This example doesn't work in Opera");  
  return ;
 }
 
 if (navigator.userAgent.indexOf("MSIE")>=0)
 { 
  var strName="Msxml2.XMLHTTP";
  if (navigator.appVersion.indexOf("MSIE 5.5")>=0)
  {
   strName="Microsoft.XMLHTTP" ;
  } 
  try
  { 
   objXmlHttp=new ActiveXObject(strName) ;
   objXmlHttp.onreadystatechange=handler ;
   return objXmlHttp ;
  } 
  catch(e)
  { 
   alert("Error. Scripting for ActiveX might be disabled")  ;
   return  ;
  } 
 } 
 if (navigator.userAgent.indexOf("Mozilla")>=0)
 {
  objXmlHttp=new XMLHttpRequest() ;
  objXmlHttp.onload=handler ;
  objXmlHttp.onerror=handler  ;
  return objXmlHttp ;
 }
}


</script>

<script type="text/javascript">
function validate_empty1(ptr)
{
	var selected=false;
 	var message="";



    if (ptr.agency_name.value==0 )
  {
  	
 	 message+="Please Select the Agency Name\n" ;
	 if(selected==false)
	 {
	 	selected=true;
		  
         //ptr.agency_name.select();
	 }
 
				
  }
 
 
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





function validate_empty2(ptr)
{

	var selected=false;
 	var message="";
 
  if (ptr.student_end_date.value.length == 0 )
  {
 	 message+="Please enter the End Date\n" ;
	 if(selected==false)
	 {
	 	//selected=true;
		//ptr.student_end_date.select();
	 }
 }
 
 
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



function call_xml_http_request1(data , url , div_tag_name)
{
	var arr = new Array(1);
    arr[0] = 1;
    showHint(data , arr,'1',url ,div_tag_name );
}
function call_xml_http_request2(data , url , div_tag_name,input_name1)
{
  if(validate_empty1(document.getElementById("form_get_date")) )
	{
	var arr = new Array(2);
    arr[0] = 1;
	arr[1]=document.getElementById(input_name1).value;
	
/*
	alert(arr[0]);
	alert(arr[1]);		
	alert(arr[2]);	
	alert(arr[3]);	
*/
    showHint(data , arr,'2',url ,div_tag_name );
	}
}
</script>


</head>

<body>
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>

<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>
<%@ page import="java.util.*" %>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>



<%
        db.fetchConfigDetails(); //newly added
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);

	String submit_final_date=request.getParameter("submit_final_date");

	String final_date=request.getParameter("final_date");
	 final_date=sql_convert_date(final_date);



	String agency_name=null;
	
	agency_name=request.getParameter("agency_name");
	
//
	if(submit_final_date !=null  && final_date != null )
	{
	
		
		int rows_affected_final_date=0;
		
		String sql_update=null;


sql_update="update agency set final_agency_date= '"+final_date+"' where agency_name= '"+agency_name+"' ;";
				//out.println(sql_update);
		

						db.connect();
						ResultSet r_u=db.execSQL("select agency_id from agency where agency_name='"+agency_name+"';");
						if(r_u.next())
							rows_affected_final_date*=db.updateSQL("delete from date_requests where agency_id="+r_u.getInt(1)+";");
						r_u.close();
						rows_affected_final_date=db.updateSQL(sql_update);
					
				
						db.close();
				
			
		if (rows_affected_final_date==1)
		{ final_date=sql_convert_date(final_date);
			response.sendRedirect("success.jsp");}
		else 
			response.sendRedirect("error.jsp");
		
	}
	
%>

<%
	String main_rec=create_table("select * from agency where agency_name= '"+agency_name+"' and agency_year= "+year,db);
	
%>



<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
   <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placemeny Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
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
      <a href="change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../old_students/main.jsp" >See Old Student Records</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
    <p align="center">To change final date for cv go <a href="../permanent_companies/edit_cv_date.jsp">here</a>.</p>
    <form method="post" name="form_get_date" id="form_get_date">
      <p>&nbsp;</p>
      <table align="center">
        <tr>
          <td > Choose Organization: </td>
          <td>
            <select name="agency_name" id="agency_name">
              <option value="0">------------------select----------------</option>
              <%
			  	db.connect();
				ResultSet r_e=db.execSQL("select agency_id from date_requests;");
				while(r_e.next())
				{
					ResultSet r_s=db.execSQL("select agency_name from agency where agency_id="+r_e.getInt(1)+";");
					if(r_s.next())
					{
						out.println("<option value=\""+r_s.getString(1)+"\">"+r_s.getString(1)+"</option>");
					}
					r_s.close();
				}
				r_e.close();
				db.close();
			  %>
            </select></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="76" height="32" border="0" align="center">
        <tr>
          <td width="77"><input class="center" type="button" value="Get Date" name="get_date" id="get_date" onClick="call_xml_http_request2(this.value,'get_date.jsp','div_get_date','agency_name')"></td>
          </tr>
      </table>
      <p><br>
        <br>
      </p>
    </form>
    <div id="div_get_date" name="div_get_date">
</div>
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
