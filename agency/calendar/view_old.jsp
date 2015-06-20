<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ include file="../utils/session_validator.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	String sid = null;
	String username=null;
	String comp_name=null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");

        db.fetchConfigDetails(); //newly added
	db.connect();
	ResultSet rs=db.execSQL("select username from session where session_id='"+sid+"';");
	if(rs.next())
		username=rs.getString(1);
	rs.close();
	ResultSet re=db.execSQL("select agency_name,agency_id from agency where username='"+username+"';");
	if(re.next())
		comp_name=re.getString(1);
	String agency_id=re.getString(2);
	re.close();
	db.close();
	
%>
<%
             String sql_count="select count(*) from schedule where agency_id='"+agency_id+"' ;";
             db.connect();
             ResultSet rs5= db.execSQL(sql_count);
             rs5.next();
             int num1=rs5.getInt(1);   
         String[][] db_events = new String[num1][11];
           int i5=0;
             if(num1!=0)
              {
                  
		String sql_schedule="select * from schedule where agency_id='"+agency_id+"' ;";
		db.connect();
		ResultSet res5= db.execSQL(sql_schedule);
		i5=0;
		while(res5.next()) 
		{
                  int agency_id_2=res5.getInt("agency_id");
                  ResultSet rs_ag_name=db.execSQL("select agency_name from agency where agency_id="+agency_id_2+";");
                  rs_ag_name.next();
                  String agency_name=rs_ag_name.getString("agency_name");
                  rs_ag_name.close();

                  db_events[i5][0]=res5.getString("recurring");
                  db_events[i5][1]= res5.getString("date_from"); //dt_from; //res5.getString("starting_time");
                  db_events[i5][2]=res5.getString("starting_time");
                  db_events[i5][3]=res5.getString("date_to");
                  db_events[i5][4]=res5.getString("end_time");
                  //db_events[i5][5]=agency_name+", Profile: "+res5.getString("company_profile");
                  db_events[i5][6]=res5.getString("description");
                  db_events[i5][7]=res5.getString("venue");
                  db_events[i5][8]=res5.getString("eligibility_criteria");
                  db_events[i5][9]=res5.getString("departments");
		  i5++;
		}
		res5.close();
		db.close();
              }
%>



<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
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
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="view.jsp">Organization Schedule</a></li>
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
					   <form method="post" name="form_placement_record" id="form_placement_record" action="">
  <p>&nbsp;</p>



<%

     if(num1==0)
     { 
       out.println("<p align=\'center\'><strong><h1 style = 'padding-left: 8%;'>");
       out.println("There is currently no data available in "+comp_name+"s schedule.");
       out.println("</h1></strong></p>");
     }
   else
    {
	
	out.println("<p align=\"center\"><strong><h1><u>");
       out.println("&nbsp;Schedule of "+comp_name+":");
       out.println("</u></h1></strong></p></br>");
       i5=0;
       while(i5<num1)
        { 
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;From: "+db_events[i5][1]+", "+db_events[i5][2]); //+"/"+db_events[i5][2]+"/"+db_events[i5][3]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;To: "+db_events[i5][3]+", "+db_events[i5][4]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Description: "+db_events[i5][6]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Venue: "+db_events[i5][7]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Eligibility Criteria: "+db_events[i5][8]);
           out.println("</h1></p>");
           out.println("<p><h1>");
           out.println("&nbsp&nbsp&nbsp;Departments: "+db_events[i5][9]);
           out.println("</h1></p>");
           out.println("<p>");
           out.println("-------------------------");
           out.println("</p>");
           i5++;
        }
    }
%>

<p>&nbsp;</p>

<p><br>
  </p>
</p>
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
