<html>
<head>
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
	String agency_profile=request.getParameter("agency_profile");
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
    String nature_business=request.getParameter("nature_business");

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
	

	if(submit!=null && agency_name!=null)
		{					

			
			String main_record=" update agency set agency_address='"+agency_address+"' ,agency_website='"+agency_website+"' ,agency_phone='"+agency_phone+"' ,agency_mobile='"+agency_mobile+"' ,agency_fax='"+agency_fax+"' ,agency_email='"+agency_email+"' ,agency_person='"+agency_person+"' ,agency_profile='"+agency_profile+"' ,shortlist="+shortlist+" ,ppt="+ppt+" ,gd="+gd+" ,aptitude_test="+aptitude_test+" ,technical_test="+technical_test+" ,interview="+interview+" ,immediate_result_declaration="+immediate_result_declaration+" ,no_of_rounds="+no_of_rounds+" ,no_of_rooms="+no_of_rooms+" ,no_of_executive="+no_of_executive+",technical_duration="+technical_duration+" ,aptitude_duration="+aptitude_duration+" ,cpi="+cpi+" ,preferred_date_1='"+sql_convert_date(preferred_date_1)+"' ,preferred_date_2='"+sql_convert_date(preferred_date_2)+"' ,date_of_result='"+sql_convert_date(date_of_result)+"' ,joining_date='"+sql_convert_date(joining_date)+"' ,nature_business='"+nature_business+"' ,lcd="+Integer.parseInt(lcd)+",laptop="+Integer.parseInt(laptop)+",ohp="+Integer.parseInt(ohp)+" where agency_name='"+agency_name+"';";
			
			
			db.connect();
			int num_rows=db.updateSQL(main_record);
			db.close();         	
			if(num_rows==1)
			{
				response.sendRedirect("success.jsp");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
			
		}

					   

%>
<body background="form/New/jee3.jpg">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a></div>
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
    <h2>Welcome , <%=username%></h2>
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
	  <a href="../instructions.jsp">Instructions</a>
      <a href="../agency_details/register.jsp">Job Application Form</a>
      <a href="edit.jsp">Edit Job Application Form</a>
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
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
				agency_name=rs.getString("agency_name");
				nature_business=rs.getString("nature_business");
				agency_website=rs.getString("agency_website");
				agency_profile=rs.getString("agency_profile");
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
				agency_person=rs.getString("agency_person");
				agency_email=rs.getString("agency_email");
				agency_address=rs.getString("agency_address");
				agency_phone=rs.getString("agency_phone");
				agency_fax=rs.getString("agency_fax");
				agency_mobile=rs.getString("agency_mobile");
				technical_test=rs.getString("technical_test");
				technical_duration=rs.getString("technical_duration");
				
		}
		rs.close();
		db.close();
		
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
                      <td ><input type="text"  name="agency_name" value="<%=agency_name%>"></td>
                    </tr>
                    <tr>
                      <td height="10" >Website</td>
                      <td ><input type="text" name="agency_website" value="<%=agency_website%>" ></td>
                    </tr>
                    <tr>
                      <td height="37">Nature of Business</td>
                      <td><input name="nature_business" value="<%=nature_business%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="34">Company profile </td>
                      <td ><select name="agency_profile" id="agency_profile" >
                        <%!String profile_list;%>
                        <% profile_list=drop_down("select profile_name from profile;",db); %>
                        <option value="<%=agency_profile%>"><%=agency_profile%></option>
                        <%=profile_list%>
                      </select></td>
                    </tr>
                    <tr>
                     <td height="36" Width="350">Contact Person</td>
                      <td ><input name="agency_person" value="<%=agency_person%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="42" >E-Mail  Address </td>
                      <td ><input name="agency_email" value="<%=agency_email%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="123" >Contact address </td>
                      <td ><textarea name="agency_address" cols="30" rows="5"><%=agency_address%></textarea></td>
                    </tr>
                    <tr>
                      <td height="38" >Agency Phone </td>
                      <td ><input name="agency_phone" value="<%=agency_phone%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="38" >Agency Mobile </td>
                      <td ><input name="agency_mobile" value="<%=agency_mobile%>" type="text"></td>
                    </tr>
                    <tr>
                      <td height="41" >Agency FAX </td>
                      <td ><input name="agency_fax" value="<%=agency_fax%>" type="text"></td>
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
                        <input readonly type="text" name="preferred_date_1" id="preferred_date_1" value="<%=sql_convert_date(preferred_date_1)%>">
                        </a>(dd-mm-yyyy)</td>
                      <tr>
                        <td >Preferred Date 2 for Recruitmentt:</td>
                        <td ><a href="javascript:NewCal('preferred_date_2','ddmmyyyy')" >
                          <input readonly type="text" name="preferred_date_2" id="preferred_date_2" value="<%=sql_convert_date(preferred_date_2)%>">
                          </a> (dd-mm-yyyy)</td>
                      </tr>
                    <tr>
                      <td  >No. of executives </td>
                      <td  ><input type="text" name="no_of_executive" id="no_of_executive" value=<%=no_of_executive%>></td>
                      </tr>
                    <tr>
                      <td >Shortlist from Resumes</td>
                      <td ><label>
                        <input name="shortlist" type="radio" id="shortlist" onClick="activate3(this,'cpi')" value="1" <%if(shortlist.equals("1")){out.println("checked");}%>>
                        </label>
                        Yes
                        <label>
                          <input name="shortlist" id="shortlist" type="radio" value="0" onClick="activate5(this,'cpi')" <%if(shortlist.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td  >Cpi(minimum):</td>
                      <td  ><input type="text" name="cpi" id="cpi" value="<%=cpi%>" disabled="disabled"></td>
                      </tr>
                    <tr>
                      <td >PPT</td>
                      <td ><label>
                        <input name="ppt" id="ppt" type="radio" value="1" onClick="activate3(this,'checkbox')" <%if(ppt.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="ppt" id="ppt" type="radio" value="0" onClick="activate5(this,'checkbox')" <%if(ppt.equals("0"))out.println("checked");%>>
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
                          <td><label>
                            <input name="checkbox4" type="checkbox" disabled="disabled" id="checkbox4"  value="1" <%if(ohp.equals("1"))out.println("checked");%>>
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
                        <input name="gd" id="gd" type="radio" value="1" <%if(gd.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="gd" id="gd" type="radio" value="0" <%if(gd.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Aptitude test </td>
                      <td ><label>
                        <input name="aptitude_test" id="aptitude_test" type="radio" value="1" onClick="activate3(this,'aptitude_duration')" <%if(aptitude_test.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="aptitude_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'aptitude_duration')" <%if(aptitude_test.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Aptitude duration (in minutes)</td>
                      <td><input type="text" name="aptitude_duration" size="10" id="aptitude_duration" disabled="disabled" value="<%=aptitude_duration%>"></td>
                      </tr>
                    <tr>
                      <td >Technical Test </td>
                      <td ><label>
                        <input name="technical_test" id="technical_test" type="radio" value="1" onClick="activate3(this,'technical_duration')" <%if(technical_test.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="technical_test" id="aptitude_test" type="radio" value="0" onClick="activate5(this,'technical_duration')" <%if(technical_test.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Technical duration (in minutes)</td>
                      <td><input type="text" name="technical_duration" size="10" id="technical_duration" disabled="disabled" value="<%=technical_duration%>"></td>
                      </tr>
                    <tr>
                      <td >Interview</td>
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
                      <td  >No. of rounds </td>
                      <td  ><input type="text" name="no_of_rounds" value=<%=no_of_rounds%> id="no_of_rounds"></td>
                      </tr>
                    <tr>
                      <td  >No. of rooms </td>
                      <td  ><input type="text" name="no_of_rooms" value=<%=no_of_rooms%> id="no_of_rooms"></td>
                      </tr>
                    <tr>
                      <td >Immediate result declaration </td>
                      <td ><label>
                        <input name="immediate_result_declaration" id="immediate_result_declaration" type="radio" value="1"  <%if(immediate_result_declaration.equals("1"))out.println("checked");%>>
                        </label>
                        Yes
                        <label>
                          <input name="immediate_result_declaration" id="immediate_result_declaration" type="radio" value="0" <%if(immediate_result_declaration.equals("0"))out.println("checked");%>>
                          </label>
                        NO</td>
                      </tr>
                    <tr>
                      <td >Date of result:</td>
                      <td ><a href="javascript:NewCal('date_of_result','ddmmyyyy')" >
                        <input readonly type="text" name="date_of_result" id="date_of_result" value="<%=sql_convert_date(date_of_result)%>">
                        </a> (dd-mm-yyyy)</td>
                      </tr>
                    <tr>
                      <td >Joining Date:</td>
                      <td ><a href="javascript:NewCal('joining_date','ddmmyyyy')" >
                        <input readonly  type="text" name="joining_date" id="joining_date" value="<%=sql_convert_date(joining_date)%>">
                        </a> (dd-mm-yyyy)</td>
                      </tr>
                    </table>
                </center>
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

