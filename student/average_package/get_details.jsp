<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">


function validate_empty(ptr_name)
{alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);


	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please select  department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			     //	ptr.department_name.select();
			 }
		}
 if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please select  program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
			    //	ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return false ;
	 } 
	 else
	 { //alert(message);
		return true;
	 }

}


</script>





</head>
<body onLoad="document.form_query_placement.agency_name.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>

<body onmousemove="closesubnav(event);"> 
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1>
 <div id="utility"> <a href="http://www.iitg.ernet.in">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement">Placement Cell</a> | <a href="http://webmail.iitg.ernet.in">Webmail</a> </div>
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
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
  <img alt="small logo" src="../images/logo-top.gif" height="116" width="115"/></div> 
  <div id="pageNav"> 
  <div id="sectionLinks"> 
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp" >Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp" >Check Eligibility</a>
      <a href="../schedule/agency_date.jsp" >Organization Dates</a>
      <a href="../companies_visiting/list.jsp">Companies Visiting</a>
      <a href="../agency_query/placement_query.jsp" >Company Details</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
   <%--   <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a>
      <img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" />
    </div>
</div></td>

  <p align="center">
    <strong>Average package details are as follows</strong></p>
    <%
        db.fetchConfigDetails(); //newly added	
 
	   String department_name=request.getParameter("department_name");
	   String programme_name=request.getParameter("programme_name");
	   String submit=request.getParameter("submit");
	

		if(submit!=null && department_name!=null && programme_name!=null)
		{
			        double total_ctc=0.0;
        int dept_id=0;
        int prog_id=0;
		int i=1;
	   String display1="<div align='center' class='result'>" ;
	   String display2="<br></div>" ;

       out.println("<table align='center' cellpadding='5' cellspacing='5' border='0' name='table_query_placement_details'"+"id='table_query_placement_details' class='sortable' >");
       out.println("<tr>");
   	   out.println("<th>Sl.No.</th>");
       out.println("<th>Department</th>");
	   out.println("<th>Programme</th>");
	   out.println("<th>Registered Students</th>");
	   out.println("<th>Placed Students</th>");
	   out.println("<th>% Placed </th>");
	   out.println("<th>Average Package</th>");
       out.println("</tr>");
		String get_deptname="select department_id from department_record where department_name='"+department_name+"';";
        db.connect();
        ResultSet rd=db.execSQL(get_deptname);
        rd.next();
    	dept_id=rd.getInt(1);
        rd.close();
        db.close();
        
        
       String get_progname="select programme_id from programme_record where programme_name='"+programme_name+"';";
        db.connect();
        ResultSet rp=db.execSQL(get_progname);
        rp.next();
        prog_id=rp.getInt(1);
        rp.close();
        db.close();

        String stud_id="select student_id, package_id from placement_record;";
        db.connect();
        ResultSet rs=db.execSQL(stud_id);
        int student_id=0;
		int package_id=0;
		double placed=0;
		double percent=0;
	    double avg_package=0;
		int  reg_stud=0;
		
    	while(rs.next())
	    {
			student_id=rs.getInt(1);
			package_id=rs.getInt(2);
			int department_id=0;
			int programme_id=0;
			double ctc=0;
			
		
			String sql_query="select department_id, programme_id , ctc from package_details where package_id='"+package_id+"';";
			db.connect();
			ResultSet raw=db.execSQL(sql_query);
			if(raw.next())
			{
				department_id=raw.getInt(1);
				programme_id=raw.getInt(2);
				ctc=raw.getDouble(3);
				
				if(department_id==dept_id && programme_id==prog_id)
				{
					placed=placed+1;
					total_ctc=total_ctc+ctc;
				}
			}
			raw.close();
			db.close();

			
			String get_reg_stud="select count(*) from student_record where department_id='"+dept_id+"' and programme_id='"+prog_id+"';";
       	    db.connect();
        	ResultSet rod=db.execSQL(get_reg_stud);
        	rod.next();
        	reg_stud=rod.getInt(1);
        	rod.close();
        	db.close();
		}

		
			if(placed!=0)
			avg_package=total_ctc/placed;
			else
			avg_package=0;
			if(reg_stud!=0)
			{
			percent=(placed/reg_stud)*100;
		
			}
			if(reg_stud==0)
			percent=0;
			
		


   
   out.println("<tr><td>"+i+"</td><td>"+department_name+"</td><td>"+programme_name+"</td><td>"+reg_stud+"</td><td>"+placed+"</td><td>"+percent+"</td><td>"+avg_package+"</td></tr>");
   
  			i++;
			placed=0;
			rs.close();
			db.close();

	out.println("</table>");
		}

%>
  




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
