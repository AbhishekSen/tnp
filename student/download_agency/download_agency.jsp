<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>Placement Query</title>

<script type="text/javascript">

function call_xml_http_request1(data , url , div_tag_name)
{
	var arr = new Array(3);
  
    arr[0] = 1;
	arr[1]=document.getElementById("check_student_roll_number").checked;


	//1 to 2 the parameters for the query.

	arr[2]=document.getElementById("student_roll_number").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

 	
    showHint(data , arr,'3',url ,div_tag_name );
	
}


function activate(check_box,activate_tag)
{        
     	if(check_box.value=="0")
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
      		document.getElementById(activate_tag).disabled=true;
}


function get_data()
{//alert("hi"+validate_empty("form_query_placement"));
	if(validate_empty("form_query_placement"))
	{//alert("rohan1");
	//	call_xml_http_request1('data','get_details.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

   if (ptr.check_student_roll_number.checked == 1 )
  {
     //alert(ptr.student_roll_number.value.length);
	   if (ptr.student_roll_number.value.length == 0 )
   		{
  			 message+="Please select the Student roll number.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.student_roll_number.select();
			 }
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





</script>
<script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script>

<style type="text/css">
<!--
body {
	background-color: #FFFFCC;
}
-->
</style></head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



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
<jsp:include page="../utils/head.html" flush="true"/>

<h2>Placement Query
</h2>

		<form name="form_query_placement" id="form_query_placement" action="get_csv_agency.jsp">
	<br><b><u>Search appropriate fields:</u></b><br><br>
			<table align="center">
<tr>
<td><input type="radio" value="0" name="agency_id" id="agency_id" onClick="activate(this,'agency_name')"></td>
<td>Choose Organization:</td>
<td><%! String agency_list ;%>
<% agency_list =drop_down("select agency_name from agency;",db) ; %>
<select name="agency_name" id="agency_name" disabled="disabled"  >

<option value="0">------------------select----------------</option>
<%=agency_list%>
</select>	
</td></tr>
<tr><td><input type="radio" value="1" name="agency_id" id="agency_id" onClick="activate(this,'agency_name')" ></td>
<td>All Organization's Registered</td>
</tr>
<!--<td><input type="text" name="agency_name" id="student_roll_number" disabled="disabled"></td> -->
							
						
						
<tr><td><div name="agency_name_details" id="agency_name_details"></div></td></tr>
						
						
					</table>								
	      <p><br>
		      
	        <br>
	      </p>
	      <p><br>
	        <input type="submit" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data"><br>
          </p>
</form>
<br><br>

<div name='div_get_placement_details' id='div_get_placement_details'></div>

<%

%>


<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>

