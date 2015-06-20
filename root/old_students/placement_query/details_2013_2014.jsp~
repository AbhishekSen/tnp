<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">


<script src="../../js/datetimepicker.js"></script>
<script type="text/javascript" src="../../js/tabber.js"></script>
<link rel="stylesheet" href="../../js/example.css" TYPE="text/css" MEDIA="screen">


</script><script src="../../js/datetimepicker.js"></script>
<%@page language="java" import="pack.DbBean3"%> 


<jsp:useBean id="db3" class="pack.DbBean3" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>
<%@ include file="../../utils/session_validator.jsp"%>

<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	/*if (session_validate(sid,db3).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");*/
%>
<%
	     /*	String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet res= db.execSQL(sql_username);
		if(res.next()) 
		{
		username = res.getString(1);
		}
		
		res.close();
		db.close();*/
	
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
        db3.fetchConfigDetails(); //newly added
	String student_roll_number=request.getParameter("student_roll_number");
	int student_id=0;
	int department_id=0;
	int programme_id=0;

%>
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
        String comp_1=request.getParameter("comp_1");
        String comp_2=request.getParameter("comp_2");
        String comp_3=request.getParameter("comp_3");
        String comp_4=request.getParameter("comp_4");
        String comp_5=request.getParameter("comp_5");
        String address2=request.getParameter("address2");
        String address3=request.getParameter("address3");
        String fin_and_banking_sector=request.getParameter("fin_and_banking_sector");
        String sex_value="";
        String department_name="";
        String programme_name="";
			
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a></div>
 <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <div id="globalLink">
      <div id="globalLink2"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
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
    <h2>Welcome </h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div>
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
      <a href="../main.jsp" >See Old Student Records</a>
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="" alt="" width="177" height="298" />
      </div>
  </div>
  <div id="content"> 
    <div class="feature">
    <%	if(submit==null)
	{
		String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"';" ;
		db3.connect(); 
		ResultSet rs= db3.execSQL(sql_get_data);
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
                fin_and_banking_sector=rs.getString(61); 
		comp_1=rs.getString(66);
                comp_2=rs.getString(67);
                comp_3=rs.getString(68);
                comp_4=rs.getString(69);
                comp_5=rs.getString(70);
                address2=rs.getString(72);
                address3=rs.getString(73);
		}
		rs.close();
		db3.close();
              
              
              String sql_temp="select sex_value from sex where sex_id='"+sex+"';" ;
		db3.connect(); 
		ResultSet rsab= db3.execSQL(sql_temp);
                if(rsab.next()) 
		{
			sex_value=rsab.getString(1);
                }
              rsab.close();
	      db3.close();


              sql_temp="select department_name from department_record where department_id='"+department_id+"';" ;
		db3.connect(); 
		rsab= db3.execSQL(sql_temp);
                if(rsab.next()) 
		{
			department_name=rsab.getString(1);
                }
              rsab.close();
	      db3.close();

             sql_temp="select programme_name from programme_record where programme_id='"+programme_id+"';" ;
		db3.connect(); 
		rsab= db3.execSQL(sql_temp);
                if(rsab.next()) 
		{
			programme_name=rsab.getString(1);
                }
              rsab.close();
	      db3.close();
	}

%>

       <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="650" height="528" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="200"><strong>Student roll number</strong></td>
                      <td width="351"><%=student_roll_number%></td>
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
                      <td><%=sex_value%></td>
                    </tr>
                    <tr>
                      <td><strong>Category</strong></td>
                      <td><%=category%></td>
                    </tr>
                    <tr>
                      <td><strong>Department</strong></td>
                      <td><%=department_name%></td>
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
                      </tr>
                      <tr>
                      <td><strong>Room No.</strong></td>
                      <td><%=room_no%></td>
                    </tr>
                    <tr>
                      <td><strong>Email Id </strong></td>
                      <td><%=email1%> <strong> (iitg e-mail)</strong></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><%=email2%> (<strong>alternative e-mail)</strong></td>
                    </tr>
                    <tr>
                      <td><strong>Telephone No</strong></td>
                      <td><%=mobile1%></td>
                    </tr>
                    <tr>
                      <td><strong>Mobile No.</strong></td>
                      <td><%=mobile2%></td>
                    </tr>
                    <tr>
                      <td height="150"><strong>Permanent Address</strong></td>
                      <td><%=address%><br/><%=address2%><br/><%=address3%></td>
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
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Academic Details</h2>
                <p>&nbsp;</p>
                <center>
                  <table width="694" height="414" align="center" cellpadding="5" cellspacing="5">
                    
                    <tr>
                      <td><strong>Level</strong></td>
                      <td><strong>Board/Institution</strong></td>
                      <td><strong>Medium</strong></td>
                      <td><strong>% of Marks</strong></td>
                      <td><strong>Year of Passing</strong></td>
                    </tr>
                    <tr>
                      <td><strong>X STD</strong></td>
                      <td><%=x_board%></td>
                      <td><%=x_medium%></td>
                      <td><%=x_marks%></td>
                      <td><%=x_year%></td>
                    </tr>
                    <tr>
                      <td><strong>XII STD</strong></td>
                      <td><%=xii_board%></td>
                      <td><%=xii_medium%></td>
                      <td><%=xii_marks%></td>
                      <td><%=xii_year%></td>
                    </tr>
                    <tr>
                      <td><strong>Gap in Study</strong></td>
                      <td><%=gap%> <strong>year</strong></td>

                    </tr>
                    <tr>
                      <td width="174"><strong>CPI(up to 6th semester)</strong></td>
                      <td width="141"><%=cpi%></td>
                    </tr>
                    <tr>
                      <td><strong>SPI in all semesters</strong></td>
                      <td><strong>Backlog(if any)</strong></td>
                      <td width="105"><%=backlog%></td>
                    </tr>
                    <tr>
                      <td><strong>1st Sem</strong></td>
                      <td><strong>2nd Sem</strong></td>
                      <td><strong>3rd Sem</strong></td>
                      <td width="122"><strong>4th Sem</strong></td>
                      <td width="128"><strong>5th Sem</strong></td>
                      
                    </tr>
                    <tr>
                      <td><%=sem1%></td>
                      <td><%=sem2%></td>
                      <td><%=sem3%></td>
                      <td><%=sem4%></td>
                      <td><%=sem5%></td>
                      
                    </tr>
                    <tr>
                    <td ><strong>6th Sem</strong></td>
                      <td><strong>7th Sem</strong></td>
                    </tr>
                    <tr>
                    <td><%=sem6%></td>
                      <td><%=sem7%></td>
                    </tr>
                    <tr>
                      <td><strong>Preferred JOb</strong></td>
                      <td><strong>Core Sector</strong></td>
                      <td><strong>Govt. Sector</strong></td>
                      <td><strong>IT Sector</strong></td>
                      <td><strong>Management Sector</strong></td>
                      <td><strong>Fin.& Banking Sector</strong></td>
                    </tr>
                    <tr>
                      <td>(1st,2nd or 3rd preferences in the respective boxes)</td>
                      <td><%=core%></td>
                      <td><%=govt%></td>
                      <td><%=IT%></td>
                      <td><%=management%></td>
                      <td><%=fin_and_banking_sector%></td>
                    </tr>
                    <tr>
                      <td><strong>Dream Company</strong></td>
                      <td><%=dream_company%></td>
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
                    <td height="32" width="350" ><strong>Company I</strong></td>
                    <td><%=comp_1%></td>
                  </tr>
                  <tr>
                    <td height="32" ><strong>Company II</strong></td>
                    <td ><%=comp_2%></td>
                  </tr>
                  <tr>
                    <td height="32" ><strong>Company III</strong></td>
                    <td ><%=comp_3%></td>
                  </tr>
                  <tr>
                    <td height="32" ><strong>Company IV</strong></td>
                    <td ><%=comp_4%></td>
                  </tr>
                    <tr>
                      <td height="32" ><strong>Company V</strong></td>
                      <td ><%=comp_5%></td>
                    </tr>
                  </table>
                <p>&nbsp;</p>
              </div>
              
            </div></td>
          </tr>
          <tr>
            <td align="right">
          </tr>
          </td>
        </table>

      <p align="center">&nbsp;</p>
    </div>
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name </div>
</div>
</body>

</html>

