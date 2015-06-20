<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>

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
{  
      if(check_box.checked==true)
	{
                document.getElementById(activate_2).checked=true;
		document.getElementById(activate_2).disabled=false;
		document.getElementById("checkbox2").checked=true;
		document.getElementById("checkbox3").checked=true;	
		document.getElementById("checkbox2").disabled=false;
		document.getElementById("checkbox3").disabled=false;	
	}
	else
	{
		document.getElementById(activate_2).disabled=true;
	
	}   
}
function activate5(check_box,activate_2)
{
	if(check_box.checked==true)
	{
                document.getElementById(activate_2).checked=false;
                document.getElementById("checkbox2").checked=false;
                document.getElementById("checkbox3").checked=false;  
		document.getElementById(activate_2).disabled=true;
                document.getElementById("checkbox2").disabled=true;
                document.getElementById("checkbox3").disabled=true;

              	
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
	var str="1234567890 -+";
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

function is_float(str)
{
	//alert("in float");
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
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
function alpha(e)
{
	var k;

	if(e.keyCode ==0)
	{
 	   k = e.which;                        
	}
	else
	{
	   k = e.keyCode;                     
	}
      
       //ENABLING LEFT,RIGHT,UPPER,DOWN ARROW//
       if(k > 36 && k< 41  && e.charCode==0) 
       {
        return true;
       }
       return ((k > 63 && k < 91) || (k > 96 && k < 123) || (k > 43 && k < 58) || (k >39 && k<42) || k==13 || k == 8 || k == 9 || k == 32 || k==95 || k==46);

        /*
	 if(k==34 || k==92)
         {
            alert("Please do not use single or double quotes or forward slash.");
         }
         return ((k > 63 && k < 92) || (k > 96 && k < 127) || (k > 41 && k <64) || (k >39 && k<42) ||(k >34 && k<40) || k==10 ||  k==13 || k == 8 || k == 9 || k == 27 || k == 32 || k == 33 || k==95 || k==46 );
        */
}

function isvalid(str)
{
  
  var i=0;
  for(i=0;i<str.length;i++)
  {
    var k=str.charAt(i);
   
    if(k=='\\' || k=='\'' || k=='\"')
    {
      return false;
    }
    
  }
  return true;
}


function alltrim(str)
{
	//var strr="";
	return str.replace(/^\s+|\s+$/g, '');
	//alert(strr);
	//return strr;
}

function findall()
{
	
	var i=0;
	//alert("i="+i);
	//alert(form2.elements.length);
    for(i = 0; i < document.form_company_profile.elements.length; i++)
    {
		//alert("i="+i);
        document.form_company_profile.elements[i].value=alltrim(document.form_company_profile.elements[i].value);
    }
}



function validate_empty()
{	

	var message="";

	findall();

if(document.form_company_profile.company_address.value=="")
	message+="please enter \"Company Address\" \n";
else{
	if(!isvalid(document.form_company_profile.company_address.value))
	{
	    message+="Please remove slashes and quotes from \"Company Address\" field\n";
		    
	}
}
if(document.form_company_profile.company_website.value=="")
	message+="please enter \"Company website\" \n";
else{
	if(!isvalid(document.form_company_profile.company_website.value))
	{
	    message+="Please remove slashes and quotes from \"Company Website \" field\n";
		    
	}
}
if(document.form_company_profile.company_about.value=="")
	message+="please enter \"Company's Brief Write up \" \n";
else{
	if(!isvalid(document.form_company_profile.company_about.value))
	{
	    message+="Please remove slashes and quotes from \"Company's Brief Write up\"  field\n";
		    
	}
}

if(document.getElementById("category_6").checked==true) 
{	
      if(document.getElementById("category_other").value=="")
      {
	    message+="Type of organization(other) field  is blank \n";		
      }
      else
      { 
        if(!isvalid(document.getElementById("category_other").value))
	{
	    message+="Please remove slashes and quotes from \"Type of organization(other) field \" \n";
	}  

	if(document.getElementById("category_other").value.length > 97)
        {
	    message+="The Lenght of  \"Type of organization(other) field\" should not exceed 100 characters \n";		
	}     
    }
}

if(document.getElementById("sector_7").checked==true) 
{

	if(document.getElementById("sector_other").value=="")
	{
	    message+="Industry Sector(other) field  is blank \n";		
	}
        else
        {
	  if(!isvalid(document.getElementById("sector_other").value))
	  {
	    message+="Please remove slashes and quotes from \"Industry Sector(other) field \" \n";
	  }
	  if(document.getElementById("sector_other").value.length>97)
	  {
	    message+="The Lenght of  \"Industry Sector(other) field\" should not exceed 100 characters \n";		
	  }
        }
}

if(document.form_company_profile.head_hr_name.value!="")
{	

	if(!isvalid(document.form_company_profile.head_hr_name.value))
	{
	    message+="Please remove slashes and quotes from \"Head HR Name \" field\n";
		    
	}
}
if(document.form_company_profile.fcp_name.value=="")
	message+="please enter \"FCP Name\" \n";
else{
	if(!isvalid(document.form_company_profile.fcp_name.value))
	{
	    message+="Please remove slashes and quotes from \"FCP Name \" field\n";
		    
	}
}


if(document.form_company_profile.scp_name.value!="")
{
	if(!isvalid(document.form_company_profile.scp_name.value))
	{
	    message+="Please remove slashes and quotes from \"SCP Name \" field\n";
		    
	}
}

if(document.form_company_profile.head_hr_designation.value!="")
{
	if(!isvalid(document.form_company_profile.head_hr_designation.value))
	{
	    message+="Please remove slashes and quotes from \"Head HR Designation\" field\n";
		    
	}
}
if(document.form_company_profile.fcp_designation.value=="")
	message+="please enter \"FCP Designation \" \n";
else{
	if(!isvalid(document.form_company_profile.fcp_designation.value))
	{
	    message+="Please remove slashes and quotes from \"FCP Designation \" field\n";
		    
	}
}

if(document.form_company_profile.scp_designation.value!="")
{
	if(!isvalid(document.form_company_profile.scp_designation.value))
	{
	    message+="Please remove slashes and quotes from \"SCP Designation\" field\n";
		    
	}
}


if(document.form_company_profile.head_hr_email.value!="")
{
	if(!isvalid(document.form_company_profile.head_hr_email.value))
	{
	    message+="Please remove slashes and quotes from \"Head HR Email-id \" field\n";
		    
	}
}
if(document.form_company_profile.fcp_email.value=="")
	message+="please enter \"FCP Email-id \" \n";
else{
	if(!isvalid(document.form_company_profile.fcp_email.value))
	{
	    message+="Please remove slashes and quotes from \"FCP Email-id \" field\n";
		    
	}
}
if(document.form_company_profile.scp_email.value!="")
{
	if(!isvalid(document.form_company_profile.scp_email.value))
	{
	    message+="Please remove slashes and quotes from \"SCP Email-id \" field\n";
		    
	}
}

if(document.form_company_profile.head_hr_mobile.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.head_hr_mobile.value))
    {
      message+="Please enter a valid \"Head HR Mobile number\" \n"
    }
}


if(document.form_company_profile.fcp_mobile.value=="")
	message+="please enter \"FCP Mobile Number \"\n";
else{
	
	if(!check_agency_phone_fax(document.form_company_profile.fcp_mobile.value))
	{
	    message+="Please enter a valid \"FCP Mobile number\" \n"
	}
}



if(document.form_company_profile.scp_mobile.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.scp_mobile.value))
    {
      message+="Please enter a valid \"SCP Mobile number\" \n"
    }
}

if(document.form_company_profile.head_hr_phone.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.head_hr_phone.value))
    {
      message+="Please enter a valid \"Head HR Phone number\" \n"
    }
}
if(document.form_company_profile.fcp_phone.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.fcp_phone.value))
    {
      message+="Please enter a valid \"FCP Phone number\" \n"
    }
}
if(document.form_company_profile.scp_phone.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.scp_phone.value))
    {
      message+="Please enter a valid \"SCP Phone number\" \n"
    }
}

if(document.form_company_profile.head_hr_fax.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.head_hr_fax.value))
    {
      message+="Please enter a valid \"Head HR Fax number\" \n"
    }
}
if(document.form_company_profile.fcp_fax.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.fcp_fax.value))
    {
      message+="Please enter a valid \"FCP Fax number\" \n"
    }
}
if(document.form_company_profile.scp_fax.value!="")
{
    if(!check_agency_phone_fax(document.form_company_profile.scp_fax.value))
    {
      message+="Please enter a valid \"SCP Fax number\" \n"
    }
}

if(document.form_company_profile.preferred_date_1.value=="")
	message+="please enter From date\n";
if(document.form_company_profile.preferred_date_2.value=="")
	message+="please enter To date\n";

// Date Comparasion
var d1=document.form_company_profile.preferred_date_1.value;
var d2=document.form_company_profile.preferred_date_2.value;
var d1_ary=d1.split('-');
var d2_ary=d2.split('-');
var date1=new Date();
date1.setFullYear(d1_ary[2],d1_ary[1],d1_ary[0]);
var date2=new Date();
date2.setFullYear(d2_ary[2],d2_ary[1],d2_ary[0]);
// For validating placement duration
var min_date=new Date();
min_date.setFullYear(2013,11,30);
var max_date=new Date();
max_date.setFullYear(2014,06,01);

if(date1 > date2)
{
    message+= "Please check \"Preferred Date of visit \" field \n";
}

if( date1<min_date || date2>max_date)
{
  if(date1 < date2) 
  {
    message+= "Please check \"Preferred Date of visit \" field \n";
  }     
  message+="Placement season will start from December-2013 upto June-2014.\n";
}

if(!is_int(document.form_company_profile.no_of_rounds.value))
	message+="please enter valid Number of rounds\n";
if(!is_int(document.form_company_profile.no_of_rooms.value))
	message+="please enter valid Number of rooms\n";
if(!is_int(document.form_company_profile.no_of_executive.value))
	message+="please enter valid Number of executives\n";

if(document.form_company_profile.other_requirements.value!="")
{
        if(!isvalid(document.form_company_profile.other_requirements.value))
        {
            message+="Please remove slashes and quotes from \"Other Requirements \" field\n";                    
        }
}


	if(message=="")
	{
		document.form_company_profile.action="edit.jsp";
		return true;
	}
	else
	{
		alert(message);
		document.form_company_profile.action=null;
		return false;
	}
}	 

function enabletxt()
{
  var radioval=document.getElementById("category_6").checked;
  if(radioval==true)
  {
   document.getElementById("category_other").disabled=false; 
  }
  else
  {
   document.getElementById("category_other").disabled=true; 
  } 
}

function enabletxt2()
{
  var radioval=document.getElementById("sector_7").checked;
  if(radioval==true)
  {
   document.getElementById("sector_other").disabled=false;
  }
  else
  {
   document.getElementById("sector_other").disabled=true;
  }
}


</script>

<script src="../js/datetimepicker.js"></script>
<script type="text/javascript" src="../js/tabber.js"></script>
<link rel="stylesheet" href="../js/example.css" TYPE="text/css" MEDIA="screen">
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

<script src="../js/datetimepicker.js"></script>
<script type="text/javascript" src="../js/tabber.js"></script>
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
		ResultSet rr2=db.execSQL("select agency_id from agency where username='"+username+"';");
		String agency_id="";
		if(rr2.next())
			agency_id=""+rr2.getInt(1);
		rr2.close();
		db.close();
	
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<% 	//out.println("rohan 1");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String submit=request.getParameter("submit");
	String company_name=request.getParameter("company_name");
	String company_address=request.getParameter("company_address");
	String company_website=request.getParameter("company_website");
	String category=request.getParameter("category");
	String sector=request.getParameter("sector");
	String category_other=request.getParameter("category_other");
	String sector_other=request.getParameter("sector_other");
	String head_hr_name=request.getParameter("head_hr_name");
	String head_hr_designation=request.getParameter("head_hr_designation");
	String head_hr_email=request.getParameter("head_hr_email");
	String head_hr_mobile=request.getParameter("head_hr_mobile");
	String head_hr_phone=request.getParameter("head_hr_phone");
	String head_hr_fax=request.getParameter("head_hr_fax");
	String fcp_name=request.getParameter("fcp_name");
	String fcp_email=request.getParameter("fcp_email");
	String fcp_designation=request.getParameter("fcp_designation");
	String fcp_mobile=request.getParameter("fcp_mobile");
	String fcp_phone=request.getParameter("fcp_phone");
	String fcp_fax=request.getParameter("fcp_fax");
	String scp_name=request.getParameter("scp_name");
	String scp_email=request.getParameter("scp_email");
	String scp_designation=request.getParameter("scp_designation");
	String scp_mobile=request.getParameter("scp_mobile");
	String scp_phone=request.getParameter("scp_phone");
	String scp_fax=request.getParameter("scp_fax");
	String shortlist=request.getParameter("shortlist");
	String ppt=request.getParameter("ppt");
	String gd=request.getParameter("gd");
	String aptitude_test=request.getParameter("aptitude_test");
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
	String technical_test=request.getParameter("technical_test");
	String cpi=request.getParameter("cpi");
	String company_about=request.getParameter("company_about");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	String bond=request.getParameter("bond");
	String package_name=request.getParameter("package_name");
	String programmes=request.getParameter("programmes");
	String vacancy=request.getParameter("vacancy");
	String ctc=request.getParameter("ctc");
	String bond_duration=request.getParameter("bond_duration");
	String other_requirements=request.getParameter("other_requirements");

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
	
	if(bond!=null)
	{
		bond="1";	
	}
	else
	{
		bond="0";
	}
	if(no_of_executive!=null)
	{

	}
	else
	{
		no_of_executive="0";
	}
	if(technical_test!=null)
	{
		//technical_test="1";	
	}
	else
	{
		technical_test="0";
	}
	if(technical_duration!=null)
	{

	}
	else
	{
		technical_duration="0";
	}
	if(aptitude_duration!=null)
	{

	}
	else
	{
		aptitude_duration="0";
	}
	if(cpi!=null)
	{

	}
	else
	{
		cpi="0";
	}


	if(submit!=null && company_name!=null && company_website!=null && company_address!=null && category!=null && sector!=null && fcp_name!=null && fcp_email!=null && fcp_mobile!=null && fcp_phone!=null && fcp_fax!=null && fcp_designation!=null)
	{
		if(!(category.equals("other") && category_other==null))
		{
			if(!(sector.equals("other") && sector_other==null))
			{				
				int num_rows=0;
				if (category.equals("other") && category_other!=null)
				{
					category=category_other;
				}
				if (sector.equals("other") && sector_other!=null)
				{
					sector=sector_other;
				}
				String main_record=" update agency set agency_address='"+company_address+"' ,agency_website='"+company_website+"' ,agency_phone='"+fcp_phone+"' ,agency_mobile='"+fcp_mobile+"' ,agency_fax='"+fcp_fax+"' ,agency_email='"+fcp_email+"' ,agency_person='"+fcp_name+"' ,fcp_designation='"+fcp_designation+"',agency_profile='"+sector+"' ,nature_business='"+category+"' ,ppt='"+ppt+"' ,gd="+gd+" ,aptitude_test="+aptitude_test+" ,technical_test="+technical_test+" ,interview="+interview+" ,no_of_rounds="+no_of_rounds+" ,no_of_rooms="+no_of_rooms+" ,no_of_executive="+no_of_executive+",preferred_date_1='"+sql_convert_date(preferred_date_1)+"' ,preferred_date_2='"+sql_convert_date(preferred_date_2)+"' ,lcd="+Integer.parseInt(lcd)+",laptop="+Integer.parseInt(laptop)+",ohp="+Integer.parseInt(ohp)+",head_hr_name='"+head_hr_name+"',head_hr_designation='"+head_hr_designation+"',head_hr_email='"+head_hr_email+"',head_hr_mobile='"+head_hr_mobile+"',head_hr_phone='"+head_hr_phone+"',head_hr_fax='"+head_hr_fax+"',scp_name='"+scp_name+"',scp_designation='"+scp_designation+"',category='"+category+"',sector='"+sector+"',scp_email='"+scp_email+"',scp_mobile='"+scp_mobile+"',scp_phone='"+scp_phone+"',scp_fax='"+scp_fax+"',agency_name='"+company_name+"',company_about='"+company_about+"',other_requirements='"+other_requirements+"' where agency_id='"+agency_id+"';";
			
			
				db.connect();
				int num_rows1=db.updateSQL(main_record);
				db.close();         	
				if(num_rows1!=0)
				{
                                     %>
                                       <script type="text/javascript">
                                        location.href="success.jsp";
 				       </script>	

                                     <%
					//response.sendRedirect("success.jsp");
				}
				else
				{
                                   %>
                                       <script type="text/javascript">
                                        alert("ERROR UPDATING DATA !!");
                                       </script>
                                   <%
					//response.sendRedirect("error.jsp?error=update_fail");
				}
			}
			else
			{
                                   %>
                                       <script type="text/javascript">
                                        alert("ERROR UPDATING DATA !!");
                                       </script>
                                   <%
				//response.sendRedirect("error.jsp?error=empty_sector");
			}
		}
		else
		{
                                   %>
                                       <script type="text/javascript">
                                        alert("ERROR UPDATING DATA !!");
                                       </script>
                                   <%
			//response.sendRedirect("error.jsp?error=empty_category");
		}
	}
					   
%>

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
                 <%-- <div id = "search">
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
						  <li><a href="edit.jsp">Edit Job Application Form</a></li>
						  <li><a href="../vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
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
         <div class="feature">
    <%	if(submit==null)
	{
		String sql_get_data="select * from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		agency_id="";
		
		if(rs.next()) 
		{
				
				agency_id=rs.getString("agency_id");
				company_name=rs.getString("agency_name");
				category=rs.getString("nature_business");
				company_website=rs.getString("agency_website");
				sector=rs.getString("agency_profile");
				preferred_date_1=rs.getString("preferred_date_1");
				preferred_date_2=rs.getString("preferred_date_2");
				no_of_executive=""+rs.getInt("no_of_executive");
				shortlist=""+rs.getInt("shortlist");
				cpi=rs.getString("cpi");
				ppt=rs.getString("ppt");
				lcd=rs.getString("lcd");
				laptop=rs.getString("laptop");
				ohp=rs.getString("ohp");
				aptitude_test=rs.getString("aptitude_test");
				aptitude_duration=rs.getString("aptitude_duration");
				gd=rs.getString("gd");
				interview=rs.getString("interview");
				no_of_rounds=rs.getString("no_of_rounds");
				no_of_rooms=rs.getString("no_of_rooms");
				immediate_result_declaration=rs.getString("immediate_result_declaration");
				date_of_result=rs.getString("date_of_result");
				joining_date=rs.getString("joining_date");
				fcp_name=rs.getString("agency_person");
				fcp_email=rs.getString("agency_email");
				company_address=rs.getString("agency_address");
				fcp_phone=rs.getString("agency_phone");
				fcp_fax=rs.getString("agency_fax");
				fcp_designation=rs.getString("fcp_designation");
				fcp_mobile=rs.getString("agency_mobile");
				technical_test=rs.getString("technical_test");
				technical_duration=rs.getString("technical_duration");
				scp_name=rs.getString("scp_name");
				scp_mobile=rs.getString("scp_mobile");
				scp_phone=rs.getString("scp_phone");
				scp_fax=rs.getString("scp_fax");
				scp_email=rs.getString("scp_email");
				scp_designation=rs.getString("scp_designation");
				head_hr_name=rs.getString("head_hr_name");
				head_hr_mobile=rs.getString("head_hr_mobile");
				head_hr_phone=rs.getString("head_hr_phone");
				head_hr_fax=rs.getString("head_hr_fax");
				head_hr_email=rs.getString("head_hr_email");
				head_hr_designation=rs.getString("head_hr_designation");
				company_about=rs.getString("company_about");
				other_requirements=rs.getString("other_requirements");
				
		}
		rs.close();
		db.close();

		/*String sql_get_data1="select * from package_details_temp where agency_id='"+agency_id+"';" ;
		db.connect(); 
		ResultSet rs1= db.execSQL(sql_get_data);
		if(rs1.next()) 
		{
			job_description=rs1.getString("job_description");
			job_designation=rs1.getString("job_designation");
			location_of_posting=rs1.getString("location_of_posting");
			accomodation=rs1.getString("accomodation");
			bond=rs1.getString("bond");
			bond_duration=rs1.getString("bond_duration");
			package_name=rs1.getString("package_name");
			programmes=rs1.getString("programmes");
			vacancy=rs1.getString("vacancy");
			ctc=rs1.getString("ctc");
			
		}
		rs1.close();
		db.close();*/
		
	}
	%>


      <form name="form_company_profile" id="form_company_profile" method="post" onSubmit="return validate_empty();">
        <table width="80%" align="center">
          <tr>
            <td><div class="tabber">
              <div class="tabbertab" id="step[1]" >
                <h2>General Info </h2>
                
                  <p>&nbsp;</p>
                  <table width="600" border="0" align="center">
                    <tr>
                      <td width="300">*Name of the Organization&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td width="411"><label for="company_name"></label>
                      <input type="hidden" name="agency_id"  value="<%=agency_id%>">
                        <input name="company_name" type="hidden" id="company_name" size="45" value="<%=company_name%>"><b><%=company_name%></b></td>
                    </tr>
                    <tr>
                      <td>*Postal Address</td>
                      <td><label for="company_address"></label>
                        <textarea name="company_address" id="company_address" cols="45" rows="5" onkeypress="return alpha(event);" ><%=company_address%></textarea></td>
                    </tr>
                    <tr>
                      <td>*Website</td>
                      <td><label for="company_website"></label>
                      <input name="company_website" type="text" id="company_website" size="60" value="<%=company_website%>" onkeypress="return alpha(event);"></td>
                    </tr>
                    <tr>
                      <td>*Brief Write up on the Organization</td>
                      <td><label for="company_about"></label>
                        <input name="company_about" type="text" id="company_about" size="60" value="<%=company_about%>" onkeypress="return alpha(event);"> </td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <table width="600" border="1" align="center">
                    <tr>
                      <td width="300"><strong>*Type of Organization</strong></td>
                      <td width="300"><strong>*Industry Sector</strong></td>

                    </tr>
                    <tr>
                      <td height="194"><table width="372" border="0">
                        <tr>
                          <td width="153"><input name="category" type="radio" id="category_2" value="Private" <% if(category.equals("Private"))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>Private</strong></td>
                          <td width="209"><input type="radio" name="category" value="MNC(Indian Origin)" id="category_5" <% if(category.equals("MNC(Indian Origin)"))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>MNC(Indian Origin)</strong></td>
                        </tr>
                        <tr>
                          <td><input type="radio" name="category" value="Govt." id="category_3" <% if(category.equals("Govt."))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>Govt.</strong></td>
                          <td><input type="radio" name="category" value="MNC(Foreign origin)" id="category_0" <% if(category.equals("MNC(Foreign origin)"))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>MNC(Foreign origin)</strong></td>
                        </tr>
                        <tr>
                          <td><input type="radio" name="category" value="PSU" id="category_4" <% if(category.equals("PSU"))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>PSU</strong></td>
                          <td><input type="radio" name="category" value="NGO" id="category_1" <% if(category.equals("NGO"))out.println("checked"); %> onClick="return enabletxt();">
                            <strong>NGO</strong></td>
                        </tr>
                      </table>
                        <p><strong>
                          <input type="radio" name="category" value="other" id="category_6" <% if(!(category.equals("NGO")||category.equals("PSU")||category.equals("MNC(Foreign origin)")||category.equals("Govt.")||category.equals("MNC(Indian Origin)")||category.equals("Private")))out.println("checked"); %> onClick="return enabletxt();" >
                          Other:</strong>
                          <input type="text" name="category_other" id="category_other" <% if(!(category.equals("NGO")||category.equals("PSU")||category.equals("MNC(Foreign origin)")||category.equals("Govt.")||category.equals("MNC(Indian Origin)")||category.equals("Private"))){out.println("value='"+category+"' ");} else{out.println(" disabled ");}  %> onkeypress="return alpha(event);" >
                        </p></td>
                      <td><p><br>
                      </p>
                        <table width="350" border="0" align="center">
                          <tr>
                            <td width="136"><label>
                              <input name="sector" type="radio" id="sector_0" value="Core Engg." <% if(sector.equals("Core Engg."))out.println("checked"); %> onClick="return enabletxt2();">
                              Core Engg.</label></td>
                            <td width="204"><label>
                              <input type="radio" name="sector" value="Analytics" id="sector_4" <% if(sector.equals("Analytics"))out.println("checked"); %> onClick="return enabletxt2();">
                              Analytics</label></td>
                          </tr>
                          <tr>
                            <td><label>
                              <input type="radio" name="sector" value="IT" id="sector_1" <% if(sector.equals("IT"))out.println("checked"); %> onClick="return enabletxt2();">
                              IT</label></td>
                            <td><label>
                              <input type="radio" name="sector" value="Management" id="sector_5" <% if(sector.equals("Management"))out.println("checked"); %> onClick="return enabletxt2();">
                              Management</label></td>
                          </tr>
                          <tr>
                            <td><label>
                              <input type="radio" name="sector" value="Finance" id="sector_2" <% if(sector.equals("Finance"))out.println("checked"); %> onClick="return enabletxt2();">
                              Finance</label></td>
                            <td><label>
                              <input type="radio" name="sector" value="Education" id="sector_6" <% if(sector.equals("Education"))out.println("checked"); %> onClick="return enabletxt2();">
                              Education</label></td>
                          </tr>
                          <tr>
                            <td><label>
                              <input type="radio" name="sector" value="Consulting" id="sector_3" <% if(sector.equals("Consulting"))out.println("checked"); %> onClick="return enabletxt2();" >
                              Consulting</label></td>
                            <td><p>&nbsp;</p></td>
                          </tr>
                        </table>
                        <p><strong>
                          <input type="radio" name="sector" value="other" id="sector_7" <% if(!(sector.equals("Consulting")||sector.equals("Education")||sector.equals("Finance")||sector.equals("Management")||sector.equals("IT")||sector.equals("Analytics")||sector.equals("Core Engg.")))out.println("checked"); %>  onClick="return enabletxt2();">
                          Other:</strong>
                          <label for="sector_other"></label>
                          <input type="text" name="sector_other" id="sector_other" <% if(!(sector.equals("Consulting")||sector.equals("Education")||sector.equals("Finance")||sector.equals("Management")||sector.equals("IT")||sector.equals("Analytics")||sector.equals("Core Engg."))){out.println("value='"+sector+"'");}else{out.println(" disabled ");} %> onkeypress="return alpha(event);" >
                          <br>
                        </p></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <table width="600" border="1" align="center">
                    <tr>
                      <td><table width="600" border="0" align="left">
                        <tr>
                          <td><strong>Contact Details:</strong></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><table width="735" border=".5" align="center">
                        <tr>
                          <td width="72">&nbsp;</td>
                          <td width="220"><strong>Head HR</strong></td>
                          <td width="220"><strong>*First Contact Person</strong></td>
                          <td width="220"><strong>Second Contact Person</strong></td>
                        </tr>
                        <tr>
                          <td><strong>Name:</strong></td>
                          <td><label for="head_hr_name"></label>
                            <input type="text" name="head_hr_name" id="head_hr_name" value="<%=head_hr_name%>" onkeypress="return alpha(event);"></td>
                          <td><label for="fcp_name"></label>
                            <input type="text" name="fcp_name" id="fcp_name" value="<%=fcp_name%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_name"></label>
                            <input type="text" name="scp_name" id="scp_name" value="<%=scp_name%>" onkeypress="return alpha(event);"></td>
                        </tr>
                        <tr>
                          <td><strong>Designation:</strong></td>
                          <td><label for="head_hr_designation"></label>
                          <input type="text" name="head_hr_designation" id="head_hr_designation" value="<%=head_hr_designation%>" onkeypress="return alpha(event);"></td>
                          <td><label for="fcp_designation"></label>
                          <input type="text" name="fcp_designation" id="fcp_designation" value="<%=fcp_designation%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_designation"></label>
                            <input type="text" name="scp_designation" id="scp_designation" value="<%=scp_designation%>" onkeypress="return alpha(event);"></td>
                        </tr>
                        <tr>
                          <td><strong>E-mail:</strong></td>
                          <td><label for="head_hr_email"></label>
                            <input type="text" name="head_hr_email" id="head_hr_email" value="<%=head_hr_email%>" onkeypress="return alpha(event);"></td>
                          <td><label for="fcp_email"></label>
                            <input type="text" name="fcp_email" id="fcp_email" value="<%=fcp_email%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_email"></label>
                            <input type="text" name="scp_email" id="scp_email" value="<%=scp_email%>" onkeypress="return alpha(event);"></td>
                        </tr>
                        <tr>
                          <td><strong>Mobile:</strong></td>
                          <td><label for="head_hr_mobile"></label>
                            <input type="text" name="head_hr_mobile" id="head_hr_mobile" value="<%=head_hr_mobile%>" onkeypress="return alpha(event);" ></td>
                          <td><label for="fcp_mobile"></label>
                            <input type="text" name="fcp_mobile" id="fcp_mobile" value="<%=fcp_mobile%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_mobile"></label>
                            <input type="text" name="scp_mobile" id="scp_mobile" value="<%=scp_mobile%>" onkeypress="return alpha(event);"></td>
                        </tr>
                        <tr>
                          <td><strong>Phone:</strong></td>
                          <td><label for="head_hr_phone"></label>
                            <input type="text" name="head_hr_phone" id="head_hr_phone" value="<%=head_hr_phone%>" onkeypress="return alpha(event);"></td>
                          <td><label for="fcp_phone"></label>
                            <input type="text" name="fcp_phone" id="fcp_phone" value="<%=fcp_phone%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_phone"></label>
                            <input type="text" name="scp_phone" id="scp_phone" value="<%=scp_phone%>" onkeypress="return alpha(event);"></td>
                        </tr>
                        <tr>
                          <td><strong>Fax:</strong></td>
                          <td><label for="head_hr_fax"></label>
                            <input type="text" name="head_hr_fax" id="head_hr_fax" value="<%=head_hr_fax%>" onkeypress="return alpha(event);"></td>
                          <td><label for="fcp_fax"></label>
                            <input type="text" name="fcp_fax" id="fcp_fax" value="<%=fcp_fax%>" onkeypress="return alpha(event);"></td>
                          <td><label for="scp_fax"></label>
                            <input type="text" name="scp_fax" id="scp_fax" value="<%=scp_fax%>" onkeypress="return alpha(event);"></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
              </div>
              <div class="tabbertab" id="step[2]">
                <h2>Selection Procedure              </h2>
                <p>&nbsp;</p>
                <center>
                  <table width="640" align="center" cellpadding="5" cellspacing="5">
                    
                    <tr>
                      <td width="350">*Preferred period of visit for recruitment</td>
                      <td >
                        <input readonly type="text" name="preferred_date_1" id="preferred_date_1"  onclick="displayCalendar(document.forms[0].preferred_date_1,'dd-mm-yyyy',this)" value="<%=sql_convert_date(preferred_date_1)%>">
                        (From)</td>
                      <tr>
                        <td >&nbsp;</td>
                        <td >
                          <input readonly type="text" name="preferred_date_2" id="preferred_date_2" onclick="displayCalendar(document.forms[0].preferred_date_2,'dd-mm-yyyy',this)" value="<%=sql_convert_date(preferred_date_2)%>">
                          (To)</td>
                      </tr>
                    <tr>
                      <td >*PPT</td>
                      <td ><label>
                        <input name="ppt" id="ppt" type="radio" value="1" onClick="activate3(this,'checkbox')" <%if(ppt.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="ppt" type="radio" id="ppt" onClick="activate5(this,'checkbox')" value="0" <%if(ppt.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td ><input type="checkbox" name="checkbox" id="checkbox" disabled="disabled" onClick="activate(this,'checkbox2','checkbox3','checkbox4')"value="1" <%if(ppt.equals("1"))out.println("checked");%>>
                        Equipments (for ppt) </td>
                      <td ><table>
                        <tr>
                          <td><label>
                            <input name="checkbox2" type="checkbox" disabled="disabled" id="checkbox2" value="1" <%if(lcd.equals("1"))out.println("checked");%>>
                            </label>
                            LCD </td>
                          <td><label>
                            <input name="checkbox3" type="checkbox" disabled="disabled" id="checkbox3"  value="1" <%if(laptop.equals("1"))out.println("checked");%>>
                            </label>
                            LAPTOP </td>
                          
                          </tr>
                        </table></td>
                      </tr>
                    <tr>
                      <td >*Group Discussion</td>
                      <td ><label>
                        <input name="gd" id="gd" type="radio" value="1" <%if(gd.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="gd" type="radio" id="gd" value="0" <%if(gd.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >*Written Test (Technical/Aptitude)</td>
                      <td ><label>
                        <input name="aptitude_test" id="aptitude_test" type="radio" value="1" <%if(aptitude_test.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="aptitude_test" id="aptitude_test" type="radio" value="0" <%if(aptitude_test.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >*Online Test</td>
                      <td ><label>
                        <input name="technical_test" id="technical_test" type="radio" value="1" <%if(technical_test.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="technical_test" id="aptitude_test" type="radio" value="0" <%if(technical_test.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >*Personal Interview</td>
                      <td ><label>
                        <input name="interview" id="interview" type="radio" value="1" <%if(interview.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="interview" id="interview" type="radio" value="0" <%if(interview.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td  >*No. of rounds </td>
                      <td  ><input type="text" name="no_of_rounds" value=<%=no_of_rounds%> id="no_of_rounds" onkeypress="return alpha(event);" ></td>
                      </tr>
                    <tr>
                      <td  >*No. of rooms required</td>
                      <td  ><input type="text" name="no_of_rooms" value=<%=no_of_rooms%> id="no_of_rooms" onkeypress="return alpha(event);"></td>
                      </tr>
                    <tr>
                      <td  >*No. of executives </td>
                      <td  ><input type="text" name="no_of_executive" id="no_of_executive" value=<%=no_of_executive%> onkeypress="return alpha(event);"></td>
                    </tr>
                    <tr>
                      <td  >Other Requirements</td>
                      <td  ><input type="text" name="other_requirements" id="other_requirements" value="<%=other_requirements%>" onkeypress="return alpha(event);" ></td>
                    </tr>
                    </table>
                </center>
              </div>         
              <div class="tabbertab" id="step[3]">
                <h2>Profile Status</h2>
                <p>&nbsp;</p>
                
<%
				
				
				out.println("<table width='640' border='0' cellspacing='5' cellpadding='5'>");
				  out.println("<tr>");
				    //out.println("<th>S.No</th>");
				    out.println("<th>Approved Profiles</th>");
				    out.println("<th>Temporary Profiles</th>");
				    out.println("</tr>");

				  String get_appr="select package_name,package_id from package_details where agency_id='"+agency_id+"'; ";
                  db.connect();
				  ResultSet appr=db.execSQL(get_appr);
				  
				  out.println("<tr><td>");
				  while(appr.next() && appr!=null)
				  {
				 // ResultSet temp=db.execSQL("select package_name from package_details_temp where agency_id="+agency_id);
				  String approved_package="";
				  approved_package=""+appr.getString("package_name");
				  //String temporary_package="";
				  //temporary_package=""+temp.getString("package_name");
				  out.println("<br/><a href=\"vacancy_appr.jsp?id="+appr.getInt("package_id")+"\">"+approved_package+"</a>");
					
				  //temp.close();	  
				  }
				  appr.close();
 					out.println("</td><td>");
					ResultSet temp=db.execSQL("select package_name,package_id from package_details_temp where agency_id="+agency_id);
					while(temp.next()&&temp!=null)
					{
						out.println("<br/><a href=\"vacancy_temp.jsp?id="+temp.getInt("package_id")+"\">"+temp.getString(1)+"</a>");
					}
					temp.close();
 					out.println("</td></tr>");
					db.close();
 
 
 
 %>                
 
 
 
 
                  <tr>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    </tr>
				  </table>
              </div>
              
            </div></td>
          </tr>
          <tr>
            <td align="right"></tr>
          </td>
        </table>
        <table align="center"><tr><td>
        <input type="submit" name="submit" id="submit" value="Submit"></td></tr></table>
        <p>&nbsp;</p>
<p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
      </form>
      <p align="center">&nbsp;</p>
    </div>
              </div>
              <div id = "footer">
              <span>&#169; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
            </div>
        </div>
</body>
</html>
