<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">


function load_events()
{
	document.getElementById("btech_table").style.display="none";
	document.getElementById("mtech_table").style.display="none";
	document.getElementById("msc_table").style.display="none";
	document.getElementById("phd_table").style.display="none";
	document.getElementById("ma_table").style.display="none";
}

function activate_btech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("btech_table").style.display="block";	
	}
	else
	{
		document.getElementById("btech_table").style.display="none";
	}
}

function activate_mtech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("mtech_table").style.display="block";	
	}
	else
	{
		document.getElementById("mtech_table").style.display="none";
	}
}

function activate_msc(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("msc_table").style.display="block";	
	}
	else
	{
		document.getElementById("msc_table").style.display="none";
	}
}

function activate_phd(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("phd_table").style.display="block";	
	}
	else
	{
		document.getElementById("phd_table").style.display="none";
	}
}

function activate1(check_box,activate_5,activate_6,activate_7,activate_8,activate_9,activate_10)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_5).disabled=false;
		document.getElementById(activate_6).disabled=false;
		document.getElementById(activate_7).disabled=false;
        document.getElementById(activate_8).disabled=false;
		document.getElementById(activate_9).disabled=false;
		document.getElementById(activate_10).disabled=false; 


	}
	else
	{
		document.getElementById(activate_5).disabled=true;
		document.getElementById(activate_6).disabled=true;
		document.getElementById(activate_7).disabled=true;
        document.getElementById(activate_8).disabled=true;
		document.getElementById(activate_9).disabled=true;
		document.getElementById(activate_10).disabled=true;
	}
}



function activate11(check_box,activate_5,activate_6,activate_7,activate_8)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_5).disabled=false;
		document.getElementById(activate_6).disabled=false;
		document.getElementById(activate_7).disabled=false;
        document.getElementById(activate_8).disabled=false;
		 


	}
	else
	{
		document.getElementById(activate_5).disabled=true;
		document.getElementById(activate_6).disabled=true;
		document.getElementById(activate_7).disabled=true;
        document.getElementById(activate_8).disabled=true;
		
	}
}



function deactivate(check_box,activate_5,activate_6,activate_7,activate_8,activate_9,activate_10)
{
	if(check_box.checked==false)
	{
		document.getElementById(activate_5).disabled=false;
		document.getElementById(activate_6).disabled=false;
		document.getElementById(activate_7).disabled=false;
        document.getElementById(activate_8).disabled=false;
		document.getElementById(activate_9).disabled=false;
		document.getElementById(activate_10).disabled=false; 


	}
	else
	{
		document.getElementById(activate_5).disabled=true;
		document.getElementById(activate_6).disabled=true;
		document.getElementById(activate_7).disabled=true;
        document.getElementById(activate_8).disabled=true;
		document.getElementById(activate_9).disabled=true;
		document.getElementById(activate_10).disabled=true;
	}
}



function deactivate1(check_box,activate_5,activate_6,activate_7,activate_8,activate_9,activate_10)
{
	if(check_box.checked==false)
	{
		document.getElementById(activate_5).disabled=false;
		document.getElementById(activate_6).disabled=false;
		document.getElementById(activate_7).disabled=false;
        document.getElementById(activate_8).disabled=false;
		


	}
	else
	{
		document.getElementById(activate_5).disabled=true;
		document.getElementById(activate_6).disabled=true;
		document.getElementById(activate_7).disabled=true;
        document.getElementById(activate_8).disabled=true;
	
	}
}




function activate2(check_box,activate_2,activate_3)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=false;
		document.getElementById(activate_3).disabled=false;
	
	}
	else
	{
		document.getElementById(activate_2).disabled=true;
		document.getElementById(activate_3).disabled=true;
		
	}
}
function activate3(check_box,activate_2)
{       if(check_box.value="0")
         document.getElementById(activate_2).disabled=false;
        else
        {if(check_box.value="1")
         document.getElementById(activate_2).disabled=true;
        else
     {  	 if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=false;

	
	}
	else
	{
		document.getElementById(activate_2).disabled=true;

	}
     }
       }
}
function activate5(check_box,activate_2)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=true;
	
	}
	else
	{
		document.getElementById(activate_2).disabled=false;
	
	}
}


function activate6(check_box,activate_2)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=false;
	
	}
	else
	{
		document.getElementById(activate_2).disabled=true;
	
	}
}



function activate4(check_box,activate_2,activate_3,activate_4,activate_5,activate_6,activate_7,activate_8)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=false;
		document.getElementById(activate_3).disabled=false;
		document.getElementById(activate_4).disabled=false;
		document.getElementById(activate_5).disabled=false;
		document.getElementById(activate_6).disabled=false;
		document.getElementById(activate_7).disabled=false;
		document.getElementById(activate_8).disabled=false;
	
		
	}
	else
	{
		document.getElementById(activate_2).disabled=true;
		document.getElementById(activate_3).disabled=true;
		document.getElementById(activate_4).disabled=true;
		document.getElementById(activate_5).disabled=true;
		document.getElementById(activate_6).disabled=true;
		document.getElementById(activate_7).disabled=true;
		document.getElementById(activate_8).disabled=true;
		
	}
}
function check_agency_phone_fax(test)
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



function check_agency_email(test)
{	var count=0;
	for(i=0;i<test.length;i++)
		if(test.charAt(i)=='@')
			count++;
	if(count==1)
		return 1;
	else
		return 0;
}		

function validate_empty(ptr)
{	
 var message="";
 
 	 if (ptr.nature_business.value.length == 0 )
	 	message+="Please enter the Nature Business of the Company.\n" ;
	
	 if (ptr.agency_name.value.length == 0 )
		 message+="Please enter the Company Name.\n";
		 
	 if (ptr.agency_website.value.length == 0 )
	     message+="Please enter the Company Website.\n";
		 
	 if (ptr.agency_address.value.length == 0 )
		 message+="Please enter the Company Address.\n" ;	

	 if (ptr.agency_phone.value.length == 0 )
		 message+="Please enter the Company Phone No.\n" ;		

	 if (ptr.agency_mobile.value.length == 0 )
		 message+="Please enter the Company Mobile No.\n" ;
	
	 if (ptr.agency_fax.value.length == 0 )
  		 message+="Please enter the Company Fax No.\n" ;
		 
	 if (ptr.agency_email.value.length == 0 )
		  message+="Please enter the Company Email.\n";
	
	 if (ptr.agency_person.value.length == 0 )
		  message+="Please enter the Contact Person.\n";
	 
	 if (ptr.preferred_date_1.value.length == 0 )
		  message+="Please enter the Preferred Date 1 .\n";
	 
	 if (ptr.preferred_date_2.value.length == 0 )
		  message+="Please enter the Preferred Date 2 .\n";		

	 if (ptr.date_of_result.value.length == 0 )
		  message+="Please enter the Date Of Result.\n";

	 if (ptr.no_of_rounds.value.length == 0 )
		  message+="Please enter the No of rounds .\n";
		  
	 if (ptr.no_of_rooms.value.length == 0 )
		  message+="Please enter the No of rooms.\n";
	
	if (ptr.no_of_executive.value.length == 0 )
		  message+="Please enter the No of Executive.\n";
		  
	if (ptr.joining_date.value.length == 0 )
		  message+="Please enter the Joining date.\n";
		  
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
		ResultSet rus= db.execSQL(sql_username);
		if(rus.next()) 
		{
		username = rus.getString(1);
		}
		
		rus.close();
		db.close();
	
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	db.connect();
	int gency_id=0;
	ResultSet rset=db.execSQL("select agency_id from agency where username='"+username+"';");
	if(rset.next())
	{
		gency_id=rset.getInt(1);
	}
	rset.close();
	int ccoun=0;
	int which=0;
	ResultSet rset1=db.execSQL("select count(*) from package_details where agency_id="+gency_id+";");
	if(rset1.next())
		ccoun=rset1.getInt(1);
	rset1.close();
	if(ccoun==0)
	{
		ResultSet rset3=db.execSQL("select count(*) from package_details_temp where agency_id="+gency_id+";");
		if(rset3.next())
			ccoun=rset3.getInt(1);
		rset3.close();
		which=1;
	}
	db.close();
	int pack_id=0;
	if(ccoun!=0&&gency_id!=0&&which==0)
	{
		db.connect();
		ResultSet rset2=db.execSQL("select package_id from package_details where agency_id="+gency_id+";");
		if(rset2.next())
			pack_id=rset2.getInt(1);
		rset2.close();
		db.close();
		response.sendRedirect("../edit_details/vacancy_appr.jsp?id="+pack_id+"");
	}
	if(ccoun!=0&&gency_id!=0&&which==1)
	{
		db.connect();
		ResultSet rset2=db.execSQL("select package_id from package_details_temp where agency_id="+gency_id+";");
		if(rset2.next())
			pack_id=rset2.getInt(1);
		rset2.close();
		db.close();
		response.sendRedirect("../edit_details/vacancy_temp.jsp?id="+pack_id+"");
	}
%>


<%  	//out.println("rohan 1");
	int department_id1=0;
	int programme_id1=0;
	int agency_id=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=request.getParameter("agency_name");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	String bond=request.getParameter("bond");
	String bond_duration=request.getParameter("bond_duration");
	if(bond_duration==null){bond_duration="0";}
	String package_name1=request.getParameter("package_name1");
 	String vacancy1=request.getParameter("vacancy1");      
	//String programme_name1=request.getParameter("programme_name1");
	//String department_name1=request.getParameter("department_name1");
	String btech=request.getParameter("btech");
	String mtech=request.getParameter("mtech");
	String msc=request.getParameter("msc");
	String ma=request.getParameter("ma");
	String phd=request.getParameter("phd");
	String bdes=request.getParameter("bdes");
	String mdes=request.getParameter("mdes");
	String ctc1=request.getParameter("ctc1");
	String duplicate=null ;
	String[] btech_group=request.getParameterValues("btech_chkbox");
	String[] mtech_group=request.getParameterValues("mtech_chkbox");
	String[] msc_group=request.getParameterValues("msc_chkbox");
	String[] phd_group=request.getParameterValues("phd_chkbox");
	int succ=1;
	if(!(ma!=null||(msc!=null&&msc_group!=null)||bdes!=null||mdes!=null||(mtech!=null&&mtech_group!=null)||(btech!=null&&btech_group!=null)||(phd!=null&&phd_group!=null)||submit==null))
	{response.sendRedirect("error3.jsp");}
	else{
		String get_data="select agency_name from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet ras= db.execSQL(get_data);
		if(ras.next()) 
		{
				agency_name=ras.getString("agency_name");
								
		}
		ras.close();
		db.close();
    
	
	if(submit!=null && agency_name!=null )
		{	
		
			String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"';" ;
			db.connect(); 
			ResultSet rs_agency= db.execSQL(sql_get_data);
			if(rs_agency.next()) 
			{
				agency_id=rs_agency.getInt(1);
			}
			rs_agency.close();
			db.close();
			
		}
	if(submit!=null && agency_name!=null && agency_id!=0)
		{			

			String main_record1=" insert into package_details_temp (package_name, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name1+"','"+vacancy1+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc1+");";
			
			
			db.connect();
			ResultSet sr=db.man_stmnt(main_record1);
			db.close();
			String auto_inc_number="";
			if(sr.next())
			{
				auto_inc_number=""+sr.getInt(1);
			}
			sr.close();
			
			if(btech!=null&&btech_group.length>0)
			{
				for(int i=0;i<btech_group.length;i++)
				{
					String btech_insert="";
					db.connect();
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+btech_group[i]+";");
					if(bt1.next())
						btech_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+btech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(btech_insert);
					db.close();
				}
			}
			if(mtech!=null&&mtech_group.length>0)
			{
				for(int i=0;i<mtech_group.length;i++)
				{
					String mtech_insert="";
					db.connect();
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+mtech_group[i]+";");
					if(bt1.next())
						mtech_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+mtech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(mtech_insert);
					db.close();
				}
			}
			if(msc!=null&&msc_group.length>0)
			{
				for(int i=0;i<msc_group.length;i++)
				{
					String msc_insert="";
					db.connect();
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+msc_group[i]+";");
					if(bt1.next())
						msc_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+msc_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(msc_insert);
					db.close();
				}
			}

			if(phd!=null&&phd_group.length>0)
			{
				for(int i=0;i<phd_group.length;i++)
				{
					String phd_insert="";
					db.connect();
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+phd_group[i]+";");
					if(bt1.next())
						phd_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+phd_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(phd_insert);
					db.close();
				}
			}
			
			if(bdes!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+bdes+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+bdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			
			if(mdes!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+mdes+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+mdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			
			if(ma!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+ma+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+ma+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			if(succ!=0)
			{
				response.sendRedirect("success.jsp");
			}
			else
			{
				//out.println(main_record);
				//out.println(num_rows);//
				response.sendRedirect("error.jsp");
			}
		}

	}

%>
<body background="form/New/jee3.jpg" onLoad="load_events()">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
    <div id="utility"> 
  <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a></div> 
 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div>

<div id="pagecell1">
  <!--pagecell1-->
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr">
  <div id="pageName">
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../instructions.jsp">Instructions</a>
      <a href="../agency_details/register.jsp">Job Application Form</a>
      <a href="../edit_details/edit.jsp">Edit Job Application Form</a>
      <a href="add_vacancy.jsp">Add More Vacancies</a>
      <a href="../change_final_date/change_date.jsp">Request For Change in Final Date </a>
      <a href="../student_eligibility/eligibility.jsp">Eligible Students</a>
      <a href="../student_details/student_details.jsp">Students Details Query</a>
      <a href="../cv_query/cv_query.jsp">CV Query</a>
      <a href="../calendar/view.jsp">Company Schedule</a>
      <a href="../date_notifications/date.jsp">Final Date</a>
      <a href="../uploads/upload.jsp">Upload Company Literature</a>
      <a href="../change_password/change_password.jsp">Change Password</a>
     <a href="../../logout.jsp">Logout</a></div>
  </div>
  <div id="content">
    <div class="feature">
      <form name="form_company_profile" id="form_company_profile" method="post" onSubmit="return validate_empty(form_company_profile)">
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[3]">
                <h2>Vacancies Form</h2>
                <p>&nbsp;</p>
                <table width="640" height="123" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td height="32" width="296" >Job description</td>
                    <td width="307" ><input name="job_description" id="job_description" type="text" ></td>
                    </tr>
                  <tr>
                    <td height="32" >Job designation </td>
                    <td ><input name="job_designation" id="job_designation" type="text"></td>
                    </tr>
                  <tr>
                    <td height="32" >Place of posting </td>
                    <td ><input name="location_of_posting" id ="location_of_posting" type="text"></td>
                    </tr>
                  <tr>
                    <td width="350" height="31">Accomodation</td>
                    <td ><label>
                      <input name="accomodation" id="accomodation" type="radio" value="1">
                      </label>
                      Yes
                      <label>
                        <input name="accomodation" type="radio" id="accomodation" value="0" checked>
                        </label>
                      NO</td>
                    </tr>
                  <tr>
                    <td height="31" >Bond</td>
                    <td ><label>
                      <input name="bond" id="bond" type="radio" value="1" onClick="activate3(this,'bond_duration')">
                      </label>
                      Yes
                      <label>
                        <input name="bond" type="radio" id="bond" onClick="activate5(this,'bond_duration')" value="0" checked>
                        </label>
                      NO</td>
                    </tr>
                  <tr>
                    <td height="32" >Bond duration </td>
                    <td><input type="text" name="bond_duration" size="10" id="bond_duration" value="0">
                      (in months)</td>
                    </tr>
                  </table>
                <table width="640" height="203" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="132" height="35" >Package Name</td>
                    <td width="471" ><input name="package_name1" id ="package_name1" type="text"></td>
                    </tr>
                  <tr>
                    <td height="32">Department</td>
                    <td>Please Select your choices:</td>
                    </tr>
                    <tr><td height="40">&nbsp;</td>
                    <td nowrap>
                      <p>
                        <input type="checkbox" name="btech" id="btech" onClick="activate_btech(this)" value="1">
                        <label for="btech" >B.Tech.</label>
                    </p>
                      <table border="1" align="center" id="btech_table">
                        <tr>
                          <td width="218"><label>
                            <input type="checkbox" name="btech_chkbox" value="1" id="btech_chkbox">
                            Computer Science & Engineering</label></td>
                          <td width="238"><label>
                            <input type="checkbox" name="btech_chkbox" value="2" id="btech_chkbox">
                            Electronics & Communication Engineering</label></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="btech_chkbox" value="3" id="btech_chkbox">
                            Mechanical Engineering</label></td>
                          <td><label>
                            <input type="checkbox" name="btech_chkbox" value="4" id="btech_chkbox">
                            Civil Engineering</label></td>
                        </tr>
                        <tr>
                          <td><label><input type="checkbox" name="btech_chkbox" value="5" id="btech_chkbox">
Biotechnology</label></td>
                          <td><label><input type="checkbox" name="btech_chkbox" value="6" id="btech_chkbox">
Chemical Engineering</label></td>
                        </tr>
                        <tr>
                          <td><label><input type="checkbox" name="btech_chkbox" value="9" id="btech_chkbox">
Chemical Science and Technology</label></td>
                          <td><label><input type="checkbox" name="btech_chkbox" value="8" id="btech_chkbox">
Engineering Physics</label></td>
                        </tr>
                        <tr>
                          <td><label><input type="checkbox" name="btech_chkbox" value="7" id="btech_chkbox">
Mathematics & Computing</label></td>
                          <td><label><input type="checkbox" name="btech_chkbox" value="10" id="btech_chkbox">
Electronics and Electrical Engineering</label></td>
                        </tr>
                      </table>
                      <p><label>
                        <input type="checkbox" name="bdes" value="11" id="bdes">
                        B.Des.</label></p>
                      <p>
                        <input type="checkbox" name="mtech" id="mtech" onClick="activate_mtech(this)" value="1">
                        <label for="mtech">M.Tech.</label>
                      </p>
                      <table border="1" name="mtech_table" id="mtech_table">
                        <tr>
                          <td width="233">Biotechnology</td>
                          <td width="318"><p>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="24" id="mtech_chkbox">
                              Biotechnology</label>
                            <br>
                            <br>
                          </p></td>
                        </tr>
                        <tr>
                          <td>Chemical Engineering</td>
                          <td><label>
                            <input type="checkbox" name="mtech_chkbox" value="25" id="mtech_chkbox">
                            Petroleum Refinery Engineering</label></td>
                        </tr>
                        <tr>
                          <td>Civil Engineering</td>
                          <td><label> 
                            <input type="checkbox" name="mtech_chkbox" value="19" id="mtech_chkbox">
                          </label>
                            <label>Structural Engineering</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="20" id="mtech_chkbox">
                              Water Resources Engineering and Management</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="21" id="mtech_chkbox">
                              Geotechnical Engineering</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="22" id="mtech_chkbox">
                              Environmental Engineering</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="23" id="mtech_chkbox">
                            Transportation System Engineering</label></td>
                        </tr>
                        <tr>
                          <td>Computer Science &amp; Engineering</td>
                          <td><label>
                            <input type="checkbox" name="mtech_chkbox" value="12" id="mtech_chkbox">
                            Computer Science and Engineering</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="13" id="mtech_chkbox">
                            Information Security</label></td>
                        </tr>
                        <tr>
                          <td>Electronics and Communication Engineering</td>
                          <td><label>
                            <input type="checkbox" name="mtech_chkbox" value="14" id="mtech_chkbox">
                            Digital Signal Processing</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="15" id="mtech_chkbox">
                            VLSI</label></td>
                        </tr>
                        <tr>
                          <td>Mechanical Engineering</td>
                          <td><label>
                            <input type="checkbox" name="mtech_chkbox" value="16" id="mtech_chkbox">
                            Machine Design</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="17" id="mtech_chkbox">
                              Fluids and Thermal Sciences</label>
                            <br>
                            <label>
                              <input type="checkbox" name="mtech_chkbox" value="18" id="mtech_chkbox">
                            Computer Assisted Manufacturing</label></td>
                        </tr>
                      </table>
                      <p><label>
                        <input type="checkbox" name="mdes" value="26" id="mdes">
M.Des.</label></p>
                      <p>
  <input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1">
                        <label for="msc">M.Sc.</label>
                      </p>
                      <table border="1" id="msc_table" name="msc_table">
                        <tr>
                          <td><p>
                            <label>
                              <input type="checkbox" name="msc_chkbox" value="27" id="msc_chkbox">
                              Mathematics</label>
                            <br>
                            <br>
                          </p></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="msc_chkbox" value="28" id="msc_chkbox">
                            Physics</label></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="msc_chkbox" value="29" id="msc_chkbox">
                            Chemistry</label></td>
                        </tr>
                      </table>
                      <p>
                        <input name="ma" type="checkbox" id="ma" value="30">
                        <label for="MA">M.A. in Development Studies</label>
                      </p>
                      <p>
                        <input type="checkbox" name="phd" id="phd" onClick="activate_phd(this)" value="1">
                        <label for="phd">Ph.D.</label>
                </p>
                      <table width="450" border="1" id="phd_table" name="phd_table">
                        <tr>
                          <td><p>
                            <label>
                              <input type="checkbox" name="phd_chkbox" value="31" id="phd_chkbox">
                              Computer Science and Engineering</label>
                            <br>
                            <br>
                          </p></td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="32" id="phd_chkbox">
                            Electronics and Communication Engineering</label>
                            <br></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="33" id="phd_chkbox">
                            Mechanical Engineering</label>
                            <br></td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="34" id="phd_chkbox">
                            Civil Engineering</label>
                            <br></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="35" id="phd_chkbox">
                            Design</label>
                            <br></td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="36" id="phd_chkbox">
                            Biotechnology</label>
                            <br></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="37" id="phd_chkbox">
                            Chemical Engineering</label>
                            <br></td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="38" id="phd_chkbox">
                            Mathematics</label>
                            <br></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="39" id="phd_chkbox">
                            Physics</label>
                            <br>
                            <br>
                           </td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="40" id="phd_chkbox">
                            Chemistry</label></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="41" id="phd_chkbox">
                            HSS</label></td>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="42" id="phd_chkbox">
                            Centre for Energy</label></td>
                        </tr>
                        <tr>
                          <td><label>
                            <input type="checkbox" name="phd_chkbox" value="43" id="phd_chkbox">
                            Centre for Environment</label></td>
                          <td> <label>
                              <input type="checkbox" name="phd_chkbox" value="14" id="phd_chkbox">
                            Centre for Nanotechnology</label></td>
                        </tr>
                      </table>
                      <p>&nbsp;</p></td>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><input name="vacancy1" id="vacancy1" type="text"></td>
                  <tr>
                      <td height="32">CTC :</td>
                      <td><input name="ctc1" id="ctc1" type="text">
                        ( Lacs p.a.)</td>
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
        <p>&nbsp;</p>
<p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </form>
      <p align="center">&nbsp;</p>
    </div>
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name </div>
</div>
</body>

</html>

