<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>STUDENT REGISTRATION</title>
<script type="text/javascript">
 function check_phone(test)
{	
	var len=0;
	var str="1234567890-";
	for(i=0;i<test.length;i++)
	{
		for(j=0;j<str.length;j++)
		{
			if(test.charAt(i)==str.charAt(j))
			len++;
		}
	}
	
	if(len==test.length)
	return 1
	else
	return 0;
}


 

function validate_empty(ptr)
{	
 var message="";
  if (check_phone(ptr.mobile1.value)==0)
  		message+="Please enter a valid Phone Number1 \n" ;

  if (check_phone(ptr.mobile2.value)==0)
  		message+="Please enter a valid Phone Number2 \n" ;

  if (check_phone(ptr.telephone.value)==0)
  		message+="Please enter a valid Home Phone Number \n" ;

  if (ptr.student_roll_number.value.length == 0 )
  	message+="Please enter the roll no \n" ;
 
  if(ptr.dob.value.length==0)
    message+="Please enter date of birth \n";

  if(ptr.student_name.value.length==0)
    ptr.student_name.value="null"; 
 
if(ptr.category.value.length==0)
  ptr.category.value="null";
 
if(ptr.department_name.value.length==0)
  ptr.department_name.value="null";

if(ptr.program_name.length==0)
  ptr.program_name.value="null";

if(ptr.rank.value.length==0)
  ptr.rank.value="null";

if(ptr.hostel.value.length==0)
  ptr.hostel.value="null";

if(ptr.room.value.length==0)
  ptr.room.value="null";

if(ptr.sem1.value.length==0)
  message+="Please enter the 1st sem spi \n";

if(ptr.sem2.value.length==0)
  message+="Please enter the 2nd sem spi \n";

if(ptr.sem3.value.length==0)
  message+="Please enter the 3rd sem spi \n";

if(ptr.sem4.value.length==0)
  message+="Please enter the 4th sem spi \n";

if(ptr.sem5.value.length==0)
  message+="Please enter the 5th sem spi \n";

if(ptr.sem6.value.length==0)
  message+="Please enter the 6th sem spi \n";

if(ptr.sem7.value.length==0)
  message+="Please enter the 7th sem spi \n";

  
   
  
	
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
<style type="text/css">
<!--
body {
	background-color: #FFFFCC;
}
-->
</style></head>


<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 

<jsp:include page="../utils/head.html" flush="true"/>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<jsp:useBean id="db2" class="pack.DbBean2" scope="session" />

<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<% 
  db2.fetchConfigDetails(); 
  db.fetchConfigDetails(); //newly added
%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<jsp:useBean id="obj_student_registration" class="pack_student_registration.student_registration" scope="page"/>
<jsp:setProperty name="obj_student_registration" property="student_roll_number" param="student_roll_number" /> 
<%!int row=0;
   int success=0;
   String name=null;  %>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);
	String submit=request.getParameter("submit");
        String name=request.getParameter("student_name");
        
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex");
        
        String category=request.getParameter("category");
        String dept_name=request.getParameter("department_name");
        String prog_name=request.getParameter("program_name");
        String jee_rank=request.getParameter("rank");
        String hostel=request.getParameter("hostel");
        String room_no=request.getParameter("room");
	String email1=request.getParameter("email1");
        String email2=request.getParameter("email2");
        String mobile1=request.getParameter("mobile1");
        String mobile2=request.getParameter("mobile2");
        String address=request.getParameter("address");
        String pin=request.getParameter("pin");
        String telephone=request.getParameter("telephone");
        String x_board=request.getParameter("x_board");
        String x_medium=request.getParameter("x_medium");
        String x_class=request.getParameter("x_class");
        String x_marks=request.getParameter("x_marks");
        String x_year=request.getParameter("x_year");
        String xii_board=request.getParameter("xii_board");
        String xii_medium=request.getParameter("xii_medium");
        String xii_class=request.getParameter("xii_class");
        String xii_marks=request.getParameter("xii_marks");
        String xii_year=request.getParameter("xii_year");
        String gap=request.getParameter("gap");
        String gap_reason=request.getParameter("reason");
        String cpi=request.getParameter("cpi");
        String backlog=request.getParameter("backlog");
        String sem1=request.getParameter("sem1");
       
        String sem2=request.getParameter("sem2");
        String sem3=request.getParameter("sem3");
        String sem4=request.getParameter("sem4");
        String sem5=request.getParameter("sem5");
        String sem6=request.getParameter("sem6");
        String sem7=request.getParameter("sem7");
        String core=request.getParameter("core");
        String govt=request.getParameter("govt");
        String IT=request.getParameter("IT");
        String management=request.getParameter("management");
        String dream_company=request.getParameter("dream_company"); 
    //   Float sem11=Float.parseFloat(sem1);
    //    out.println(sem11);

	String student_roll_number=obj_student_registration.getStudent_roll_number(); 
	if(submit !=null)
	{
	 	String record="select student_id from student where student_roll_number='"+student_roll_number+"';";
			
			db.connect();
			ResultSet rs=db.execSQL(record);
	if(rs.next())
				row=rs.getInt(1);
				//out.println(rs.getString(1));
				else
				row=0;	
				
					db.close();}
				if (row!=0)
					{out.println(display1+"Student already registered"+display2);
                                         success++;} 
	if(submit!=null && student_roll_number!=null && row==0 )
		{	

                        String get_stud_id="select student_id from main_student_record where student_roll_number='"+student_roll_number+"';";
                        db2.connect();
                        ResultSet rs=db2.execSQL(get_stud_id);
                        if(rs.next())
                       { int stud_id=rs.getInt(1);   			
			int num_rows=0;

String main_record=" insert into student (student_id,student_roll_number,student_year,student_name,date_of_birth,sex,category,department_name,program_name,jee_rank,hostel,room_no,email,email_alternative,contact_number,contact_number2,permanent_address,pin,home_contact_number,x_board,x_medium,x_division,x_percentage,x_pass_year,xii_board,xii_medium,xii_division,xii_percentage,xii_pass_year,gap_in_study,gap_reason,cpi_6sem,backlog,spi_1sem,spi_2sem,spi_3sem,spi_4sem,spi_5sem,spi_6sem,spi_7sem,core_sector,govt_sector,IT_sector,management_sector,dream_company)"+
" values ("+stud_id+",'"+student_roll_number+"',"+year+",'"+name+"','"+sql_convert_date(dob)+"',"+sex+",'"+category+"','"+dept_name+"','"+prog_name+"','"+jee_rank+"','"+hostel+"','"+room_no+"','"+email1+"','"+email2+"','"+mobile1+"','"+mobile2+"','"+address+"','"+pin+"','"+telephone+"','"+x_board+"','"+x_medium+"','"+x_class+"','"+x_marks+"','"+x_year+"','"+xii_board+"','"+xii_medium+"','"+xii_class+"','"+xii_marks+"','"+xii_year+"',"+gap+",'"+gap_reason+"','"+cpi+"','"+backlog+"',"+sem1+","+sem2+","+sem3+","+sem4+","+sem5+","+sem6+","+sem7+",'"+core+"','"+govt+"','"+IT+"','"+management+"','"+dream_company+"');";
			
			db.connect();
			num_rows=db.updateSQL(main_record);
				

					db.close();	
			if(num_rows==1)
				out.println(display1+"Student Added in student Registration"+display2);
			else
				out.println(display1+"Could not add student to registration"+display2);
                       db2.close();
                       rs.close();
                       success++;
                      }
             
                   else
                  { out.println(display1+"Student with roll number "+student_roll_number+" has not yet registered for the present academic year"+display2);
		     db2.close();
                    rs.close();}	
		} 
 %>
<h4>&nbsp;</h4>
<br><br>

		<h2>STUDENT REGISTRATION FORM<%out.println(-year);%></h2>
		<br><br>
		

<form method="post" name="form_agency_registration" id="form_agency_registration" onSubmit="return validate_empty(this)">
   <table width="1000" align="center">
    <tr>
      <td width="200">Student roll number</td>
      <td width="351"><input type="text" name="student_roll_number" id="student_roll_number"></td>
    </tr>
    <tr>
    <td>Name(Capital Letter)</td>
    <td><input type="text" name="student_name" id="student_name"></td>
    </tr>
    <tr>
    <td>Date of Birth</td>
    <td><a href="javascript:NewCal('dob','ddmmyyyy')"><input readonly type="text" name="dob" id="dob"></a></td>
    </tr>
    <tr>
    <td>Sex</td>
    <td><input type="radio" name="sex" id="sex" value="1">Male<input type="radio" name="sex" id="sex" value="0">Female</td>
    </tr>
    <tr>
    <td>Category(SC/ST/OBC/GEN/PH)</td>
    <td><input type="text" name="category" id="category"></td>
    </tr>
    <tr>
    <td>Department</td>
    <td>   <select name="department_name" id="department_name" >
              <option>Biotechnology</option>
              <option>Chemical Engineering</option>
              <option>Chemistry</option>
              <option>Civil Engineering</option>
              <option>Computer Science & Engg.</option>
              <option>Design</option>
              <option>Electronics & Communication</option>
              <option>Humanities</option>
              <option>Mathematics</option>
              <option>Physics</option>
              <option>Centre for Educational Tech.</option>
              <option>Centre for Energy</option>
              <option>Central Instruments Facility</option>
              <option>Centre for Mass Media Communication</option>
              <option>Centre for Nanotechnology</option>
              <option>Computer and Communication Centre</option>
               <option>Centre for Environment</option>
            </select></td>
    </tr>
    <tr>
    <td>Program</td>
    <td>
             <select name="program_name" id="program_name" >
              <option>B.Tech</option>
              <option>M.Tech</option>
              <option>Ph.D</option>
              <option>B.Design</option>
        </select>
        </td>
  </tr>
  <tr>
  <td>JEE Rank(AIR)</td>
  <td><input type="text" name="rank" id="rank"></td>
  </tr>
  <tr>
  <td>Hostel</td>
  <td><input type="text" name="hostel" id="hostel"></td>
  <td>Room No.</td>
  <td><input type="text" name="room" id"room"></td>
  </tr>
  <tr>
  <td>Email</td>
  <td><input type="text" name="email1" id="email1">(iitg e-mail)</td>
  </tr>
  <tr><td></td>
  <td><input type="text" name="email2" id="email2">(alternative e-mail)</td>
  </tr>
  <tr>
  <td>Contact Telephone/Mobile No.</td>
  <td><input type="text" name="mobile1" id="mobile1"></td>
  </tr>
  <tr><td></td>
  <td><input type="text" name="mobile2" id="mobile2"></td>
  </tr>
  <tr>
  <td height="150">Permanent Address</td>
  <td><textarea name="address" id="address" cols="30" rows="5"></textarea></td>
  </tr>
  <tr>
  <td>Pin</td>
  <td><input type="text" name="pin id="pin"></td>
  </tr>
  <tr>
  <td>Home Telephone No.(with code)</td>
  <td><input type="text" name="telephone" id="telephone"></td>
  </tr>
  </table><hr>
  <table width="1000" align="center">
  <tr>
  <td width="200">Academic Details</td>
  <td></td>
  </tr>
  <tr>
  <td>Level</td>
  <td>Board/Institution</td>
  <td>Medium</td>
  <td>Class/Div.</td>
  <td>% of Marks</td>
  <td>Year of Passing</td>
  </tr>
  <tr>
  <td>X STD</td>
  <td><input type="text" name="x_board" id="x_board"></td>
  <td><input type="text" name="x_medium" id="x_medium"></td>
  <td><input type="text" name="x_class" id="x_class"></td>
  <td><input type="text" name="x_marks" id="x_marks"></td>
  <td><input type="text" name="x_year" id="x_year"></td>
  </tr> 
  <tr> 
  <td>XII STD</td>
  <td><input type="text" name="xii_board" id="xii_board"></td>
  <td><input type="text" name="xii_medium" id="xii_medium"></td>
  <td><input type="text" name="xii_class" id="xii_class"></td>
  <td><input type="text" name="xii_marks" id="xii_marks"></td>
  <td><input type="text" name="xii_year" id="xii_year"></td>
  </tr>
  <tr>
  <td>Gap in Study</td>
  <td><input type="radio" name="gap" id="gap" value="0">Yes<input type="radio" name="gap" id="gap" value="1">No</td>
  <td align="center">Reasons</td><td><input type="text" name="reason" id="reason"></td>
  </tr>
  </table><hr>
  <table align="center">
  <tr>
  <td width="200">CPI(up to 6th semester)</td>
  <td><input type="text" name="cpi" id="cpi"></td>
  </tr>
  <tr>
  <td>SPI in all semesters</td>
  <td>Backlog(if any)</td>
  <td><input type="text" name="backlog" id="backlog"></td>
  </tr>
  <tr>
  <td>1st Sem</td>
  <td>2nd Sem</td>
  <td>3rd Sem</td>
  <td>4th Sem</td>
  <td>5th Sem</td>
  <td>6th Sem</td>
  
  </tr>
  <tr>
  <td><input type="text" name="sem1" id="sem1"></td>
  <td><input type="text" name="sem2" id="sem2"></td>
  <td><input type="text" name="sem3" id="sem3"></td>
  <td><input type="text" name="sem4" id="sem4"></td>
  <td><input type="text" name="sem5" id="sem5"></td>
  <td><input type="text" name="sem6" id="sem6"></td>
  </tr>
  <tr>
  <td>7th Sem</td>
  </tr>
  <tr>
   <td><input type="text" name="sem7" id="sem7"></td>
  </tr>
  <tr>
  <td>Preferred JOb</td>
  <td>Core Sector</td>
  <td>Govt. Sector</td>
  <td>IT Sector</td>
  <td>Management Sector</td>
  </tr>
  <tr>
  <td>(state 1st,2nd or 3rd preferences in the respective boxes)</td>
  <td><input type="text" name="core" id="core" ></td>
  <td><input type="text" name="govt" id="govt" ></td>
  <td><input type="text" name="IT" id="IT" ></td>
  <td><input type="text" name="management" id="management" ></td>
  </tr>
  <tr>
  <td>Dream Company(if any state)</td>
  <td><input type="text" name="dream_company" id="dream_company"></td>
  </tr>
  
  </table>
  
  
  
  
  <br>
  <br>
<input class="center" type="submit" value="SUBMIT" name="submit"  id="submit" size="15" >
<br>
<br>
</form>
<hr>
 <% if(submit!=null)
 	{ if(success>=1)
		{String table2="select * from student where student_roll_number = '"+student_roll_number+"' ";
		out.println(create_table(table2,db));} 
	}	
%>
<hr>

<jsp:include page="../utils/foot.html" flush="true"/>
</body>
</html>
