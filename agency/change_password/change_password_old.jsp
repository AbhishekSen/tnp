<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
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

<script src="../js/datetimepicker.js"></script>
</head>
<body onload = "showNewRecords();">
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
		ResultSet rs= db.execSQL(sql_username);
		if(rs.next()) 
		{
		username = rs.getString(1);
		}
		
		rs.close();
		db.close();
	
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>




<%!

String agency_name=null;
%>
<%
 
	int agency_id=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String agency_name=request.getParameter("agency_name");
	String submit=request.getParameter("submit");
	String  new_password=request.getParameter("new_password");
	String  password=request.getParameter("password");
	String conf_password=request.getParameter("conf_password");
		
			String sql_get_data="select agency_id ,agency_name  from agency where username='"+username+"' ;" ;
		
			db.connect(); 
			ResultSet rus= db.execSQL(sql_get_data);
			if(rus.next()) 
			{
				agency_id=rus.getInt(1);
				agency_name=rus.getString(2);
			}
			rus.close();
			 
			db.close();
	
			if(submit!=null && agency_id!=0)
			{	
			
				sql_get_data="select password from login where username='"+username+"';" ;
				String old_password="";
				db.connect(); 
				ResultSet re= db.execSQL(sql_get_data);
				if(re.next()) 
				{
					old_password=re.getString(1);
				}
			
				re.close();  
				db.close();
				
				if(old_password.equals(password) && new_password.equals(conf_password))
				{
				
					
					String main_record1=" update login set password='"+new_password+"' where username='"+username+"';";
					String main_record2=" update agency set password='"+new_password+"',is_first=1 where username='"+username+"';";
			
					db.connect();
					int num_rows1=db.updateSQL(main_record1);
					int num_rows2=db.updateSQL(main_record2);
					db.close();         	
					if(num_rows1==1 && num_rows2==1)
					{
						
						response.sendRedirect("success.jsp");
					}
					else
					{
					response.sendRedirect("error.jsp");
					}
				}
				else
				{
					response.sendRedirect("mismatch.jsp");
				}
			}


					   

%>



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
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="../uploads/upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="change_password.jsp">Change Password</a></li>
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
                
                  <form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validatePwd();" action="change_password.jsp" > 
  <p align="center"><strong>Please fill all the fields correctly</strong></p>
  <p>&nbsp; </p>
  <table width="456" align="center">
    <tr>
      <td>Organization Name</td>
      <td><%=agency_name%></td>
    </tr>
    <tr>
      <td>Username</td>
      <td><%=username%></td>
    </tr>
    <tr>
      <td>Old Password</td>
      <td><input type="password" name="password" id="password" required="required"></td>
    </tr>
    <tr>
      <td>New Password</td>
      <td><input type="password" name="new_password" id="new_password" required="required"></td>
    </tr>
    <tr>
      <td>Confirm New Password</td>
      <td><input type="password" name="conf_password" id="conf_password" required="required"></td>
    </tr>
  </table>
  <p>. </p>
  <table width="76" height="32" border="0" align="center">
    <tr>
      <td><input  type="submit" value="Change Password" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
  
</form>
	


<tr>
  <td colspan="2" height="20">   
  <div id="siteInfo"></div> </td></tr></table>
                </div>
              </div>
              <div id = "footer">
              <span>© 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>