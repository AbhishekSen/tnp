<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(2);
  
    arr[0] = 1;



	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("agency_name").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'2',url ,div_tag_name );
	//alert("hurray");
}


function activate(check_box,activate_tag)
{
	if(check_box.value=="1")
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
		document.getElementById(activate_tag).disabled=true;
}


function get_data()
{
	if(validate_empty("form_query_placement"))
	{
	      //	call_xml_http_request1('data','get_details.jsp','div_get_placement_details');
              //		sortables_init();
		
	}
}


function validate_empty(ptr_name)
{
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

  


      if (ptr.agency_name.value== null||ptr.agency_name.value=="0")
   		{
  			 message+="Please select the Agency name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				
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

function check(ptr)
{
 if(ptr.value=="0")
  alert("Please select an agency");
 if(ptr.value.length!=0&& ptr.value!="0")
 document.getElementById("submit2").disabled=false;
}





</script>
<script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script>

</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>

<%@ include file="../utils/validatepage.jsp"%>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>
<jsp:include page="../utils/head.html" flush="true"/>

<% db.fetchConfigDetails(); %>
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="#">IITG Home</a> | <a href="#">Placemeny Cell</a> | <a href="#">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <p><a href="register.jsp">Agency Registration</a> <a href="../change_final_date/change_date.jsp">Set Final Date</a> <a href="../modifications/vacancy.jsp">Vacancy Modification</a> <a href="../queries/student_details/student_details.jsp">Students Details Query</a><a href="../queries/cv_query/cv_query.jsp">CV Query</a><a href="../../logout.jsp">Logout</a></p>
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
      <form name="form_query_placement" id="form_query_placement" action="get_details.jsp">
        <br>
        <b><u>Search appropriate fields:</u></b><br>
        <br>
        <table align="center">
          <tr>
            <td height="50"> Choose Agency: </td>
            <td><%! String agency_list ;%>
              <% agency_list =drop_down("select agency_name from agency;",db) ; %>
              <select name="agency_name" id="agency_name" onchange="check(this)">
                <option value="0">------------------select----------------</option>
                <%=agency_list%>
              </select></td>
          </tr>
          <tr height="30"></tr>
          <tr>
            <td><input type="radio" value="0" name="department" id="department" onClick="activate(this,'department_name')">
              Select all department</td>
          </tr>
          <br>
          <br>
          <tr height="30"></tr>
          <tr>
            <td><input type="radio" value="1" name="department" id="department" onClick="activate(this,'department_name')">
              Select a department</td>
            <td><%! String department_list; %>
              <% department_list=drop_down("select department_name from department_record;",db); %>
              <select name="department_name" id="department_name" disabled="disabled">
                <option value="0">-------------select------</option>
                <%=department_list%>
              </select></td>
          </tr>
          <tr height="50"></tr>
          <tr>
            <td>No of Vacancy</td>
            <td><input type="text" name="vacancy" id="vacancy"></td>
          </tr>
          <td><div name="agency_name_details" id="agency_name_details"></div></td>
          </tr>
        </table>
        <p><br>
          <!--
	<hr><b><u>View Fields</u></b>:<br><br>
	<table>
		<tr><td><input type="checkbox" value='check_get_start_date' name='check_get_start_year'
							id='check_get_start_year' onclick="activate(this,'start_year')" ></td>
							<td>Start Date</td>
		</tr>
	</table>
	
-->
        </p>
        <p>
          <input type="submit" class="center" name="submit2" id="submit2" onClick="get_data()" value="Get Data" disabled="disabled">
          <br>
        </p>
      </form>
      <div name='div_get_placement_details' id='div_get_placement_details'></div>

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
