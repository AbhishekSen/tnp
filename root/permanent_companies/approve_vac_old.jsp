<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,java.util.Properties,javax.mail.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
<script type="text/javascript">

/*function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
   

 if (message.length > 0)
 {
    alert(message);
    return false ;
 } 
 else
 {
	return true;
 }

}*/

</script>


</head>


<body onLoad="document.form_placement_record.agency_name.focus();">
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
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
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
 </td>
 <%
        db.fetchConfigDetails(); //newly added
 	String pack_id=request.getParameter("id");
	String job_description="";
	String job_designation="";
	String location_of_posting="";
	String accomodation="";
	String bond="";
	String bond_duration="";
	String package_name="";
	String old_package_id="";
	String vacancy="";
	String ctc="";
	String ctc_mtech="";
        String ctc_msc="";
        String ctc_ma="";
        String ctc_phd="";
	String package_id="";
	String agency_id="";
	String submit=request.getParameter("submit");
	String remove=request.getParameter("remove");
	String shortlist="";
	String cpi="";
	String cpi_other="";
	String bond_details="";
        String x_percentage="";
        String xii_percentage="";
        String bonus="";
        String gross="";
        String gross_mtech="";
        String gross_msc="";
        String gross_ma="";
        String gross_phd="";
        String take_home_during="";
        String take_home_after="";
	String temp_curr="";
	//progs=new int[50];
	int ag_id=0;
	try{
	if(pack_id==null)
	{response.sendRedirect("approve.jsp");}
	else if(pack_id!=null&&remove!=null)
	{
		db.connect();
		int s=0;
		int s1=0;
		int s2=0;
		s=db.updateSQL("delete from package_extra_details_temp where package_id="+pack_id+";");
		s1=db.updateSQL("delete from package_details_temp where package_id="+pack_id+";");
		s2=db.updateSQL("delete from minor_details_temp where package_id="+pack_id+";");

		db.close();
		if(s!=0&&s1!=0 && s2!=0){
			//response.sendRedirect("success_d.jsp");
			response.sendRedirect("success.jsp");
			}
		else{
			//response.sendRedirect("error_d.jsp");
			response.sendRedirect("error.jsp");}
	}
	else if(pack_id!=null&&submit==null&&remove==null)
	{
		db.connect();
		ResultSet rs=db.execSQL("select * from package_details_temp where package_id="+pack_id+";");
		if(rs.next()&&rs!=null)
		{
			job_description=rs.getString("job_description");
			job_designation=rs.getString("job_designation");
			location_of_posting=rs.getString("location_of_posting");
			accomodation=""+rs.getInt("accomodation");
			bond=""+rs.getInt("bond");
			package_name=rs.getString("package_name");
			ctc=""+rs.getFloat("ctc");
			ctc_mtech=rs.getString("ctc_mtech");
                        ctc_msc=rs.getString("ctc_msc");
                        ctc_ma=rs.getString("ctc_ma");
                        ctc_phd=rs.getString("ctc_phd");
			old_package_id=""+rs.getInt("old_package_id");
			vacancy=""+rs.getInt("vacancy");
			bond_duration=rs.getString("bond_duration");
			package_id=""+rs.getInt("package_id");
			agency_id=""+rs.getInt("agency_id");
			cpi=rs.getString("cpi");
			cpi_other=rs.getString("cpi_other");
			bond_details=rs.getString("bond_details");
			shortlist=rs.getString("shortlist");
                        x_percentage=rs.getString("x_percentage");
                        xii_percentage=rs.getString("xii_percentage");
		}
		rs.close();


		ResultSet rs_curr=db.execSQL("select pay_mode_temp from agency_currency where agency_id="+agency_id+" and package_id_temp="+pack_id+";");
		if(rs_curr.next())
		{
			temp_curr=rs_curr.getString("pay_mode_temp");
		}
		rs_curr.close();
		db.close();
	}
	else if(pack_id!=null&&submit!=null)
	{
		db.connect();
		ResultSet rs3=db.execSQL("select * from package_details_temp where package_id="+pack_id+";");
		if(rs3.next())
		{
			old_package_id=rs3.getString("old_package_id");
			job_description=rs3.getString("job_description");
			job_designation=rs3.getString("job_designation");
			location_of_posting=rs3.getString("location_of_posting");
			accomodation=""+rs3.getInt("accomodation");
			bond=""+rs3.getInt("bond");
			package_name=rs3.getString("package_name");
			ctc=""+rs3.getFloat("ctc");
			ctc_mtech=rs3.getString("ctc_mtech");
                        ctc_msc=rs3.getString("ctc_msc");
                        ctc_ma=rs3.getString("ctc_ma");
                        ctc_phd=rs3.getString("ctc_phd");
			old_package_id=""+rs3.getInt("old_package_id");
			vacancy=""+rs3.getInt("vacancy");
			bond_duration=rs3.getString("bond_duration");
			package_id=""+rs3.getInt("package_id");
			agency_id=""+rs3.getInt("agency_id");
			cpi=rs3.getString("cpi");
			cpi_other=rs3.getString("cpi_other");
			bond_details=rs3.getString("bond_details");
			shortlist=rs3.getString("shortlist");
                        x_percentage=rs3.getString("x_percentage");
                        xii_percentage=rs3.getString("xii_percentage");
                        gross=rs3.getString("gross");
                        gross_mtech=rs3.getString("gross_mtech");
                        gross_msc=rs3.getString("gross_msc");
                        gross_ma=rs3.getString("gross_ma");
                        gross_phd=rs3.getString("gross_phd");
                        bonus=rs3.getString("bonus");
                        take_home_during=rs3.getString("take_home_during");
                        take_home_after=rs3.getString("take_home_after");
		}
		rs3.close();
                int rs_curr_up;


		db.close();
		if(!old_package_id.equals("0"))
		{
			int s=0,s1=0,s2=0,s3=0,s4=0,s5=0,s6=0,s7=0;
			db.connect();

                        s=db.updateSQL("update package_details set package_name='"+package_name+"',agency_id='"+agency_id+"',vacancy='"+vacancy+"',ctc='"+ctc+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"',accomodation='"+accomodation+"',bond='"+bond+"',bond_duration='"+bond_duration+"',location_of_posting='"+location_of_posting+"',job_description='"+job_description+"',job_designation='"+job_designation+"',shortlist='"+shortlist+"',cpi='"+cpi+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"',ctc_ma='"+ctc_ma+"',gross_ma='"+gross_ma+"' where package_id="+old_package_id+";");

			//s=db.updateSQL("update package_details set package_name='"+package_name+"',agency_id='"+agency_id+"',vacancy='"+vacancy+"',ctc='"+ctc+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"',accomodation='"+accomodation+"',bond='"+bond+"',bond_duration='"+bond_duration+"',location_of_posting='"+location_of_posting+"',job_description='"+job_description+"',job_designation='"+job_designation+"',shortlist='"+shortlist+"',cpi='"+cpi+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"' where package_id="+old_package_id+";");
			s1=db.updateSQL("delete from package_extra_details where package_id="+old_package_id+";");
			//s2=db.updateSQL("delete from interested_students where agency_id="+agency_id+" and package_id="+old_package_id+";");
			s3=db.updateSQL("delete from eligible_students where agency_id="+agency_id+" and package_id="+old_package_id+";");
                        
                        //updating agency_curreny
                        rs_curr_up=db.updateSQL("update agency_currency set pay_mode=pay_mode_temp where agency_id="+agency_id+"  and        package_id="+old_package_id+";");
			ResultSet rss=db.execSQL("select * from package_extra_details_temp where package_id="+pack_id+";");
			while(rss.next())
			{
				s4=db.updateSQL("insert into package_extra_details(package_id,department_id,programme_id,program_index,agency_id,ctc) values('"+old_package_id+"','"+rss.getInt("department_id")+"','"+rss.getInt("programme_id")+"','"+rss.getInt("program_index")+"','"+rss.getInt("agency_id")+"','"+rss.getString("ctc")+"');");
				if(rss.getInt("program_index")<=11)
					s5=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+old_package_id+"',student_id from student_record where cpi_6sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
				else if( rss.getInt("program_index")<31  || (rss.getInt("program_index")>=45 && rss.getInt("program_index")<=49 )) // newly added
					s5=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+old_package_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
                                else
                                        s5=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+old_package_id+"',student_id from student_record where x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
                         }
			rss.close();

			s2=db.updateSQL("delete from interested_students where student_id NOT IN (select student_id from  eligible_students where agency_id="+agency_id+" and package_id="+old_package_id+") and agency_id="+agency_id+"  and package_id="+old_package_id+";");
			

			db.connect();
			db.updateSQL("delete from minor_details where agency_id="+agency_id+" and package_id="+old_package_id+" ;");
		  

			ResultSet rss1=db.execSQL("select * from minor_details_temp where package_id="+pack_id+";");
			if(rss1!= null)
			{
			while(rss1.next())
			{
			s6= db.updateSQL("insert into minor_details(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+old_package_id+"','"+rss1.getInt("program_index")+"','"+rss1.getInt("major")+"','"+rss1.getInt("minor")+"','"+rss1.getString("CPI")+"');");
			}
			}
			s7=db.updateSQL("delete from minor_details_temp where package_id="+pack_id+";");


			db.close();
			//if(s1!=0&&s2!=0&&s!=0) //s1 variable is used in multiple query:confusing,s2 is true if update commnand not executed

                      //  if(s!=0 && s1!=0 && s3!=0 && s4!=0 && s5!=0) 
                        if(s!=0 && s1!=0 && s3!=0 && s4!=0 && s5!=0) 

			{
				db.connect();
				s3=db.updateSQL("delete from package_extra_details_temp where package_id="+pack_id+";");
				s4=db.updateSQL("delete from package_details_temp where package_id="+pack_id+";");
				s7=db.updateSQL("delete from minor_details_temp where package_id="+pack_id+";");

			        db.close();
				if(s3!=0&&s4!=0)
                                {
                                       
				        db.connect();
                                        ResultSet rs_agemail=db.execSQL("select agency_email,agency_person from agency where agency_id="+agency_id+";");
                                        rs_agemail.next();
                                        String agemail=rs_agemail.getString("agency_email");
                                        String agperson=rs_agemail.getString("agency_person");
                                        rs_agemail.close();
			                db.close();

                                        String host = "naambor.iitg.ernet.in";
                                        String from = "noreply@iitg.ernet.in";
                                        String to = agemail;
                                        Properties props = System.getProperties();
                                        props.put("mail.smtp.host", host);
                                        Session session1 = Session.getDefaultInstance(props, null);

                                        MimeMessage message1 = new MimeMessage(session1);
                                        message1.setFrom(new InternetAddress(from));
                                        message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                                        message1.setSubject("Job Profile Updated");
                                        message1.setText("Dear "+agperson+",\nYour company job profile has been updated.\n\nKindly contact Placement Cell @ 0361-2582175 for any further details.\n\nThanks & Regards\nPlacement Cell\nIIT Guwahati");
                                        Transport.send(message1);
 
					response.sendRedirect("success.jsp");
                                }
				else
					response.sendRedirect("error.jsp");
			}
			else
				response.sendRedirect("error.jsp");	
		}
		else
		{

			int s=0,s1=0,s2=0,s3=0,s4=0,s6=0,s7=0;	
			db.connect();

			int srt=db.updateSQL("delete from package_extra_details where agency_id="+agency_id+" and package_id="+pack_id+";");
			srt=db.updateSQL("delete from package_details where agency_id="+agency_id+" and package_id="+pack_id+";"); 

                        ResultSet rrs=db.man_stmnt("insert into package_details(package_name,agency_id,vacancy,ctc,ctc_mtech,ctc_msc,ctc_phd,bonus,gross,gross_mtech,gross_msc,gross_phd,take_home_during,take_home_after,accomodation,bond,bond_duration,location_of_posting,job_description,job_designation,cpi,x_percentage,xii_percentage,cpi_other,bond_details,shortlist,ctc_ma,gross_ma) select package_name,agency_id,vacancy,ctc,ctc_mtech,ctc_msc,ctc_phd,bonus,gross,gross_mtech,gross_msc,gross_phd,take_home_during,take_home_after,accomodation,bond,bond_duration,location_of_posting,job_description,job_designation,cpi,x_percentage,xii_percentage,cpi_other,bond_details,shortlist,ctc_ma,gross_ma from package_details_temp where package_id="+pack_id+";");

			//ResultSet rrs=db.man_stmnt("insert into package_details(package_name,agency_id,vacancy,ctc,ctc_mtech,ctc_msc,ctc_phd,bonus,gross,gross_mtech,gross_msc,gross_phd,take_home_during,take_home_after,accomodation,bond,bond_duration,location_of_posting,job_description,job_designation,cpi,x_percentage,xii_percentage,cpi_other,bond_details,shortlist) select package_name,agency_id,vacancy,ctc,ctc_mtech,ctc_msc,ctc_phd,bonus,gross,gross_mtech,gross_msc,gross_phd,take_home_during,take_home_after,accomodation,bond,bond_duration,location_of_posting,job_description,job_designation,cpi,x_percentage,xii_percentage,cpi_other,bond_details,shortlist from package_details_temp where package_id="+pack_id+";");

			ag_id=0;
			if(rrs.next())
				ag_id=rrs.getInt(1);
			rrs.close();
			
			rs_curr_up=db.updateSQL("update agency_currency set pay_mode=pay_mode_temp, package_id='"+ag_id+"' where agency_id='"+agency_id+"' and package_id='"+pack_id+"';");		
			System.out.println("here "+ag_id);				
			s1=db.updateSQL("delete from interested_students where agency_id="+agency_id+" and package_id="+ag_id+";");
			s2=db.updateSQL("delete from eligible_students where agency_id="+agency_id+" and package_id="+ag_id+";");

			ResultSet rss=db.execSQL("select * from package_extra_details_temp where package_id="+pack_id+";");
			while(rss.next())
			{
				s3=db.updateSQL("insert into package_extra_details(package_id,department_id,programme_id,program_index,agency_id,ctc) values('"+ag_id+"','"+rss.getInt("department_id")+"','"+rss.getInt("programme_id")+"','"+rss.getInt("program_index")+"','"+rss.getInt("agency_id")+"','"+rss.getString("ctc")+"');");
				if(rss.getInt("program_index")<=11)
					s4=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+ag_id+"',student_id from student_record where cpi_6sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
				else if(rss.getInt("program_index")<31 || (rss.getInt("program_index")>=45 && rss.getInt("program_index")<=49 )) //----newly addaed----
					s4=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+ag_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
                                else
                                        s4=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+ag_id+"',student_id from student_record where x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+rss.getInt("program_index")+";");
                         }
			rss.close();
			

			db.close();

			db.connect();
			db.updateSQL("delete from minor_details where agency_id="+agency_id+" and package_id="+ag_id+" ;");
		
			ResultSet rss1=db.execSQL("select * from minor_details_temp where package_id="+pack_id+";");
			if(rss1!= null)
			{
			while(rss1.next())
			{
			s6= db.updateSQL("insert into minor_details(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+ag_id+"','"+rss1.getInt("program_index")+"','"+rss1.getInt("major")+"','"+rss1.getInt("minor")+"','"+rss1.getString("CPI")+"');");
			}
			}
			s7=db.updateSQL("delete from minor_details_temp where package_id="+pack_id+";");
			db.close();

			//if(ag_id!=0  && s3!=0 && s4!=0)
			if(ag_id!=0  && s3!=0 && s4!=0)
			{
				db.connect();
				s2=db.updateSQL("delete from package_extra_details_temp where package_id="+pack_id+";");
				s3=db.updateSQL("delete from package_details_temp where package_id="+pack_id+";");
				s7=db.updateSQL("delete from minor_details_temp where package_id="+pack_id+";");

				db.close();
				if(s2!=0&&s3!=0)
                                {
                                        // Mail Sending Part
				        db.connect();
                                        ResultSet rs_agemail=db.execSQL("select agency_email,agency_person from agency where agency_id="+agency_id+";"); 
                                        rs_agemail.next();
                                        String agemail=rs_agemail.getString("agency_email");
                                        String agperson=rs_agemail.getString("agency_person");
                                        rs_agemail.close();
				        db.close();
 
                                        String host = "naambor.iitg.ernet.in";
        	                        String from = "noreply@iitg.ernet.in";
                                        String to = agemail;
                                        Properties props = System.getProperties();
	                                props.put("mail.smtp.host", host);
        	                        Session session1 = Session.getDefaultInstance(props, null);

                	                MimeMessage message1 = new MimeMessage(session1);
                        	        message1.setFrom(new InternetAddress(from));
                                	message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	                                message1.setSubject("Job Profile Approved");
        	                        message1.setText("Dear "+agperson+",\nYour company job profile has been approved.\n\nKindly contact Placement Cell @ 0361-2582175 for any further details.\n\nThanks & Regards\nPlacement Cell\nIIT Guwahati");
                	                Transport.send(message1);

					response.sendRedirect("success.jsp");
                                } 
				else
					response.sendRedirect("error.jsp");
			}
			else
				response.sendRedirect("error.jsp");		
		}
	}
	
	
 %>

 <table width="500" border="0" align="center">
   <tr>
     <td>&nbsp;<p align="center"><b>
	 <%
	 	if(pack_id!=null)
		{
			db.connect();
			ResultSet t1=db.execSQL("select agency_name from agency where agency_id="+agency_id+";");
			if(t1.next())
			{
				ResultSet t2=db.execSQL("select old_package_id from package_details_temp where package_id="+pack_id+";");
				if(t2.next())
				{
					if(t2.getInt(1)==0)
					{
						out.println("Organization "+t1.getString(1)+" has requested to approve this new package.");
					}
					else
					{
						out.println("Organization "+t1.getString(1)+"has requested changes to be made in this package.");
					}
				}
				t2.close();
			}
			t1.close();
			db.close();
		}
		}
		catch(Exception e){e.printStackTrace();}
	 %></b></p>
     </td>
   </tr>
   <tr>
     <td>&nbsp;</td>
   </tr>
 </table>
 <table width="640" height="374" align="center" cellpadding="5" cellspacing="5">
                  <tr>
                    <td height="32" width="350" >Job description</td>
                    <td width="307" ><%=job_description%></td>
                    </tr>
                  <tr>
                    <td height="32" >Job designation </td>
                    <td ><%=job_designation%></td>
                    </tr>
                  <tr>
                    <td height="32" >Place of posting </td>
                    <td ><%=location_of_posting%></td>
                    </tr>
                  <tr>
                    <td height="31">Accomodation</td>
                    <td ><% if(accomodation.equals("1")){out.println("Yes");}else{out.println("No");} %></td>
                  </tr>
                  <tr>
                    <td height="31" >Bond</td>
                    <td > <% if(bond.equals("1"))out.println("Yes"); %>

                       <% if(bond.equals("0"))out.println("No"); %>
                      </td>
                  </tr>
                  <tr>
                    <td height="32" >Bond duration </td>
                    <td><%=bond_duration%>
                      (in months)</td>
                  </tr>
                  <tr>
                    <td height="32" ><p>Bond details </p></td>
                    <td><%=bond_details%></td>
                  </tr>
                  <tr>
                    <td height="31" >Shortlist by cpi?</td>
                    <td ><label>
                     <% if(shortlist.equals("1"))out.println("Yes"); %> <% if(shortlist.equals("0"))out.println("No"); %>
                      </td>
                  </tr>
                  <tr>
                    <td height="32" >Cpi(minimum)</td>
                    <td><%=cpi%>
                      (on scale of 0-10)</td>
                  </tr>
                    <tr>
                    <td height="32" >Tenth percentage</td>
                    <td><%=x_percentage%>
                      %</td>
                  </tr>
                  <tr>
                    <td height="32" >Tweleth Percentage</td>
                    <td><%=xii_percentage%>
                      %</td>
                  </tr>
                  <tr>
                    <td height="32" ><p>Other requirements</p></td>
                    <td><%=cpi_other%></td>
                  </tr>
                  </table>
<table width="640" height="203" align="center" cellpadding="5" cellspacing="5">
<tr>
                    <td width="132" height="35" >Profile Name</td>
                    <td width="471" ><%=package_name%></td>
                  </tr>
                  <tr>
                    <td height="32">Programmes</td>
                    <td>Choices:</td>
                    </tr>
                    <tr><td height="40">&nbsp;</td>
                    <td nowrap>
                    <%
						if(remove==null&&submit==null&&pack_id!=null){
						db.connect();
						ResultSet rs1=db.execSQL("select program_index from package_extra_details_temp where package_id="+package_id+" order by program_index;");
						while(rs1.next())
						{
							ResultSet rs2=db.execSQL("select programme_name from prog_record where prog_id="+rs1.getInt(1)+";");
							if(rs2.next())
							{
								out.println("<br/>"+rs2.getString(1)+"");
							}
							rs2.close();
						}
						rs1.close();
						db.close();
						db.connect();
					
						out.println("<table>");
						ResultSet rr1=db.execSQL("select * from minor_details_temp where agency_id="+agency_id+" and package_id="+package_id+";");
					String dep_names[]={"CSE", "ECE", "ME", "CVL", "BT", "CHM", "MnC", "EP", "CST", "EEE", "Design"};
					String cpi_minor_table="";
					if(rr1!= null)
					{
						out.println("<br>");

						out.println("<tr><td>Major Dept</td><td>Minor Dept</td></tr>");

					while(rr1.next())
					{
						cpi_minor_table = rr1.getString("CPI");
						out.println("<tr><td>"+dep_names[rr1.getInt("major")-1]+"</td><td>"+dep_names[rr1.getInt("minor")-1]+"</td></tr>");						
					}
					}
					    out.println("<br>");

					    out.println("<tr><td>Min CPI for Minor:</td><td>"+cpi_minor_table+"</td></tr>");

					    out.println("</table>");
						
						
						db.close();


				      }
					%>
                    </td>
                  <tr>
                    <td height="32">No. of vacancy :</td>
                    <td><%=vacancy%></td>
                  <tr>
                      <td height="32">CTC BTech:</td>
                      <td><%=ctc%>&nbsp;<%=temp_curr%></td>
                    </tr>
                  <tr>
                      <td height="32">CTC MTech:</td>
                      <td><%=ctc_mtech%>&nbsp;<%=temp_curr%></td>
                    </tr>
                   <tr>
                      <td height="32">CTC M.Sc:</td>
                      <td><%=ctc_msc%>&nbsp;<%=temp_curr%></td>
                    </tr>
                   <tr>
                      <td height="32">CTC M.A:</td>
                      <td><%=ctc_ma%>&nbsp;<%=temp_curr%></td>
                    </tr>
                  <tr>
                      <td height="32">CTC PhD:</td>
                      <td><%=ctc_phd%>&nbsp;<%=temp_curr%></td>
                    </tr>
                </table> <form name="form" method="post" action="approve_vac.jsp?id=<%=pack_id%>">
  <table width="360" border="0" align="center">
                  <tr>
                    <td width="293">
                      <input type="submit" name="submit" id="submit" value="Approve">
                    </td>
                    <td width="57"><input type="submit" name="remove" id="remove" value="Remove"></td>
                  </tr>
  </table></form>
  <p>&nbsp;</p>
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
