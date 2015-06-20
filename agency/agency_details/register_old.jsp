<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">


function activate(check_box,activate_2,activate_3,activate_4)
{
	if(check_box.checked==true)
	{
		document.getElementById(activate_2).disabled=false;
		document.getElementById(activate_3).disabled=false;
		document.getElementById(activate_4).disabled=false;
	}
	else
	{
		document.getElementById(activate_2).disabled=true;
		document.getElementById(activate_3).disabled=true;
		document.getElementById(activate_4).disabled=true;
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

<%  	//out.println("rohan 1");
	int department_id1=0;
	int programme_id1=0;
	int department_id2=0;
	int programme_id2=0;
	int department_id3=0;
	int programme_id3=0;
	int department_id4=0;
	int programme_id4=0;
	int department_id5=0;
	int programme_id5=0;
	int agency_id=0;
	int registration_status=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String agency_name=request.getParameter("agency_name");
	String agency_address=request.getParameter("agency_address");
	String agency_website=request.getParameter("agency_website");
	String agency_phone=request.getParameter("agency_phone");
	String agency_mobile=request.getParameter("agency_mobile");
	String agency_fax=request.getParameter("agency_fax");
	String agency_email=request.getParameter("agency_email");
	String agency_person=request.getParameter("agency_person");
	String shortlist=request.getParameter("shortlist");
	String ppt=request.getParameter("ppt");
	String gd=request.getParameter("gd");
	String aptitude_test=request.getParameter("aptitude_test");
	String technical_test=request.getParameter("technical_test");
	String interview=request.getParameter("interview");
	String immediate_result_declaration=request.getParameter("immediate_result_declaration");
	String no_of_rounds=request.getParameter("no_of_rounds");
	String no_of_rooms=request.getParameter("no_of_rooms");
	String preferred_date_1=request.getParameter("preferred_date_1");
	String preferred_date_2=request.getParameter("preferred_date_2");
	String date_of_result=request.getParameter("date_of_result");
	String joining_date=request.getParameter("joining_date");
	String lcd=request.getParameter("checkbox2");
	String laptop=request.getParameter("checkbox3");
	String ohp=request.getParameter("checkbox4");
	String equipments=request.getParameter("checkbox");
	String no_of_executive=request.getParameter("no_of_executive");
	String aptitude_duration=request.getParameter("aptitude_duration");
	String technical_duration=request.getParameter("technical_duration");
	String cpi=request.getParameter("cpi");
    String nature_business=request.getParameter("nature_business");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	String bond=request.getParameter("bond");
	String bond_duration=request.getParameter("bond_duration");
	String package_name1=request.getParameter("package_name1");
 	String vacancy1=request.getParameter("vacancy1");      
	String programme_name1=request.getParameter("programme_name1");
	String department_name1=request.getParameter("department_name1");
	String ctc1=request.getParameter("ctc1");
	String package_name2=request.getParameter("package_name2");
 	String vacancy2=request.getParameter("vacancy2");      
	String programme_name2=request.getParameter("programme_name2");
	String department_name2=request.getParameter("department_name2");
	String ctc2=request.getParameter("ctc2");
	String package_name3=request.getParameter("package_name3");
 	String vacancy3=request.getParameter("vacancy3");      
	String programme_name3=request.getParameter("programme_name3");
	String department_name3=request.getParameter("department_name3");
	String ctc3=request.getParameter("ctc3");
	String package_name4=request.getParameter("package_name4");
 	String vacancy4=request.getParameter("vacancy4");      
	String programme_name4=request.getParameter("programme_name4");
	String department_name4=request.getParameter("department_name4");
	String ctc4=request.getParameter("ctc4");
	String package_name5=request.getParameter("package_name5");
 	String vacancy5=request.getParameter("vacancy5");      
	String programme_name5=request.getParameter("programme_name5");
	String department_name5=request.getParameter("department_name5");
	String ctc5=request.getParameter("ctc5");
	String duplicate=null ;
    
	
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
		

			
			String sql_get_data1="select department_id from department_record where department_name='"+department_name1+"';" ;
			db.connect(); 
			ResultSet rstdn1= db.execSQL(sql_get_data1);
			if(rstdn1.next()) 
			{
				department_id1=rstdn1.getInt(1);
			}
			rstdn1.close();
			db.close();
			
			
			sql_get_data1="select programme_id from programme_record where programme_name='"+programme_name1+"';" ;
			db.connect(); 
			ResultSet rstd1= db.execSQL(sql_get_data1);
			if(rstd1.next()) 
			{
				programme_id1=rstd1.getInt(1);
			}
			rstd1.close();
			db.close();

			
			String main_record1=" insert into package_details (package_name, department_id, programme_id, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name1+"','"+department_id1+"','"+programme_id1+"','"+vacancy1+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc1+");";
			
			
			db.connect();
			int num_rows1=db.updateSQL(main_record1);
			db.close();   
			
			String sql_get_data2="select department_id from department_record where department_name='"+department_name2+"';" ;
			db.connect(); 
			ResultSet rstdn2= db.execSQL(sql_get_data2);
			if(rstdn2.next()) 
			{
				department_id2=rstdn2.getInt(1);
			}
			rstdn2.close();
			db.close();
			
			
			sql_get_data2="select programme_id from programme_record where programme_name='"+programme_name2+"';" ;
			db.connect(); 
			ResultSet rstd2= db.execSQL(sql_get_data2);
			if(rstd2.next()) 
			{
				programme_id2=rstd2.getInt(1);
			}
			rstd2.close();
			db.close();

			
			String main_record2=" insert into package_details (package_name, department_id, programme_id, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name2+"','"+department_id2+"','"+programme_id2+"','"+vacancy2+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc2+");";
			
			
			db.connect();
			int num_rows2=db.updateSQL(main_record2);
			db.close();
			
			String sql_get_data3="select department_id from department_record where department_name='"+department_name3+"';" ;
			db.connect(); 
			ResultSet rstdn3= db.execSQL(sql_get_data3);
			if(rstdn3.next()) 
			{
				department_id3=rstdn3.getInt(1);
			}
			rstdn3.close();
			db.close();
			
			
			sql_get_data3="select programme_id from programme_record where programme_name='"+programme_name3+"';" ;
			db.connect(); 
			ResultSet rstd3= db.execSQL(sql_get_data3);
			if(rstd3.next()) 
			{
				programme_id3=rstd3.getInt(1);
			}
			rstd3.close();
			db.close();

			
			String main_record3=" insert into package_details (package_name, department_id, programme_id, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name3+"','"+department_id3+"','"+programme_id3+"','"+vacancy3+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc3+");";
			
			
			db.connect();
			int num_rows3=db.updateSQL(main_record3);
			db.close();
			
			String sql_get_data4="select department_id from department_record where department_name='"+department_name4+"';" ;
			db.connect(); 
			ResultSet rstdn4= db.execSQL(sql_get_data4);
			if(rstdn4.next()) 
			{
				department_id4=rstdn4.getInt(1);
			}
			rstdn4.close();
			db.close();
			
			
			sql_get_data4="select programme_id from programme_record where programme_name='"+programme_name4+"';" ;
			db.connect(); 
			ResultSet rstd4= db.execSQL(sql_get_data4);
			if(rstd4.next()) 
			{
				programme_id4=rstd4.getInt(1);
			}
			rstd4.close();
			db.close();

			
			String main_record4=" insert into package_details (package_name, department_id, programme_id, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name4+"','"+department_id4+"','"+programme_id4+"','"+vacancy4+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc4+");";
			
			
			db.connect();
			int num_rows4=db.updateSQL(main_record4);
			db.close();
			
			String sql_get_data5="select department_id from department_record where department_name='"+department_name5+"';" ;
			db.connect(); 
			ResultSet rstdn5= db.execSQL(sql_get_data5);
			if(rstdn5.next()) 
			{
				department_id5=rstdn5.getInt(1);
			}
			rstdn5.close();
			db.close();
			
			
			sql_get_data5="select programme_id from programme_record where programme_name='"+programme_name5+"';" ;
			db.connect(); 
			ResultSet rstd5= db.execSQL(sql_get_data5);
			if(rstd5.next()) 
			{
				programme_id5=rstd5.getInt(1);
			}
			rstd5.close();
			db.close();

			
			String main_record5=" insert into package_details (package_name, department_id, programme_id, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_duration,ctc)"+" values ('"+agency_name+'-'+package_name5+"','"+department_id5+"','"+programme_id5+"','"+vacancy5+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+","+bond_duration+","+ctc5+");";
			
			
			db.connect();
			int num_rows5=db.updateSQL(main_record5);
			db.close();
			

    if(lcd!=null)
	{
		lcd="1";
	}
	else
	{
		lcd="0";
	}
	if(laptop!=null)
	{
		laptop="1";
	}
	else
	{
		laptop="0";
	}
	if(ohp!=null)
	{
		ohp="1";
	}
	else
	{
		ohp="0";
	}				

			String main_record=" update agency set agency_address='"+agency_address+"' ,agency_website='"+agency_website+"' ,agency_phone='"+agency_phone+"' ,agency_mobile='"+agency_mobile+"' ,agency_fax='"+agency_fax+"' ,agency_email='"+agency_email+"' ,agency_person='"+agency_person+"' ,shortlist="+shortlist+" ,ppt="+ppt+" ,gd="+gd+" ,aptitude_test="+aptitude_test+" ,technical_test="+technical_test+" ,interview="+interview+" ,immediate_result_declaration="+immediate_result_declaration+" ,no_of_rounds="+no_of_rounds+" ,no_of_rooms="+no_of_rooms+" ,no_of_executive="+no_of_executive+" ,aptitude_duration="+aptitude_duration+" ,technical_duration="+technical_duration+" ,cpi="+cpi+" ,preferred_date_1='"+sql_convert_date(preferred_date_1)+"' ,preferred_date_2='"+sql_convert_date(preferred_date_2)+"' ,date_of_result='"+sql_convert_date(date_of_result)+"' ,joining_date='"+sql_convert_date(joining_date)+"' ,nature_business='"+nature_business+"' ,lcd="+Integer.parseInt(lcd)+",laptop="+Integer.parseInt(laptop)+",ohp="+Integer.parseInt(ohp)+" where agency_name='"+agency_name+"';";
			
			
			db.connect();
			int num_rows=db.updateSQL(main_record);
			db.close();
			if(num_rows==1 && num_rows1==1 && num_rows2==1 && num_rows3==1 && num_rows4==1 && num_rows5==1)
			{
				response.sendRedirect("success.jsp");
			}
			else
			{
				out.println(main_record);
				out.println(num_rows);//response.sendRedirect("error.jsp");
			}
			
		}

					   

%>
<body background="form/New/jee3.jpg">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
  <a href="#">IITG Home</a> | <a href="#">Placement Cell</a></div> 
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
      <a href="register.jsp">Job Application Form</a>
      <a href="../edit_details/edit.jsp">Edit Job Application Form</a>
      <a href="../vacancies/add_vacancy.jsp">Add More Vacancies</a>
      <a href="../change_final_date/change_date.jsp">Request For Change in Final Date </a>
      <a href="../student_eligibility/eligibility.jsp">Eligible Students</a>
      <a href="../student_details/student_details.jsp">Students Details Query</a>
      <a href="../cv_query/cv_query.jsp">CV Query</a>
      <a href="../calendar/view.jsp">Company Schedule</a>
      <a href="../date_notifications/date.jsp">Final Date</a>
      <a href="../uploads/upload.jsp">Upload Company Literature</a>
      <a href="../change_password/change_password.jsp">Change Password</a>
      <a href="../../logout.jsp">Logout</a>
     <img src="" alt="" width="177" height="298" /></div>
  </div>
  <div id="content">
    <div class="feature">
        <%	if(submit==null)
	{
		String sql_get_data="select * from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet ras= db.execSQL(sql_get_data);
		if(ras.next()) 
		{
				agency_name=ras.getString(2);
				agency_website=ras.getString(4);
				agency_person=ras.getString(24);
				agency_email=ras.getString(25);
				agency_phone=ras.getString(27);
				agency_fax=ras.getString(28);
				agency_mobile=ras.getString(29);
				registration_status=ras.getInt(36);
				
		}
		ras.close();
		db.close();
		
		if(registration_status==1)
		response.sendRedirect("error2.jsp");
	}
	
	%>
 
      <form name="form_company_profile" id="form_company_profile" method="post" onSubmit="return validate_empty(form_company_profile)">
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="640" height="153" border="0" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td >Name of the company </td>
                      <td ><input type="text"  name="agency_name" value="<%=agency_name%>" ></td>
                    </tr>
                    <tr>
                      <td height="10" >Website</td>
                      <td ><input name="agency_website" id ="agency_website" value="<%=agency_website%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="37">Nature of Business</td>
                      <td><input name="nature_business" id="nature_business" type="text"></td>
                    </tr>          
                    <tr>
                      <td height="36" Width="350">Contact Person</td>
                      <td ><input name="agency_person" value = "<%=agency_person%>"type="text"></td>
                    </tr>
                    <tr>
                      <td height="42" >E-Mail  Address </td>
                      <td ><input name="agency_email" value ="<%=agency_email%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="123" >Contact address </td>
                      <td ><textarea name="agency_address" id="agency_address" cols="30" rows="5"></textarea></td>
                    </tr>
                    <tr>
                      <td height="38" > Phone No.</td>
                      <td ><input name="agency_phone" value="<%=agency_phone%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="38" >Mobile No.</td>
                      <td ><input name="agency_mobile" value ="<%=agency_mobile%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="41" >Fax No.</td>
                      <td ><input name="agency_fax" value ="<%=agency_fax%>" type="text"></td>
                    </tr>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Selection Procedure              </h2>
                <p>&nbsp;</p>
                <center>
                  <table width="640" align="center" cellpadding="5" cellspacing="5">
                    
                    <tr>
                      <td width="350">Preferred Date 1 for Recruitment:</td>
                      <td ><a href="javascript:NewCal('preferred_date_1','ddmmyyyy')" >
                        <input readonly type="text" name="preferred_date_1" id="preferred_date_1" >
                        </a>(dd-mm-yyyy)</td>
                      <tr>
                        <td >Preferred Date 2 for Recruitmentt:</td>
                        <td ><a href="javascript:NewCal('preferred_date_2','ddmmyyyy')" >
                          <input readonly type="text" name="preferred_date_2" id="preferred_date_2" >
                          </a> (dd-mm-yyyy)</td>
                      </tr>
                    <tr>
                      <td  >No. of executives </td>
                      <td  ><input type="text" name="no_of_executive" id="no_of_executive"></td>
                      </tr>
                    <tr>
                      <td >Shortlist from Resumes</td>
                      <td ><label>
                        <input name="shortlist" id="shortlist" type="radio" value="1" onClick="activate3(this,'cpi')">
                        </label>
                        Yes
                        <label>
                          <input name="shortlist" id="shortlist" type="radio" value="0" onClick="activate5(this,'cpi')">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td  >Cpi(minimum):</td>
                      <td  ><input type="text" name="cpi" id="cpi" disabled="disabled"></td>
                      </tr>
                    <tr>
                      <td >PPT</td>
                      <td ><label>
                        <input name="ppt" id="ppt" type="radio" value="1" onClick="activate3(this,'checkbox')">
                        </label>
                        Yes
                        <label>
                          <input name="ppt" id="ppt" type="radio" value="0" onClick="activate5(this,'checkbox')">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td ><input type="checkbox" name="checkbox" id="checkbox" disabled="disabled" onClick="activate(this,'checkbox2','checkbox3','checkbox4')"value="1">
                        Equipments (for ppt) </td>
                      <td ><table>
                        <tr>
                          <td><label>
                            <input name="checkbox2" type="checkbox" disabled="disabled" id="checkbox2" value="1">
                            </label>
                            LCD </td>
                          <td><label>
                            <input name="checkbox3" type="checkbox" disabled="disabled" id="checkbox3"  value="1">
                            </label>
                            LAPTOP </td>
                          <td><label>
                            <input name="checkbox4" type="checkbox" disabled="disabled" id="checkbox4"  value="1">
                            </label>
                            OHP </td>
                          </tr>
                        </table></td>
                      </tr>
                    <tr>
                      <td height="27"></td>
                      </tr>
                    <tr>
                      <td >GD</td>
                      <td ><label>
                        <input name="gd" id="gd" type="radio" value="1">
                        </label>
                        Yes
                        <label>
                          <input name="gd" id="gd" type="radio" value="0">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Aptitude test </td>
                      <td ><label>
                        <input name="aptitude_test" id="aptitude_test" type="radio" value="1" onClick="activate3(this,'aptitude_duration')">
                        </label>
                        Yes
                        <label>
                          <input name="aptitude_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'aptitude_duration')">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Aptitude duration (in minutes)</td>
                      <td><input type="text" name="aptitude_duration" size="10" id="aptitude_duration" disabled="disabled"></td>
                      </tr>
                    <tr>
                      <td >Technical Test </td>
                      <td ><label>
                        <input name="technical_test" id="technical_test" type="radio" value="1" onClick="activate3(this,'technical_duration')">
                        </label>
                        Yes
                        <label>
                          <input name="technical_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'technical_duration')">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Technical duration (in minutes)</td>
                      <td><input type="text" name="technical_duration" size="10" id="technical_duration" disabled="disabled"></td>
                      </tr>
                    <tr>
                      <td >Interview</td>
                      <td ><label>
                        <input name="interview" id="interview" type="radio" value="1">
                        </label>
                        Yes
                        <label>
                          <input name="interview" id="interview" type="radio" value="0">
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td  >No. of rounds </td>
                      <td  ><input type="text" name="no_of_rounds" id="no_of_rounds"></td>
                      </tr>
                    <tr>
                      <td  >No. of rooms </td>
                      <td  ><input type"text" name="no_of_rooms" id="no_of_rooms"></td>
                      </tr>
                    <tr>
                      <td >Immediate result declaration </td>
                      <td ><label>
                        <input name="immediate_result_declaration" id="immediate_result_declaration" type="radio" value="1"  >
                        </label>
                        Yes
                        <label>
                          <input name="immediate_result_declaration" id="immediate_result_declaration" type="radio" value="0" >
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Date of result:</td>
                      <td ><a href="javascript:NewCal('date_of_result','ddmmyyyy')" >
                        <input readonly type="text" name="date_of_result" id="date_of_result" >
                        </a> (dd-mm-yyyy)</td>
                      </tr>
                    <tr>
                      <td >Joining Date:</td>
                      <td ><a href="javascript:NewCal('joining_date','ddmmyyyy')" >
                        <input readonly  type="text" name="joining_date" id="joining_date">
                        </a> (dd-mm-yyyy)</td>
                      </tr>
                    </table>
                </center>
              </div>
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
                          <input name="accomodation" id="accomodation" type="radio" value="0">
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
                          <input name="bond" id="bond" type="radio" value="0" onClick="activate5(this,'bond_duration')">
                        </label>
                        NO</td>
                    </tr>
                    <tr>
                      <td height="32" >Bond duration </td>
                      <td><input type="text" name="bond_duration" size="10" id="bond_duration" disabled="disabled">
                        (in months)</td>
                        </tr>
                  </table>
                <p><strong>Package I :</strong> </p>
                <table width="640" height="184" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="350" height="24" >Package Name</td>
                    <td ><input name="package_name1" id ="package_name1" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32">Department</td>
            <td><select name="department_name1" id="department_name1">
              <%!String department_list1;%>
              <% department_list1=drop_down("select department_name from department_record;",db); %>
              <option value="0">-----------------------select----------------------</option>
              <%=department_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">Select individual program</td>
            <td><select name="programme_name1" id="programme_name1" >
              <%!String program_list1;%>
              <% String program_list1=drop_down("select programme_name from programme_record;",db); %>
              <option value="0">-------------select--------------------</option>
              <%=program_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><input name="vacancy1" id="vacancy1" type="text"></td>
                  <tr>
                    <td height="32">CTC :</td>
                    <td><input name="ctc1" id="ctc1" type="text">
                      ( Lacs p.a.)</td>
                  </tr>
                </table>
                <p><strong>Package II :</strong></p>
                <table width="640" height="192" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="350" height="24" >Package Name</td>
                    <td ><input name="package_name2" id ="package_name2" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32">Department</td>
            <td><select name="department_name2" id="department_name2">
              <% department_list1=drop_down("select department_name from department_record;",db); %>
              <option value="0">-----------------------select----------------------</option>
              <%=department_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">Select individual program</td>
            <td><select name="programme_name2" id="programme_name2" >
              <% program_list1=drop_down("select programme_name from programme_record;",db); %>
              <option value="0">-------------select--------------------</option>
              <%=program_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><input name="vacancy2" id="vacancy2" type="text"></td>
                  <tr>
                    <td height="32">CTC :</td>
                    <td><input name="ctc2" id="ctc2" type="text">
                      ( Lacs p.a.)</td>
                  </tr>
                </table>
                <p><strong>Package III :</strong></p>
                <table width="640" height="195" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="307" height="24" >Package Name</td>
                    <td width="296" ><input name="package_name3" id ="package_name3" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32">Department</td>
            <td><select name="department_name3" id="department_name3">
              <% department_list1=drop_down("select department_name from department_record;",db); %>
              <option value="0">-----------------------select----------------------</option>
              <%=department_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">Select individual program</td>
             <td><select name="programme_name3" id="programme_name3" >
              <% program_list1=drop_down("select programme_name from programme_record;",db); %>
              <option value="0">-------------select--------------------</option>
              <%=program_list1%>
            </select></td>
                  </tr>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><input name="vacancy3" id="vacancy3" type="text"></td>
                  <tr>
                    <td height="32">CTC :</td>
                    <td><input name="ctc3" id="ctc3" type="text">
                      ( Lacs p.a.)</td>
                  </tr>
                  <tr></tr>
                </table>
                <p><strong>Package IV:</strong></p>
                <table width="660" height="204" align="center" cellpadding="5" cellspacing="5">
               
                     <tr>
                      <td width="307" height="24" >Package Name</td>
                      <td width="296" ><input name="package_name4" id ="package_name4" type="text"></td>
                    </tr>
                    <tr>
                      <td height="32">Department</td>
            <td><select name="department_name4" id="department_name4">
              <% department_list1=drop_down("select department_name from department_record;",db); %>
              <option value="0">-----------------------select----------------------</option>
              <%=department_list1%>
            </select></td>
                    </tr>
                    <tr>
                      <td height="32">Select individual program</td>
            <td><select name="programme_name4" id="programme_name4" >
              <% program_list1=drop_down("select programme_name from programme_record;",db); %>
              <option value="0">-------------select--------------------</option>
              <%=program_list1%>
            </select></td>
                    </tr>
                    <tr>
                      <td height="32">No. of vacancy :</td>
                      <td><input name="vacancy4" id="vacancy4" type="text"></td>
                    <tr>
                      <td height="32">CTC :</td>
                      <td><input name="ctc4" id="ctc4" type="text">
                        (  Lacs p.a.)</td>
                  </tr>

                  </table>
                <p>&nbsp;</p>
                <p><strong>Package V:</strong></p>
                <table width="640" height="195" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="307" height="24" >Package Name</td>
                    <td width="296" ><input name="package_name5" id ="package_name5" type="text"></td>
                  </tr>
                  <tr>
                    <td height="32">Department</td>
                    <td><select name="department_name5" id="department_name5">
                      <% department_list1=drop_down("select department_name from department_record;",db); %>
                      <option value="0">-----------------------select----------------------</option>
                      <%=department_list1%>
                    </select></td>
                  </tr>
                  <tr>
                    <td height="32">Select individual program</td>
                    <td><select name="programme_name5" id="programme_name5" >
                      <% program_list1=drop_down("select programme_name from programme_record;",db); %>
                      <option value="0">-------------select--------------------</option>
                      <%=program_list1%>
                    </select></td>
                  </tr>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><input name="vacancy5" id="vacancy5" type="text"></td>
                  <tr>
                    <td height="32">CTC :</td>
                    <td><input name="ctc5" id="ctc5" type="text">
                      (  Lacs p.a.)</td>
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
  <div id="siteInfo"></div>
</div>
</body>

</html>

