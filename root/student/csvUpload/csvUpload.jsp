<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page language="java" import="java.util.*,java.util.Properties" %>
<%@page language="java" import="java.io.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

<script language="Javascript"><!--
  function doUpload()
  {
    document.upload.todo.value="upload";
	document.upload.submit();
  }

  //--></script>

</head>


<body onLoad="document.form_placement_record.agency_name.focus();">

<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	

      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();
	
%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>


<jsp:useBean id="uploadBeanCsv" scope="session" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="uploadBeanCsv" property="overwrite" value="true" />
</jsp:useBean>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../../student/main.jsp">Student </a>
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
 </td>

  <div id="content"> 
    <div class="feature">
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
				try{
					// Uses the bean now to store specified by jsp:setProperty at the top.
					javazoom.upload.parsing.CosUploadFile uf = (javazoom.upload.parsing.CosUploadFile) mrequest.getFiles().get("csv");
					System.out.println(uf.getFileName());
					System.out.println(uf.getContentType());
					if(uf.getContentType().equalsIgnoreCase("application/vnd.ms-excel")||uf.getContentType().equalsIgnoreCase("text/csv")){
						InputStream csvIs = uf.getInpuStream();
						System.out.println(csvIs.available());
						BufferedReader reader = new BufferedReader(new InputStreamReader(csvIs));
						String line = null;
						String[] parts;
						int studCount = 0;
						int unsuccessCount = 0;
						line = reader.readLine();
						while ((line = reader.readLine()) != null) {
							parts = line.split(",");
							unsuccessCount++;
							if(parts.length == 5){
								System.out.print("roll no. : "+ parts[0] + " ");
								System.out.print("name : "+ parts[1] + " ");
								System.out.print("user name : "+ parts[2] + " ");
								System.out.print("cpi : "+ parts[3] + " ");
								System.out.print("program : "+ parts[4] + " ");
								System.out.println();
								
								String student_roll_number=parts[0];
								String student_cpi=parts[3];
								String student_uname=parts[2];
								String student_name=parts[1];
								String student_programme=parts[4];
								
						
								
								
								
								db.fetchConfigDetails();
								System.out.println("Stage 1");
								if(student_roll_number!=null&&student_cpi!=null&&student_uname!=null&&student_name!=null&&student_programme!=null&&student_roll_number!=""&&student_cpi!=""&&student_uname!=""&&student_name!=""&&student_programme!="")
								{
									//if(parseFloat(student_cpi))
									System.out.println("Stage 2");
									db.connect();
									System.out.println("Stage 3");
									int count=0;
									String query = "select * from student_record where student_roll_number="+student_roll_number+" or username='"+student_uname+"'";
									System.out.println(query);
									ResultSet re1=db.execSQL(query);
									System.out.println("Stage 4");
									if(re1.next()){
										count++;
									}
									re1.close();
									if(count>0){
										%>
											<p>Student already exists for roll no. <%=student_roll_number%> or username <%=student_uname%></p>
										<%
									}
									else{
										count=0;
										try{
											float f=Float.parseFloat(student_cpi);
											
											query = "select * from prog_record where programme_name='"+student_programme+"'";
											System.out.println(query);
											ResultSet re2=db.execSQL(query);
											if(re2.next()){
												//if(re2.getInt("duration")==2)
												if(re2.getInt("duration")==2 || re2.getInt("duration")==0){
													if(f<5){
														query = "insert into student_record (student_roll_number,student_name,username,is_activated,cpi_2sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','0','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');";
														System.out.println(query);
														count=db.updateSQL(query);
													}
													else{
														query = "insert into student_record (student_roll_number,student_name,username,is_activated,cpi_2sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','1','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');";
														System.out.println(query);
														count=db.updateSQL(query);
													}
												}
												else{
													if(f<5){
														query = "insert into student_record (student_roll_number,student_name,username,is_activated,cpi_6sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','0','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');";
														System.out.println(query);
														count=db.updateSQL(query);
													}
													else{
														query = "insert into student_record (student_roll_number,student_name,username,is_activated,cpi_6sem,department_id,programme_id,program_id,program_name) values ('"+student_roll_number+"','"+student_name+"','"+student_uname+"','1','"+student_cpi+"','"+re2.getInt("department_id")+"','"+re2.getInt("programme_id")+"','"+re2.getInt("prog_id")+"','"+re2.getString("programme_name")+"');";
														System.out.println(query);
														count=db.updateSQL(query);
													}
												}

												if(count==0){
													%>
														<p>Some Error occured.. Please Try Again...</p>
													<%
												}
												else{
													studCount++;
													unsuccessCount--;
												}
											}
											else{
												%>
													<p>Program name mismatch for student: <%=student_roll_number%> </p>
												<%
											}
											re2.close();
											
										}
										catch(NumberFormatException e1){
											e1.printStackTrace();
											%>
												<p>Incorrect CPI</p>
											<%
										}								
										db.close();
									}
								}
								else{
									%>
										<p>Incorrect file format..</p>
									<%
								}
							}
							else{
									%>
										<p>Incorrect file format..</p>
									<%
							}
							
							
						}

						
						
						
						%>
							<p><%=studCount%> Student(s) inserted successfully.</p>
							<p><%=unsuccessCount%> Student(s) not inserted.</p>
						<%
						
						
					}
					else{
						%>
							<p>Incorrect file type.. Only .csv file allowed</p>
						<%
					}
				}

				catch(Exception e){
						e.printStackTrace();
					%>
						
						<p>Incorrect file.. Please upload correct file</p>
					<%
				}
	     }
         else out.println("<BR> todo="+todo);
      }
%>
<form method="post" action="csvUpload.jsp" name="upload" enctype="multipart/form-data">
  <table width="70%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
      <td align="left"><strong>File columns must be : Student Roll Number | Student Name| Student Username | Student CPI | Programme</strong></td>
    </tr>
    <tr>
      <td align="left"><b>Select a file to upload: </b></td>
    </tr>
    <tr>
      <td align="left">Filetype : .CSV</td>
    </tr>
    <tr>
      <td align="left"><input type="file" name="csv" size="50"></td>
    </tr>
    <tr>
      <td align="left">
        <input type="hidden" name="todo">
        <input type="button" name="Submit" value="Upload" onClick="doUpload()">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
	</table>
  </form>


</div></div>

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
