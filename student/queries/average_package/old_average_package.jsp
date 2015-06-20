<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-859-1" />
<link rel="stylesheet" type="text/css" href="../../css/style1.css" />
<title>Placement Query</title>

<script type="text/javascript">

function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(3);
  
    arr[0] = 1;
	arr[1]=document.getElementById("department_name").value;


	//1 to 2 the parameters for the query.

	arr[2]=document.getElementById("program_name").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'3',url ,div_tag_name );
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
{//alert("hi");
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


	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please select  department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			     //	ptr.department_name.select();
			 }
		}
 if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please select  program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			    //	ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 { //alert(message);
		return true;
	 }

}





</script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<jsp:useBean id="db2" class="pack.DbBean2" scope="session"/>
<% db2.fetchConfigDetails(); %>



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
<%@ include file="../../utils/drop_down2.jsp"%>
<%@ include file="../../utils/dropDepartmentWSClient/web/index.jsp"%>
<%@ include file="../../utils/dropProgramWSClient/web/index.jsp"%>
<jsp:include page="../../utils/query_head.html" flush="true"/>

<h2>Placement Query
</h2>

		<form name="form_query_placement" id="form_query_placement">
	<br><b><u>Search appropriate fields:</u></b><br><br>
			<table>
						<tr>
						<td>Choose Program:</td>
						 
							<td><select name="program_name" id="program_name" >
              <%!String program_list;%>
            <% String program_list=drop_down("select programme_name from programme_record;",db2); %>
            
          <option value="0">-------------select--------------------</option>
     <%=program_list%>
        </select></td>
							
						</tr>
						<tr><td>
Choose Department:
</td>   <td>   <select name="department_name" id="department_name">
                    <%!String department_list;%>
                    <% department_list=drop_down("select department_name from department_record;",db2); %>
                    <option value="0">-----------------------select----------------------</option>
                    <%=department_list%>
            </select></td></tr>

						
					</table>								
		
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
			<input type="button" class="center" name="button_query_placement_details" id="button_query_placement_details" onClick="get_data()" value="Get Data">
		<br><br>
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

