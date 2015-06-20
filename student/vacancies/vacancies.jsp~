<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

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
function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(4);
  
    arr[0] = 1; 

	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("department_name").value;
	
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
<script src="../js/datetimepicker.js"></script>
<script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script>





</head>
<body onLoad="document.form_query_placement.department_id.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<%@page language="java" import="java.sql.*"%>





<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ include file="../sessionvalidate.jsp"%>


<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down_3.jsp"%>
<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
		{
		username = rs.getString(1);
		}
		
		rs.close();
		db.close();
	
%>

     <form name="form_query_placement" id="form_query_placement" method="post" action="#" onsubmit="return getPlacementDetails();"  enctype="multipart/form-data">
        <table width="644" height="67" align="center">
        <tr>
        <td align="center">
        <b><u>Place Your Search:</u></b>
        
        </td>
        </tr>
          <tr>
            <td align="center"> Select department</td>
            <td align="center">
              <select name="department_id" id="department_id">
                <%!String department_list;%>
                <% db.connect();
                    department_list=drop_down("select department_name,department_id from department_record;",db);
                   db.close(); %>
                <option value="0">-----------------------select----------------------</option>
                <%=department_list%>
              </select>
            </td>
          <tr>
            <td align="center">Select program</td>
            <td align="center"><select name="programme_id" id="programme_id" >
              <%!String program_list;%>
              <% db.connect();
               String program_list=drop_down("select programme_name,programme_id from programme_record;",db);
               db.close(); %>
              <option value="0">-----------------------select----------------------</option>
              <%=program_list%>
            </select></td>
          </tr>
        <br>
        <br>
   
          <tr><td></td>
            <td align="center"><input type="submit" class="center" name="submit_query_placement_details" id="submit_query_placement_details"  value="Get Data"></td>
          </tr>
        </table>

      </form>

</body>
</html>
