<html>
<head>
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Student Registration Form</title>

<script type="text/javascript">
function disable()
{
      document.getElementById("print_f").value="tt";
}
<!--
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


function is_float(str)
{
	//alert("in float");
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
	if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(new_key==".")
		{
			j++;
		}
		else if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
		if(j>1)
		{
			return false;
		}
	}
	return true;
}

function is_int(str)
{
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
		if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
	}
	return true;
}

function alltrim(str)
{
	var str1="";
	str1=str.replace(/'/g,"`");
	return str1.replace(/^\s+|"|\s+$/g, '');
}

function findall()
{
	var i=0;
    for(i = 0; i < form2.elements.length; i++)
    {
        form2.elements[i].value=alltrim(form2.elements[i].value);
    }
}



function validate_empty()
{	
 var message="";
 
findall();
  	if(document.form2.dob.value=="")
  message+="Please enter the Date of Birth \n"; 
 
	if(document.form2.category.value=="")
  message+="Please select category\n" ;
  
  	if(document.form2.hostel.value=="")
  message+="Please enter Hostel Name\n" ;

        if(document.form2.nationality.value=="")
  message+="Please enter Nationality\n" ;
 
	if(document.form2.rank.value=="")
  message+="Please enter Your Rank \n" ;

	if(document.form2.room.value=="")
 	message+="Please enter Room No \n" ;

	if(document.form2.sem1.value=="" || !(is_float(document.form2.sem1.value)))
  message+="Please enter a valid number 1st sem spi \n";

	if(document.form2.sem2.value==""  || !(is_float(document.form2.sem2.value)))
  message+="lease enter a valid number 2nd sem spi \n";

	if(document.form2.sem3.value==""  || !(is_float(document.form2.sem3.value)))
  message+="lease enter a valid number 3rd sem spi \n";

	if(document.form2.sem4.value==""  || !(is_float(document.form2.sem4.value)))
  message+="lease enter a valid number 4th sem spi \n";

	if(document.form2.sem5.value=="" || !(is_float(document.form2.sem5.value)))
  message+="lease enter a valid number 5th sem spi \n";

	if(document.form2.sem6.value=="" || !(is_float(document.form2.sem6.value)))
  message+="Please enter a valid number 6th sem spi \n";

	//if(document.form2.sem7.value=="" || !(is_float(document.form2.sem1.value))

 /* if(!(is_float(document.form2.sem1.value)) ){message+="Please enter a valid number in SPI 1 sem\n";}
  if(!(is_float(document.form2.sem2.value)) ){message+="Please enter a valid number in SPI 2 sem\n";}
  if(!(is_float(document.form2.sem3.value)) ){message+="Please enter a valid number in SPI 3 sem\n";}
  if(!(is_float(document.form2.sem4.value)) ){message+="Please enter a valid number in SPI 4 sem\n";}
  if(!(is_float(document.form2.sem5.value)) ){message+="Please enter a valid number in SPI 5 sem\n";}
  if(!(is_float(document.form2.sem5.value)) ){message+="Please enter a valid number in SPI 6 sem\n";}
  if(!(is_float(document.form2.sem7.value)) ){message+="Please enter a valid number in SPI 7 sem\n";}*/

  
  	if(document.form2.email2.value=="")
  message+="Please enter the Alternative Email ID \n"; 
  
  	if(document.form2.address.value=="")
  message+="Please enter Address \n"; 

  	if(!is_int(document.form2.pin.value))
  message+="Please enter Pin \n"; 

  	if(document.form2.telephone.value=="")
  message+="Please enter Telephone Number \n"; 

if(document.form2.mobile1.value=="")
  message+="Please enter Contact Telephone/Mobile No. \n"; 

  	if(document.form2.x_board.value=="")
  message+="Please enter the X Board \n"; 
  
  	if(document.form2.x_medium.value=="")
  message+="Please enter the X Medium \n"; 
  
  	if(document.form2.x_marks.value=="")
  message+="Please enter the X Marks \n"; 
  
  	if(document.form2.x_div.value=="")
  message+="Please enter the X Division \n"; 
  
  	if(document.form2.x_year.value=="")
  message+="Please enter the X Percentage \n"; 

  
  	if(document.form2.xii_board.value=="")
  message+="Please enter the XII Board \n"; 
  
  	if(document.form2.xii_medium.value=="")
  message+="Please enter the XII Medium \n"; 
  
  	if(document.form2.xii_div.value=="")
  message+="Please enter the XII Division \n"; 
  
  	if(document.form2.xii_marks.value=="")
  message+="Please enter the XII Percentage \n"; 
  
  	if(document.form2.xii_year.value=="")
  message+="Please enter the XII Year\n";
 
	if(document.form2.gap[0].checked)
  {
	  if(document.form2.gap_reason.value=="")message+="Please enter Gap in Study Reason\n";
	  if(document.form2.gap_duration.value=="")message+="Please enter Gap in Study Duration\n";
  }


	if(document.form2.backlog[0].checked)
  {
	   if(document.form2.backlog_courses.value=="")message+="Please enter details of backlog courses\n";	 
  }

/*	
  
	if(document.form2.gap[0].checked==true)
  {document.form2.gap_reason.value="none";document.form2.gap_duration.value="0";}
  
  if(document.form2.backlog.checked==true)
  {
	  if(document.form2.backlog_corses.value=="")message+="Please enter details of backlog courses\n";
  }
  else{document.form2.backlog_courses.value="none";}*/
  
  if(document.form2.comp_1.value==""){document.form2.comp_1.value="none";}
  if(document.form2.comp_2.value==""){document.form2.comp_2.value="none";}
  if(document.form2.comp_3.value==""){document.form2.comp_3.value="none";}
  if(document.form2.comp_4.value==""){document.form2.comp_4.value="none";}
  if(document.form2.comp_5.value==""){document.form2.comp_5.value="none";}

  if(!(is_int(document.form2.IT.value)==true) ){message+="Please enter a valid number for IT\n";}
  if(!(is_int(document.form2.core.value)==true)){message+="Please enter a valid number for Core\n";}
  if(!(is_int(document.form2.govt.value)==true)){message+="Please enter a valid number for Govt\n";}
  if(!(is_int(document.form2.management.value)==true)){message+="Please enter a valid number for Management\n";}
  if(!(is_int(document.form2.fin_and_banking_sector.value)==true)){message+="Please enter a valid number for Fin & Banking\n";}

  if(document.form2.dream_company.value==""){document.form2.dream_company.value="none";}

  if (message!="")
 {
	document.form2.action=null;
    alert(message);
	return false;
 } 
 else
 {
	var test = document.getElementById("print_f");
		
	     if(test.checked)
		{
			//alert(test);
			var con = confirm("After final submission you will not be able to modify your profile.Please take a back to back print out after pressing ok button or you may ignore by pressing cancel button ");
			if (con ==true)
			{
			
			      document.form2.action="edit_b.jsp";
			      return true;

			}
			else
			{
			   document.form2.action=null;
			   return false;
			}
			
		}
	      else
		{
			document.form2.action="edit_b.jsp";
			return true;

		}
 }

}
//-->

function updatePPO(ppo)
{
        if(ppo.checked)
        {

             document.getElementById("comp_1").disabled = true;
             document.getElementById("comp_2").disabled = true;
             document.getElementById("comp_3").disabled = true;
             document.getElementById("comp_4").disabled = true;
             document.getElementById("comp_5").disabled = true; 
             document.getElementById("comp_1").value="";
             document.getElementById("comp_2").value="";               
             document.getElementById("comp_3").value=""; 
             document.getElementById("comp_4").value=""; 
             document.getElementById("comp_5").value=""; 
        }             
        else             
        {
             document.getElementById("comp_1").disabled = false;
             document.getElementById("comp_2").disabled = false;
             document.getElementById("comp_3").disabled = false;
             document.getElementById("comp_4").disabled = false;
             document.getElementById("comp_5").disabled = false;  

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
<%@ include file="/student/sessionvalidate.jsp"%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%
	db.fetchConfigDetails();
	String username="";
	int program_id=0;
	String sql_username="select username from session where session_id = '"+sid+"';" ;
	db.connect();
	ResultSet rus= db.execSQL(sql_username);
	if(rus.next())
	{
		username = rus.getString(1);
	}
	rus.close();
	db.close();
	String student_roll_number="";
	String stdid="";
	String sql_student_roll_number="select student_roll_number,is_activated,student_id from student_record where username='"+username+"';";
	db.connect();
	int is_activated=0;
	ResultSet rs1= db.execSQL(sql_student_roll_number);
	if(rs1.next())
	{
		student_roll_number = ""+rs1.getInt(1);
		is_activated=rs1.getInt(2);
		stdid= ""+rs1.getInt(3);
		
	}
	rs1.close();
	db.close();
	if(is_activated==0)
		response.sendRedirect("edit_error.jsp");
	
	//String student_roll_number=request.getParameter("student_roll_number");
	int student_id=0;
	String department_id="0";
	String programme_id="0";
	String print_f="";
        String minor_program_name="";        
	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String submit=request.getParameter("submit");
		print_f=request.getParameter("print_f");
        String name=request.getParameter("student_name");
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex"); 
        String category=request.getParameter("category");
        String dept_name=request.getParameter("department_name");
        String prog_name=request.getParameter("program_name");
        String jee_rank=request.getParameter("rank");

        String prep=request.getParameter("prep");
        if(prep==null)
	{
         prep="0";
        }
        String hostel=request.getParameter("hostel");
        String nationality=request.getParameter("nationality");
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
        String x_marks=request.getParameter("x_marks");
        String x_year=request.getParameter("x_year");
        String xii_board=request.getParameter("xii_board");
        String xii_medium=request.getParameter("xii_medium");
        String xii_marks=request.getParameter("xii_marks");
        String xii_year=request.getParameter("xii_year");
        String gap=request.getParameter("gap");
        String gap_reason=request.getParameter("gap_reason");
        String cpi=request.getParameter("cpi");
        String backlog=request.getParameter("backlog");
        String sem1=request.getParameter("sem1");
        String sem2=request.getParameter("sem2");
        String sem3=request.getParameter("sem3");
        String sem4=request.getParameter("sem4");
        String sem5=request.getParameter("sem5");
        String sem6=request.getParameter("sem6");
        String sem7=request.getParameter("sem7");
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
		String address2=request.getParameter("address2");
		String address3=request.getParameter("address3");
		
	if(submit!=null && print_f==null && student_roll_number!=null&& jee_rank!=null&&dob!=null&&hostel!=null&&room_no!=null&&email1!=null&&email2!=null&&mobile1!=null&&address!=null&&pin!=null&&telephone!=null&&x_board!=null&&xii_board!=null&&x_medium!=null&&xii_medium!=null&&x_div!=null&&xii_div!=null&&x_marks!=null&&xii_marks!=null&&x_year!=null&&xii_year!=null&&gap!=null&&sem1!=null&&sem2!=null&&sem3!=null&&sem4!=null&&sem5!=null&&sem6!=null&&backlog!=null)
	{  	
		String main_record1=" update student_record set jee_rank='"+jee_rank+"'";
		if(gap.equals("1"))
		{
			if(gap_reason==null||gap_duration==null)
				response.sendRedirect("error.jsp?error=gap");
			else
				main_record1=main_record1+",gap_in_study='1',gap_reason='"+gap_reason+"',gap_duration='"+gap_duration+"'";
		}
		else
			main_record1=main_record1+",gap_in_study='0',gap_reason=' ',gap_duration=' '";
		if(backlog.equals("1"))
		{
			if(backlog_courses==null)
				main_record1=main_record1+",backlog='1',backlog_courses=' '";
			else
				main_record1=main_record1+",backlog='1',backlog_courses='"+backlog_courses+"'";
		}
		else
			main_record1=main_record1+",backlog='0',backlog_courses='NA'";
		if(sem7!=null)
			main_record1=main_record1+",spi_7sem='"+sem7+"'";
		else
			main_record1=main_record1+",spi_7sem='0'";
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
		
                main_record1=main_record1+",nationality='"+nationality+"'";	       
                main_record1=main_record1+",isPrep='"+prep+"'";
	
		main_record1=main_record1+" ,address2='"+address2+"',address3='"+address3+"', date_of_birth='"+sql_convert_date(dob)+"', sex="+sex+" ,category='"+category+"' , hostel='"+hostel+"' ,room_no='"+room_no+"', email='"+email1+"' , email_alternative='"+email2+"',contact_number='"+mobile1+"', permanent_address='"+address+"', pin='"+pin+"' ,  x_board='"+x_board+"',x_medium='"+x_medium+"', x_percentage='"+x_marks+"' ,x_pass_year='"+x_year+"' ,xii_board='"+xii_board+"' ,xii_medium='"+xii_medium+"' ,xii_percentage='"+xii_marks+"' ,xii_pass_year='"+xii_year+"' ,spi_1sem="+sem1+" ,spi_2sem="+sem2+",spi_3sem="+sem3+" ,spi_4sem="+sem4+" ,spi_5sem="+sem5+" ,spi_6sem="+sem6+" ,x_div='"+x_div+"',xii_div='"+xii_div+"',is_registered=1  where student_roll_number='"+student_roll_number+"';";
		
	


		db.connect();
		int num_rows1=db.updateSQL(main_record1);
		
		
		db.close();	
		if(num_rows1!=0)
				response.sendRedirect("success1.jsp");
		else
				response.sendRedirect("error.jsp?error=update_fail");
				//out.println(""+num_rows1);
			
     }
  if(print_f!=null && submit!=null && student_roll_number!=null&& jee_rank!=null&&dob!=null&&hostel!=null&&room_no!=null&&email1!=null&&email2!=null&&mobile1!=null&&address!=null&&pin!=null&&telephone!=null&&x_board!=null&&xii_board!=null&&x_medium!=null&&xii_medium!=null&&x_div!=null&&xii_div!=null&&x_marks!=null&&xii_marks!=null&&x_year!=null&&xii_year!=null&&gap!=null&&sem1!=null&&sem2!=null&&sem3!=null&&sem4!=null&&sem5!=null&&sem6!=null&&backlog!=null)
	{  	
		String main_record1=" update student_record set jee_rank='"+jee_rank+"'";
		if(gap.equals("1"))
		{
			if(gap_reason==null||gap_duration==null)
				response.sendRedirect("error.jsp?error=gap");
			else
				main_record1=main_record1+",gap_in_study='1',gap_reason='"+gap_reason+"',gap_duration='"+gap_duration+"'";
		}
		else
			main_record1=main_record1+",gap_in_study='0',gap_reason=' ',gap_duration=' '";
		if(backlog.equals("1"))
		{
			if(backlog_courses==null)
				main_record1=main_record1+",backlog='1',backlog_courses=' '";
			else
				main_record1=main_record1+",backlog='1',backlog_courses='"+backlog_courses+"'";
		}
		else
			main_record1=main_record1+",backlog='0',backlog_courses='NA'";
		if(sem7!=null)
			main_record1=main_record1+",spi_7sem='"+sem7+"'";
		else
			main_record1=main_record1+",spi_7sem='0'";
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
	
                main_record1=main_record1+",nationality='"+nationality+"'";	
                main_record1=main_record1+",isPrep='"+prep+"'"; 
		
		main_record1=main_record1+" ,address2='"+address2+"',address3='"+address3+"', date_of_birth='"+sql_convert_date(dob)+"', sex="+sex+" ,category='"+category+"' , hostel='"+hostel+"' ,room_no='"+room_no+"', email='"+email1+"' , email_alternative='"+email2+"',contact_number='"+mobile1+"', permanent_address='"+address+"', pin='"+pin+"' ,  x_board='"+x_board+"',x_medium='"+x_medium+"', x_percentage='"+x_marks+"' ,x_pass_year='"+x_year+"' ,xii_board='"+xii_board+"' ,xii_medium='"+xii_medium+"' ,xii_percentage='"+xii_marks+"' ,xii_pass_year='"+xii_year+"' ,spi_1sem="+sem1+" ,spi_2sem="+sem2+",spi_3sem="+sem3+" ,spi_4sem="+sem4+" ,spi_5sem="+sem5+" ,spi_6sem="+sem6+" ,x_div='"+x_div+"',xii_div='"+xii_div+"',is_registered=1  where student_roll_number='"+student_roll_number+"';";
		
	


		db.connect();
		int num_rows1=db.updateSQL(main_record1);
		
		
		db.close();	
		if(num_rows1!=0)
				response.sendRedirect("bth.jsp");
		else
				response.sendRedirect("error.jsp?error=update_fail");
				//out.println(""+num_rows1);
			
     }
     

	//if(submit!=null)
	//	response.sendRedirect("error2.jsp");
%>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<style type="text/css">
.aa {
	text-align: right;
}
.ab {
	text-align: left;
}
.cen {
	text-align: center;
}
.red {
	color: #F00;
}
.red {
	color: #F00;
}
</style>
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css">
</head>
<body background="/images/main_background.jpg">


    <div class="feature">
     <%	
	    session.setAttribute("rollno",student_roll_number);
	    session.setAttribute("uid",username);
	    session.setAttribute("stdid",stdid);

	  

	if(submit==null)
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
                        prep = rs.getString("isPrep");
        	hostel=rs.getString("hostel");
                nationality=rs.getString("nationality"); 
       		room_no=rs.getString("room_no");
			email1=rs.getString("email");
		email2=rs.getString("email_alternative");
        	mobile1=rs.getString("contact_number");
       		mobile2=rs.getString("contact_number2");
       		address=rs.getString("permanent_address");
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
        	gap=rs.getString("gap_in_study");
			if(gap==null)gap="0";
			gap_reason=rs.getString("gap_reason");
        	cpi=rs.getString("cpi_6sem");
        	backlog=rs.getString("backlog");
        	sem1=rs.getString("spi_1sem");
        	sem2=rs.getString("spi_2sem");
        	sem3=rs.getString("spi_3sem");
        	sem4=rs.getString("spi_4sem");
        	sem5=rs.getString("spi_5sem");
        	sem6=rs.getString("spi_6sem");
        	sem7=rs.getString("spi_7sem");

        	if(sem1.equals("0"))   {sem1="";}
        	if(sem2.equals("0"))   sem2="";
        	if(sem3.equals("0"))   sem3="";
        	if(sem4.equals("0"))   sem4="";
        	if(sem5.equals("0"))   sem5="";
        	if(sem6.equals("0"))   sem6="";
        	if(sem7.equals("0"))   sem7="";
        	if(pin.equals("0"))   pin="";
        	if(jee_rank.equals("0"))  jee_rank="";
        	if(x_marks.equals("0"))   x_marks="";
        	if(xii_marks.equals("0"))   xii_marks="";
        	
		programme_id=""+rs.getString("programme_id");
		department_id=""+rs.getString("department_id");
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
			address2=rs.getString("address2");
			address3=rs.getString("address3");
			program_id=rs.getInt("program_id");
			
			
		}
		rs.close();
		if(program_id!=0)
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
                
                ResultSet rs22 = db.execSQL("select minor_program_name from student_minor_details where student_roll_number="+student_roll_number+";");
		if(rs22.next())
			minor_program_name=rs22.getString(1);
		rs22.close();

		db.close();
		
	}

%>

      <form name="form2" id="form2" method="post" onSubmit="return validate_empty();" >
        <table width="100%" align="center">
          <tr>
            <td bgcolor="#FFFFFF">
                <h2 align="center">General Info </h2>
                <center>
                  <table width="80%" border="1" align="center" cellpadding="5" cellspacing="5" style="border:groove">
                    <tr>
                      <td width="40%" class="aa">Student roll number</td>
                      <td width="60%" class="ab"><%=student_roll_number%></td>
                    </tr>
                    <tr>
                      <td class="aa">Name(Capital Letter)</td>
                      <td class="ab"><%=name%></td>
                    </tr>
                    <tr>
                      <td class="aa">*Date of Birth</td>
                      <td class="ab">
                        <input readonly type="text" name="dob" id="dob" onClick="displayCalendar(document.forms[0].dob,'dd-mm-yyyy',this)" value="<%=sql_convert_date(dob)%>" >
		      </td>
                    </tr>
                    <tr>
                      <td class="aa">*Sex</td>
                      <td class="ab"><input name="sex" type="radio" id="sex" value="1" checked <% if(sex.equals("1")){out.println("checked");} %>>
                        Male
                        <input type="radio" name="sex" id="sex" value="0" <% if(sex.equals("0")){out.println("checked");} %>>
                        Female</td>
                    </tr> <tr>
                      <td class="aa">*Category<br><span style="font-size:10px">(SC/ST/OBC/GEN/PH/Foreign)</span></td>
                      <td class="ab"><label for="category"></label>
                        <select name="category" id="category">
                          <option value="GEN" <% if(category.equals("GEN"))out.println("selected"); %> >GEN</option>
                          <option value="SC" <% if(category.equals("SC"))out.println("selected"); %> >SC</option>
                          <option value="ST" <% if(category.equals("ST"))out.println("selected"); %> >ST</option>
                          <option value="OBC" <% if(category.equals("OBC"))out.println("selected"); %> >OBC</option>
                          <option value="PH" <% if(category.equals("PH"))out.println("selected"); %> >PH</option>
			  <option value="FOREIGN STUDENT" <% if(category.equals("FOREIGN STUDENT"))out.println("selected"); %>>FOREIGN STUDENT</option>
                        </select></td>
                    </tr>                     
                    <tr>
                      <td class="aa">*Nationality</td>
                      <td class="ab"><span id="sprytextfield1">
                        <input type="text" name="nationality" value="<%=nationality%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    </tr>
                    <tr>
                      <td class="aa">Programme</td>
                      <td class="ab"><%=program_name%></td>
                    </tr>
                    <tr>
                      <td class="aa">Minor Programme</td>
                      <td class="ab"><%=minor_program_name%></td>
                    </tr>

                    <tr>
                      <td class="aa">*JEE Rank(AIR)</td>
                      <td class="ab"><span id="sprytextfield2">
                        <input type="text" name="rank" value="<%=jee_rank%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span>&nbsp;&nbsp;&nbsp;&nbsp;<label>Preparatory?<input type="checkbox" id="prep" name="prep" value="1" <%if(prep.equals("1")) out.println("checked");%>></label></td>
                    </tr>
                    <tr>
                      <td class="aa">*Hostel</td>
                      <td class="ab"><span id="spryselect1">
                      <label for="hostel"></label>
                      <select name="hostel" id="hostel" value="<%=hostel%>">
                        <option value="barak">Barak</option>
                        <option value="brahmaputra">Brahmaputra</option>
                        <option value="dibang" selected>Dibang</option>
                        <option value="dihing">Dihing</option>
                        <option value="kameng">Kameng</option>
                        <option value="Kapili">Kapili</option>
                        <option value="siang">Siang</option>
                        <option value="subansiri">Subansiri</option>
                        <option value="umiam">Umiam</option>
                        <option value="ngh">New Girls Hostel</option>
                      </select>
                      <span class="selectRequiredMsg">Please select an item.</span></span></td>
                    </tr>
                      <tr>
                      <td class="aa">*Room No.</td>
                      <td class="ab"><span id="sprytextfield4">
                      <input type="text" name="room" value="<%=room_no%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span></span></td>
                    </tr>
                    <tr>
                      <td class="aa">*Email</td>
                      <td class="ab"><span id="sprytextfield5">
                      <input type="text" name="email1" value="<%=username%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span>
                        (iitg e-mail)</td>
                    </tr>
                    <tr>
                      <td class="aa"></td>
                      <td class="ab"><span id="sprytextfield6">
                      <input type="text" name="email2" value="<%=email2%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span>
                        (alternative e-mail)</td>
                    </tr>
                    <tr>
                      <td class="aa">*Contact Telephone/Mobile No.</td>
                      <td class="ab"><span id="sprytextfield7">
                      <input type="text" name="mobile1" value="<%=mobile1%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
                    </tr>
                    <tr>
                      <td class="aa">Alternate Telephone/Mobile No.</td>
                      <td class="ab"><input type="text" name="mobile2" value="<%=mobile2%>"></td>
                    </tr>
                    <tr>
                      <td height="50" class="aa">*Permanent Address</td>
                      <td class="ab">Line 1:<span id="sprytextfield8">
                        <input name="address" type="text" value="<%=address%>" size="60" maxlength="100">
                        <span class="textfieldRequiredMsg">A value is required.</span></span><br/>
                      Line 2:<input name="address2" type="text" value="<%=address2%>" size="60" maxlength="100"><br/>
                      Line 3:<input name="address3" type="text" value="<%=address3%>" size="60" maxlength="100"></td>
                    </tr>
                    <tr>
                      <td class="aa">*Pin</td>
                      <td class="ab"><span id="sprytextfield9">
                      <input type="text" name="pin" value="<%=pin%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span></span></td>
                    </tr>
                    <tr>
                      <td class="aa">*Home Telephone No.(with code)</td>
                      <td class="ab"><span id="sprytextfield10">
                      <input type="text" name="telephone" value="<%=telephone%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                    </tr>
                  </table>
                </center>
                <h2 class="cen">Academic Details</h2>
               
                <h3 width="80%" align="center">X-XII<sup>th</sup></h3>
                <table width="80%" border="1" align="center" style="border:groove">
                 <tr>
                    <td width="20%">Level</td>
                    <td width="20%">Board/Institution</td>
                    <td width="20%">Medium</td>
                    <td width="20%">Class/Division</td>
                    <td width="20%">% of Marks</td>
                    <td width="20%">Year of Passing</td>
                  </tr>
                  <tr>
                    <td>*X STD</td>
                    <td><span id="sprytextfield11">
                      <input name="x_board" type="text" value="<%=x_board%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield12">
                      <input name="x_medium" type="text" value="<%=x_medium%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><label for="x_div"></label>
                      <span id="sprytextfield13">
                      <input type="text" name="x_div" id="x_div" value="<%=x_div%>">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield14">
                    <input type="text" name="x_marks" value="<%=x_marks%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                    <td><span id="sprytextfield15">
                    <input type="text" name="x_year" value="<%=x_year%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldMinCharsMsg">Minimum number of characters not met.</span><span class="textfieldMaxCharsMsg">Exceeded maximum number of characters.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                  </tr>
                  <tr>
                    <td>*XII STD/DIP/EQUI</td>
                    <td><span id="sprytextfield16">
                      <input name="xii_board" type="text" value="<%=xii_board%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield17">
                      <input name="xii_medium" type="text" value="<%=xii_medium%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><label for="xii_div"></label>
                      <span id="sprytextfield18">
                      <input type="text" name="xii_div" id="xii_div" value="<%=xii_div%>">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield19">
                    <input type="text" name="xii_marks" value="<%=xii_marks%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                    <td><span id="sprytextfield20">
                      <input type="text" name="xii_year" value="<%=xii_year%>">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                  </tr>
                  <tr>
                    <td>*Gap in Study</td>
                    <td><input type="radio" name="gap" id="gap" value="1" <% if(gap.equals("1")){out.println("checked");} %>>
                      Yes
                      <input name="gap" type="radio" id="gap" value="0" <% if(gap.equals("0")){out.println("checked");} %>>
                      No</td>
                      <td><p>If Yes, Reason:</p>
                      
                        <label for="gap_reason"></label>
                      </td>
                    <td><input name="gap_reason" type="text" id="gap_reason" value="<%=gap_reason%>" maxlength="200" /></td>
                    <td>Duration:</td>
                    <td><label for="gap_duration"></label>
                      <input type="text" name="gap_duration" id="gap_duration" value="<%=gap_duration%>"/></td>
                  </tr>
                </table>
                <h3 width="80%" align="center">Graduation</h3>
                <center>
                  <table width="80%" align="center" cellpadding="5" cellspacing="5" style="border:groove" border="1">
                    
                    <tr>
                       <td nowrap > <h3 style="font-style:oblique;">SPI in all semesters</h3>
                      </td>
                        
                    </tr>
                    <tr>
                      <td>*1st Sem</td>
                      <td>*2nd Sem</td>
                      <td>*3rd Sem</td>
                      <td>*4th Sem</td>
                      <td>*5th Sem</td>
                      <td>*6th Sem</td>
                    </tr>
                    <tr>
                      <td><span id="sprytextfield21">
                      <input type="text" name="sem1" value="<%=sem1%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                      <td><span id="sprytextfield22">
                      <input type="text" name="sem2" value="<%=sem2%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                      <td><span id="sprytextfield23">
                      <input type="text" name="sem3" value="<%=sem3%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                      <td><span id="sprytextfield24">
                      <input type="text" name="sem4" value="<%=sem4%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                      <td><span id="sprytextfield25">
                      <input type="text" name="sem5" value="<%=sem5%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td><td height="34"><span id="sprytextfield26">
                    <input type="text" name="sem6" value="<%=sem6%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                      
                    </tr>
                    <tr>
                    
                      <td>7th Sem</td> <td>
                      <input type="text" name="sem7" value="<%=sem7%>"></td>
                    </tr>
                    <tr><td>Backlog<br/><input type="radio" name="backlog" value="1" <% if(backlog.equals("1"))out.println("checked"); %>/>Yes
                        <input type="radio" name="backlog" value="0" <% if(backlog.equals("0"))out.println("checked"); %>/>No
</td>
                        <td>Courses:</td>
                        <td>
                          <input type="text" name="backlog_courses" id="backlog_courses" value="<%=backlog_courses%>"/>
                        </td>
                    </tr>
                    
                    <tr>
                      <td width="20%" style="text-decoration:underline">CPI(up to 6th semester)</td>
                      <td><%=cpi%></td>
                    </tr>

                  </table>
              </center><h3 width="90%" align="center">Job Preference</h3>
               
                <table width="92%" align="center" cellpadding="5" cellspacing="5" style="border:groove" border="1">
                  <tr>
                    <td width="20%"><span class="red">*</span>Preferred Job</td>
                    <td>Core Sector</td>
                    <td>Govt. Sector</td>
                    <td>IT Sector</td>
                    <td>Management Sector</td>
                    <td>Fin. &amp; Banking Sector</td>
                  </tr>
                  <tr>
                    <td>(Rate 1-5 [1-more likely,5-least likely])</td>
                    <td><span id="sprytextfield3">
                    <input type="text" name="core" value="<%=core%>" >
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                    <td><span id="sprytextfield27">
                    <input type="text" name="govt" value="<%=govt%>" >
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                    <td><span id="sprytextfield28">
                    <input type="text" name="IT" value="<%=IT%>" >
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                    <td><span id="sprytextfield29">
                    <input type="text" name="management" value="<%=management%>" >
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                    <td><span id="sprytextfield30">
                    <input type="text" name="fin_and_banking_sector" id="fin_and_banking_sector" value="<%=fin_and_banking_sector%>"/>
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" name="ppo" id="ppo" value="Y"  onChange="updatePPO(this);">
                      Got PPO?</td>
                    <td>Dream Company(if any):<br>
                      <input type="text" name="dream_company" id="dream_company" value="<%=dream_company%>"></td>
                  </tr>
                  <tr>
                    <td >Organization I</td>
                    <td><input name="comp_1" id="comp_1" type="text" value="<%=comp_1%>"></td>
                  </tr>
                  <tr>
                    <td>Organization II</td>
                    <td ><input name="comp_2" id="comp_2" type="text" value="<%=comp_2%>"></td>
                  </tr>
                  <tr>
                    <td >Organization III</td>
                    <td ><input name="comp_3" id ="comp_3" type="text" value="<%=comp_3%>"></td>
                  </tr>
                  <tr>
                    <td >Organization IV</td>
                    <td ><input name="comp_4" id ="comp_4" type="text" value="<%=comp_4%>"></td>
                  </tr>
                  <tr>
                    <td>Organization V</td>
                    <td ><input name="comp_5" id ="comp_5" type="text" value="<%=comp_5%>"></td>
                  </tr>
                </table>
                <p>&nbsp;</p></td>
          </tr>
                    <tr>
          <td align="center">
          	<strong>Fields marked with <span class="red">*</span> are compulsory.
          	<!--REGISTRATION IS CLOSED.-->
          	<br>Submit the entries according to your certificates, make sure you have sufficient evidences to defend these details during verification.<br>You cannot modify the form if you check the below checkbox and press submit.<br>
          	Uncheck it and press submit for temporary submission.</strong>
          </td>
          </tr>
          <tr>
            <td align="center">
	      <label>Check this for final submission <input type="checkbox" name="print_f" id="print_f" value="Final_submit">&nbsp;&nbsp;<br>
	      <input type="submit" name="submit" id="submit" value="Submit">&nbsp;
	    
          
          
        </table>
</form>

<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");

var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "none", {validateOn:["blur"], maxChars:5, hint:"ex: A-001", minChars:4});
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "email", {validateOn:["blur"]});
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "email", {validateOn:["blur"]});
var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "none", {validateOn:["blur"], minChars:10, maxChars:10, hint:"10-digit no."});
var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "none", {validateOn:["blur"]});
var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "integer", {validateOn:["blur"], minChars:6, maxChars:6});
var sprytextfield10 = new Spry.Widget.ValidationTextField("sprytextfield10", "integer", {validateOn:["blur"]});
var sprytextfield11 = new Spry.Widget.ValidationTextField("sprytextfield11", "none", {validateOn:["blur"], hint:"ex: CBSE"});
var sprytextfield12 = new Spry.Widget.ValidationTextField("sprytextfield12", "none", {validateOn:["blur"], hint:"ex: Hindi"});
var sprytextfield13 = new Spry.Widget.ValidationTextField("sprytextfield13", "none", {validateOn:["blur"], hint:"ex: first"});
var sprytextfield14 = new Spry.Widget.ValidationTextField("sprytextfield14", "real", {validateOn:["blur"], minValue:1, maxValue:100, hint:"ex: 85.6"});
var sprytextfield15 = new Spry.Widget.ValidationTextField("sprytextfield15", "integer", {hint:"YYYY", validateOn:["blur"], minValue:1980, maxValue:2010});
var sprytextfield16 = new Spry.Widget.ValidationTextField("sprytextfield16", "none", {validateOn:["blur"], hint:"ex: CBSE"});
var sprytextfield17 = new Spry.Widget.ValidationTextField("sprytextfield17", "none", {validateOn:["blur"], hint:"ex: English"});
var sprytextfield18 = new Spry.Widget.ValidationTextField("sprytextfield18", "none", {validateOn:["blur"], hint:"ex: first with hons."});
var sprytextfield19 = new Spry.Widget.ValidationTextField("sprytextfield19", "real", {validateOn:["blur"], hint:"ex: 81.0"});
var sprytextfield20 = new Spry.Widget.ValidationTextField("sprytextfield20", "none", {validateOn:["blur"], hint:"ex: 1994"});
var sprytextfield21 = new Spry.Widget.ValidationTextField("sprytextfield21", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var sprytextfield22 = new Spry.Widget.ValidationTextField("sprytextfield22", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var sprytextfield23 = new Spry.Widget.ValidationTextField("sprytextfield23", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var sprytextfield24 = new Spry.Widget.ValidationTextField("sprytextfield24", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var sprytextfield25 = new Spry.Widget.ValidationTextField("sprytextfield25", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var sprytextfield26 = new Spry.Widget.ValidationTextField("sprytextfield26", "real", {validateOn:["blur"], maxValue:10, useCharacterMasking:true});
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {validateOn:["blur"], minValue:1, maxValue:5});
var sprytextfield27 = new Spry.Widget.ValidationTextField("sprytextfield27", "none", {validateOn:["blur"], minValue:1, maxValue:5});
var sprytextfield28 = new Spry.Widget.ValidationTextField("sprytextfield28", "none", {validateOn:["blur"], minValue:1, maxValue:5});
var sprytextfield29 = new Spry.Widget.ValidationTextField("sprytextfield29", "none", {validateOn:["blur"], minValue:1, maxValue:5});
var sprytextfield30 = new Spry.Widget.ValidationTextField("sprytextfield30", "none", {validateOn:["blur"], minValue:1, maxValue:5});
</script>
</body>

</html>

