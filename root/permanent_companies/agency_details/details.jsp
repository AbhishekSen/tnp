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
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/sql_convert_date.jsp"%>

<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	
	String agency_id=request.getParameter("agency_id"); // it will take agency_id
%>



<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>

<%  
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");


        // May be all these variables should be initialized to null.
	String agency_name=request.getParameter("agency_name");  // newly added

	String agency_address=request.getParameter("agency_address");
	String agency_website=request.getParameter("agency_website");
	String agency_phone=request.getParameter("agency_phone");
	String agency_mobile=request.getParameter("agency_mobile");
	String agency_fax=request.getParameter("agency_fax");
	String agency_email=request.getParameter("agency_email");
	String agency_person=request.getParameter("agency_person");
	String agency_profile=request.getParameter("agency_profile");
	String shortlist=request.getParameter("shortlist");
	String ppt=request.getParameter("ppt");
	String gd=request.getParameter("gd");
	String aptitude_test=request.getParameter("aptitude_test");
	String interview=request.getParameter("interview");
	String immediate_result_declaration=request.getParameter("immediate_result_declaration");
	String no_of_rounds=request.getParameter("no_of_rounds");
	String no_of_rooms=request.getParameter("no_of_rooms");
	String preferred_date_1=request.getParameter("preferred_date_1");
	String preferred_date_2=request.getParameter("preferred_date_2");
	String date_of_result=request.getParameter("date_of_result");
	String joining_date=request.getParameter("joining_date");
	String lcd=request.getParameter("checkbox2");
	String laptop=request.getParameter("checkbox3");
	String ohp=request.getParameter("checkbox4");
	String equipments=request.getParameter("checkbox");
	String no_of_executive=request.getParameter("no_of_executive");
	String aptitude_duration=request.getParameter("aptitude_duration");
	String cpi=request.getParameter("cpi");
        String nature_business=request.getParameter("nature_business");
	String technical_test=request.getParameter("technical_test");
	String technical_duration=request.getParameter("technical_duration");
				   

%>
<body background="form/New/jee3.jpg">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div>

<div id="pagecell1">
  <!--pagecell1-->
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr">
  <div id="pageName">
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks"><a href="../../placement_record/main.jsp">Placement Record</a> <a href="../main.jsp" >Permanent Organization's</a> <a href="../../temporary_companies/main.jsp" > Temporary Organization's</a> <a href="../../student/main.jsp" target="_blank">Student </a> <a href="../../change_final_date/change_date.jsp" >Change Date Requests</a> <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a> <a href="../../average_package/average_package.jsp" >Average Package Query</a> <a href="../../placement_schedule/main.jsp" >Placement Schedule</a> <a href="../../upload/upload.jsp" >Upload Organization PPT's</a> <a href="../../company_literature/browse.jsp" >Download Organization Literature</a> <a href="../../../logout.jsp">LOGOUT</a><img src="" alt="" width="177" height="298" /></div>
  </div>
  <div id="content">
    <div class="feature">
    <%	
		String sql_get_data="select * from agency where agency_id='"+agency_id+"';" ;
                db.fetchConfigDetails(); // newly added
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
                                agency_name=rs.getString(2);
				nature_business=rs.getString(3);
				agency_website=rs.getString(4);
				agency_profile=rs.getString(5);
				preferred_date_1=rs.getString(6);
				preferred_date_2=rs.getString(7);
				no_of_executive=rs.getString(8);
				cpi=rs.getString(10);
				ppt=rs.getString(11);
				lcd=rs.getString(12);
				laptop=rs.getString(13);
				ohp=rs.getString(14);
				aptitude_test=rs.getString(15);
				aptitude_duration=rs.getString(16);
				gd=rs.getString(17);
				interview=rs.getString(18);
				no_of_rounds=rs.getString(19);
				no_of_rooms=rs.getString(20);
				immediate_result_declaration=rs.getString(21);
				date_of_result=rs.getString(22);
				joining_date=rs.getString(23);
				agency_person=rs.getString(24);
				agency_email=rs.getString(25);
				agency_address=rs.getString(26);
				agency_phone=rs.getString(27);
				agency_fax=rs.getString(28);
				agency_mobile=rs.getString(29);
				technical_test=rs.getString(33);
				technical_duration=rs.getString(34);
				
		}
		rs.close();
		db.close();
		
	
	%>
 
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="640" height="153" border="0" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td ><strong>Name of the Organization</strong></td>
                      <td ><%=agency_name%></td>
                    </tr>
                    <tr>
                      <td height="10" ><strong>Website</strong></td>
                      <td ><%=agency_website%></td>
                    </tr>
                    <tr>
                      <td height="37"><strong>Nature of Business</strong></td>
                      <td><%=nature_business%></td>
                    </tr>
                    <tr>
                      <td height="34"><strong>Company profile </strong></td>
                      <td ><%=agency_profile%></td>
                    </tr>
                    <tr>
                      <td height="36" Width="350"><strong>Contact Person</strong></td>
                      <td ><%=agency_person%></td>
                    </tr>
                    <tr>
                      <td height="42" ><strong>E-Mail  Address </strong></td>
                      <td ><%=agency_email%></td>
                    </tr>
                    <tr>
                      <td height="123" ><strong>Contact address</strong></td>
                      <td ><%=agency_address%></td>
                    </tr>
                    <tr>
                      <td height="38" ><strong> Phone No.</strong></td>
                      <td ><%=agency_phone%></td>
                    </tr>
                    <tr>
                      <td height="38" ><strong> Mobile No.</strong></td>
                      <td ><%=agency_mobile%></td>
                    </tr>
                    <tr>
                      <td height="41" ><strong> Fax No.</strong></td>
                      <td ><%=agency_fax%></td>
                    </tr>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Selection Procedure              </h2>
                <p>&nbsp;</p>
                <center>
                  <table width="640" align="center" cellpadding="5" cellspacing="5">
                      <tr>
                      <td width="350"><strong>Preferred Date 1 for Recruitment:</strong></td>
                      <td ><%=preferred_date_1%></td>
                    <tr>
                      <td ><strong>Preferred Date 2 for Recruitment:</strong></td>
                      <td ><%=preferred_date_2%></td>
                    </tr>
                    <tr>
                      <td  ><strong>No. of executives </strong></td>
                      <td  ><%=no_of_executive%></td>
                    </tr>
                    <tr>
                      <td  ><strong>Cpi(minimum):</strong></td>
                      <td  ><%=cpi%></td>
                    </tr>
                    <tr>
                      <td ><strong>Equipments (for ppt)</strong></td>
                      <td ><table>
                        <tr>
                          <td><%=lcd%>,<strong> LCD</strong> <%=laptop%>,<strong> Laptop </strong><%=ohp%>, <strong>OHP</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                      <tr>
                      <td ><strong>GD</strong></td>
                      <td ><%=gd%></td>
                    </tr>
                    <tr>
                      <td ><strong>Aptitude Test duration (in minutes)</strong></td>
                      <td><%=aptitude_duration%></td>
                    </tr>
                    <tr>
                      <td ><strong>Technical Test duration (in minutes)</strong></td>
                      <td><%=technical_duration%></td>
                    </tr>
                    <tr>
                      <td ><strong>Interview</strong></td>
                      <td ><%=interview%></td>
                    </tr>
                    <tr>
                      <td  ><strong>No. of rounds </strong></td>
                      <td  ><%=no_of_rounds%></td>
                    </tr>
                    <tr>
                      <td  ><strong>No. of rooms </strong></td>
                      <td  ><%=no_of_rooms%></td>
                    </tr>
                    <tr>
                      <td ><strong>Date of result:</strong></td>
                      <td ><%=date_of_result%></td>
                    </tr>
                    <tr>
                      <td ><strong>Joining Date:</strong></td>
                      <td ><%=joining_date%></td>
                    </tr>
                  </table>
                </center>
              </div>
              
              
            </div></td>
          </tr>
          <tr>
            <td align="right"></tr>
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

