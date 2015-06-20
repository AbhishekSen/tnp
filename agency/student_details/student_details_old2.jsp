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
		response.sendRedirect("../logout.jsp");
%>
<% db.fetchConfigDetails(); %>
<%
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
<%
    String student_roll_number=request.getParameter("student_roll_number");
    String submit=request.getParameter("submit");
    int student_id=0;
    int agency_id=0;
    int num=0;
    int status=0;
    if(submit!=null)
      {
          String sql_temp="select agency_id from agency where username='"+username+"';" ;
          db.connect();
          ResultSet rs5= db.execSQL(sql_temp);
          if(rs5.next()) 
		{
		  agency_id = rs5.getInt(1);
		} 
           rs5.close();
          String sql_stud="select student_id from student_record where student_roll_number='"+student_roll_number+"';" ;
          ResultSet rst= db.execSQL(sql_stud);
            if(rst.next()) 
		{
		  student_id = rst.getInt(1);
		} 
           rst.close();
          String sql_count="select count(*) from interested_students where student_id="+student_id+" and agency_id="+agency_id+";" ;
           rs5= db.execSQL(sql_count);
           if(rs5.next()) 
		{
		  num = rs5.getInt(1);
		} 
           rs5.close();
         db.close();
    
       if(num==0)
        {
             response.sendRedirect("error1.jsp");
        }
      else
        {
           String sql_status="select status from eligible_students where student_id="+student_id+" and agency_id="+agency_id+";" ;
            db.connect();
            ResultSet rsab= db.execSQL(sql_status);
           if(rsab.next()) 
		{
		  status = rsab.getInt(1);
		} 
           rsab.close();
         db.close();
         
          if(status==1)
           {
               response.sendRedirect("error2.jsp");
           } 
         else
          {
             response.sendRedirect("update.jsp?student_roll_number="+student_roll_number);
          }         

        }
      }

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
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity:0.5 });
	});
	function showNewRecords()
		{
			$('#slideUp').show();
			$('#slideUp').slideUp("slow");			
		}
 </script>
</head>
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
					   <form method="post" name="form_agency_registration" id="form_agency_registration" onSubmit="return validate_empty(form_agency_registration)" action="student_details.jsp">
              <p style = "padding-left:40%;" ><strong>Enter Roll Number</strong></p>
              <table width="459" height="42" align="center">
                <tr>
                  <td width="200">Student roll number</td>
                  <td width="351"><input type="text" name="student_roll_number" id="student_roll_number"></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <table width="65" height="32" border="0" align="center">
                <tr>
                  <td><div align="center">
               <input  type="submit" value="Get Details" name="submit"  id="submit">
              <colgroup>
                </colgroup>
            </div></td>
                </tr>
              </table>
              <p>&nbsp;  </p>
              <p>&nbsp;</p>
            </form>
                </div>
              </div>
              <div id = "footer">
              <span>© 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>  
</body>
</html>
  