<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">


<script type="text/javascript" src="../../js/tabber.js"></script>
<link rel="stylesheet" href="../../js/example.css" TYPE="text/css" MEDIA="screen">
<script type="text/javascript">

var time = 3000;
var numofitems = 7;


function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
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

 function check_phone(test)
{	
	var len=0;
	var str="1234567890-";
	for(i=0;i<test.length;i++)
	{
		for(j=0;j<str.length;j++)
		{
			if(test.charAt(i)==str.charAt(j))
			len++;
		}
	}
	
	if(len==test.length)
	return 1
	else
	return 0;
}


 

function validate_empty(ptr)
{	
 var message="";
 

  if (ptr.student_roll_number.value.length == 0 )
  	message+="Please enter the roll no \n" ;

	
  if (message.length > 0)
 {
    alert(message);
    return false ;
 } 
 else
 {
	return true;
 }

}

</script>

<script src="../../js/datetimepicker.js"></script>
</head>
<body onmousemove="closesubnav(event);"> 
<body onLoad="document.form_agency_registration.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 


<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../../utils/sql_convert_date.jsp"%>


<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>

<% db.fetchConfigDetails(); %>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr"> 
    <div id="globalLink">
      <div id="globalLink2"> <a href="../../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
    </div> 
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form> 
  </div> 
  <!-- end globalNav --> 
  
</div> 



<%	
	int student_id=0;
	String program_id="";
	String is_activated=request.getParameter("is_activated");
	String student_roll_number=request.getParameter("student_roll_number");
	String department_id="0";
	String programme_id="0";
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String submit=request.getParameter("submit");
		String submit1=request.getParameter("submit1");
		String submit2=request.getParameter("submit2");
        String name=request.getParameter("student_name");
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex"); 
        String category=request.getParameter("category");
        //String dept_name=request.getParameter("department_name");
        //String prog_name="";
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
        String gap_reason=request.getParameter("gap_reason");
        String cpi=request.getParameter("cpi_2sem");
        String backlog=request.getParameter("backlog");
        String sem1=request.getParameter("sem1");
        String sem2=request.getParameter("sem2");
        String sem3=request.getParameter("sem3");
        String core=request.getParameter("core");
        String govt=request.getParameter("govt");
        String IT=request.getParameter("IT");
        String management=request.getParameter("management");
        String dream_company=request.getParameter("dream_company"); 
		String fin_and_banking_sector=request.getParameter("fin_and_banking_sector");
		String gap_duration=request.getParameter("gap_duration");
		String x_div=request.getParameter("x_div");
		String xii_div=request.getParameter("xii_div");
		String backlog_courses=request.getParameter("backlog_courses");
		String comp_1=request.getParameter("comp_1");
		String comp_2=request.getParameter("comp_2");
		String comp_3=request.getParameter("comp_3");
		String comp_4=request.getParameter("comp_4");
		String comp_5=request.getParameter("comp_5");
		String program_name="";
		String grad_degree=request.getParameter("grad_degree");
		String grad_branch=request.getParameter("grad_branch");
		String grad_medium=request.getParameter("grad_medium");
		String grad_percentage=request.getParameter("grad_percentage");
		String grad_year=request.getParameter("grad_year");
		String grad_board=request.getParameter("grad_board");
		String grad_div=request.getParameter("grad_div");
		String others=request.getParameter("others");
		String others_medium=request.getParameter("others_medium");
		String others_div=request.getParameter("others_div");
		String others_percentage=request.getParameter("others_percentage");
		String others_year=request.getParameter("others_year");
		String others_board=request.getParameter("others_board");
		String spec=request.getParameter("spec");
		String address2=request.getParameter("address2");
		String address3=request.getParameter("address3");
		int i3=0;
		if((submit1!=null||submit2!=null)&&is_activated!=null&&cpi!=null)
		{
			db.connect();
			i3=db.updateSQL("update student_record set is_activated="+is_activated+",cpi_2sem="+cpi+" where student_roll_number="+student_roll_number+";");
			db.close();
		}

	if(submit!=null &&is_activated!=null&&cpi!=null&& name!=null&&student_roll_number!=null&& jee_rank!=null&&dob!=null&&hostel!=null&&room_no!=null&&email1!=null&&email2!=null&&mobile1!=null&&address!=null&&pin!=null&&telephone!=null&&x_board!=null&&xii_board!=null&&x_medium!=null&&xii_medium!=null&&x_div!=null&&xii_div!=null&&x_marks!=null&&xii_marks!=null&&x_year!=null&&xii_year!=null&&gap!=null&&sem1!=null&&sem2!=null&&backlog!=null&&grad_degree!=null&&grad_branch!=null&&grad_medium!=null&&grad_year!=null&&grad_percentage!=null&&grad_board!=null&&grad_div!=null)
	{  	
		db.connect();
		if(spec!=null)
		{
			ResultSet r_s2=db.execSQL("select programme_name from prog_record where prog_id="+spec+";");
			if(r_s2.next())
				program_name=r_s2.getString(1);
			r_s2.close();
		}
		db.close();
		String main_record1=" update student_record set jee_rank='"+jee_rank+"'";
		
		if(spec!=null&&program_name!=null)
		{
			main_record1=main_record1+",program_id="+spec+",program_name='"+program_name+"'";
		}
		if(gap.equals("1"))
		{
			if(gap_reason==null||gap_duration==null)
				response.sendRedirect("error.jsp?error=gap");
			else
				main_record1=main_record1+",gap_in_study='1',gap_reason='"+gap_reason+"',gap_duration='"+gap_duration+"'";
		}
		else
			main_record1=main_record1+",gap_in_study='0',gap_reason='NA',gap_duration='NA'";
		if(backlog.equals("1"))
		{
			if(backlog_courses==null)
				main_record1=main_record1+",backlog='1',backlog_courses=' '";
			else
				main_record1=main_record1+",backlog='1',backlog_courses='"+backlog_courses+"'";
		}
		else
			main_record1=main_record1+",backlog='0',backlog_courses='NA'";
		if(others!=null&&others_year!=null&&others_div!=null&&others_board!=null&&others_percentage!=null&&others_medium!=null)
		{
			main_record1=main_record1+",others='"+others+"',others_year='"+others_year+"',others_div='"+others_div+"',others_board='"+others_board+"',others_percentage='"+others_percentage+"',others_medium='"+others_medium+"'";
		}
		if(sem3!=null)
			main_record1=main_record1+",spi_3sem='"+sem3+"'";
		else
			main_record1=main_record1+",spi_3sem='0'";
		if(core!=null)
			main_record1=main_record1+",core_sector='"+core+"'";
		else
			main_record1=main_record1+",core_sector='NA'";
		if(IT!=null)
			main_record1=main_record1+",it_sector='"+IT+"'";
		else
			main_record1=main_record1+",it_sector='NA'";
		if(govt!=null)
			main_record1=main_record1+",govt_sector='"+govt+"'";
		else
			main_record1=main_record1+",govt_sector='NA'";
		if(management!=null)
			main_record1=main_record1+",management_sector='"+management+"'";
		else
			main_record1=main_record1+",management_sector='NA'";
		if(fin_and_banking_sector!=null)
			main_record1=main_record1+",fin_and_banking_sector='"+fin_and_banking_sector+"'";
		else
			main_record1=main_record1+",fin_and_banking_sector='NA'";
		if(dream_company!=null)
			main_record1=main_record1+",dream_company='"+dream_company+"'";
		else
			main_record1=main_record1+",dream_company='NA'";
		if(comp_1!=null)
			main_record1=main_record1+",comp_1='"+comp_1+"'";
		else
			main_record1=main_record1+",comp_1='NA'";
		if(comp_2!=null)
			main_record1=main_record1+",comp_2='"+comp_2+"'";
		else
			main_record1=main_record1+",comp_2='NA'";
		if(comp_3!=null)
			main_record1=main_record1+",comp_3='"+comp_3+"'";
		else
			main_record1=main_record1+",comp_3='NA'";
		if(comp_4!=null)
			main_record1=main_record1+",comp_4='"+comp_4+"'";
		else
			main_record1=main_record1+",comp_4='NA'";
		if(comp_5!=null)
			main_record1=main_record1+",comp_5='"+comp_5+"'";
		else
			main_record1=main_record1+",comp_5='NA'";
		if(mobile2!=null)
			main_record1=main_record1+",contact_number2='"+mobile2+"'";
		else
			main_record1=main_record1+",contact_number2='NA'";
		if(telephone!=null)
			main_record1=main_record1+",home_contact_number='"+telephone+"'";
		else
			main_record1=main_record1+",home_contact_number='NA'";
		
		
		main_record1=main_record1+" ,is_activated="+is_activated+",student_name='"+name+"',cpi_2sem="+cpi+", date_of_birth='"+sql_convert_date(dob)+"', sex="+sex+" ,category='"+category+"' , hostel='"+hostel+"' ,room_no='"+room_no+"', email='"+email1+"' , email_alternative='"+email2+"',contact_number='"+mobile1+"', permanent_address='"+address+"', pin='"+pin+"' ,  x_board='"+x_board+"',x_medium='"+x_medium+"', x_percentage='"+x_marks+"' ,x_pass_year='"+x_year+"' ,xii_board='"+xii_board+"' ,xii_medium='"+xii_medium+"' ,xii_percentage='"+xii_marks+"' ,xii_pass_year='"+xii_year+"' ,spi_1sem="+sem1+" ,spi_2sem="+sem2+",x_div='"+x_div+"',xii_div='"+xii_div+"',grad_degree='"+grad_degree+"',grad_medium='"+grad_medium+"',grad_branch='"+grad_branch+"',grad_div='"+grad_div+"',grad_year='"+grad_year+"',grad_percentage='"+grad_percentage+"',grad_board='"+grad_board+"',address2='"+address2+"',address3='"+address3+"'  where student_roll_number='"+student_roll_number+"';";



		db.connect();
		int num_rows1=db.updateSQL(main_record1);
		
		
		db.close();	
		if(num_rows1==1 || i3==1){
			String deleteQuery = "delete from eligible_students where student_id in ( select student_id from student_record where student_roll_number='"+student_roll_number+"')";
			
			String deleteQuery2 = "delete from interested_students where student_id in ( select student_id from student_record where student_roll_number='"+student_roll_number+"')";
			
			String insertQuery = "insert into eligible_students(agency_id,student_id,package_id) ( select ped.agency_id, sr.student_id, ped.package_id from package_extra_details ped, student_record sr, package_details pd where sr.student_roll_number = '"+student_roll_number+"' and sr.program_id = ped.program_index and	ped.package_id = pd.package_id and (sr.cpi_2sem >= pd.cpi))";
			db.connect();
			db.updateSQL(deleteQuery);
			db.updateSQL(deleteQuery2);
			db.updateSQL(insertQuery);
			db.close();	


			response.sendRedirect("success.jsp");
	
				
		}
		else
				response.sendRedirect("error.jsp?error=update_fail");
				//out.println(main_record1);
     	}

%>




        <%	if(submit==null)
	{
		String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
			name=rs.getString("student_name");
			dob=rs.getString("date_of_birth");
			sex=rs.getString("sex");
			if(sex==null)sex="0";
			category=rs.getString("category");
			jee_rank=rs.getString("jee_rank");
        	hostel=rs.getString("hostel");
       		room_no=rs.getString("room_no");
			email1=rs.getString("email");
            email2=rs.getString("email_alternative");
        	mobile1=rs.getString("contact_number");
       		mobile2=rs.getString("contact_number2");
       		address=rs.getString("permanent_address");
			address2=rs.getString("address2");
			address3=rs.getString("address3");
       		pin=rs.getString("pin");
      		telephone=rs.getString("home_contact_number");
        	x_board=rs.getString("x_board");
       		x_medium=rs.getString("x_medium");
          	x_marks=rs.getString("x_percentage");
       		x_year=rs.getString("x_pass_year");
        	xii_board=rs.getString("xii_board");
        	xii_medium=rs.getString("xii_medium");
        	xii_marks=rs.getString("xii_percentage");
        	xii_year=rs.getString("xii_pass_year");
		programme_id=""+rs.getString("programme_id");
		department_id=""+rs.getString("department_id");
        	gap=rs.getString("gap_in_study");
			if(gap==null)gap="0";
			gap_reason=rs.getString("gap_reason");
        	cpi=rs.getString("cpi_2sem");
        	backlog=rs.getString("backlog");
        	sem1=rs.getString("spi_1sem");
        	sem2=rs.getString("spi_2sem");
        	sem3=rs.getString("spi_3sem");
        	core=rs.getString("core_sector");
        	govt=rs.getString("govt_sector");
			IT=rs.getString("it_sector");
        	management=rs.getString("management_sector");
			fin_and_banking_sector=rs.getString("fin_and_banking_sector");
			dream_company=rs.getString("dream_company"); 
			program_name=rs.getString("program_name");
			gap_duration=rs.getString("gap_duration");
			x_div=rs.getString("x_div");
			xii_div=rs.getString("xii_div");
			backlog_courses=rs.getString("backlog_courses");
			comp_1=rs.getString("comp_1");
			comp_2=rs.getString("comp_2");
			comp_3=rs.getString("comp_3");
			comp_4=rs.getString("comp_4");
			comp_5=rs.getString("comp_5");
			grad_degree=rs.getString("grad_degree");
			grad_branch=rs.getString("grad_branch");
			grad_medium=rs.getString("grad_medium");
			grad_percentage=rs.getString("grad_percentage");
			grad_year=rs.getString("grad_year");
			grad_board=rs.getString("grad_board");
			grad_div=rs.getString("grad_div");
			others=rs.getString("others");
			others_medium=rs.getString("others_medium");
			others_div=rs.getString("others_div");
			others_percentage=rs.getString("others_percentage");
			others_year=rs.getString("others_year");
			others_board=rs.getString("others_board");	
			program_id=rs.getString("program_id");
			is_activated=""+rs.getInt("is_activated");
			
		}
		rs.close();
		if(program_id!=null)
		{
			ResultSet r_s1=db.execSQL("select programme_name from prog_record where prog_id="+program_id+";");
			if(r_s1.next())
				program_name=r_s1.getString(1);
			r_s1.close();
		}
		else
		{
			ResultSet rsss=db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
			if(rsss.next())
				program_name=rsss.getString(1);
			rsss.close();
			ResultSet rs2=db.execSQL("select department_name from department_record where department_id="+department_id+";");
			if(rs2.next())
				program_name+=" "+rs2.getString(1);
			rs2.close();
		}
		db.close();
		
	}

%>



<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="57" width="67"/></div>
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
  </div><form name="form2" method="post" action="edit_m.jsp?student_roll_number=<%=student_roll_number%>">
  <div id="content"> 
    <div class="feature">
      <table width="80%" align="center">
        <tr>
          <td bgcolor="#FFFFFF"><div class="tabber">
            <div class="tabbertab" id="step[1]" >
              <h2>General Info </h2>
              <center>
                <p>&nbsp;</p>
                <table width="687" height="751" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="200">Student roll number</td>
                    <td width="351"><p><%=student_roll_number%></p>
                      Activated

                    <label>
                    <input type="radio" name="is_activated" value="1" id="is_activated_0" <% if(is_activated.equals("1"))out.println("checked"); %>>
                    Yes</label>
                    
                    <label>
                    <input type="radio" name="is_activated" value="0" id="is_activated_1" <% if(is_activated.equals("0"))out.println("checked"); %>>
                    No</label>
					<input type="submit" name="submit1" id="submit1" value="Submit"></td>
                  </tr>
                  <tr>
                    <td>Name(Capital Letter)</td>
                    <td>
                      <label for="student_name"></label>
                      <input type="text" name="student_name" id="student_name" value="<%=name%>"></td>
                  </tr>
                  <tr>
                    <td>Date of Birth</td>
                    <td><a href="javascript:NewCal('dob','ddmmyyyy')">
                      <input readonly type="text" name="dob" id="dob" value="<%=sql_convert_date(dob)%>" >
                    </a></td>
                  </tr>
                  <tr>
                    <td>Sex</td>
                    <td><input name="sex" type="radio" id="sex" value="1" checked <% if(sex.equals("1")){out.println("checked");} %>>
                      Male
                      <input type="radio" name="sex" id="sex" value="0" <% if(sex.equals("0")){out.println("checked");} %>>
                      Female</td>
                  </tr>
                  <tr>
                    <td>Category(SC/ST/OBC/GEN/PH)</td>
                    <td><label for="category"></label>
                      <select name="category" id="category">
                        <option value="GEN" <% if(category.equals("GEN"))out.println("selected"); %>>GEN</option>
                        <option value="SC" <% if(category.equals("SC"))out.println("selected"); %>>SC</option>
                        <option value="ST" <% if(category.equals("ST"))out.println("selected"); %>>ST</option>
                        <option value="OBC" <% if(category.equals("OBC"))out.println("selected"); %>>OBC</option>
                        <option value="PH" <% if(category.equals("PH"))out.println("selected"); %>>PH</option>
                      </select></td>
                  </tr>
                  <tr>
                    <td>Programme</td>
                    <td><p><%=program_name%></p>
                      <p>
                        <%
	if(programme_id!=null)
	{
		if(programme_id.equals("3"))
		{
			db.connect();
			ResultSet r_s=db.execSQL("select count(*) from prog_record where department_id="+department_id+" and programme_id="+programme_id+";");
			int count1=1;
			if(r_s.next())
				count1=r_s.getInt(1);
			r_s.close();
			db.close();
			if(count1>1)
			{
				db.connect();
				ResultSet r_e=db.execSQL("select * from prog_record where department_id="+department_id+" and programme_id="+programme_id+";");
				out.println("<label for=\"spec\"></label>");
				out.println("<select name=\"spec\" id=\"spec\">");
				while(r_e.next())
				{
					if(program_name.equals(r_e.getString("programme_name")))
						out.println("<option value=\""+r_e.getString("prog_id")+"\" selected>"+r_e.getString("programme_name")+"</option>");
					else
						out.println("<option value=\""+r_e.getString("prog_id")+"\">"+r_e.getString("programme_name")+"</option>");
				}
				r_e.close();
				db.close();
				out.println("</select>");
			}
		}
	}
%>
                      </p></td>
                  </tr>
                  <tr>
                    <td>GATE/JAM/NET (AIR)</td>
                    <td><input type="text" name="rank" value="<%=jee_rank%>"></td>
                  </tr>
                  <tr>
                    <td>Hostel</td>
                    <td><input type="text" name="hostel" value="<%=hostel%>"></td>
                  </tr>
                  <tr>
                    <td>Room No.</td>
                    <td><input type="text" name="room" value="<%=room_no%>"></td>
                  </tr>
                  <tr>
                    <td>Email</td>
                    <td><input type="text" name="email1" value="<%=email1%>">
                      (iitg e-mail)</td>
                  </tr>
                  <tr>
                    <td></td>
                    <td><input type="text" name="email2" value="<%=email2%>">
                      (alternative e-mail)</td>
                  </tr>
                  <tr>
                    <td>Contact Telephone/Mobile No.</td>
                    <td><input type="text" name="mobile1" value="<%=mobile1%>"></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td><input type="text" name="mobile2" value="<%=mobile2%>"></td>
                  </tr>
                  <tr>
                    <td height="150">Permanent Address</td>
                    <td>
                      <input name="address" type="text" value="<%=address%>" size="45"><br/>
<input name="address2" type="text" value="<%=address2%>" size="45"><br/>
                        <input name="address3" type="text" value="<%=address3%>" size="45">
                        </td>
                  </tr>
                  <tr>
                    <td>Pin</td>
                    <td><input type="text" name="pin" value="<%=pin%>"></td>
                  </tr>
                  <tr>
                    <td>Home Telephone No.(with code)</td>
                    <td><input type="text" name="telephone" value="<%=telephone%>"></td>
                  </tr>
                </table>
              </center>
            </div>
            <div class="tabbertab" id="step[2]">
              <h2>Academic Details</h2>
              <p>&nbsp;</p>
              <table width="1000" align="center" cellpadding="5" cellspacing="5">
                <tr>
                  <td>Level</td>
                  <td>Board/Institution</td>
                  <td>Medium</td>
                  <td>Class/Div</td>
                  <td>% of Marks</td>
                  <td>Year of Passing</td>
                </tr>
                <tr>
                  <td>X STD</td>
                  <td><input type="text" name="x_board" value=<%=x_board%>></td>
                  <td><input type="text" name="x_medium" value=<%=x_medium%>></td>
                  <td><label for="x_div"></label>
                    <input type="text" name="x_div" id="x_div" value="<%=x_div%>"/></td>
                  <td><input type="text" name="x_marks" value=<%=x_marks%>></td>
                  <td><input type="text" name="x_year" value=<%=x_year%>></td>
                </tr>
                <tr>
                  <td>XII STD</td>
                  <td><input type="text" name="xii_board" value=<%=xii_board%>></td>
                  <td><input type="text" name="xii_medium" value=<%=xii_medium%>></td>
                  <td><label for="xii_div"></label>
                    <input type="text" name="xii_div" id="xii_div" value="<%=xii_div%>"/></td>
                  <td><input type="text" name="xii_marks" value=<%=xii_marks%>></td>
                  <td><input type="text" name="xii_year" value=<%=xii_year%>></td>
                </tr>
                <tr>
                  <td><p>Graduation</p>
                    <p>Degree:
                      <label for="grad_degree"></label>
                      <input type="text" name="grad_degree" id="grad_degree" value="<%=grad_degree%>"/>
                    </p>
                    <p>Branch:
                      <label for="grad_branch"></label>
                      <input type="text" name="grad_branch" id="grad_branch" value="<%=grad_branch%>"/>
                    </p></td>
                  <td><label for="grad_board"></label>
                    <input type="text" name="grad_board" id="grad_board" value="<%=grad_board%>"/></td>
                  <td><label for="grad_medium"></label>
                    <input type="text" name="grad_medium" id="grad_medium" value="<%=grad_medium%>"/></td>
                  <td><label for="grad_div"></label>
                    <input type="text" name="grad_div" id="grad_div" value="<%=grad_div%>"/></td>
                  <td><label for="grad_percentage"></label>
                    <input type="text" name="grad_percentage" id="grad_percentage" value="<%=grad_percentage%>"/></td>
                  <td><label for="grad_year"></label>
                    <input type="text" name="grad_year" id="grad_year" value="<%=grad_year%>"/></td>
                </tr>
                <tr>
                  <td>Others:
                    <label for="others"></label>
                    <input type="text" name="others" id="others" value="<%=others%>"/></td>
                  <td><label for="others_board"></label>
                    <input type="text" name="others_board" id="others_board" value="<%=others_board%>"/></td>
                  <td><label for="others_medium"></label>
                    <input type="text" name="others_medium" id="others_medium" value="<%=others_medium%>"/></td>
                  <td><label for="others_div"></label>
                    <input type="text" name="others_div" id="others_div" value="<%=others_div%>"/></td>
                  <td><label for="others_percentage"></label>
                    <input type="text" name="others_percentage" id="others_percentage" value="<%=others_percentage%>"/></td>
                  <td><label for="others_year"></label>
                    <input type="text" name="others_year" id="others_year" value="<%=others_year%>"/></td>
                </tr>
                <tr>
                  <td>Gap in Study</td>
                  <td><input type="radio" name="gap" id="gap" value="1" <% if(gap.equals("1")){out.println("checked");} %> />
                    Yes
                    <input name="gap" type="radio" id="gap" value="0" <% if(gap.equals("0")){out.println("checked");} %> />
                    No</td>
                  <td><p>If Yes, Reason:</p>
                    <label for="gap_reason"></label></td>
                  <td><input type="text" name="gap_reason" id="gap_reason" value="<%=gap_reason%>"/></td>
                  <td>Duration:</td>
                  <td><label for="gap_duration"></label>
                    <input type="text" name="gap_duration" id="gap_duration" value="<%=gap_duration%>"/></td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <center>
                <table align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td><table align="center" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="200">CPI(up to 2nd semester)</td>
                        <td>
                          <label for="cpi_2sem"></label>
                          <input type="text" name="cpi_2sem" id="cpi_2sem" value="<%=cpi%>"></td><td><input type="submit" name="submit2" id="submit2" value="Submit"></td>
                      </tr>
                      <tr>
                        <td>SPI in all semesters</td>
                        <td>&nbsp;</td>
                        <td>Backlog<br/>
                          <input type="radio" name="backlog" value="1" <% if(backlog.equals("1")) out.println("checked"); %>/>
                          Yes
                          <input type="radio" name="backlog" value="0" <% if(backlog.equals("0")) out.println("checked"); %>/>
                          No </td>
                        <td>Courses:</td>
                        <td><input type="text" name="backlog_courses" id="backlog_courses" value="<%=backlog_courses%>"/></td>
                      </tr>
                      <tr>
                        <td>1st Sem</td>
                        <td>2nd Sem</td>
                        <td>3rd Sem</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><input type="text" name="sem1" value="<%=sem1%>" /></td>
                        <td><input type="text" name="sem2" value="<%=sem2%>" /></td>
                        <td><input type="text" name="sem3" value="<%=sem3%>" /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>Preferred Job</td>
                        <td>Core Sector</td>
                        <td>Govt. Sector</td>
                        <td>IT Sector</td>
                        <td>Management Sector</td>
                        <td>Fin. &amp; Banking Sector</td>
                      </tr>
                      <tr>
                        <td>(state 1st,2nd or 3rd preferences in the respective boxes)</td>
                        <td><input type="text" name="core" value="<%=core%>" /></td>
                        <td><input type="text" name="govt" value="<%=govt%>" /></td>
                        <td><input type="text" name="IT" value="<%=IT%>" /></td>
                        <td><input type="text" name="management" value="<%=management%>" /></td>
                        <td><label for="fin_and_banking_sector"></label>
                          <input type="text" name="fin_and_banking_sector" id="fin_and_banking_sector" value="<%=fin_and_banking_sector%>"/></td>
                      </tr>
                      <tr>
                        <td>Dream Company(if any state)</td>
                        <td><input type="text" name="dream_company" value="<%=dream_company%>" /></td>
                      </tr>
                    </table></td>
                  </tr>
                </table>
                <p>&nbsp;</p>
              </center>
            </div>
            <div class="tabbertab" id="step[3]">
              <h2>Choice Sheet</h2>
              <p>&nbsp;</p>
              <table width="640" height="192" align="center" cellpadding="5" cellspacing="5">
                <tr>
                  <td height="32" width="350" >Organization I</td>
                  <td width="307" ><input name="comp_1" id="comp_1" type="text" value="<%=comp_1%>"></td>
                </tr>
                <tr>
                  <td height="32" >Organization II</td>
                  <td ><input name="comp_2" id="comp_2" type="text" value="<%=comp_2%>"></td>
                </tr>
                <tr>
                  <td height="32" >Organization III</td>
                  <td ><input name="comp_3" id ="comp_3" type="text" value="<%=comp_3%>"></td>
                </tr>
                <tr>
                  <td height="32" >Organization IV</td>
                  <td ><input name="comp_4" id ="comp_4" type="text" value="<%=comp_4%>"></td>
                </tr>
                <tr>
                  <td height="32" >Organization V</td>
                  <td ><input name="comp_5" id ="comp_5" type="text" value="<%=comp_5%>"></td>
                </tr>
              </table>
              <p>&nbsp;</p>
            </div>
          </div></td>
        </tr>
        <tr>
          <td align="right"><input type="submit" name="submit" id="submit" value="Submit">
        </tr>
  </td>
  
      </table>
      <p></p>
    </div> 
  </div>
  </form>
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
