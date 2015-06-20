<html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
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
    for(i = 0; i < document.form_agency_registration.elements.length; i++)
    {
		//alert("i="+i);
        document.form_agency_registration.elements[i].value=alltrim(document.form_agency_registration.elements[i].value);
    }
}


function call_xml_http_request1(data , url , div_tag_name)
{
	var arr = new Array(2);
  
    arr[0] = 1;



	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("agency_name").value;


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'2',url ,div_tag_name );
	//alert("hurray");
}


function activate(check_box,activate_tag)
{
	if(check_box.checked==1)
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
		document.getElementById(activate_tag).disabled=true;
}


function get_data()
{//alert("hi"+validate_empty("form_query_placement"));
	if(validate_empty("form_query_placement"))
	{//alert("rohan1");
		call_xml_http_request1('data','get_details1.jsp','div_get_placement_details');
		sortables_init();
		//alert("rohan");
	}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

   //alert(ptr.student_roll_number.value.length);
	   if (ptr.agency_name.value== null)
   		{
  			 message+="Please select the Agency name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.agency_name.select();
			 }
		}
   

 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 {//alert("hi");
		return true;
	 }

}
 
 


</script>

<script src="../../js/datetimepicker.js"></script>
<script src="../../js/xmlhttprequest.js"></script>
<script src="../../js/sorttable.js"></script>

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
  </div>
  <div id="content"> 
    <div class="feature">
 <p>&nbsp;</p>
  <table align="center">
    <tr>
      <td> </td>
      <td></td>
    </tr>
    <td><div name="agency_name_details" id="agency_name_details">    
<%
	
	String submit=request.getParameter("submit");
        String agen_name=request.getParameter("agency_name");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	out.println(display1+"Following Students are eligible and are interested in "+agen_name+display2);   
	out.println("<table border='0' name='table_query_placement_details'"+
	"id='table_query_placement_details' class='sortable' cellpadding='5'>");
	out.println("<tr>");
	out.println("<th>Sl.No.</th>");
	
	out.println("<th>Student Roll Number</th>");
	out.println("<th>Student Name</th>");
	out.println("<th>Current cpi</th>");
	out.println("<th>Department</th>");
	out.println("<th>Programme</th>");
        out.println("<th>Remark</th>");
	out.println("</tr>");
	
	String get_cpi="select package_id from package_details where package_name='"+agen_name+"';";
	db.connect();
	ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
	
	String package_id="";
	if(re.next())
		package_id=""+re.getInt("package_id");
	re.close();
	db.close();
	

	db.connect();
	int i=1;
	ResultSet ra=db.execSQL("select student_id from interested_students where package_id="+package_id+";");
	while(ra.next())
	{
		ResultSet rs=db.execSQL("select student_roll_number,student_name,cpi_6sem,cpi_2sem,program_name,programme_id,email,email_alternative,contact_number,contact_number2,x_percentage,xii_percentage,program_id,department_id from student_record where student_id= "+ra.getInt(1)+" and is_activated=1;");
		if(rs.next())
		{ 

					      String st_dept_name="NA";
					      String st_pg_name="NA";
					      int st_department_id=rs.getInt("department_id");
					      int st_program_id=rs.getInt("program_id");

					     // System.out.println("dept_id: "+st_department_id+", prog id: "+st_program_id);
					      ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
					      if(st_dept.next())
					      st_dept_name=st_dept.getString(1);
					      ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
					      if(st_pg.next())
					      st_pg_name=st_pg.getString(1);



           
                  String sql_temp="select status from eligible_students where student_id='"+ra.getString(1)+"' and package_id="+package_id+";";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
                                     if(rr.next())
                                      {
                                            status=rr.getInt(1);
                                      }                                     

                                      rr.close();
                                                   
			
			out.println("<tr><td>"+i+"</td><td>"+rs.getInt("student_roll_number")+"</td><td>"+rs.getString("student_name")+"</td><td>");
			
			if(rs.getInt("programme_id")==1||rs.getInt("programme_id")==2)
			{
				out.println(rs.getString("cpi_6sem")+"</td>");
				
			}
			else
			{
				out.println(rs.getString("cpi_2sem")+"</td>");
				
			}
			out.println("<td>"+st_dept_name+"</td>");
			out.println("<td>"+st_pg_name+"</td>");
			
                        if(status==1)
                          out.println("<td>"+"Already placed"+"</td></tr>");
                        else
                          out.println("</tr>");
			i++;
		}
		rs.close();
	}
	ra.close();
	db.close();  
	
	
%>

  
    </div></td></tr>												
	</table>
<table width="76" height="32" border="0" align="center">
    <tr>
      <td><form method="post" action="get_csv.jsp?agen_name=<%=package_id%>"><input type="submit" name="submit" value="Get CSV"></form></td>
    </tr>
  </table>
  <p>&nbsp;</p>

<div name='div_get_placement_details' id='div_get_placement_details'></div>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </div> 
  </div>

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
