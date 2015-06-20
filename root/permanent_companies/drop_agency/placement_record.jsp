<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../../css/style1.css" />
<title>DELETE AGENCY FORM</title>
<script type="text/javascript">

function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
   

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
<script src="../../js/datetimepicker.js"></script>
<script src="../../js/xmlhttprequest.js"></script>

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
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
 
 




<%!
int j=0;
String agency_name=null;
%>
<%
        db.fetchConfigDetails(); //newly added
	//out.println("rohan 1");
	 
	Calendar rightNow = Calendar.getInstance();
	int year = rightNow.get(Calendar.YEAR);
	//out.println(year);
 
int agency_id=0;
 

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	 
	 
//out.println(confirmation);

	if(submit!=null && agency_name!=null )
		{				
			int num_rows=0;
			int num_rows1=0;
			int num_rows2=0;//,agency_id=0,student_id=0;
			
	
	String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"' and agency_year='"+year+"';" ;
			//out.println(sql_get_data);
			db.connect(); 
			ResultSet rs= db.execSQL(sql_get_data);
			if(rs.next()) 
			{agency_id=rs.getInt(1);}
			rs.close();
			//out.println(old_department_id);  
			db.close();

	  
	
	
//String get_number="select agency_id from appearance where student_id="+student_id+";";
//	db.connect();
 //rs=db.execSQL(get_number);
	//out.println("*"+j+"*");
//	j=0;
//	int k=0;
//	while(rs.next())
//	{
//	j++;
//	if(rs=agency_id)
//	{k=1};
//	
 //}
//	rs.close();
//	db.close();
	//out.println(j);
	 
			
 		
			if(agency_id!=0 )
			{	
			//out.println(confirmation);
				String main_record=" delete from agency where agency_id="+agency_id+" ;";
				//out.println(main_record);
				db.connect();
				num_rows=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows==1)
					{
						out.println(display1+"AGENCY DETAILS DELETED"+display2);
					 

					}
					else
				out.println(display1+"Could not delete agency details"+display2);
					
				String main_record1=" delete from department where agency_id="+agency_id+" ;";
				//out.println(main_record1);
				db.connect();
				num_rows1=db.updateSQL(main_record1);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows1!=0)
					{
						out.println(display1+"DEPARTMENT DETAILS DELETED"+display2);
					 

					}
						
					else
				out.println(display1+" Departments details not filled earlier"+display2);
				
				String main_record2=" delete from program_package where agency_id="+agency_id+" ;";
				//out.println(main_record2);
				db.connect();
				num_rows2=db.updateSQL(main_record2);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows2!=0)
					{
						out.println(display1+"PACKAGE DETAILS DELETED"+display2);
					 

					}	
					
					
					
					
			else
				out.println(display1+"Package details not filled earlier"+display2);
                                String main_record3=" delete from equipments where agency_id="+agency_id+" ;";
				//out.println(main_record2);
				db.connect();
				num_rows2=db.updateSQL(main_record3);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows2!=0)
					{
						out.println(display1+"EQUIPMENT DETAILS DELETED"+display2);
					 

					}	
					
					
					
					
			else
				out.println(display1+"Equipment details not filled earlier"+display2);
                                
			}
			else
				out.println(display1+"Could not delete record since Agency doesnt exit.."+display2);
		}	
		
	 
	
%>
<h4>&nbsp;</h4>
<br><br>

		<h2>DROP ORGANIZATION
	      <%out.println("-"+year);%> </h2>
		<br><br>
		

<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
<p>&nbsp;</p>
<table width="456" align="center">
<tr>
<td >
Choose Organization:
</td><td><%! String agency_list ;%>
<% agency_list =drop_down("select agency_name from agency where agency_year='"+year+"' ;",db) ; %>
<select name="agency_name" id="agency_name">
<option value="0">------------------select----------------</option>
<%=agency_list%>
</select>	
</td></tr>
 
 
</table>
<p><br>
  </p>
<p><br>
  <input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" >
  <br>
  <br>
</p>
</form>
<hr>
	
<%	//		if(submit!=null&& j!=2)
			//{
			//	String table2="select * from appearance where agency_id ="+agency_id+" and student_id="+student_id+";";
			//	out.println(create_table(table2,db));
			//}
			/*else
			out.println("kishlay");*/
	//%>	
<hr>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
