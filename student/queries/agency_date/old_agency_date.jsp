<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../../css/style1.css" />
<title>Placement Query</title>

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
	if(check_box.checked==1)
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
		call_xml_http_request1('data','get_details.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

   //alert(ptr.student_roll_number.value.length);
	   if (ptr.agency_name.value== null)
   		{
  			 message+="Please select the Agency name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.agency_name.select();
			 }
		}
   

 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 {//alert("hi");
		return true;
	 }

}





</script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

<style type="text/css">
<!--
body {
	background-color: #FFFFCC;
}
-->
</style></head>
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<jsp:include page="../../utils/head.html" flush="true"/>

<h2>Placement Query
</h2>

		<form name="form_query_placement" id="form_query_placement">
	<br><b><u>Search appropriate fields:</u></b><br><br>
			<table align="center">
						<tr>
<td >
Choose Organization:
</td><td><%! String agency_list ;%>
<% agency_list =drop_down("select agency_name from agency;",db) ; %>
<select name="agency_name" id="agency_name">
<option value="0">------------------select----------------</option>
<%=agency_list%>
</select>	
</td></tr>
						
						<td><div name="agency_name_details" id="agency_name_details"></div></td></tr>
						
						
					</table>								
		<br>
<!--
	<hr><b><u>View Fields</u></b>:<br><br>
	<table>
		<tr><td><input type="checkbox" value='check_get_start_date' name='check_get_start_year'
							id='check_get_start_year' onclick="activate(this,'start_year')" ></td>
							<td>Start Date</td>
		</tr>
	</table>
	
-->	
	<br><br>
			...........................................................................................................................................
			<input type="button" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data">
		..................................................................................................<br>
		<br>
</form>
<br><br>

<div name='div_get_placement_details' id='div_get_placement_details'></div>

<%

%>
<!--
<table id="asdf" class="sortable"><tr><td>asdf</td></tr>
<tr><td>1</td></tr>
<tr><td>2</td></tr>
<tr><td>3</td></tr>
<tr><td>4</td></tr>
<tr><td>5</td></tr>

</table>
-->
<jsp:include page="../../utils/foot.html" flush="true"/>
</body>
</html>

