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
	var arr = new Array(4);
  
    arr[0] = 1; 

	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("department_name").value;
	
	arr[2]=document.getElementById("program_name").value;
	
	
	
	arr[3]=document.getElementById("year").value;
	
	


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'4',url ,div_tag_name );
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
	 
		call_xml_http_request1('data','get_placement_details1.jsp','div_get_placement_details1');
		sortables_init();
		//alert("rohan");
	//}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please enter the department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.department_name.select();
			 }
		}
    if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please enter the program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return true ;
	 } 
	 else
	 { alert(message);
		return false;
	 }

}





</script>
<script src="../../js/datetimepicker.js"></script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

</head>-
<body onLoad="document.form_query_placement.department_id.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<%@page language="java" import="java.sql.*"%>





<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<jsp:useBean id="db2" class="pack.DbBean2" scope="session"/>
<%@ include file="../../utils/sql_convert_date.jsp"%>



<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>

 
<%@ include file="../../utils/dropDepartmentWSClient/web/index.jsp"%>
<%@ include file="../../utils/dropProgramWSClient/web/index.jsp"%>

<script src="../../js/xmlhttprequest.js"></script>
<jsp:include page="../../utils/head.html" flush="true"/>
<% 
  db2.fetchConfigDetails(); 
  db.fetchConfigDetails(); //newly added
%>

<%

	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR); 
	//String year ="1888";
	//String year = y.toString();
	//out.println(year); 
	
        
	String department_name=request.getParameter("department_name");
     
	
	String program_name=request.getParameter("program_name");
	  
	
   %>


<h2>Placement Query
</h2>

		<form method="post" name="form_query_placement" id="form_query_placement" onSubmit="return true">
	<br><b><u>Search appropriate fields:</u></b><br><br>
			<table>
						 <tr>
            <td> 
            Select department</td>
            <td>   <p>
              <select name="department_name" id="department_name">
                <%!String department_list;%>
                <% db2.connect();
                    department_list=drop_down("select department_name from department_record;",db2);
                   db2.close(); %>
                <option value="0">-----------------------select----------------------</option>
                <%=department_list%>
              </select>
            </p>
              </td>
			
			
			  <tr>
            <td height="97">
                                 
              
                
              
                
              <p>Select program</p>
              </td>
        <td>
             <select name="program_name" id="program_name" >
              <%!String program_list;%>
            <% db2.connect();
               String program_list=drop_down("select programme_name from programme_record;",db2);
               db2.close(); %>
            
          <option value="0">-----------------------------------------------select-----------------------------------------------------</option>
     <%=program_list%>
	 
	
         
        </select>
        </td>
  </tr>
			
	 <input type="hidden" name="year" id="year" value="<%=year%>">
	 		
         
						
						
						
						
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
			<input type="button" class="center" name="button" id="button" onClick="get_data()" value="Get Data">
		<br><br>
</form>
<br><br>

<div name='div_get_placement_details1' id='div_get_placement_details1'></div>

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

