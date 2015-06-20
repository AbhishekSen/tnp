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
  	message+="Please enter the Agency ID\n" ;
	
  if (ptr.student_roll_number.value.length == 0 )
        message+="Please enter the Student ID \n" ;
		
  if (ptr.basic.value.length == 0  )
        message+="Please select the Package \n" ;
		
  if (ptr.location_of_posting.value.length == 0)
  		message+="Please enter the Location of Posting \n" ;
		
  if (ptr.remarks.value.length == 0)
  		message+="Please enter the Remarks \n" ;
		

		
	
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
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="student_roll_number" param="student_roll_number" />
<jsp:setProperty name="obj_placement_record" property="basic" param="basic" />
<jsp:setProperty name="obj_placement_record" property="hra" param="hra" />
<jsp:setProperty name="obj_placement_record" property="others" param="others" />
<jsp:setProperty name="obj_placement_record" property="gross" param="gross" />
<jsp:setProperty name="obj_placement_record" property="take_home" param="take_home" />
<jsp:setProperty name="obj_placement_record" property="ctc" param="ctc" />
<jsp:setProperty name="obj_placement_record" property="location_of_posting" param="location_of_posting" />
<jsp:setProperty name="obj_placement_record" property="remarks" param="remarks" />

<%!
int j=0;
String agency_name=null;
%>
<%
    db.fetchConfigDetails(); //newly added
int agency_id=0;
int student_id=0;

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=obj_placement_record.getAgency_name();
	String student_roll_number=obj_placement_record.getStudent_roll_number();
	String basic=obj_placement_record.getBasic();
	String location_of_posting=obj_placement_record.getLocation_of_posting();
	String remarks=obj_placement_record.getRemarks();
	String hra=obj_placement_record.getHra();
	String others=obj_placement_record.getOthers();
	String gross=obj_placement_record.getGross();
	String take_home=obj_placement_record.getTake_home();
	String ctc=obj_placement_record.getCtc();
	String confirmation=request.getParameter("confirmation");
//out.println(confirmation);

	if(submit!=null && agency_name!=null && student_roll_number!=null && basic!=null && location_of_posting!=null && hra!=null&& others!=null&& gross!=null&& ctc!=null&& remarks!=null )
		{				
			int num_rows=0;//,agency_id=0,student_id=0;
			
	
	String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"';" ;
			//out.println(sql_get_data);
			db.connect(); 
			ResultSet rs= db.execSQL(sql_get_data);
			if(rs.next()) 
			{agency_id=rs.getInt(1);}
			rs.close();
			//out.println(old_department_id);  
			db.close();

	 sql_get_data="select student_id from student where student_roll_number='"+student_roll_number+"';" ;
			//out.println(sql_get_data);
			db.connect(); 
			ResultSet re= db.execSQL(sql_get_data);
			if(re.next()) 
			{student_id=re.getInt(1);}
			//out.println(old_department_id);
			re.close();  
			db.close();
	
	
String get_number="select agency_id from placement_record where student_id="+student_id+";";
	db.connect();
	 rs=db.execSQL(get_number);
	//out.println("*"+j+"*");
	j=0;
	while(rs.next())
	{
	j++;
	}
	rs.close();
	db.close();
	//out.println(j);
	if(j==2)
	{out.println(display1+"Student has been already registered for two companies"+display2);}
			
	if(j==1||j==0)		
		{	if(agency_id!=0&&student_id!=0)
			{	
			//out.println(confirmation);
				String main_record=" insert into placement_record(student_id,agency_id,basic,hra,others,gross,take_home,ctc,location_of_posting,remarks,confirmation)"+" values ("+student_id+","+agency_id+","+Double.parseDouble(basic)+","+Double.parseDouble(hra)+","+Double.parseDouble(others)+","+Double.parseDouble(gross)+","+Double.parseDouble(take_home)+","+Double.parseDouble(ctc)+",'"+location_of_posting+"','"+remarks+"',"+Integer.parseInt(confirmation)+");";
				//out.println("rohan 3");
				db.connect();
				num_rows=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();
                               
                              String update_agency="update student set final_agency_id="+agency_id+" where student_id="+student_id+";";
                                 db.connect();
                                 int update_rows=db.updateSQL(update_agency);
                                 db.close();	
				
                                if(num_rows==1)
					{
						out.println(display1+"Record Added in Placement Record"+display2);
					 

					}
				else
				out.println(display1+"Could not add record in Placement Record"+display2);
			}
			else
				out.println(display1+"Could not add record since Agency or Student does not exists.."+display2);
		}	
		
	}
	
	
%>
<h4>&nbsp;</h4>
<br><br>

		<h2>PLACEMENT RECORD FORM</h2>
		<br><br>
		

<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty(this)">
<table width="456" align="center">
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
<tr>
<td>Student  roll number </td>
<td><input type="text" name="student_roll_number" id="student_roll_number"></td>
</tr>
<tr>
<td >Basic</td>
<td><input name="basic" id ="basic" type="text"></td>
</tr>
<tr>
<td >Hra </td>
<td ><input type="text" name="hra" id="hra"></td>
</tr>
<tr><tr>
<td >Others </td>
<td ><input type="text" name="others" id="others"></td>
</tr><tr>
<td >Gross </td>
<td ><input type="text" name="gross" id="gross"></td>
</tr>
<tr>
<tr>
<tr>
<td >Take home </td>
<td ><input type="text" name="take_home" id="take_home"></td>
</tr>
<tr>
<tr>
<td >CTC </td>
<td ><input type="text" name="ctc" id="ctc"></td>
</tr>
<tr>
<tr>
<td >Location of Posting </td>
<td>
<input name="location_of_posting" id ="location_of_posting" type="text"></td>
</tr>
<tr>
<td >Remarks</td>
<td><textarea name="remarks" cols="40" rows="7"></textarea></td>
</tr>
 <tr>
            <td>Confirmation</td>
      <td>
			
 NO <input name="confirmation" id="confimation" type="radio"  value="0">
 YES<input name="confirmation" id="confirmation" type="radio"  value="1"></td>
        </tr>
</table>
<p>&nbsp;</p>
<p>.....
  <input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" >
  .....<br>
  <br>
</p>
</form>
<hr>
	
<%			if(submit!=null&& j!=2)
			{
				String table2="select * from placement_record where agency_id ="+agency_id+" and student_id="+student_id+";";
				out.println(create_table(table2,db));
			}
	%>	
<hr>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
