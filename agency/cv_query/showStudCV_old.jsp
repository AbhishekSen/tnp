<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>


<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	
		
	
	String submit=request.getParameter("submit");
	
	
%>
<% db.fetchConfigDetails(); %>

<%
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
			username = rs.getString(1);
		//out.println(username+"<br/>");
		String agency_id="";
		rs.close();
		ResultSet re=db.execSQL("select agency_id from agency where username='"+username+"';");
		if(re.next())
			agency_id=re.getString(1);
		//out.println(agency_id+"<br/>");
		re.close();
		db.close();

		String package_id=request.getParameter("id");
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

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
	</script>
	
<script src="../js/sorttable.js"></script>
<script src="../js/datetimepicker.js"></script>
</head>


<body onload = "showNewRecords();">
<div id = "container">
            <div id = "header">
              <div>
              <div id="globalLink" style = "float:left;width:40%;"> 
                   <br/> <span id="spancompany"><u>Welcome <%=username%></u></span>
                </div>
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
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
						  <li><a href="cv_query.jsp">CV Query</a></li>
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
                 <div style="margin-top:10px;margin-left:20px;font-size:14px;">
	           <center>Click here to download of all students interested in this profile:<form method="post" action="download_cv.jsp?pid=<%=package_id%>&aid=<%=agency_id%>"><input type="submit" name="submit" value="CVs"></form><form method="post" action="get_csv.jsp?username=<%=username%>&pid=<%=package_id%>"><input align="right" type="submit" name="submit" value="List(in CSV Format)"></form></center>
	         </div>

					 <div id = "center" class = "center">
					   <table border="0" align="center" style = "text-align:center" >
          <tr>
            <td>
            <table border='0' name="table_query_placement_details" id='table_query_placement_details' class='sortable' cellpadding='5'>
            <tr><td>S.No.</td><td>Student Roll Number</td><td>Student Name</td><td>CPI</td><td>Programme</td><td>Department Name</td><td>Download CV</td></tr>
	   
            <%
				db.connect();int i=1;
				String la="<a href=\"../student_details/update.jsp?student_roll_number=";
				String ld="<a href=\"../student_details/update.jsp?student_roll_number=";
				String lb="\">";
				String lc="</a>";
				ResultSet rset=db.execSQL("select student_id from interested_students where agency_id="+agency_id+" and package_id='"+package_id+"';");

				while(rset.next())
				{

                                    String sql_temp="select status from eligible_students where student_id='"+rset.getString(1)+"' and agency_id="+agency_id+" and package_id='"+package_id+"';";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
					if(rr.next())
					{
                                            status=rr.getInt(1);
					}                                     

                                      rr.close();
                                                                   

					ResultSet rset1=db.execSQL("select * from student_record where student_id='"+rset.getString(1)+"';");

                                   
					if(rset1.next())
					{
						String st_dept_name="NA";
						int st_department_id=rset1.getInt("department_id");
						 
						
						ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
						if(st_dept.next())
						{
						    st_dept_name=st_dept.getString(1);
						}
						String sql_temp1="select programme_name from prog_record where prog_id="+rset1.getInt("program_id")+";";
						String pname="";

						ResultSet rrp=db.execSQL(sql_temp1);
						if(rrp.next())
						{
						    pname=rrp.getString(1);
						}                                     

						    rrp.close();


                                             
                                               if(status==1)
                                                {
                                                     out.println("<tr><td>"+rset1.getString("student_roll_number")+"</td><td>"+rset1.getString("student_name")+"</td>");
                                                }
                                              else
                                               {
						la=ld+rset1.getString("student_roll_number")+lb;
						out.println("<tr><td>"+i+"</td><td>"+la+rset1.getString("student_roll_number")+lc+"</td><td>"+la+rset1.getString("student_name")+lc+"</td>");
                                               }
						if(Integer.parseInt(rset1.getString("programme_id"))==1||Integer.parseInt(rset1.getString("programme_id"))==2)
							out.println("<td>"+rset1.getString("cpi_6sem")+"</td>");
						else
							out.println("<td>"+rset1.getString("cpi_2sem")+"</td>");
						out.println("<td>"+pname+"</td>");
						out.println("<td>"+st_dept_name+"</td>");
                                                if(status==1)
                                                 out.println("<td>"+"Already Placed"+"</td></tr>");
                                                else
						out.println("<td><a href=\"process.jsp?roll="+rset1.getString("student_roll_number")+"&pid="+package_id+"\">Download CV</a></td></tr>");
					      
					}
					rset1.close();
				}
				rset.close();
				db.close();
			%>
		  
		   
            </table>
            </td>
          </tr>

        </table>
                </div>
              </div>
              <div id = "footer">
              <span>&copy; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
