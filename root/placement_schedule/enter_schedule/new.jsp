<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" rel="stylesheet" href="dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
<SCRIPT type="text/javascript" src="dhtmlgoodies_calendar.js?random=20060118"></script>
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript" src="../../js/tabber.js"></script>
<link rel="stylesheet" href="../../js/example.css" TYPE="text/css" MEDIA="screen">
<script type="text/javascript">

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


function checkhour(item,itm)
{     
     	if(item=="")
        {
		itm.value="";
        }
	else if(parseInt(item,10)>12 || parseInt(item,10)<1)
	{
               alert(parseInt(item,10));
	       itm.value="12";
	} 
}

function checkmin(item)
{
	if(item.value=="")
		item.value="";
	else if(parseInt(item.value,10)>59 || parseInt(item.value,10)<0)
	{		
		item.value="00";
	}
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
    for(i = 0; i < document.form_placement_record.elements.length; i++)
    {
		//alert("i="+i);
        document.form_placement_record.elements[i].value=alltrim(document.form_placement_record.elements[i].value);
    }
}

function validate_empty()
{	

	var message="";

	findall();
        
         
	if(document.form_placement_record.dob.value=="")
		message+="Please enter Date From\n";
	if(document.form_placement_record.dob_to.value=="")
		message+="Please enter Date To\n";
	if(document.form_placement_record.company_name.value=="")
		message+="Please enter Company profile name\n";
		
	
	if(message=="")
	{
		document.form_placement_record.action="new.jsp";
		return true;
	}
	else
	{
		alert(message);
		document.form_placement_record.action=null;
		return false;
	}
}	 


</script>

<script src="../../js/datetimepicker.js"></script>
</head>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/sql_convert_date.jsp"%>
<%@ include file="../../utils/sql_convert_year.jsp"%>
<%@ include file="../../utils/sql_convert_day.jsp"%>
<%@ include file="../../utils/sql_convert_month.jsp"%>

<%@ include file="../../utils/session_validator.jsp"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	
%>
<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placemeny Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
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
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../../placement_record/main.jsp">Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp" >Change Date Requests</a>
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
<%
        db.fetchConfigDetails(); //newly added
     
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
        String click=request.getParameter("click");
	String submit=request.getParameter("submit");
        String dob=request.getParameter("dob");
        String dob_to=request.getParameter("dob_to");
	String starting_time="";
	String end_time="";
        String hours=request.getParameter("hours");
        String mins=request.getParameter("mins");
        String am_pm=request.getParameter("am_pm");
        String hours1=request.getParameter("hours1");
        String mins1=request.getParameter("mins1");
        String am_pm1=request.getParameter("am_pm1");
	String company_name=request.getParameter("company_name"); // Here company_name will actually store agency_id
	String description=request.getParameter("description");
	String venue=request.getParameter("venue");
	String eligibility_criteria=request.getParameter("eligibility_criteria");
	String departments=request.getParameter("departments");

        

     if(submit!=null)
		{	

			db.connect();
			starting_time+=hours+":"+mins+" "+am_pm ;
			end_time+=hours1+":"+mins1+" "+am_pm1 ;
			//String year=sql_convert_year(dob);
                        //String day=sql_convert_day(dob);
                       // String month=sql_convert_month(dob);

			//String year_to=sql_convert_year(dob_to);
                        //String day_to=sql_convert_day(dob_to);
                        //String month_to=sql_convert_month(dob_to);

                        int num_rows=0;
			int pk_id=0;
                        String pack_name="";
			//int agnsy_id=0;

		      ResultSet rs=db.execSQL("select package_name,package_id from package_details where agency_id="+Integer.parseInt(company_name)+";");
		      if(rs.next())
                      {
			  pack_name=rs.getString("package_name");
			  pk_id=rs.getInt(2);
		      }
                     
			//String main_record=" insert into schedule(month,day,year,starting_time,end_time,company_profile,description,venue,eligibility_criteria,departments,agency_id,package_id)"+" values ('"+month+"','"+day+"','"+year+"','"+starting_time+"','"+end_time+"','"+pack_name+"','"+description+"','"+venue+"','"+eligibility_criteria+"','"+departments+"',"+Integer.parseInt(company_name)+","+pk_id+");";
			String main_record=" insert into schedule(date_from,starting_time,date_to,end_time,company_profile,description,venue,eligibility_criteria,departments,agency_id,package_id)"+" values ('"+dob+"','"+starting_time+"','"+dob_to+"','"+end_time+"','"+pack_name+"','"+description+"','"+venue+"','"+eligibility_criteria+"','"+departments+"',"+Integer.parseInt(company_name)+","+pk_id+");";	
								
				
				num_rows=db.updateSQL(main_record);
				db.close();	
				if(num_rows==1 )
					{									
					  response.sendRedirect("success.jsp");					 
					}
				else
					response.sendRedirect("error.jsp");

		
	}
if(click!=null)
 {
       response.sendRedirect("oldschedule.jsp?company_name="+company_name);
 }

%>

</td>
<form method="post" name="form_placement_record" id="form_placement_record" onSubmit="return validate_empty()" >
  <p align="center"> <strong> Please Fill All The Fields </strong></p>
  <table width="560" height="399" align="center">
    <tr>
       <td>*Date From</td>
       <td>
       <input readonly type="text" name="dob" id="dob" onclick="displayCalendar(document.forms[1].dob,'dd-mm-yyyy',this)" value="" >
       </td>
    </tr>
    <tr>
      <td>Start Time</td>
      <td><input type="text" name="hours" id="hours" value="00" onBlur="checkhour(this.value,this)" size="3">
          :<input type="text" name="mins" id="mins" value="00" onBlur="checkmin(this)" size="3">
           <select name="am_pm" id="am_pm"> <option value="AM">AM</option><option value="PM">PM</option></select>
     </td>
    </tr>
    <tr>
       <td>*Date To</td>
       <td>
       <input readonly type="text" name="dob_to" id="dob_to" onclick="displayCalendar(document.forms[1].dob_to,'dd-mm-yyyy',this)" value="" >
       </td>
    </tr>

    <tr>
      <td >End Time</td>
      <td><input type="text" name="hours1" id="hours1" value="00" onkeyup="checkhour(this)" size="3">
          :<input type="text" name="mins1" id="mins1" value="00" onkeyup="checkmin(this)" size="3">
           <select name="am_pm1" id="am_pm1"> <option value="AM">AM</option><option value="PM">PM</option></select>
      </td>
    </tr>
    <tr>
      <td >*Company Profile</td>
      <td >
     <%! String agency_list ;%>
<%
   db.connect();
   //agency_list =drop_down("select pd.package_name,pd.agency_id,a.agency_name from package_details as pd, agency as a where pd.agency_id=a.agency_id order by pd.agency_id;",db) ; 
   ResultSet rs_agency_lst=db.execSQL("select pd.package_name,pd.agency_id,a.agency_name from package_details as pd, agency as a where pd.agency_id=a.agency_id order by pd.agency_id;"); 
  %>
   <select name="company_name" id="company_name">
   <option value="">--------------Company Name/Profile Name------------</option>
  <%
    while(rs_agency_lst.next())
    {
      out.println("<option value='"+rs_agency_lst.getString(2)+"'>"+rs_agency_lst.getString(3)+" / "+rs_agency_lst.getString(1)+"</option>"); 
    }
    rs_agency_lst.close();
    db.close();
  %>
 <%//=agency_list%>
  </select>
</td><td><input type="submit" name="click" value="Click for previous schedule"></td>
    </tr>
    <tr>
      <td >Description</td>
      <td ><p>
        <input type="text" name="description" id="description">
      </p>        </td>
    </tr>
    <tr>
      <td >Venue</td>
      <td ><label>
        <input type="text" name="venue" id="venue">
      </label></td>
    </tr>
    <tr>
      <td >Eligibility Criteria </td>
      <td ><label>
        <input type="text" name="eligibility_criteria" id="eligibility_criteria">
      </label></td>
    </tr>

    <tr>

      <td >Departments </td>
      <td >
        <input type="text" name="departments" id="departments">
      </td>
    </tr>
<tr>
      <td >
        <input type="hidden" name="hiddenTextBox">
      </td>
    </tr>
  </table>
  .
  <table width="76" height="32" border="0" align="center">
    <tr>
      <td><input class="center" type="submit" value="Submit" name="submit"  id="submit" size="15" ></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
<tr>
  <td colspan="2" height="20">   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    GCom  </div> </td></tr></table>
</div> 
<!--end pagecell1--> 
</div>
</div>
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
