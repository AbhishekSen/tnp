<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>PLACEMENT RECORD FORM</title>
<script type="text/javascript">
function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency\n" ;
	
  if (ptr.agency_email.value.length == 0 )
        message+="Please enter the Email. \n" ;
		
  if (ptr.agency_person.value.length == 0  )
        message+="Please enter the Person \n" ;
		
  if (ptr.agency_website.value.length == 0)
  		message+="Please enter the Website of Posting \n" ;
		
   

		
	
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

<style type="text/css">
<!--
body {
	background-color: #FFFFCC;
}
-->
</style></head>


<body onLoad="document.form_placement_record.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 

<jsp:include page="../utils/head.html" flush="true"/>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_agency_details1.agency_details1" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="agency_website" param="agency_website" />
<jsp:setProperty name="obj_placement_record" property="agency_email" param="agency_email" />
<jsp:setProperty name="obj_placement_record" property="agency_person" param="agency_person" />
<jsp:setProperty name="obj_placement_record" property="agency_phone" param="agency_phone" />
<jsp:setProperty name="obj_placement_record" property="agency_mobile" param="agency_mobile" />
<jsp:setProperty name="obj_placement_record" property="agency_fax" param="agency_fax" />
<jsp:setProperty name="obj_placement_record" property="average_package" param="average_package" />
 

<%
        db.fetchConfigDetails(); //newly added
        
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	String agency_website=obj_placement_record.getAgency_website();
	String agency_email=obj_placement_record.getAgency_email();
	String agency_person=obj_placement_record.getAgency_person();
	String agency_phone=obj_placement_record.getAgency_phone();
	String agency_mobile=obj_placement_record.getAgency_mobile();
	String agency_fax=obj_placement_record.getAgency_fax();
	String average_package=obj_placement_record.getAverage_package();
 
//out.println(confirmation);

	if(submit!=null && agency_name!=null && agency_website!=null && agency_email!=null && agency_person!=null && agency_mobile!=null&& average_package!=null  )
		{				
			int num_rows=0;//,agency_id=0,student_id=0;
			
	
	 
	
	
 
	//out.println(j);
	 
		
		{	 
			//out.println(confirmation);
				String main_record=" insert into temporary_agency(agency_name,agency_website,agency_person,agency_email,agency_phone,agency_fax,agency_mobile,average_package)"+" values ('"+agency_name+"','"+agency_website+"','"+agency_person+"','"+agency_email+"','"+agency_phone+"','"+agency_fax+"','"+agency_mobile+"',"+Double.parseDouble(average_package)+");";
				//out.println(main_record);
				db.connect();
				num_rows=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows==1)
					{
						out.println(display1+"Record Added in Agency Record"+display2);
					 

					}
				else
				out.println(display1+"Could not add record in Agency Record"+display2);
			 }	
		
	}
	
	
%>
<h4>&nbsp;</h4>
<br><br>

		<h2>Temprorary agency registration</h2>
		<br><br>
		

<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
<table width="456" align="center">
 
<tr>
<td>Agency name </td>
<td><input type="text" name="agency_name" id="agency_name"></td>
</tr>
<tr>
<td >Website</td>
<td><input name="agency_website" id ="agency_website" type="text"></td>
</tr>
<tr>
<td >Agency person </td>
<td ><input type="text" name="agency_person" id="agency_person"></td>
</tr>


<tr>
<td >Email </td>
<td ><input type="text" name="agency_email" id="agency_email"></td>
</tr>

<tr>
<td >Mobile </td>
<td ><input type="text" name="agency_mobile" id="agency_mobile"></td>
</tr>
<tr><tr>
<td >Phone no </td>
<td ><input type="text" name="agency_phone" id="agency_phone"></td>
</tr>
<tr>
<tr>
<tr>
<td >Fax </td>
<td ><input type="text" name="agency_fax" id="agency_fax"></td>
</tr>
<tr>
<tr>
<td >Average package </td>
<td ><input type="text" name="average_package" id="average_package"></td>
</tr>
 
 
</table>
<br><br>
<input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" >
<br>
<br>
</form>
<hr>
	
<%		if(submit!=null)
			{
				String table2="select * from temporary_agency where agency_name ='"+agency_name+"';";
			out.println(create_table(table2,db));
			}	 
			
	%>	
<hr>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
