<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>

<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css" />
<script src="../js/datetimepicker.js"></script>
<script type="text/javascript" src="../js/tabber.js"></script>


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

<%  

	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String agency_name="";
	int agency_id=0;
	String agency_address="";
	String agency_website="";
	String agency_profile="";
	String agency_phone="";
	String agency_mobile="";
	String agency_fax="";
	String agency_email="";
	String agency_person="";
	String shortlist="";
	String ppt="";
	String gd="";
	String aptitude_test="";
	String technical_test="";
	String interview="";
	String immediate_result_declaration="";
	String no_of_rounds="";
	String no_of_rooms="";
	String preferred_date_1="";
	String preferred_date_2="";
	String date_of_result="";
	String joining_date="";
	String lcd="";
	String laptop="";
	String ohp="";
	String equipments="";
	String no_of_executive="";
	String aptitude_duration="";
	String technical_duration="";
	String cpi="";
    String nature_business="";
	String job_description="";
	String job_designation="";
	String location_of_posting="";
	String accomodation="";
	String bond="";
	String bond_duration="";
	int registration_status=0;

%>
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Welcome  <%=username%></a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>

<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li><a href="http://iitg.ernet.in" target="_blank" title="IIT Guwahati">IIT Guwahati Home</a>
       
      </li>
      <li><a href="http://iitg.ernet.in/placement" target="_blank" title="Training & Placement Cell">T&P Cell</a>
        
      </li>
     
      <li><a href="http://www.iitg.ernet.in/acad/courses_syllabee.php"  target="_blank" title="Courses Offered">Courses Offered & Syllabi</a></li>
      <li class="last-child"><a href="../logout.jsp" title="Logout">Logout</a></li>
    </ul>
  </nav>
</div>
<!-- content -->
<div class="wrapper row3" style="width:100%;">

<!-- ################################################################################################ -->
<div id="container">
  <div id="sidebar_1" class="sidebar one_quarter first" style="background:#DFDFDF;color:#000">
  <aside>
        <!-- ########################################################################################## -->
        <h2 align="center">Recruiter</h2>
        <nav>
          <ul>
            <li><a href="#">Instructions</a></li>
            <li align="center"> <span style="color:darkgrey; text-align:center;"> Add Job Profile</span>
              <ul>
                <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
                <li><a href="../vacancies/add_vacancy.jsp">Job Profile & Salary Details</a></li>
              </ul>
            </li>
            <li><span style="color:darkgrey; text-align:center;">Students Details</span>
            <ul>
                <li><a href="../cv_query/cv_query.jsp">Eligible Students</a></li>
                <li><a href="../student_details/student_details.jsp">Using Roll No.</a></li>
            </ul>
            </li><li><a href="../calendar/view.jsp">Update Organization Schedule</a>
            </li><li><a href="../uploads/upload.jsp">Upload Organization Literature</a>
            </li><li><a href="../change_password/change_password.jsp">Change Password</a>
            </li><li><a href="../../logout.jsp">Logout</a>
            </li>
            
           
          
          </ul>
        </nav>
        <!-- /nav --><!-- /section --><!-- /section -->
        <!-- ########################################################################################## -->
    </aside>
</div>  </div>  <!-- ################################################################################################ --><!-- ################################################################################################ -->
    <div id="portfolio"  class="three_quarter">
      <ul class="clear">

        <%	
		String sql_get_data="select * from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet ras= db.execSQL(sql_get_data);
		if(ras.next()) 
		{
				agency_name=ras.getString("agency_name");
				agency_id=ras.getInt("agency_id");
				nature_business=ras.getString("nature_business");
				agency_website=ras.getString("agency_website");
				agency_profile=ras.getString("agency_profile");
				preferred_date_1=ras.getString("preferred_date_1");
				preferred_date_2=ras.getString("preferred_date_2");
				no_of_executive=""+ras.getInt("no_of_executive");
				shortlist=""+ras.getInt("shortlist");
				cpi=ras.getString("cpi");
				ppt=ras.getString("ppt");
				lcd=ras.getString("lcd");
				laptop=ras.getString("laptop");
				ohp=ras.getString("ohp");
				aptitude_test=ras.getString("aptitude_test");
				aptitude_duration=ras.getString("aptitude_duration");
				gd=ras.getString("gd");
				interview=ras.getString("interview");
				no_of_rounds=ras.getString("no_of_rounds");
				no_of_rooms=ras.getString("no_of_rooms");
				immediate_result_declaration=ras.getString("immediate_result_declaration");
				date_of_result=ras.getString("date_of_result");
				joining_date=ras.getString("joining_date");
				agency_person=ras.getString("agency_person");
				agency_email=ras.getString("agency_email");
				agency_address=ras.getString("agency_address");
				agency_phone=ras.getString("agency_phone");
				agency_fax=ras.getString("agency_fax");
				agency_mobile=ras.getString("agency_mobile");
				technical_test=ras.getString("technical_test");
				technical_duration=ras.getString("technical_duration");
				registration_status=ras.getInt("registration_status");
				
		}
		ras.close();
		db.close();

	%>
 
      
        <table width="100%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="100%" height="153" border="0" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td >Name of the company </td>
                      <td ><%=agency_name%> </td>
                    </tr>
                    <tr>
                      <td height="10" >Website</td>
                      <td ><%=agency_website%></td>
                    </tr>
                    <tr>
                      <td height="37">Nature of Business</td>
                      <td><%=nature_business%></td>
                    </tr>          
                    <tr>
                      <td height="36" Width="350">Contact Person</td>
                      <td ><%=agency_person%></td>
                    </tr>
                    <tr>
                      <td height="42" >E-Mail  Address </td>
                      <td ><%=agency_email%></td>
                    </tr>
                    <tr>
                      <td height="123" >Contact address </td>
                      <td ><%=agency_address%></td>
                    </tr>
                    <tr>
                      <td height="38" > Phone No.</td>
                      <td ><%=agency_phone%></td>
                    </tr>
                    <tr>
                      <td height="38" >Mobile No.</td>
                      <td ><%=agency_mobile%></td>
                    </tr>
                    <tr>
                      <td height="41" >Fax No.</td>
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
                      <td width="350">Preferred Date 1 for Recruitment:</td>
                      <td >
                        <%=sql_convert_date(preferred_date_1)%> (dd-mm-yyyy)</td>
                    <tr>
                        <td >Preferred Date 2 for Recruitmentt:</td>
                        <td ><%=sql_convert_date(preferred_date_2)%>(dd-mm-yyyy)</td>
                    </tr>
                    <tr>
                      <td  >No. of executives </td>
                      <td  ><%=no_of_executive%></td>
                    </tr>
                    <tr>
                      <td >Shortlist from Resumes</td>
                      <td ><%if(shortlist.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td  >Cpi(minimum):</td>
                      <td  ><%=cpi%></td>
                    </tr>
                    <tr>
                      <td >PPT</td>
                      <td ><%if(ppt.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td >
                        Equipments (for ppt) </td>
                      <td ><table>
                        <tr>
                          <td><%if(lcd.equals("1"))out.println("LCD");%> </td>
                          <td><%if(laptop.equals("1"))out.println("LAPTOP");%> </td>
                          <td><%if(ohp.equals("1"))out.println("OHP");%> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="27"></td>
                    </tr>
                    <tr>
                      <td >GD</td>
                      <td> <%if(gd.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td >Aptitude test </td>
                      <td ><%if(aptitude_test.equals("1")){out.println("Yes");}else{out.println("No");}%>
                        </td>
                    </tr>
                    <tr>
                      <td >Aptitude duration (in minutes)</td>
                      <td><%=aptitude_duration%></td>
                    </tr>
                    <tr>
                      <td >Technical Test </td>
                      <td ><%if(technical_test.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td >Technical duration (in minutes)</td>
                      <td><%=technical_duration%></td>
                    </tr>
                    <tr>
                      <td >Interview</td>
                      <td ><%if(interview.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td  >No. of rounds </td>
                      <td  ><%=no_of_rounds%></td>
                    </tr>
                    <tr>
                      <td  >No. of rooms </td>
                      <td  ><%=no_of_rooms%></td>
                    </tr>
                    <tr>
                      <td >Immediate result declaration </td>
                      <td ><%if(immediate_result_declaration.equals("1")){out.println("Yes");}else{out.println("No");}%></td>
                    </tr>
                    <tr>
                      <td >Date of result:</td>
                      <td ><%=sql_convert_date(date_of_result)%> (dd-mm-yyyy)</td>
                    </tr>
                    <tr>
                      <td >Joining Date:</td>
                      <td ><%=sql_convert_date(joining_date)%> (dd-mm-yyyy)</td>
                    </tr>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[3]">
                <h2>Vacancies Form</h2>
                <p>&nbsp;</p>
<%
				  String t1="select * from package_details where agency_id='"+agency_id+"'";
				  db.connect();
				  ResultSet r1=db.execSQL(t1);
				  String tds="<td height=\"32\" width=\"296\" >";
				  String tde="</td>";
				  String package_name="";
				  String ctc="";
				  String dep="";
				  String prog="";
				  String no_vac="";  
				  int i=1;
				  String j="";
				  while(r1.next()){
					  package_name=r1.getString("package_name");
					  ctc=r1.getString("ctc");
					  //dep=r1.getString(4);
					  //prog=r1.getString(5);
					  no_vac=r1.getString("vacancy");
					  j=""+i;
					  out.println("<table width=\"640\" height=\"123\" align=\"center\" cellpadding=\"5\" cellspacing=\"5\">");
					  out.println("<tr>"+tds+"<strong>Package-"+j+"</strong></td>"+tds+"</td></tr>");
					  out.println("<tr>"+tds+"Job Description</td>"+tds+r1.getString("job_description")+"</td></tr>");
					  out.println("<tr>"+tds+"Job Designation</td>"+tds+r1.getString("job_designation")+"</td></tr>");
					  out.println("<tr>"+tds+"Place of Posting</td>"+tds+r1.getString("location_of_posting")+"</td></tr>");
					  out.println("<tr>"+tds+"Accomodation</td>"+tds);if(r1.getInt("accomodation")==1){out.println("Yes");}else{out.println("No");}out.println("</td></tr>");
					  out.println("<tr>"+tds+"Bond</td>"+tds);if(r1.getInt("bond")==1){out.println("Yes");}else{out.println("No");}out.println("</td></tr>");
					  if(r1.getInt("bond")==1){out.println("<tr>"+tds+"Bond Duration</td>"+tds+r1.getInt("bond_duration")+"</td></tr>");}
					  i++;
					  out.println("<tr>"+tds+"Package</td>"+tds+package_name+"</td></tr>");
					  ResultSet r4=db.execSQL("select program_index from package_extra_details where package_id="+r1.getInt("package_id")); 
					  out.println(tds+"Programmes</td>"+tds);
					  int ij=1;
					  while(r4.next())
					  {
						  //if(r4.getInt(1)!=null)
						  {
							  ResultSet r5=db.execSQL("select programme_name from prog_record where prog_id='"+r4.getInt(1)+"';");
							  if(r5.next())
							  {
								  //if(r5.getString(1)!=null)
								  out.println(""+ij+"."+r5.getString(1)+"<br/>");
							  }
							  r5.close();
							  ij++;
						  }
					  }
					  r4.close();
					  out.println("&nbsp;</td></tr>");
					  /*ResultSet r2=db.execSQL("select department_name from department_record where department_id='"+dep+"'");
					  if(r2.next())
					  {
						  out.println(tds+"Department</td>"+tds+r2.getString("department_name")+"</td></tr>");
					  }
					  r2.close();*/
					  
					  /*ResultSet r3=db.execSQL("select programme_name from programme_record where programme_id='"+prog+"'");
					  if(r3.next())
					  {
						  out.println(tds+"Programme</td>"+tds+r3.getString("programme_name")+"</td></tr>");
					  }*/
					  out.println(tds+"No. of Vacancies</td>"+tds+no_vac+"</td></tr>");
					  out.println(tds+"CTC</td>"+tds+ctc+"(Lacs p.a.)</td></tr>");
					  out.println("</table>");
					  //r3.close();
				  }
				  r1.close();
				  db.close();
				  %>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </div>
            </div></td>
          </tr>
          <tr>
            <td align="right"></td>
          </tr>
        </table></ul></div>
</div>
</div>
</ul>
                          
        <p align="center">&nbsp;</p></div>
        </div>
      
      
</ul></div>
      </div>
      <div class="clear"><!-- Footer -->
</div>
<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%;">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Cell, IIT Guwahati
    </center></p>
    
  </div>
</div>
</body>

</html>

