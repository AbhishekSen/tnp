<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
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
		ResultSet rs1= db.execSQL(sql_username);
		if(rs1.next()) 
		{
		username = rs1.getString(1);
		}
		
		rs1.close();
		db.close();
	
%>

<%@page language="java" import="java.sql.*,java.io.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>



<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<head>
<link rel="SHORTCUT ICON" href="images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Placement</title>


<link rel='stylesheet' href='../../stylesheet/style.css'>
<link rel="stylesheet" href="../../stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
	jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity:0.5 });
	});
	function showNewRecords()
		{
			$('#slideUp').show();
			$('#slideUp').slideUp("slow");			
		}
 </script>
 
 <script src="../js/xmlhttprequest.js"></script>
<script src="../js/sorttable.js"></script> 

</head>


<body  onload = "showNewRecords();"> 

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
						  <li><a href="eligibility.jsp">Eligible Students</a></li>
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
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
					 <div id = "center" class = "center" >
		<table align="center" id = "studentList">
    <tr>
      <td> </td>
      <td></td>
    </tr>
    <td><div name="agency_name_details" id="agency_name_details">
    
<%
	
	String submit=request.getParameter("submit");
	String package_id=request.getParameter("id");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	out.println(display1+"Following Students are eligible and are interested in your profile"+display2);   
	out.println("<table border='0' name='table_query_placement_details'"+
	"id='table_query_placement_details' class='sortable' cellpadding='5'>");
	out.println("<tr>");
	out.println("<th>Sl.No.</th>");
	
	out.println("<th>Student Roll Number</th>");
	out.println("<th>Student Name</th>");
	out.println("<th>CPI</th>");
	out.println("<th>Programme</th>");
	out.println("<th>Department</th>");
        out.println("<th>Remark</th>");
	out.println("</tr>");
	
	String get_cpi="select agency_id from agency where username='"+username+"';";
	db.connect();
	ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
	
	String agency_id="";
	if(re.next())
		agency_id=""+re.getInt("agency_id");
	re.close();
	db.close();
	String la="<a href=\"../student_details/update.jsp?student_roll_number=";
	String ld="<a href=\"../student_details/update.jsp?student_roll_number=";
	String lb="\">";
	String lc="</a>";
 




	db.connect();
	int i=1;
	ResultSet ra=db.execSQL("select student_id from interested_students where agency_id="+agency_id+" and package_id='"+package_id+"';");
		while(ra.next())
	{
		ResultSet rs=db.execSQL("select student_roll_number,student_name,department_id,cpi_6sem,cpi_2sem,program_name,programme_id,program_id,email,email_alternative,contact_number,contact_number2,x_percentage,xii_percentage from student_record where student_id= "+ra.getInt(1)+" and is_activated=1;");
		if(rs.next())
		{ 
					  String st_dept_name="NA";
					  int st_department_id=rs.getInt("department_id");
					  
				          String sql_temp1="select programme_name from prog_record where prog_id="+rs.getInt("program_id")+";";
					  String pname="";
                                    
					  ResultSet rrp=db.execSQL(sql_temp1);
					  if(rrp.next())
					   {
                                            pname=rrp.getString(1);
					   }                                     

                                          rrp.close();

					  ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
					  if(st_dept.next())
					  st_dept_name=st_dept.getString(1);
           
				      String sql_temp="select status from eligible_students where student_id='"+ra.getString(1)+"' and agency_id="+agency_id+" and package_id='"+package_id+"';";
					int status=0;
                                    
					ResultSet rr=db.execSQL(sql_temp);
					  if(rr.next())
					    {
                                            status=rr.getInt(1);
					    }                                     

					  rr.close();
                                                   

                       if(status==1)
                        {
			out.println("<tr><td>"+i+"</td><td>"+rs.getInt("student_roll_number")+"</td><td>"+rs.getString("student_name")+"</td><td>");
                        }
                      else
                       {
			la=ld+rs.getString("student_roll_number")+lb;
			out.println("<tr><td>"+i+"</td><td>"+la+rs.getInt("student_roll_number")+lc+"</td><td>"+la+rs.getString("student_name")+lc+"</td><td>");
		       }
			if(rs.getInt("programme_id")==1||rs.getInt("programme_id")==2)
			{
				out.println(rs.getString("cpi_6sem")+"</td>");
				
			}
			else
			{
				out.println(rs.getString("cpi_2sem")+"</td>");
				
			}
			out.println("<td>"+pname+"</td>");
			out.println("<td>"+st_dept_name+"</td>");

                        ResultSet prec = db.execSQL("select count(*) from placement_record where student_id='"+ra.getString(1)+"';");
                        if(prec.next())
                        {
                          if(prec.getInt(1)>0)
                          {
                             out.println("<td>"+"Already placed"+"</td></tr>");
                          } 
                          else
                          {
                             out.println("</tr>");
                          } 
                        }
                        prec.close();
			
                        /*if(status==1)
                          out.println("<td>"+"Already placed"+"</td></tr>");
                        else
                          out.println("</tr>");
                        */

			i++;
		}
		rs.close();
	}
	ra.close();
	db.close(); 
%>
  </div></td></tr>
	</table>	
.</table>
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><form method="post" action="get_csv.jsp?username=<%=username%>&pid=<%=package_id%>"><input type="submit" name="submit" value="Get CSV"></form></td>
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
