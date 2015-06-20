<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>Set Date</title>
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

<style type="text/css">
<!--
body {
	background-color: #FFFFCC;
}
-->
</style></head>


<body>
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
<%@ page import="java.util.*" %>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<jsp:include page="../utils/head.html" flush="true"/>


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

			
						rows_affected_final_date=db.updateSQL(sql_update);
					
				
						db.close();
				
			
		if (rows_affected_final_date==1)
		{ final_date=sql_convert_date(final_date);
			out.println(display1+"Success! Final Agency Date is Fixed to:"+final_date+display2);}
		else 
			out.println(display1+"Operation Failed! Retry"+display2);

		
	}
	
%>

<%
	String main_rec=create_table("select * from agency where agency_name= '"+agency_name+"' and agency_year= "+year,db);
	
%>



<form method="post" name="form_get_date" id="form_get_date">
<p>&nbsp;</p>
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
</table>
<p><br>
  </p>
<p><br>
  <input class="center" type="button" value="Get Date" name="get_date" id="get_date" onClick="call_xml_http_request2(this.value,'get_date.jsp','div_get_date','agency_name')"><br>
</p>
<!--<table><tr>
<td>Final Date<input readonly type="text" name="final_date" id="final_date" onClick="alert('Please Select the date from the calender');">
          (dd-mm-yyyy)</td>
        <td><a href="javascript:NewCal('final_date','ddmmyyyy')" ><img class="cal" alt="Pick a date" src="../images/cal.gif"/></a> </td>
</tr></table>
<br><br>
<input class="center" type="submit" value="SET DATE" name="submit_final_date"  id="submit_final_date" size="15" >
<br>
<br>-->
</form>
<div id="div_get_date" name="div_get_date">
</div>


<br><br>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
