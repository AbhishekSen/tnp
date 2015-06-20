<%@page language="java" import="java.sql.*,java.lang.*,java.util.*,java.io.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">

</script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>





</head>
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<%
String submit=request.getParameter("submit");
String agency_id="";
float cp;
if(submit!=null){
			
                        db.fetchConfigDetails();
			db.connect();
			String package_name=request.getParameter("package_name");
			
			String get_cpi="select cpi,agency_id,package_id from package_details where package_name='"+package_name+"';";
			
			ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
			re.next();
			String cpi=re.getString(1);
			float cpi1=Float.parseFloat(cpi);
			agency_id=re.getString(2);
			String package_id=re.getString(3);
			
			String Content="Roll-Number,Name,Gender,Department,Programme,DOB,Category,Email,Contact Number,cpi,x-percent,xii-percent\n";

			ResultSet rs=db.execSQL("select student_id from eligible_students where agency_id="+agency_id+" and package_id="+package_id+";");
			while(rs.next())
			{ 
                            int stud_id=rs.getInt(1);
			   

					String stud_roll="select * from student_record where student_id="+stud_id+";";
					ResultSet rr=db.execSQL(stud_roll);
					//rr.next();
					String gender="";
					String gen="";

					while(rr.next())
					{

					      String st_dept_name="NA";
					      String st_pg_name="NA";
					      int st_department_id=rr.getInt("department_id");
					      int st_program_id=rr.getInt("program_id");

					     // System.out.println("dept_id: "+st_department_id+", prog id: "+st_program_id);
					      ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
					      if(st_dept.next())
					      st_dept_name=st_dept.getString(1);
					      ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
					      if(st_pg.next())
					      st_pg_name=st_pg.getString(1);
					      Content+=rr.getString("student_roll_number");
					      Content+=","+rr.getString("student_name");
                                              gender=rr.getString("sex");
                                              //System.out.println("gender:::"+gender);
					      if(gender.equals("1"))
						{
						    gen="Male";

						}
					      else
						{
						    gen="Female";
						}
					      Content+=","+gen;
					      Content+=","+st_dept_name;
					      Content+=","+st_pg_name;
					      Content+=","+rr.getString("date_of_birth");
					      Content+=","+rr.getString("category");
					      Content+=","+rr.getString("email_alternative");
					      Content+=","+rr.getString("contact_number");
					      int prg=rr.getInt("programme_id");
					      if(prg==1 || prg==2)
					      {
						cp=rr.getFloat("cpi_6sem");
					      }
					      else
					      {
						cp=rr.getFloat("cpi_2sem");
					      }
					      Content+=","+cp;
					      Content+=","+rr.getString("x_percentage");
					      Content+=","+rr.getString("xii_percentage")+"\n";



					}
					rr.close();
					
				      }
				  rs.close();

			
			 


			String filename="eligible_student.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush();
          
                 }

%>




<%@page language="java" import="java.sql.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>

<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
   <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
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
      <a href="../../../logout.jsp">LOGOUT</a>
      <img src="../../images/bot.gif" alt="" width="177" height="298" />
    </div>
	</div> 
    <div id="content"> 
    <div class="feature">
<form name="form_query_placement" method="post" action="eligibility_query.jsp">
  <p><strong>Select Appropriate Fields</strong></p>
  <table align="center">
    <tr>
      <td > Choose Company profile: </td>
      <td><%! String agency_list ;%>
        <% agency_list =drop_down("select package_name from package_details;",db) ; %>
        <select name="package_name" id="package_name">
          <option value="0">------------------select----------------</option>
          <%=agency_list%>
        </select></td>
    </tr><td><div name="agency_name_details" id="agency_name_details"></div></td></tr>
						
						
	</table>	
.
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><input type="submit" class="center" name="submit" id=""  value="Get Data"></td>
    </tr>
  </table>
 
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
