<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel='stylesheet' href='../../stylesheet/style.css'>
<link rel="stylesheet" href="../../stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
		jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity: 0.5 });
		  
		});
		function showNewRecords()
		{
			$('#slideUp').show();
			$('#slideUp').slideUp("slow");			
		}
</script><script type="text/javascript">
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
		ResultSet res= db.execSQL(sql_username);
		if(res.next()) 
		{
		username = res.getString(1);
		}
		
		res.close();
		db.close();
	
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	String student_roll_number=request.getParameter("student_roll_number");
        
	int student_id=0;
	int department_id=0;
	int programme_id=0;
	int program_id=0;

%>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String roll_no="";
		
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
	
			
%>


<body onLoad="showNewRecords();">
<div id = "container">
            <div id = "header">
              <div>
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                      <ul class="SlidingMenu Horizontal">
                        <li><a href="../instructions.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></li>
                      </ul>
                      <div class="ClearFix"></div>
                    </div>
                </div>
              </div>
              <div  id = "headerTop">
                <div id ="title">
                  <span id = "spanTitleFirst">
                    Training & Placement Cell - 
                  </span>
                  <span id = "spanTitleSecond">
                    IIT Guwahati
                  </span>
                </div>
                <%--<div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                <div id = "divMain">
                 <div class = "mainMenu">
					<div id="VerticalSlidingMenu">
						<ul class="SlidingMenu">
						  <li><a href='../instructions.jsp'>Instructions</a></li>
						  <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
						  <li><a href="../vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="student_details.jsp">Students Details Query</a></li>
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="../uploads/upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="../change_password/change_password.jsp">Change Password</a></li>
						  <li><a href="../../logout.jsp">Logout</a></li>
						 </ul>	
					  </div>
                 </div>
                 <div class = "mainContainer" id="mainContainer">
          					<div id = "slideUp" style = "display:none;color:white;">
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          					</div> 
					 <div id = "center" class = "center">
						 <div class="feature">
    <%	
	
		String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		
		if(rs.next()) 
		{
			roll_no=""+rs.getInt(2);
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
		if(programme_id==1 || programme_id==2) // for betch/bdes
        	   cpi=rs.getString(29);
                else if(programme_id==3 || programme_id==4 || programme_id==5 || programme_id==6) // for Mtech/mdes/ma/msc
                   cpi=rs.getString(44);
                else
                   cpi="N/A"; 
	//	cpi=rs.getString(29);
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
		program_id=rs.getInt(45);
			
		}
		rs.close();
		
		db.close();
		if(!roll_no.equals(student_roll_number)){response.sendRedirect("error.jsp");}
	

%>

       <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="650" height="300" align="center">
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
                      <% String sex_value=get_unique_field("select sex_value from sex where sex_id='"+sex+"';",db);%>
                      <td><%=sex_value%></td>
                    </tr>
                    <tr>
                      <td><strong>Category</strong></td>
                      <td><%=category%></td>
                    </tr>
                    <tr>
                      <td><strong>Department</strong></td>
                      <% 
                        String department_name=get_unique_field("select department_name from department_record where department_id="+department_id+";",db);
                      %>
                      <td><%=department_name%></td>
                    </tr>
                    <tr>
                      <td><strong>Programme</strong></td>
                      <% 
                         String programme_name=get_unique_field("select programme_name from prog_record where prog_id="+program_id+";",db);
                       %>
                      <td><%=programme_name%></td>
                    </tr>
<%--
                    <tr>
                      <td><strong>Email</strong></td>
                      <td><%=email1%>@iitg.ernet.in</td>
                      <td><%=email2%></td>
                    </tr>

                    <tr>
                      <td><strong>Mobile Number</strong></td>
                      <td><%=mobile1%></td>
                      <td><%=mobile2%></td>
                    </tr>
--%>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Academic Details</h2>
                <p>&nbsp;</p>
                <center>
                  <table width="694" height="414" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="174"><strong>Academic Details</strong></td>
                      <td></td>
                    </tr>
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
                      <td width="174"><strong>CPI</strong></td>
                      <td width="141"><%=cpi%></td>
                    </tr>
                    <tr>
                      <td><strong>SPI in all semesters</strong></td>
                      <td><strong>Backlog(if any)</strong></td>
                      <td width="105"><%=backlog%></td>
                    </tr>
                    <%
                      if(programme_id==1 || programme_id==2) // For BTech/Bdes
                      {
                    %>
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
                      <%-- <td><strong>7th Sem</strong></td> --%>
                    </tr>
                    <tr>
                    <td><%=sem6%></td>
                      <%--<td><%=sem7%></td> --%>
                    </tr>
                    <%
                      } 
                      else // for others
                      {
                    %>
                     <tr>
                       <td><strong>1st Sem</strong></td>
                       <td><strong>2nd Sem</strong></td>  
                     </tr>
                     <tr>
                       <td><%=sem1%></td>
                       <td><%=sem2%></td>
                     </tr>
                    <% 
                      } 
                    %> 
                    <tr>                      
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                </center>
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
                </div>
              </div>
              <div id = "footer">
              <span>&copy; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
