<%@page language="java" import="java.util.*,gcom.*,java.lang.*,java.io.*,javazoom.upload.*,java.sql.*" %>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();

      String str_path=gpath+"placement_uploads/root/uploads/";
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>'  />
</jsp:useBean>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="css/emx_nav_left.css" type="text/css">
<script type="text/javascript">
<!--
var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function change_data()
{
	var i;
	i=document.getElementById("content");
	var str="Now i've changed this whole feature!!!"
	str+= "<br>This may just be <BR> useful in AJAX.<br><br>Let us see!!";
	i.innerHTML=str;
	document.getElementById("infobar").innerHTML="<h3 id=\"infotitle\">Data Changed! </h3><br><br><br> <a href=\"javascript:clearinfo()\" id=\"infohide\">Hide</a><br>";
	document.getElementById("pagecell1").style.top='180px';
	var j=document.styleSheets[0];
	alert(document.getElementById("infobar").style.position);
	alert(document.getElementById("infobar").offsetHeight);
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112px';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}
// -->


</script>


</head>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<body onmousemove="closesubnav(event);"> 
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
    <div id="globalLink"> <a href="main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div> 
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="images/logo-top.gif" height="60" width="74"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="placement_record/main.jsp" >Placement Record</a>
      <a href="permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="student/main.jsp" >Student </a>
      <a href="change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="average_package/average_package.jsp" >Average Package Query</a>
      <a href="placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../logout.jsp">LOGOUT</a>
      <img src="images/bot.gif" alt="" width="177" height="298" />
    </div>
</div></td>
<table width="300" border="0" align="center">
  <tr>
    <td>
    
	<%
		
		String prog=request.getParameter("prog");
		String submit=request.getParameter("submit");
		String file_name=request.getParameter("file_name");
		String unames=request.getParameter("unames");
		db.fetchConfigDetails();
		if(prog!=null)
		{
			String sql_st="";
			out.println(prog);
			if(prog.equals("1"))
			{
				
				
				String new_line="";
				String Content="";
				File file = new File(gpath+"placement_uploads/root/uploads/"+file_name);
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				DataInputStream dis = null;
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				dis = new DataInputStream(bis);
				//db.fetchConfigDetails();
				db.connect();
				int ijk=1;//db.updateSQL("truncate table btech_temp_data");
				db.close();
					  while (dis.available() != 0) 
					  {
						new_line=dis.readLine();
						String[] flds=new_line.split(",");
						int ijkl=0;
						int dep_id=0;
						int prog_id=0;
						String pprog_name="";
						if(unames!=null)
						{
							db.connect();
							int iklj=db.updateSQL("update student_record set username='"+flds[0]+"' where student_roll_number="+flds[1]+";");
							db.close();
							//response.sendRedirect("update_stud");
						}
						else
						{
							db.connect();
							ResultSet rr1=db.execSQL("select * from prog_record where programme_id=1 or programme_id=2");
							while(rr1.next())
							{
								if(request.getParameter(rr1.getString("programme_name")).equals(flds[3]))
								{
									pprog_name=rr1.getString("programme_name");
									flds[3]=""+rr1.getInt("prog_id");
									dep_id=rr1.getInt("department_id");
									prog_id=rr1.getInt("programme_id");
									ijkl=1;break;
								}
							}
							rr1.close();
							db.close();
							
							
							float f=Float.parseFloat(flds[2]);
							if(ijkl==1)
							{
								
								String qry="";
								if(f>5.0)
									qry="insert into student_record (student_roll_number,student_name,cpi_6sem,program_id,program_name,department_id,programme_id) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"');";
								else
									qry="insert into student_record (student_roll_number,student_name,cpi_6sem,program_id,program_name,department_id,programme_id,is_activated) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"','0');";
								//out.println(qry);
								db.connect();
								//Content+=flds[0]+","+flds[1]+","+flds[2]+"\n";
								ijk*=db.updateSQL(qry);
								db.close();
							}
						}
					  }
				
				
			}
			else if(prog.equals("2"))
			{
				String new_line="";
				String Content="";
				File file = new File(gpath+"placement_uploads/root/uploads/"+file_name);
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				DataInputStream dis = null;
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				dis = new DataInputStream(bis);
				//db.fetchConfigDetails();
				db.connect();
				int ijk=1;//db.updateSQL("truncate table mtech_temp_data");
				db.close();
					  while (dis.available() != 0) {
						new_line=dis.readLine();
						String[] flds=new_line.split(",");
						int ijkl=0;
						int dep_id=0;
						String pprog_name="";
						int prog_id=0;
												if(unames!=null)
						{
							db.connect();
							int iklj=db.updateSQL("update student_record set username='"+flds[0]+"' where student_roll_number="+flds[1]+";");
							db.close();
							//response.sendRedirect("update_stud");
						}
						else
						{
						db.connect();
						ResultSet rr1=db.execSQL("select * from prog_record where programme_id=3 or programme_id=4");
						while(rr1.next())
						{
							if(request.getParameter(rr1.getString("programme_name")).equals(flds[3]))
							{
								pprog_name=rr1.getString("programme_name");
								flds[3]=""+rr1.getInt("prog_id");
								dep_id=rr1.getInt("department_id");
								prog_id=rr1.getInt("programme_id");
								ijkl=1;break;
							}
						}
						rr1.close();
						db.close();
						
						
						float f=Float.parseFloat(flds[2]);
						if(ijkl==1)
						{
							String qry="";
							if(f>5.0)
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"');";
							else
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id,is_activated) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"','0');";
							//out.println(qry);
							db.connect();
							//Content+=flds[0]+","+flds[1]+","+flds[2]+"\n";
							ijk*=db.updateSQL(qry);
							db.close();
						}
						}
					  }
			}
			else if(prog.equals("3"))
			{
				String new_line="";
				String Content="";
				File file = new File(gpath+"placement_uploads/root/uploads/"+file_name);
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				DataInputStream dis = null;
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				dis = new DataInputStream(bis);
				//db.fetchConfigDetails();
				db.connect();
				int ijk=1;//db.updateSQL("truncate table msc_temp_data");
				db.close();
					  while (dis.available() != 0) {
						new_line=dis.readLine();
						String[] flds=new_line.split(",");
						int ijkl=0;
						int dep_id=0;
						int prog_id=0;
						String pprog_name="";
												if(unames!=null)
						{
							db.connect();
							int iklj=db.updateSQL("update student_record set username='"+flds[0]+"' where student_roll_number="+flds[1]+";");
							db.close();
							//response.sendRedirect("update_stud");
						}
						else
						{
						db.connect();
						ResultSet rr1=db.execSQL("select * from prog_record where programme_id=5");
						while(rr1.next())
						{
							if(request.getParameter(rr1.getString("programme_name")).equals(flds[3]))
							{
								pprog_name=rr1.getString("programme_name");
								flds[3]=""+rr1.getInt("prog_id");
								dep_id=rr1.getInt("department_id");
								prog_id=rr1.getInt("programme_id");
								ijkl=1;break;
							}
						}
						rr1.close();
						db.close();
						
						
						float f=Float.parseFloat(flds[2]);
						if(ijkl==1)
						{
							String qry="";
							if(f>5.0)
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"');";
							else
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id,is_activated) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"','0');";
							//out.println(qry);
							db.connect();
							//Content+=flds[0]+","+flds[1]+","+flds[2]+"\n";
							ijk*=db.updateSQL(qry);
							db.close();
						}
						}
					  }
			}
			else if(prog.equals("4"))
			{
				String new_line="";
				String Content="";
				File file = new File(gpath+"placement_uploads/root/uploads/"+file_name);
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				DataInputStream dis = null;
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				dis = new DataInputStream(bis);
				//db.fetchConfigDetails();
				db.connect();
				int ijk=1;//db.updateSQL("truncate table ma_temp_data");
				db.close();
										int ijkl=0;
						int dep_id=0;
						int prog_id=0;
						db.connect();
						String pprog_name="";
						int progg_id=0;


						ResultSet rr1=db.execSQL("select * from prog_record where programme_id=6");
						while(rr1.next())
						{
								pprog_name=rr1.getString("programme_name");
								dep_id=rr1.getInt("department_id");
								prog_id=rr1.getInt("programme_id");
								progg_id=rr1.getInt("prog_id");
								ijkl=1;break;

						}
						rr1.close();
						db.close();
					  while (dis.available() != 0) 
					  {

						new_line=dis.readLine();
						String[] flds=new_line.split(",");

						
												 if(unames!=null)
						{
							db.connect();
							int iklj=db.updateSQL("update student_record set username='"+flds[0]+"' where student_roll_number="+flds[1]+";");
							db.close();
							//response.sendRedirect("update_stud");
						}
						else{
						float f=Float.parseFloat(flds[2]);
						if(ijkl==1)
						{
							String qry="";
							if(f>5.0)
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+progg_id+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"');";
							else
								qry="insert into student_record (student_roll_number,student_name,cpi_2sem,program_id,program_name,department_id,programme_id,is_activated) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+progg_id+"','"+pprog_name+"','"+dep_id+"','"+prog_id+"','0');";
							//out.println(qry);
							db.connect();
							//Content+=flds[0]+","+flds[1]+","+flds[2]+"\n";
							ijk*=db.updateSQL(qry);
							db.close();
						}}
					  
					  }
			}
			/*else if(prog.equals("5"))
			{
				String new_line="";
				String Content="";
				File file = new File(gpath+"placement_uploads/root/uploads/"+file_name);
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				DataInputStream dis = null;
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				dis = new DataInputStream(bis);
				//db.fetchConfigDetails();
				db.connect();
				int ijk=db.updateSQL("truncate table phd_temp_data");
				db.close();
					  while (dis.available() != 0) {
						new_line=dis.readLine();
						String[] flds=new_line.split(",");
						int ijkl=0;
						int dep_id=0;
						int prog_id=0;
						db.connect();
						ResultSet rr1=db.execSQL("select * from prog_record where programme_id=7");
						while(rr1.next())
						{
							if(request.getParameter(rr1.getString("programme_name")).equals(flds[3]))
							{
								flds[3]=""+rr1.getInt("prog_id");
								dep_id=rr1.getInt("department_id");
								prog_id=rr1.getInt("programme_id");
								ijkl=1;break;
							}
						}
						rr1.close();
						db.close();
						
						
						float f=Float.parseFloat(flds[2]);
						if(f>5.0&&ijkl==1)
						{
							String qry="insert into phd_temp_data (roll_number,name,cpi,prog_id,department_id,programme_id) values('"+flds[0]+"','"+flds[1]+"','"+flds[2]+"','"+flds[3]+"','"+dep_id+"','"+prog_id+"');";							//out.println(qry);
							db.connect();
							//Content+=flds[0]+","+flds[1]+","+flds[2]+"\n";
							ijk*=db.updateSQL(qry);
							db.close();
						}
					  }
			}*/
			//db.connect();
			//ResultSet rs=db.execSQL(sql_st);
			//while(rs.next())
			{
				
			}
			//rs.close();
			//db.close();
		}
		response.sendRedirect("update_stud.jsp");
		
	%>
    
    </td>
  </tr>
</table>

<tr>
  <td colspan="2" height="20">   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    GCom  </div> </td></tr></table>
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
