<html>
<head>
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script type="text/javascript">

function disable()
{
      document.getElementById("print_f").value="tt";
}

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
	//str1=str.replace(/"/g,"``");
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

	if(document.form2.mobile1.value=="")
  message+="Please enter your mobile number \n";

	if(document.form2.sem1.value=="")
  message+="Please enter the 1st sem spi \n";

	if(document.form2.sem2.value=="")
  message+="Please enter the 2nd sem spi \n";

	if(document.form2.sem3.value=="")
  document.form2.sem3.value="0"; 

  if(!(is_float(document.form2.sem1.value)) ){message+="Please enter a valid number in SPI 1 sem\n";}
  if(!(is_float(document.form2.sem2.value)) ){message+="Please enter a valid number in SPI 2 sem\n";}
  if(!(is_float(document.form2.sem3.value)) ){message+="Please enter a valid number in SPI 3 sem\n";}

  
  	if(document.form2.email2.value=="")
  message+="Please enter the Email \n"; 
  
  	if(document.form2.address.value=="")
  message+="Please enter Address \n"; 

  	if(!is_int(document.form2.pin.value))
  message+="Please enter Pin \n"; 

  	if(document.form2.telephone.value=="")
  message+="Please enter Telephone Number \n"; 

  	if(document.form2.x_board.value=="")
  message+="Please enter the X Board \n"; 
  
  	if(document.form2.x_medium.value=="")
  message+="Please enter the X Medium \n"; 
  
  	if(document.form2.x_marks.value=="")
  message+="Please enter the X Marks \n"; 
  
  	if(document.form2.x_div.value=="")
  message+="Please enter the X Division \n"; 
  
  	if(document.form2.x_year.value=="")
  message+="Please enter the X Year \n"; 

  
  	if(document.form2.xii_board.value=="")
  message+="Please enter the XII Board \n"; 
  
  	if(document.form2.xii_medium.value=="")
  message+="Please enter the XII Medium \n"; 
  
  	if(document.form2.xii_div.value=="")
  message+="Please enter the XII Division \n"; 
  
  	if(document.form2.xii_marks.value=="")
  message+="Please enter the XII Marks \n"; 
  
  	if(document.form2.xii_year.value=="")
  message+="Please enter the XII Year\n"; 
	
	
	if(document.form2.grad_degree.value=="")
  message+="Please enter the Grad Degree \n"; 
	
	if(document.form2.grad_branch.value=="")
  message+="Please enter the Grad Branch \n"; 
  
	if(document.form2.grad_board.value=="")
  message+="Please enter the Grad Board \n"; 
  
  	if(document.form2.grad_medium.value=="")
  message+="Please enter the Grad Medium\n"; 
  
  	if(document.form2.grad_div.value=="")
  message+="Please enter the Grad Division \n"; 
  
  	if(document.form2.grad_percentage.value=="")
  message+="Please enter the Grad Percentage \n"; 
  
  	if(document.form2.grad_year.value=="")
  message+="Please enter the Grad Year\n"; 

	if(document.form2.gap[0].checked)
  {
	  if(document.form2.gap_reason.value=="")message+="Please enter Gap in Study Reason\n";
	  if(document.form2.gap_duration.value=="")message+="Please enter Gap in Study Duration\n";
  }


	if(document.form2.backlog[0].checked)
  {
	   if(document.form2.backlog_courses.value=="")message+="Please enter details of backlog courses\n";	 
  }
	
	
	/*if(document.form2.gap[0].checked==true)
  {document.form2.gap_reason.value="none";document.form2.gap_duration.value="0";}
  
	if(document.form2.gap[1].checked==true)
  {
	  if(document.form2.gap_reason.value=="")message+="Please enter Gap in Study Reason\n";
	  if(document.form2.gap_duration.value=="")message+="Please enter Gap in Study Duration\n";
  }*/
  /*if(document.form2.backlog.checked==true)
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

			var con = confirm("After final submission you are not able to modify your profile.Please take a back to back print out after pressing ok button or you may ignore pressing cancel button ");
			if (con ==true)
			{
			
			      document.form2.action="edit_m.jsp";
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
			document.form2.action="edit_m.jsp";
			return true;

		}
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
<%@ include file="../sessionvalidate.jsp"%>



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
	String program_id="";
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

%>
<%	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	Calendar rightNow = Calendar.getInstance();
 
		int year = rightNow.get(Calendar.YEAR);
		String submit=request.getParameter("submit");
		print_f=request.getParameter("print_f");
        String name="";
        String dob=request.getParameter("dob");
        String sex=request.getParameter("sex"); 
        String category=request.getParameter("category");
        //String dept_name=request.getParameter("department_name");
        //String prog_name="";
        String jee_rank=request.getParameter("rank");
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
        String cpi=request.getParameter("cpi");
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
		

	if(submit!=null && print_f==null  && student_roll_number!=null&& jee_rank!=null&&dob!=null&&hostel!=null&&room_no!=null&&email1!=null&&email2!=null&&mobile1!=null&&address!=null&&pin!=null&&telephone!=null&&x_board!=null&&xii_board!=null&&x_medium!=null&&xii_medium!=null&&x_div!=null&&xii_div!=null&&x_marks!=null&&xii_marks!=null&&x_year!=null&&xii_year!=null&&gap!=null&&sem1!=null&&sem2!=null&&backlog!=null&&grad_degree!=null&&grad_branch!=null&&grad_medium!=null&&grad_year!=null&&grad_percentage!=null&&grad_board!=null&&grad_div!=null)
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
	
                main_record1=main_record1+",nationality='"+nationality+"'";	
		
		main_record1=main_record1+" ,address2='"+address2+"',address3='"+address3+"', date_of_birth='"+sql_convert_date(dob)+"', sex="+sex+" ,category='"+category+"' , hostel='"+hostel+"' ,room_no='"+room_no+"', email='"+email1+"' , email_alternative='"+email2+"',contact_number='"+mobile1+"', permanent_address='"+address+"', pin='"+pin+"' ,  x_board='"+x_board+"',x_medium='"+x_medium+"', x_percentage='"+x_marks+"' ,x_pass_year='"+x_year+"' ,xii_board='"+xii_board+"' ,xii_medium='"+xii_medium+"' ,xii_percentage='"+xii_marks+"' ,xii_pass_year='"+xii_year+"' ,spi_1sem="+sem1+" ,spi_2sem="+sem2+",x_div='"+x_div+"',xii_div='"+xii_div+"',grad_degree='"+grad_degree+"',grad_medium='"+grad_medium+"',grad_branch='"+grad_branch+"',grad_div='"+grad_div+"',grad_year='"+grad_year+"',grad_percentage='"+grad_percentage+"',grad_board='"+grad_board+"',is_registered=1  where student_roll_number='"+student_roll_number+"';";



		db.connect();
		int num_rows1=db.updateSQL(main_record1);
		
		
		db.close();	
		if(num_rows1==1)
		  {
				response.sendRedirect("success1.jsp");
		  }
		  else
		  {
		    response.sendRedirect("error.jsp?error=update_fail");
		  }
				//out.println(main_record1);
     }

     if(submit!=null && print_f!=null  && student_roll_number!=null&& jee_rank!=null&&dob!=null&&hostel!=null&&room_no!=null&&email1!=null&&email2!=null&&mobile1!=null&&address!=null&&pin!=null&&telephone!=null&&x_board!=null&&xii_board!=null&&x_medium!=null&&xii_medium!=null&&x_div!=null&&xii_div!=null&&x_marks!=null&&xii_marks!=null&&x_year!=null&&xii_year!=null&&gap!=null&&sem1!=null&&sem2!=null&&backlog!=null&&grad_degree!=null&&grad_branch!=null&&grad_medium!=null&&grad_year!=null&&grad_percentage!=null&&grad_board!=null&&grad_div!=null)
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
		
                main_record1=main_record1+",nationality='"+nationality+"'";		

		main_record1=main_record1+" ,address2='"+address2+"',address3='"+address3+"', date_of_birth='"+sql_convert_date(dob)+"', sex="+sex+" ,category='"+category+"' , hostel='"+hostel+"' ,room_no='"+room_no+"', email='"+email1+"' , email_alternative='"+email2+"',contact_number='"+mobile1+"', permanent_address='"+address+"', pin='"+pin+"' ,  x_board='"+x_board+"',x_medium='"+x_medium+"', x_percentage='"+x_marks+"' ,x_pass_year='"+x_year+"' ,xii_board='"+xii_board+"' ,xii_medium='"+xii_medium+"' ,xii_percentage='"+xii_marks+"' ,xii_pass_year='"+xii_year+"' ,spi_1sem="+sem1+" ,spi_2sem="+sem2+",x_div='"+x_div+"',xii_div='"+xii_div+"',grad_degree='"+grad_degree+"',grad_medium='"+grad_medium+"',grad_branch='"+grad_branch+"',grad_div='"+grad_div+"',grad_year='"+grad_year+"',grad_percentage='"+grad_percentage+"',grad_board='"+grad_board+"',is_registered=1  where student_roll_number='"+student_roll_number+"';";



		db.connect();
		int num_rows1=db.updateSQL(main_record1);
		
		
		db.close();	
		if(num_rows1==1)
			{
			  response.sendRedirect("mth.jsp");
			}
			else
			  {
			    response.sendRedirect("error.jsp?error=update_fail");
				
			  }
     }


%>

<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">

<body background="form/New/jee3.jpg">


  <div id="content">
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
			address2=rs.getString("address2");
			address3=rs.getString("address3");
			
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


      <form name="form2" id="form2" method="post" onSubmit="return validate_empty();">
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2 align="center">General Info </h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="687" height="751" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="200">Student roll number</td>
                      <td width="351"><%=student_roll_number%></td>
                    </tr>
                    <tr>
                      <td>Name(Capital Letter)</td>
                      <td><%=name%></td>
                    </tr>
                    <tr>
                      <td>*Date of Birth</td>
                      <td>
                        <input readonly type="text" name="dob" id="dob" onClick="displayCalendar(document.forms[0].dob,'dd-mm-yyyy',this)" value="<%=sql_convert_date(dob)%>" >
                     </td>
                    </tr>
                    <tr>
                      <td>*Sex</td>
                      <td><input name="sex" type="radio" id="sex" value="1" checked <% if(sex.equals("1")){out.println("checked");} %>>
                        Male
                        <input type="radio" name="sex" id="sex" value="0" <% if(sex.equals("0")){out.println("checked");} %>>
                        Female</td>
                    </tr>
                    <tr>
                      <td>*Physically Handicapped<span style="font-size:10px"></span></td>
                      <td><label for="category"></label>
                        <p>
                          <label>
                            <input type="radio" name="RadioGroup1" value="ph_y" id="RadioGroup1_0" <% if(category.equals("PH"))out.println("checked"); %>>
                            Yes</label>
                          <label>
                            <input name="RadioGroup1" type="radio" id="RadioGroup1_1" value="ph_n" <% if(!category.equals("PH"))out.println("checked"); %>>
                          No</label>
                          <br>
                      </p></td>
                    </tr>
                    <tr>
                      <td>*Category<br>
                      <span style="font-size:10px">(SC/ST/OBC/GEN/Foreign)</span></td>
                      <td><label for="category"></label>
                        <select name="category" id="category">
                          <option value="GEN" selected <% if(category.equals("GEN"))out.println("selected"); %>>GEN</option>
                          <option value="SC" <% if(category.equals("SC"))out.println("selected"); %>>SC</option>
                          <option value="ST" <% if(category.equals("ST"))out.println("selected"); %>>ST</option>
                          <option value="OBC" <% if(category.equals("OBC"))out.println("selected"); %>>OBC</option>
			  <option value="FOREIGN STUDENT" <% if(category.equals("FOREIGN STUDENT"))out.println("selected"); %>>FOREIGN STUDENT</option>
                      </select></td>
                    </tr>
                    <tr>
                      <td>*Nationality</td>
                      <td><span id="sprytextfield1">
                        <input type="text" name="nationality" value="<%=nationality%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
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
					String something="";
					something+="<option value=\""+r_e.getString("prog_id")+"\"";
					if(r_e.getString("programme_name").equals(program_name))
						something+=" selected";
					out.println(something+">"+r_e.getString("programme_name")+"</option>");
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
                      <td>*Qualifying Examination</td>
                      <td><select name="exam" id="exam" onChange="examination()">
                          <option value="gate">GATE</option>
                          <option value="jam">JAM</option>
                          <option value="ceed">CEED</option>
                          <option value="net">NET</option>
                      </select>
                      
                      <script type=""="text/javascript">
					  function examination()
					  { var sel=document.getElementById("exam");
					    if(sel=="jam") document.getElementById("demo").innerHTML = "<label for="cat_rank">Cat. Rank :</label>
                      <input name="cat_rank" type="text" id="cat_rank" size="10" maxlength="10">";
					  }
					  </script>
                         AIR :
                       <span id="sprytextfield2">
                         <input type="text" name="rank" value="<%=jee_rank%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span>&nbsp;<span id="demo">
                      </span></td>
                    </tr>
                    <tr>
                      <td>*Hostel</td>
                      <td><span id="sprytextfield3">
                        <input type="text" name="hostel" value="<%=hostel%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                      </tr>
                      <tr>
                      <td>*Room No.</td>
                      <td><span id="sprytextfield4">
                        <input type="text" name="room" value="<%=room_no%>">
                        <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    </tr>
                    <tr>
                      <td>*Email</td>
                      <td><span id="sprytextfield5">
                      <input type="text" name="email1" value="<%=username%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span>
                        (iitg e-mail)</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><span id="sprytextfield6">
                      <input type="text" name="email2" value="<%=email2%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span>
                        (alternative e-mail)</td>
                    </tr>
                    <tr>
                      <td>*Contact Telephone/Mobile No.</td>
                      <td><span id="sprytextfield7">
                      <input type="text" name="mobile1" value="<%=mobile1%>">
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                    </tr>
                    <tr>
                      <td>Alternate Telephone/Mobile No.</td>
                      <td><input type="text" name="mobile2" value="<%=mobile2%>"></td>
                    </tr>
                    <tr>
                      <td height="150">*Permanent Address</td>
                      <td>Line 1:<span id="sprytextfield8">
                        <input name="address" type="text" value="<%=address%>" size="60" maxlength="100">
                        <span class="textfieldRequiredMsg">A value is required.</span></span><br/>
                      Line 2:<input name="address2" type="text" value="<%=address2%>" size="60" maxlength="100"><br/>
                      Line 3:<input name="address3" type="text" value="<%=address3%>" size="60" maxlength="100"></td>
                    </tr>
                    <tr>
                      <td>*Pin</td>
                      <td><span id="sprytextfield9">
                        <input type="text" name="pin" value="<%=pin%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    </tr>
                    <tr>
                      <td>*Home Telephone No.(with code)</td>
                      <td><span id="sprytextfield10">
                        <input type="text" name="telephone" value="<%=telephone%>">
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
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
                    <td>Medium of Education</td>
                    <td>Class/Div</td>
                    <td>% of Marks</td>
                    <td>Year of Passing</td>
                  </tr>
                  <tr>
                    <td height="61">*X STD</td>
                    <td><span id="sprytextfield11">
                    <input name="x_board" type="text" value="<%=x_board%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield12">
                    <input name="x_medium" type="text" value="<%=x_medium%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><label for="x_div"></label>
                      <span id="sprytextfield13">
                      <input type="text" name="x_div" id="x_div" value="<%=x_div%>"/>
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield14">
                    <input type="text" name="x_marks" value="<%=x_marks%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                    <td><span id="sprytextfield15">
                    <input type="text" name="x_year" value="<%=x_year%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                  </tr>
                  <tr>
                    <td height="43">*XII STD/DIP/EQUI</td>
                    <td><span id="sprytextfield16">
                      <input name="xii_board" type="text" value="<%=xii_board%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield17">
                      <input name="xii_medium" type="text" value="<%=xii_medium%>" maxlength="200">
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><label for="xii_div"></label>
                      <span id="sprytextfield18">
                      <input type="text" name="xii_div" id="xii_div" value="<%=xii_div%>"/>
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                    <td><span id="sprytextfield19">
                    <input type="text" name="xii_marks" value="<%=xii_marks%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                    <td><span id="sprytextfield20">
                    <input type="text" name="xii_year" value="<%=xii_year%>">
                    <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                  </tr>
                  <tr>
                    <td><p>*Graduation</p>
                      <p>Degree:
                        <label for="grad_degree"></label>
                        <span id="sprytextfield26">
                        <input name="grad_degree" type="text" id="grad_degree" value="<%=grad_degree%>" maxlength="200"/>
                        <span class="textfieldRequiredMsg">A value is required.</span></span></p>
                      <p>Branch:
                        <label for="grad_branch"></label>
                        <span id="sprytextfield27">
                        <input name="grad_branch" type="text" id="grad_branch" value="<%=grad_branch%>" maxlength="200"/>
                        <span class="textfieldRequiredMsg">A value is required.</span></span></p></td>
                    <td><label for="grad_board"></label>
                      <span id="sprytextfield21">
                      <input name="grad_board" type="text" id="grad_board" value="<%=grad_board%>" maxlength="200"/>
                    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                      <td><label for="grad_medium"></label>
                        <span id="sprytextfield22">
                        <input name="grad_medium" type="text" id="grad_medium" value="<%=grad_medium%>" maxlength="200"/>
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                      <td><label for="grad_div"></label>
                        <span id="sprytextfield23">
                        <input type="text" name="grad_div" id="grad_div" value="<%=grad_div%>"/>
                      <span class="textfieldRequiredMsg">A value is required.</span></span></td>
                      <td><label for="grad_percentage"></label>
                        <span id="sprytextfield24">
                        <input type="text" name="grad_percentage" id="grad_percentage" value="<%=grad_percentage%>"/>
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                      <td><label for="grad_year"></label>
                        <span id="sprytextfield25">
                        <input type="text" name="grad_year" id="grad_year" value="<%=grad_year%>"/>
                      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                     </tr>
                  <tr>
                    <td>Others:
                      <label for="others"></label>
                      <input name="others" type="text" id="others" value="<%=others%>" maxlength="200"/></td>
                    <td><label for="others_board"></label>
                      <input name="others_board" type="text" id="others_board" value="<%=others_board%>" maxlength="200"/></td>
                    <td><label for="others_medium"></label>
                      <input name="others_medium" type="text" id="others_medium" value="<%=others_medium%>" maxlength="200"/></td>
                    <td><label for="others_div"></label>
                      <input type="text" name="others_div" id="others_div" value="<%=others_div%>"/></td>
                    <td><label for="others_percentage"></label>
                      <input type="text" name="others_percentage" id="others_percentage" value="<%=others_percentage%>"/></td>
                    <td><label for="others_year"></label>
                      <input type="text" name="others_year" id="others_year" value="<%=others_year%>"/></td>
                  </tr>
                  <tr>
                    <td>*Gap in Study</td>
                    <td><input name="gap" type="radio" id="gap" value="1" checked <% if(gap.equals("1")){out.println("checked");} %> />
Yes
  <input name="gap" type="radio" id="gap" value="0" <% if(gap.equals("0")){out.println("checked");} %> />
No</td>
                    <td><p>If Yes, Reason:</p>
                      
                        <label for="gap_reason"></label>
                      </td>
                    <td><input name="gap_reason" type="text" id="gap_reason" value="<%=gap_reason%>" maxlength="200"/></td>
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
                        <td><%=cpi%></td>
                      </tr>
                      <tr>
                        <td>SPI in all semesters</td>
                        <td>&nbsp;</td>
                        <td>Backlog<br/><input type="radio" name="backlog" value="1" <% if(backlog.equals("1")) out.println("checked"); %>/>
                        Yes
                          <input type="radio" name="backlog" value="0" <% if(backlog.equals("0")) out.println("checked"); %>/>
                          No
						</td>
                        <td>Courses:</td>
                        <td>
                          <input name="backlog_courses" type="text" id="backlog_courses" value="<%=backlog_courses%>" maxlength="200"/>
                        </td>
                      </tr>
                      <tr>
                        <td>*1st Sem</td>
                        <td>*2nd Sem</td>
                        <td>3rd Sem</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td><span id="sprytextfield28">
                        <input type="text" name="sem1" value="<%=sem1%>" />
                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
                        <td><span id="sprytextfield29">
                        <input type="text" name="sem2" value="<%=sem2%>" />
                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
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
                        <td>(state preferences in the respective boxes. Give numbers 1,2,3)</td>
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
          <td align="center">
          	<strong>Fields marked with * are compulsory.<!--REGISTRATION IS CLOSED.--><br>You cannot modify the form if you check the below checkbox and press submit.<br>Uncheck it and press submit for temporary submission.</strong>
          </td>
          </tr>
          <tr>
            <td align="center">
	      <label>Check this for final submission <input type="checkbox" name="print_f" id="print_f" value="Final_submit">&nbsp;&nbsp;<br>
	      <input type="submit" name="submit" id="submit" value="Submit">&nbsp;
	    
          
          
        </table>

      </form>

    </div>
  </div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "integer", {validateOn:["blur"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "none", {validateOn:["blur"]});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4");
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "email", {validateOn:["blur"]});
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "email", {validateOn:["blur"]});
var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "integer", {validateOn:["blur"]});
var sprytextfield8 = new Spry.Widget.ValidationTextField("sprytextfield8", "none", {validateOn:["blur"]});
var sprytextfield9 = new Spry.Widget.ValidationTextField("sprytextfield9", "none", {validateOn:["blur"]});
var sprytextfield10 = new Spry.Widget.ValidationTextField("sprytextfield10", "none", {validateOn:["blur"]});
var sprytextfield11 = new Spry.Widget.ValidationTextField("sprytextfield11", "none", {validateOn:["blur"]});
var sprytextfield12 = new Spry.Widget.ValidationTextField("sprytextfield12", "none", {validateOn:["blur"]});
var sprytextfield13 = new Spry.Widget.ValidationTextField("sprytextfield13", "none", {validateOn:["blur"]});
var sprytextfield14 = new Spry.Widget.ValidationTextField("sprytextfield14", "real", {validateOn:["blur"]});
var sprytextfield15 = new Spry.Widget.ValidationTextField("sprytextfield15", "integer", {validateOn:["blur"]});
var sprytextfield16 = new Spry.Widget.ValidationTextField("sprytextfield16", "none", {validateOn:["blur"]});
var sprytextfield17 = new Spry.Widget.ValidationTextField("sprytextfield17", "none", {validateOn:["blur"]});
var sprytextfield18 = new Spry.Widget.ValidationTextField("sprytextfield18", "none", {validateOn:["blur"]});
var sprytextfield19 = new Spry.Widget.ValidationTextField("sprytextfield19", "real", {validateOn:["blur"]});
var sprytextfield20 = new Spry.Widget.ValidationTextField("sprytextfield20", "integer", {validateOn:["blur"]});
var sprytextfield21 = new Spry.Widget.ValidationTextField("sprytextfield21", "none", {validateOn:["blur"]});
var sprytextfield22 = new Spry.Widget.ValidationTextField("sprytextfield22", "none", {validateOn:["blur"]});
var sprytextfield23 = new Spry.Widget.ValidationTextField("sprytextfield23", "none", {validateOn:["blur"]});
var sprytextfield24 = new Spry.Widget.ValidationTextField("sprytextfield24", "real", {validateOn:["blur"]});
var sprytextfield25 = new Spry.Widget.ValidationTextField("sprytextfield25", "integer", {validateOn:["blur"]});
var sprytextfield26 = new Spry.Widget.ValidationTextField("sprytextfield26");
var sprytextfield27 = new Spry.Widget.ValidationTextField("sprytextfield27", "none", {validateOn:["blur"]});
var sprytextfield28 = new Spry.Widget.ValidationTextField("sprytextfield28", "real", {validateOn:["blur"]});
var sprytextfield29 = new Spry.Widget.ValidationTextField("sprytextfield29", "real", {validateOn:["blur"]});
</script>
</body>

</html>

