<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">


<script src="../js/sorttable.js"></script>

<script type="text/javascript" language="JavaScript">

function swap(ag_id,cv)
{
	if(cv==0)
	{
		if(document.getElementById("cvs_"+ag_id+"_0").checked==true)
		{
			document.getElementById("cvs_"+ag_id+"_1").checked=false;
		}
		else
			document.getElementById("cvs_"+ag_id+"_1").checked=true;
	}
	else
	{
		if(document.getElementById("cvs_"+ag_id+"_1").checked==true)
		{
			document.getElementById("cvs_"+ag_id+"_0").checked=false;
		}
		else
			document.getElementById("cvs_"+ag_id+"_0").checked=true;
	}
}
</script>


</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId();        
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");

         
        db.fetchConfigDetails(); //newly added
       
	String student_roll_number="";
	String student_id="0";
	String username="";
        String program_id="";
	db.connect();

        out.println("sid :"+sid);
        //try{
	ResultSet rsac=db.execSQL("select username from session where session_id='"+sid.toString()+"';");
        //rsac.next();
	//username=rsac.getString("username").toString(); 
	//rsac.close();
        //out.println("sid= "+sid+",  username= "+username);
        //}
        //catch(SQLException sql)
        //{
         // out.println("error: "+sql);
        //}
	ResultSet rsad=db.execSQL("select student_id,student_roll_number,program_id from student_record where username='"+username+"';");
        out.println("select student_id,student_roll_number,program_id from student_record where username='"+username+"'");
	rsad.next();
	student_id=rsad.getString("student_id");
	student_roll_number=rsad.getString("student_roll_number");
	program_id=rsad.getString("program_id");

	rsad.close();
	db.close();
                  
	//inserting into interesting_students table
	String[] agency_ids=request.getParameterValues("agency_id");
	String[] cvs_1=request.getParameterValues("cvs_1");
	String[] cvs_2=request.getParameterValues("cvs_2");
	String submit=request.getParameter("submit");
	        
	if(submit!=null)
	{
		db.connect();
		ResultSet r_fd=db.execSQL("select agency_id from agency where cv_final_date>curdate() or (cv_final_date=curdate() and cv_final_time>=curtime());");
		int i_ag=0;
		while(r_fd.next())
			i_ag=db.updateSQL("delete from interested_students where student_id='"+student_id+"' and agency_id='"+r_fd.getString("agency_id")+"';");
		r_fd.close();
		int i_id=0;
		//if(agency_ids!=null)
		//out.println("\n"+agency_ids.length+"\n");
		while(agency_ids!=null && i_id<agency_ids.length)
		{
			i_ag*=db.updateSQL("insert into interested_students(agency_id,student_id) values ('"+agency_ids[i_id++]+"','"+student_id+"');");
		}
		i_id=0;
		while(cvs_1!=null && i_id<cvs_1.length)
		{
			i_ag*=db.updateSQL("update interested_students set cv=0 where student_id="+student_id+" and agency_id="+cvs_1[i_id++]+";");
		}
		i_id=0;
		while(cvs_2!=null && i_id<cvs_2.length)
		{
			i_ag*=db.updateSQL("update interested_students set cv=1 where student_id="+student_id+" and agency_id="+cvs_2[i_id++]+";");
		}
		db.close();
	}
           	
%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>

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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp" >Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="student_eligibility.jsp" >Check Eligibility</a><a href="../agency_query/placement_query.jsp" >Organization information</a>
      <a href="../vacancies/vacancies.jsp" >Vacancies</a>
   <%--   <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a></div>
  </div>
  <div id="content"> 
    <div class="feature">
	  <form name="form1" action="confirm.jsp" method="post">
        <p><strong>Select Appropriate Organization</strong></p>
        <table align="center" cellpadding="5" class='sortable' id="org_det"><tr><th>Status</th><th>S.No.</th><th>Organization Name</th><th>Organization's Nature of Business</th><th>Deadline</th><th>CV to show</th></tr>
       
<%
          
			db.connect(); 
			ResultSet date_1=db.execSQL("select curdate(),curtime();");
			String ss="";
			String ss1="";
			if(date_1.next()){ss=date_1.getString(1);ss1=date_1.getString(2);}
			date_1.close();
			String[] dt=ss.split("-");
			String[] tm=ss1.split(":");
			String ag_id="";
			String stat="";
			String big_q="";
			big_q+="select P.agency_id as ag_id,0 as stat from package_extra_details P where";
		big_q+=" P.program_index="+program_id+" and P.agency_id not in (select E.agency_id from eligible_students E where E.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select E.agency_id as ag_id,1 as stat from eligible_students E";
			big_q+=" where E.student_id="+student_id+" and E.agency_id not in ";
			big_q+=" (select I.agency_id from interested_students I where I.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select I.agency_id as ag_id,2 as stat from interested_students I where I.student_id="+student_id+";";
			//out.println(big_q);
                   
			ResultSet rsab=db.execSQL(big_q);
			String sr="<span style=\"color:red\">";
			String sb="<span style=\"color:blue\">";
			String sg="<span style=\"color:green\">";
			String sgr="<span style=\"color:gray\">";
                        String sp="<span style=\"color:purple\">";
			String se="</span>";
			int i=1;
                     
			while (rsab.next()) 
			{	
				//out.println("<br/>"+rsab.getString(1)+"|||"+rsab.getString(2)+"<br/>");
				ag_id=rsab.getString("ag_id");
				stat=rsab.getString("stat");
				ResultSet rs1= db.execSQL("select agency_name,nature_business,cv_final_date,cv_final_time from agency where agency_id='"+ag_id+"';");
				rs1.next();
				//out.println("<br/>"+rs1.getString(1)+rs1.getString(2)+rs1.getString(3)+"<br/>");
				if(rs1.getString("cv_final_date")!=null && rs1.getString("cv_final_time")!=null)
				{				
					String[] dt2=rs1.getString("cv_final_date").split("-");
					String[] tm2=rs1.getString("cv_final_time").split(":");
					boolean flag=false;
					if(Integer.parseInt(dt[0])<Integer.parseInt(dt2[0]))
					{
						flag=true;
					}
					else if(Integer.parseInt(dt[0])==Integer.parseInt(dt2[0]))
					{
						if(Integer.parseInt(dt[1])<Integer.parseInt(dt2[1]))
							flag=true;
						else if(Integer.parseInt(dt[1])==Integer.parseInt(dt2[1]))
						{
							if(Integer.parseInt(dt[2])<Integer.parseInt(dt2[2]))
								flag=true;
							else if(Integer.parseInt(dt[2])==Integer.parseInt(dt2[2]))
							{
								if(Integer.parseInt(tm[0])<Integer.parseInt(tm2[0]))
								{
									flag=true;
								}
								else if(Integer.parseInt(tm[0])==Integer.parseInt(tm2[0]))
								{
									if(Integer.parseInt(tm[1])<Integer.parseInt(tm2[1]))
										flag=true;
									else if(Integer.parseInt(tm[1])==Integer.parseInt(tm2[1]))
									{
										if(Integer.parseInt(tm[2])<=Integer.parseInt(tm2[2]))
											flag=true;
									}
								}
							}
						}
					}
				{
				String checked="";
				ResultSet cvq=db.execSQL("select cv from interested_students where agency_id="+ag_id+" and student_id="+student_id+";");
				if(stat.equals("2"))
				{
					checked=" checked";
					cvq.next();
					out.println("<tr>");
           
                                     String sql_temp="select status from eligible_students where student_id='"+student_id+"' and agency_id="+ag_id+";";
                                   int status=0;
                                     
                                     ResultSet rr=db.execSQL(sql_temp);
                                     if(rr.next())
                                      {
                                            status=rr.getInt(1);
                                      }                                     

                                      rr.close();
                                      
                                   if(status==1)
                                    {
                                        if(flag)
					{
						out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sp+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:purple\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sp+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sp+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:purple\">Restricted</b></td></tr>");
					}
					else
					{
						out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:gray\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sgr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:gray\">Restricted</b></td></tr>");

					}
                                             
                                    }
                                       
                                     if(status!=1)
                                      {
					if(flag)
					{
						out.println("<td align=\"center\"><input type=\"checkbox\" name=\"agency_id\" id=\"agency_id\" value=\""+ag_id+"\" "+checked+"> </td>");
						out.println("<td> "+sb+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:blue\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sb+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sb+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+se+" "+sb+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
					}
					else
					{
						out.println("<td align=\"center\"><b style=\"color:green\">&#10004;</b></td>");
						out.println("<td> "+sgr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:gray\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sgr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+se+sgr+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
					}

					if(flag)
					{
						out.println("<td><label><input type=\"checkbox\" name=\"cvs_1\" value=\""+ag_id+"\" id=\"cvs_"+ag_id+"_0\" onClick=\"swap('"+ag_id+"',0);\" ");
						if(cvq.getString(1).equals("0"))
							out.println("checked");
						out.println(">CV1</label>");
						out.println("<label><input type=\"checkbox\" name=\"cvs_2\" value=\""+ag_id+"\" id=\"cvs_"+ag_id+"_1\" onClick=\"swap('"+ag_id+"',1);\" ");
						if(cvq.getString(1).equals("1"))
							out.println("checked");
						out.println(">CV2</label></td>");
					}
					else
					{
						out.println("<td>"+sgr+"CV"+(cvq.getInt(1)+1)+se+"</td>");
					}
					out.println("</tr>");
                                      }
				}
				else if(stat.equals("1"))
				{
                                       String sql_temp="select status from eligible_students where student_id='"+student_id+"' and agency_id="+ag_id+";";
                                   int status=0;
                                     
                                     ResultSet rr=db.execSQL(sql_temp);
                                     if(rr.next())
                                      {
                                            status=rr.getInt(1);
                                      }                                     

                                      rr.close();
                                      
                                   if(status==1)
                                    {
                                        if(flag)
					{
						out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sp+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:purple\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sp+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sp+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:purple\">Restricted</b></td></tr>");
					}
					else
					{
						out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:gray\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sgr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:gray\">Restricted</b></td></tr>");

					}
                                             
                                    }

                                         

                                   if(status!=1)
                                    {
					out.println("<tr>");
					if(flag)
					{
						out.println("<td align=\"center\"><input type=\"checkbox\" name=\"agency_id\" id=\"agency_id\" value=\""+ag_id+"\" "+checked+"> </td><td>");
						out.println(sg+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:green\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sg+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sg+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
					}
					else
					{
						out.println("<td align=\"center\"><b style=\"color:red\">&times;</td><td>");
						out.println(sgr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:gray\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sgr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
					}

					if(flag)
					{
						out.println("<td><label><input type=\"checkbox\" name=\"cvs_1\" value=\""+ag_id+"\" id=\"cvs_"+ag_id+"_0\" onClick=\"swap('"+ag_id+"',0);\">CV1</label>");
						out.println("<label><input type=\"checkbox\" name=\"cvs_2\" value=\""+ag_id+"\" id=\"cvs_"+ag_id+"_1\" onClick=\"swap('"+ag_id+"',1);\">CV2</label></td>");
					}
					else
					{
						out.println("<td><b style=\"color:gray\">Not Applied</b></td>");
					}
					out.println("</tr>");
                                     }
				}
				else
				{
					if(flag)
					{
						out.println("<tr><td align=\"center\"><b style=\"color:red\">&times;</b></td><td> "+sr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:red\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:red\">Not Eligible</b></td></tr>");
					}
					else
					{
						out.println("<tr><td align=\"center\"><b style=\"color:red\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
						out.println("<a style=\"color:gray\" href=\"details.jsp?id="+ag_id+"\">");
						out.println(rs1.getString("agency_name")+"</a></input></td>");
						out.println("<td align=\"center\">"+sgr+rs1.getString("nature_business")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
						out.println("<td align=\"center\"><b style=\"color:gray\">Not Eligible</b></td></tr>");

					}
				}
				cvq.close();
				i++;
				}}//}}
				rs1.close();
			}	
			rsab.close();			
			db.close();
              
 %>
        </table>          
		<table align="center"><tr><td><input type="submit" name="submit" value="Submit"></td></tr></table>
		<p>&nbsp;</p>
		<table align="center">
		  <tr><td>
		<b style="color:green">&#9608;</b> - Eligible but Not Interested<br/><br/>
        <b style="color:blue">&#9608;</b> - Eligible and Interested<br/><br/>
        <b style="color:red">&#9608;</b> - Not Eligible<br/><br/>
        <b style="color:gray">&#9608;</b> - Last Date Completed<br/><br/>
        <b style="color:purple">&#9608;</b> - Restricted<br/><br/>
        <b style="color:green">&#10004;</b> - Applied<br/><br/>
        <b style="color:red">&times;</b> - Not Applied<br/><br/>
      </td></tr></table>
        </form>
      <div name='div_get_placement_details' id='div_get_placement_details'></div>

<p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo">
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
