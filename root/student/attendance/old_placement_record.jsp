<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>ATTENDANCE RECORD FORM</title>
<script type="text/javascript">
function validate_empty(ptr)
{	
 var message="";
  if(ptr.agency_name.value=="0")
    message+="Please enter the Agency Name\n" ;
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
  if (ptr.student_roll_number.value.length == 0 )
        message+="Please enter the Student Roll no. \n" ;
		
  

		
	
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
<script src="../js/datetimepicker.js"></script>
<script src="../js/xmlhttprequest.js"></script>

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
<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="student_roll_number" param="student_roll_number" />
 




<%!

String agency_name=null;
%>
<%
        db.fetchConfigDetails(); //newly added
	//out.println("rohan 1");
	 
	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR);
	//out.println(year);
 
int agency_id=0;
int student_id=0;
  int i=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	String student_roll_number=obj_placement_record.getStudent_roll_number();
	 
//out.println(confirmation);

	if(submit!=null && agency_name!=null && student_roll_number!=null )
		{				
			int num_rows=0;
			
	
	String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"' and agency_year='"+year+"';" ;
		
			db.connect(); 
			ResultSet rs= db.execSQL(sql_get_data);
			if(rs.next()) 
			{agency_id=rs.getInt(1);}
			rs.close();
			 
			db.close();

	 sql_get_data="select student_id from student where student_roll_number='"+student_roll_number+"';" ;
			
			db.connect(); 
			ResultSet re= db.execSQL(sql_get_data);
			if(re.next()) 
			{student_id=re.getInt(1);}
			
			re.close();  
			db.close();
	       

	
		if(agency_id!=0&&student_id!=0)
			{	
			      
				String main_record=" insert into appearance(student_id,agency_id)"+" values ("+student_id+","+agency_id+");";
				
				db.connect();
				num_rows=db.updateSQL(main_record);
		
				db.close();	
				if(num_rows==1)
					{      i++;
						out.println(display1+"Record Added in Attendance register"+display2);
					 

					}
				else
				out.println(display1+"Could not add record in Attendance register"+display2);
			}
			else    {if(agency_id==0)
				out.println(display1+"Could not add record since Agency is temporarily registered"+display2);
		                  else
                                  {if(student_id==0)
                                    out.println(display1+"Could not add record since Student is not yet registered"+display2);}
                                 }
}	
		
	
	
	
%>
<h4>&nbsp;</h4>
<br><br>

		<h2>ATTENDANCE RECORD FORM<%out.println("-"+year);%> </h2>
		<br><br>
		

<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
<p>&nbsp;</p>
<table width="456" align="center">
<tr>
<td >
Choose Organization:
</td><td><%! String agency_list ;
             String temp_agency_list;%>
<% agency_list =drop_down("select agency_name from agency where agency_year='"+year+"' ;",db) ;
   temp_agency_list=drop_down("select agency_name from temporary_agency ;",db); %>
<select name="agency_name" id="agency_name">
<option value="0">------------------select----------------</option>
<%=agency_list+temp_agency_list%>
</select>	
</td></tr>
<tr>
<td>Student  roll number </td>
<td><input type="text" name="student_roll_number" id="student_roll_number"></td>
</tr>
 
</table>
<p>&nbsp;</p>
<p><br>
  <input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" >
  <br>
  <br>
</p>
</form>
<hr>
	
<%			if(submit!=null&&i>=1)
			{
				String table2="select distinct agency_id ,student_id from appearance where agency_id ="+agency_id+" and student_id="+student_id+";";
				out.println(create_table(table2,db));
			}
			
	%>	
<hr>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
