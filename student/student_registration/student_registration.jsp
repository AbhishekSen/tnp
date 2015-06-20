<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

var time = 3000;
var numofitems = 7;


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
 
 	if(ptr.student_roll_number.value.length==0)
  message+="Please enter the Student Roll Number \n"; 
  
  	if(ptr.student_name.value.length==0)
  message+="Please enter the Student Name \n"; 
  
  	if(ptr.dob.value.length==0)
  message+="Please enter the Date of Birth \n"; 
 
  if (check_phone(ptr.mobile1.value)==0)
  		message+="Please enter a valid Phone Number1 \n" ;

  if (check_phone(ptr.mobile2.value)==0)
  		message+="Please enter a valid Phone Number2 \n" ;

  if (check_phone(ptr.telephone.value)==0)
  		message+="Please enter a valid Home Phone Number \n" ;
 
	if(ptr.category.value.length==0)
  message+="Please select category\n" ;
  
  	if(ptr.hostel.value.length==0)
  message+="Please select Hostel \n" ;
  
	if(ptr.department_name.value.length==0)
  message+="Please select Department Name \n" ;
  
	if(ptr.program_name.length==0)
 message+="Please select Programme Name \n" ;
 
	if(ptr.rank.value.length==0)
  message+="Please enter a JEE Rank \n" ;

	if(ptr.room.value.length==0)
 	message+="Please enter Room No \n" ;

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
<script type="text/javascript" src="../js/tabber.js"></script>
<link rel="stylesheet" href="../js/example.css" TYPE="text/css" MEDIA="screen">


</script><script src="../js/datetimepicker.js"></script>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>

<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rus= db.execSQL(sql_username);
		if(rus.next()) 
		{
		username = rus.getString(1);
		}
		
		rus.close();
		db.close();
	
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%!int row=0;
   int success=0;
   String name=null;
   int department_id=0;
   int  programme_id=0;
%>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String submit=request.getParameter("submit");
        String name=request.getParameter("student_name");
        String student_roll_number=request.getParameter("student_roll_number");
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
			

	if(submit!=null && student_roll_number!=null )
	{  	

		String sql_get_data="select department_id from department_record where department_name='"+dept_name+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
			department_id=rs.getInt(1);
		}
		rs.close();
		db.close();
		
		sql_get_data="select programme_id from programme_record where programme_name='"+prog_name+"';" ;
		db.connect(); 
		ResultSet res= db.execSQL(sql_get_data);
		if(res.next()) 
		{
			programme_id=res.getInt(1);
		}
		res.close();
		db.close();
		
		String duplicate=get_unique_field("select student_id from student_record where student_roll_number='"+student_roll_number+"';",db);
		if(duplicate==null)
		{
		
		String main_record=" insert into student_record (student_roll_number,student_name,date_of_birth,sex,department_id,programme_id,category,jee_rank,hostel,room_no,email,email_alternative,contact_number,contact_number2,permanent_address,pin,home_contact_number,x_board,x_medium,x_percentage,x_pass_year,xii_board,xii_medium,xii_percentage,xii_pass_year,gap_in_study,gap_reason,cpi_6sem,backlog,spi_1sem,spi_2sem,spi_3sem,spi_4sem,spi_5sem,spi_6sem,spi_7sem,core_sector,govt_sector,it_sector,management_sector,dream_company)"+
" values ('"+student_roll_number+"','"+name+"','"+sql_convert_date(dob)+"',"+sex+",'"+department_id+"','"+programme_id+"','"+category+"','"+jee_rank+"','"+hostel+"','"+room_no+"','"+email1+"','"+email2+"','"+mobile1+"','"+mobile2+"','"+address+"','"+pin+"','"+telephone+"','"+x_board+"','"+x_medium+"','"+x_marks+"','"+x_year+"','"+xii_board+"','"+xii_medium+"','"+xii_marks+"','"+xii_year+"',"+gap+",'"+gap_reason+"','"+cpi+"','"+backlog+"',"+sem1+","+sem2+","+sem3+","+sem4+","+sem5+","+sem6+","+sem7+",'"+core+"','"+govt+"','"+IT+"','"+management+"','"+dream_company+"');";
			
		db.connect();
		int num_rows=db.updateSQL(main_record);
		db.close();	
		if(num_rows==1)
				response.sendRedirect("success.jsp");
		else
				response.sendRedirect("error.jsp");
		}
		else
				response.sendRedirect("error2.jsp");
			
     }

%>
<body background="form/New/jee3.jpg">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> </div>
 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div>

<div id="pagecell1">
  <!--pagecell1-->
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr">
  <div id="pageName">
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
    <a href="../instructions/info.jsp">Instructions</a><a href="edit.jsp"  >Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp" >Check Eligibility</a><a href="../agency_query/placement_query.jsp" >Organization Information</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
    <%--  <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a>
      <img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" /></div>
  </div>
  <div id="content">
    <div class="feature">

      <form name="form_company_profile" id="form_company_profile" method="post" onSubmit="return validate_empty(form_company_profile)">
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="716" height="751" align="center" cellpadding="5" cellspacing="5">
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
                      <td><a href="javascript:NewCal('dob','ddmmyyyy')">
                        <input readonly type="text" name="dob" id="dob">
                      </a></td>
                    </tr>
                    <tr>
                      <td>Sex</td>
                      <td><input type="radio" name="sex" id="sex" value="1">
                        Male
                        <input type="radio" name="sex" id="sex" value="0">
                        Female</td>
                    </tr>
                    <tr>
                      <td>Category(SC/ST/OBC/GEN/PH)</td>
                      <td><input type="text" name="category" id="category"></td>
                    </tr>
                    <tr>
                      <td>Department</td>
                      <td><select name="department_name" id="department_name" >
                        <%!String department_list1;%>
                        <% department_list1=drop_down("select department_name from department_record;",db); %>
                        <option value="0">-----------------------select----------------------</option>
                        <%=department_list1%>
                      </select></td>
                    </tr>
                    <tr>
                      <td>Program</td>
                      <td><select name="program_name" id="program_name" >
                        <%!String program_list;%>
                        <% String program_list=drop_down("select programme_name from programme_record;",db); %>
                        <option value="0">-------------select--------------------</option>
                        <%=program_list%>
                      </select></td>
                    </tr>
                    <tr>
                      <td>JEE Rank(AIR)</td>
                      <td><input type="text" name="rank" id="rank"></td>
                    </tr>
                    <tr>
                      <td>Hostel</td>
                      <td><select name="hostel" id="hostel" >
                        <%!String hostel_list;%>
                        <% String hostel_list=drop_down("select hostel_name from hostel_list;",db); %>
                        <option value="0">-------------select--------------------</option>
                        <%=hostel_list%>
                      </select></td>
                      </tr>
                      <tr>
                      <td>Room No.</td>
                      <td><input type="text" name="room" id"room"></td>
                    </tr>
                    <tr>
                      <td>Email</td>
                      <td><input type="text" name="email1" id="email1">
                        (iitg e-mail)</td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="text" name="email2" id="email2">
                        (alternative e-mail)</td>
                    </tr>
                    <tr>
                      <td>Contact Telephone/Mobile No.</td>
                      <td><input type="text" name="mobile1" id="mobile1"></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="text" name="mobile2" id="mobile2"></td>
                    </tr>
                    <tr>
                      <td height="150">Permanent Address</td>
                      <td><textarea name="address" id="address" cols="30" rows="5"></textarea></td>
                    </tr>
                    <tr>
                      <td>Pin</td>
                      <td><input type="text" name="pin" id="pin"></td>
                    </tr>
                    <tr>
                      <td>Home Telephone No.(with code)</td>
                      <td><input type="text" name="telephone" id="telephone"></td>
                    </tr>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Academic Details</h2>
                <p>&nbsp;</p>
                <center>
                  <table width="800" height="515" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td>Level</td>
                      <td>Board/Institution</td>
                      <td>Medium</td>
                      <td>% of Marks</td>
                      <td>Year of Passing</td>
                    </tr>
                    <tr>
                      <td>X STD</td>
                      <td><input type="text" name="x_board" id="x_board"></td>
                      <td><input type="text" name="x_medium" id="x_medium"></td>
                      <td><input type="text" name="x_marks" id="x_marks"></td>
                      <td><input type="text" name="x_year" id="x_year"></td>
                    </tr>
                    <tr>
                      <td>XII STD</td>
                      <td><input type="text" name="xii_board" id="xii_board"></td>
                      <td><input type="text" name="xii_medium" id="xii_medium"></td>
                      <td><input type="text" name="xii_marks" id="xii_marks"></td>
                      <td><input type="text" name="xii_year" id="xii_year"></td>
                    </tr>
                    <tr>
                      <td>Gap in Study</td>
                      <td><input type="radio" name="gap" id="gap" value="0">
                        Yes
                        <input type="radio" name="gap" id="gap" value="1">
                        No</td>
                    </tr>
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
                    </tr>
                    <tr>
                      <td><input type="text" name="sem1" id="sem1"></td>
                      <td><input type="text" name="sem2" id="sem2"></td>
                      <td><input type="text" name="sem3" id="sem3"></td>
                      <td><input type="text" name="sem4" id="sem4"></td>
                      <td><input type="text" name="sem5" id="sem5"></td>
                    </tr>
                    <tr>
                      <td>6th Sem</td>
                      <td>7th Sem</td>
                    </tr>
                    <tr>
                      <td><input type="text" name="sem6" id="sem6"></td>
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
                   <p>&nbsp;</p>
                </center>
              </div>
              <div class="tabbertab" id="step[3]">
                <h2>Choice Sheet</h2>
                <p>&nbsp;</p>
                <table width="640" height="192" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td height="32" width="350" >Organization I</td>
                    <td width="307" ><input name="job_description" id="job_description" type="text" ></td>
                  </tr>
                  <tr>
                    <td height="32" >Organization II</td>
                    <td ><input name="job_designation" id="job_designation" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32" >Organization III</td>
                    <td ><input name="location_of_posting" id ="location_of_posting" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32" >Organization IV</td>
                    <td ><input name="location_of_posting2" id ="location_of_posting2" type="text"></td>
                  </tr>
                    <tr>
                      <td height="32" >Organization V</td>
                      <td ><input name="location_of_posting2" id ="location_of_posting3" type="text"></td>
                    </tr>
                  </table>
                <p>&nbsp;</p>
              </div>
              
            </div></td>
          </tr>
          <tr>
            <td align="right"><input type="submit" name="submit" id="submit" value="Submit">
          </tr>
          </td>
        </table>
        <p>&nbsp;</p>
<p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </form>
      <p align="center">&nbsp;</p>
    </div>
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name </div>
</div>
</body>

</html>

