<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
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

<script src="../../js/datetimepicker.js"></script>
</head>
<body onmousemove="closesubnav(event);"> 

<%@page language="java" import="pack.DbBean"%> 


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
<%@ page import="java.lang.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>

<%
	String student_roll_number=request.getParameter("student_roll_number");
	int student_id=0;
	int department_id=0;
	int programme_id=0;
	String sex_id="0";
	String gap_id="1";

%>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
		String sex_name="";
		String gap_name="";
		
        String name=request.getParameter("student_name");
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex"); 
        String category=request.getParameter("category");
        String department_name=request.getParameter("department_name");
        String programme_name=request.getParameter("programme_name");
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
			
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
   <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink">
      <div id="globalLink2"> <a href="main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    </div> 
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="116" width="115"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
          <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
  <div id="content"> 
    <div class="feature">
    <%	
		String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
			
			
			name=rs.getString(3);
			
				
		
			dob=rs.getString(4);
			sex=rs.getString(5);
			category=rs.getString(6);
			department_id=rs.getInt(7);
			programme_id=rs.getInt(8);
			jee_rank=rs.getString(9);
        	hostel=rs.getString(10);
       		room_no=rs.getString(11);
			email1=rs.getString(12);
            email2=rs.getString(13);
        	mobile1=rs.getString(14);
       		mobile2=rs.getString(15);
       		address=rs.getString(16);
       		pin=rs.getString(17);
      		telephone=rs.getString(18);
        	x_board=rs.getString(19);
       		x_medium=rs.getString(20);
          	x_marks=rs.getString(21);
       		x_year=rs.getString(22);
        	xii_board=rs.getString(23);
        	xii_medium=rs.getString(24);
        	xii_marks=rs.getString(25);
        	xii_year=rs.getString(26);
        	gap=rs.getString(27);
			gap_reason=rs.getString(28);
        	cpi=rs.getString(29);
        	backlog=rs.getString(30);
        	sem1=rs.getString(31);
        	sem2=rs.getString(32);
        	sem3=rs.getString(33);
        	sem4=rs.getString(34);
        	sem5=rs.getString(35);
        	sem6=rs.getString(36);
        	sem7=rs.getString(37);
        	core=rs.getString(38);
        	govt=rs.getString(39);
			IT=rs.getString(40);
        	management=rs.getString(41);
			dream_company=rs.getString(42); 
			
		}
		rs.close();
		db.close();
		
		sql_get_data="select department_name from department_record where department_id="+department_id+";" ;
		db.connect(); 
		ResultSet rds= db.execSQL(sql_get_data);
		if(rds.next()) 
		{	
			department_name=rds.getString(1);
		}
		rds.close();
		db.close();
		
		sql_get_data="select programme_name from programme_record where programme_id="+programme_id+";" ;
		db.connect(); 
		ResultSet rdes= db.execSQL(sql_get_data);
		if(rdes.next()) 
		{	
			programme_name=rdes.getString(1);
		}
		rdes.close();
		db.close();
		
		if(sex.equals(sex_id))
		{
			sex_name="Male";
			
		}
		else
		{
			sex_name="Female";
		}
		
		if(gap.equals(gap_id))
		{
			gap_name="No";
			
		}
		else
		{
			gap_name="Yes";
		}
		
		if(name==null)
		response.sendRedirect("error.jsp");
		
	

%>

      <form  name="form_agency_registration" id="form_agency_registration" >
        <p><strong>Student Details</strong></p>
        <table width="1000" align="center" cellpadding="5" cellspacing="5">
          <tr>
            <td width="200"><strong>Student roll number</strong></td>
            <td width="351"><%=student_roll_number%> </td>
          </tr>
          <tr>
            <td><strong>Name</strong></td>
            <td><%=name%></td>
          </tr>
          <tr>
            <td><strong>Date of Birth</strong></td>
            <td><%=dob%></td>
          </tr>
          <tr>
            <td><strong>Sex</strong></td>
            <td><%=sex_name%></td>
          </tr>
          <tr>
            <td><strong>Category</strong></td>
            <td><%=category%></td>
          </tr>
          <tr>
            <td><strong>Department</strong></td>
            <td><%=department_name%>
           </td>
          </tr>
          <tr>
            <td><strong>Programme</strong></td>
            <td><%=programme_name%></td>
          </tr>
          <tr>
            <td><strong>JEE Rank(AIR)</strong></td>
            <td><%=jee_rank%></td>
          </tr>
          <tr>
            <td><strong>Hostel</strong></td>
            <td><%=hostel%></td>
            <td><strong>Room No.</strong></td>
            <td><%=room_no%></td>
          </tr>
          <tr>
            <td><strong>Email</strong></td>
            <td><%=email1%>
              <strong>(iitg e-mail)</strong></td>
          </tr>
          <tr>
            <td></td>
            <td><%=email2%>
            (<strong>alternative e-mail)</strong></td>
          </tr>
          <tr>
            <td><strong>Contact Telephone/Mobile No.</strong></td>
            <td><%=mobile1%></td>
          </tr>
          <tr>
            <td></td>
            <td><%=mobile2%></td>
          </tr>
          <tr>
            <td height="150"><strong>Permanent Address</strong></td>
            <td><%=address%></td>
          </tr>
          <tr>
            <td><strong>Pin</strong></td>
            <td><%=pin%></td>
          </tr>
          <tr>
            <td><strong>Home Telephone No.(with code)</strong></td>
            <td><%=telephone%></td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <table width="1000" align="center" cellpadding="5" cellspacing="5">
          <tr>
            <td width="200"><strong>Academic Details</strong></td>
            <td></td>
          </tr>
          <tr>
            <td><strong>Level</strong></td>
            <td><strong>Board/Institution</strong></td>
            <td><strong>Medium</strong></td>
            <td>&nbsp;</td>
            <td><strong>% of Marks</strong></td>
            <td><strong>Year of Passing</strong></td>
          </tr>
          <tr>
            <td><strong>X STD</strong></td>
            <td><%=x_board%></td>
            <td><%=x_medium%></td>
            <td>&nbsp;</td>
            <td><%=x_marks%></td>
            <td><%=x_year%></td>
          </tr>
          <tr>
            <td><strong>XII STD</strong></td>
            <td><%=xii_board%></td>
            <td><%=xii_medium%></td>
            <td>&nbsp;</td>
            <td><%=xii_marks%></td>
            <td><%=xii_year%></td>
          </tr>
          <tr>
            <td><strong>Gap in Study</strong></td>
            <td><%=gap_name%></td>
            <td align="center"><strong>Reasons</strong></td>
            <td>&nbsp;</td>
          </tr>
        
        
          <tr>
            <td width="151"><strong>CPI(up to 6th semester)</strong></td>
            <td width="126"><%=cpi%></td>
          </tr>
          <tr>
            <td><strong>SPI in all semesters</strong></td>
            <td><strong>Backlog(if any)</strong></td>
            <td width="120"><%=backlog%></td>
          </tr>
          <tr>
            <td><strong>1st Sem</strong></td>
            <td><strong>2nd Sem</strong></td>
            <td><strong>3rd Sem</strong></td>
            <td width="107"><strong>4th Sem</strong></td>
            <td width="120"><strong>5th Sem</strong></td>
            <td width="90"><strong>6th Sem</strong></td>
          </tr>
          <tr>
            <td><%=sem1%></td>
            <td><%=sem2%></td>
            <td><%=sem3%></td>
            <td><%=sem4%></td>
            <td><%=sem5%></td>
            <td><%=sem6%></td>
          </tr>
          <tr>
            <td><strong>7th Sem</strong></td>
          </tr>
          <tr>
            <td><%=sem7%></td>
          </tr>
          <tr>
            <td><strong>Preferred JOb</strong></td>
            <td><strong>Core Sector</strong></td>
            <td><strong>Govt. Sector</strong></td>
            <td><strong>IT Sector</strong></td>
            <td><strong>Management Sector</strong></td>
          </tr>
          <tr>
            <td>(1st,2nd or 3rd preferences in the respective boxes)</td>
            <td><%=core%></td>
            <td><%=govt%></td>
            <td><%=IT%></td>
            <td><%=management%></td>
          </tr>
          <tr>
            <td><strong>Dream Company(if any state)</strong></td>
            <td><%=dream_company%></td>
          </tr>
        </table>
        <p>.        </p>
        <table width="65" height="32" border="0" align="center">
          <tr>
            <td></td>
          </tr>
        </table>
        <p>&nbsp;  </p>
        <p>&nbsp;</p>
      </form>



    <p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name
  </div> 
</div> 
<!--end pagecell1--> 
<br> 
<script type="text/javascript">
    <!--
      var menuitem1 = new menu(7,1,"hidden");
			var menuitem2 = new menu(7,2,"hidden");
			var menuitem3 = new menu(7,3,"hidden");
			var menuitem4 = new menu(7,4,"hidden");
			var menuitem5 = new menu(7,5,"hidden");
			var menuitem6 = new menu(7,6,"hidden");
			var menuitem7 = new menu(7,7,"hidden");
    // -->
    </script> 
</body>
</html>
