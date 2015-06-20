<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<script src="../js/sorttable.js"></script>


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

        //out.println("sid :"+sid);
	ResultSet rsac=db.execSQL("select username from session where session_id='"+sid+"';");
        rsac.next();
	username=rsac.getString("username").toString(); 
	rsac.close();
        //out.println("sid= "+sid+",  username= "+username);

        //Original
	ResultSet rsad=db.execSQL("select student_id,student_roll_number,program_id from student_record where username='"+username+"';");


	//ResultSet rsad=db.execSQL("select student_id,student_roll_number,programme_id from student_record where username='"+username+"';");
	
        //out.println("select student_id,student_roll_number,program_id from student_record where username='"+username+"'");
	rsad.next();
	student_id=rsad.getString("student_id");
	student_roll_number=rsad.getString("student_roll_number");

	program_id=rsad.getString("program_id");
	//program_id=rsad.getString("programme_id");

	rsad.close();
	db.close();
                  
	//inserting into interested_students table
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
			ResultSet resPk = db.execSQL("select package_id from package_details where agency_id='"+agency_ids[i_id]+"'");
			while(resPk.next())
			{
				i_ag*=db.updateSQL("insert into interested_students(agency_id,student_id,package_id) values ('"+agency_ids[i_id]+"','"+student_id+"','"+resPk.getString(1)+"');");
				
			}
			i_id++;
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
<div id="content"> 
    <div class="feature">
	  <form name="formEligibility" action="#" onsubmit="return confirmEligibility();" method="post" enctype="multipart/form-data">
        <center><b><strong>Select Appropriate Organization</strong></b></center>
        <div align='center'>
			<table cellpadding="5" class='imagetable' id="organizationDetail">
				<tr>
					<th>Status</th>
					<th>S.No.</th>
					<th>Organization Name/Package Name</th>
					<th>Organization's Nature of Business</th>
					<th>Deadline</th><th>CV to show</th>
				</tr>
       
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
			String p_id="";
			String stat="";
			String big_q="";
			
			/************************************************/
			/*big_q+="select P.agency_id as ag_id,0 as stat,P.package_id as p_id from package_extra_details P where";
			big_q+=" P.program_index="+program_id+" and P.agency_id not in (select E.agency_id from eligible_students E where E.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select E.agency_id as ag_id,1 as stat,E.package_id as p_id from eligible_students E";
			big_q+=" where E.student_id="+student_id+" and E.agency_id not in ";
			big_q+=" (select I.agency_id from interested_students I where I.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select I.agency_id as ag_id,2 as stat,I.package_id as p_id from interested_students I where I.student_id="+student_id+";";	*/
			/************************************************/
			
			
			//query for retrieving job profiles eligible for students department
			/*big_q+="select P.agency_id as ag_id,0 as stat,P.package_id as p_id from package_extra_details P where";
			big_q+=" P.program_index="+program_id+" and P.package_id not in (select E.package_id from eligible_students E where E.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select E.agency_id as ag_id,1 as stat,E.package_id as p_id from eligible_students E";
			big_q+=" where E.student_id="+student_id+" and E.package_id not in ";
			big_q+=" (select I.package_id from interested_students I where I.student_id="+student_id+")";
			big_q+=" union";
			big_q+=" select I.agency_id as ag_id,2 as stat,I.package_id as p_id from interested_students I where I.student_id="+student_id+";";	*/
			/****************************************************/
			
			
			big_q+="select P.agency_id as ag_id, 0 as stat, P.package_id as p_id, PD.package_name as p_name, A.agency_name as a_name,";
			big_q+=" A.nature_business as nature, A.cv_final_date as final_date, A.cv_final_time as final_time, -1 as cv, -1 as status";
			big_q+=" from";
			big_q+=" package_extra_details P, package_details PD, agency A";
			big_q+=" where";
			big_q+=" P.agency_id = A.agency_id and";
			big_q+=" P.package_id = PD.package_id and";
			big_q+=" P.program_index = "+program_id+"";
			big_q+=" and P.package_id not in (select ";
			big_q+=" E.package_id";
			big_q+=" from";
			big_q+=" eligible_students E";
			big_q+=" where";
			big_q+=" E.student_id = "+student_id+") ";
			big_q+=" union select ";
			big_q+=" E.agency_id as ag_id, 1 as stat, E.package_id as p_id, PD.package_name as p_name, A.agency_name as a_name, ";
			big_q+=" A.nature_business as nature, A.cv_final_date as final_date, A.cv_final_time as final_time, -1 as cv, E.status as status";
			big_q+=" from";
			big_q+=" eligible_students E, package_details PD, agency A";
			big_q+=" where";
			big_q+=" E.agency_id = A.agency_id and";
			big_q+=" E.package_id = PD.package_id and";
			big_q+=" E.student_id = "+student_id+"";
			big_q+=" and E.package_id not in (select ";
			big_q+=" I.package_id";
			big_q+=" from";
			big_q+=" interested_students I";
			big_q+=" where";
			big_q+=" I.student_id = "+student_id+") ";
			big_q+=" union select ";
			big_q+=" I.agency_id as ag_id, 2 as stat, I.package_id as p_id, PD.package_name as p_name, A.agency_name as a_name, ";
			big_q+=" A.nature_business as nature, A.cv_final_date as final_date, A.cv_final_time as final_time, I.cv as cv, E.status as status";
			big_q+=" from";
			big_q+=" interested_students I, package_details PD, agency A, eligible_students E";
			big_q+=" where";
			big_q+=" I.student_id = E.student_id and";
			big_q+=" I.agency_id = E.agency_id and";
			big_q+=" I.package_id = E.package_id and";
			big_q+=" I.agency_id = A.agency_id and";
			big_q+=" I.package_id = PD.package_id and";
			big_q+=" I.student_id = "+student_id;
				
				
			ResultSet rsab=db.execSQL(big_q);
			String sr="<span style=\"color:red\">";
			String sb="<span style=\"color:blue\">";
			String sg="<span style=\"color:green\">";
			String sgr="<span style=\"color:gray\">";
			String sp="<span style=\"color:purple\">";
			String se="</span>";
			int i=1;

			String package_name="";
			
			while (rsab.next()){
				ag_id=rsab.getString("ag_id");
				p_id=rsab.getString("p_id");
				stat=rsab.getString("stat");
				package_name=rsab.getString("p_name");
				if(rsab.getString("final_date")!=null && rsab.getString("final_time")!=null){				
					String[] dt2=rsab.getString("final_date").split("-");
					String[] tm2=rsab.getString("final_time").split(":");
					boolean flag=false;
					if(Integer.parseInt(dt[0])<Integer.parseInt(dt2[0])){
						flag=true;
					}
					else if(Integer.parseInt(dt[0])==Integer.parseInt(dt2[0])){
						if(Integer.parseInt(dt[1])<Integer.parseInt(dt2[1])){
							flag=true;
						}
						else if(Integer.parseInt(dt[1])==Integer.parseInt(dt2[1])){
							if(Integer.parseInt(dt[2])<Integer.parseInt(dt2[2])){
								flag=true;
							}
							else if(Integer.parseInt(dt[2])==Integer.parseInt(dt2[2])){
								if(Integer.parseInt(tm[0])<Integer.parseInt(tm2[0])){
									flag=true;
								}
								else if(Integer.parseInt(tm[0])==Integer.parseInt(tm2[0])){
									if(Integer.parseInt(tm[1])<Integer.parseInt(tm2[1])){
										flag=true;
									}
									else if(Integer.parseInt(tm[1])==Integer.parseInt(tm2[1])){
										if(Integer.parseInt(tm[2])<=Integer.parseInt(tm2[2])){
											flag=true;
										}
									}
								}
							}
						}
					}
					String checked="";
					// stat == 2 means fetched from Interested Students ( Ref. big_q )
					if(stat.equals("2")){
						checked=" checked";
						out.println("<tr>");
						int status=0;
						status=rsab.getInt("status");
						
						if(status==1){
							if(flag){
								out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sp+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:purple\" href=\"#\" onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sp+rsab.getString("nature")+se+"</td><td align=\"center\">"+sp+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
								out.println("<td align=\"center\"><b style=\"color:purple\">Restricted</b></td></tr>");
							}
							else{
								out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:gray\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sgr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
								out.println("<td align=\"center\"><b style=\"color:gray\">Restricted</b></td></tr>");
							}
						}
						if(status!=1){
							if(flag){
								out.println("<td align=\"center\"><input type=\"checkbox\" name=\"agency_id\" id=\""+ag_id+":"+p_id+"\" value=\""+ag_id+":"+p_id+"\" "+checked+ " onClick=\"selectDefaultCV('"+ag_id+":"+p_id+"');\"> </td>");
								out.println("<td> "+sb+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:blue\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sb+rsab.getString("nature")+se+"</td><td align=\"center\">"+sb+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+se+" "+sb+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							}
							else{
								out.println("<td align=\"center\"><b style=\"color:green\">&#10004;</b></td>");
								out.println("<td> "+sgr+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:gray\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sgr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+se+sgr+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							}
							if(flag){
								out.println("<td><label><input type=\"checkbox\"  name=\"cvs_1\" value=\""+ag_id+":"+p_id+"\" id=\"cvs_"+ag_id+":"+p_id+"_0\" onClick=\"swap('"+ag_id+":"+p_id+"',0);\" ");
								if(rsab.getString("cv").equals("0")){
									out.println("checked");
								}
								out.println(">CV1</label>");
								out.println("<br>");
								out.println("<label><input type=\"checkbox\"  name=\"cvs_2\" value=\""+ag_id+":"+p_id+"\" id=\"cvs_"+ag_id+":"+p_id+"_1\" onClick=\"swap('"+ag_id+":"+p_id+"',1);\" ");
								if(rsab.getString("cv").equals("1")){
									out.println("checked");
								}
								out.println(">CV2</label></td>");
							}
							else{
								out.println("<td>"+sgr+"CV"+(rsab.getString("cv")+1)+se+"</td>");
							}
							out.println("</tr>");
						}						
					}
					// stat == 1 means fetched from eligible students( Ref. big_q )
					else if(stat.equals("1")){
						int status=0;
						status=rsab.getInt("status");
						if(status==1){
							if(flag){
								out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sp+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:purple\"  href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sp+rsab.getString("nature")+se+"</td><td align=\"center\">"+sp+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
								out.println("<td align=\"center\"><b style=\"color:purple\">Restricted</b></td></tr>");
							}
							else{
								out.println("<tr><td align=\"center\"><b style=\"color:purple\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:gray\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sgr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
								out.println("<td align=\"center\"><b style=\"color:gray\">Restricted</b></td></tr>");

							}
						}
						if(status!=1){
							out.println("<tr>");
							if(flag){
								out.println("<td align=\"center\"><input type=\"checkbox\" name=\"agency_id\" id=\""+ag_id+":"+p_id+"\" value=\""+ag_id+":"+p_id+"\" "+checked+ " onClick=\"selectDefaultCV('"+ag_id+":"+p_id+"');\"> </td><td>");
								out.println(sg+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:green\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sg+rsab.getString("nature")+se+"</td><td align=\"center\">"+sg+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							}
							else{
								out.println("<td align=\"center\"><b style=\"color:red\">&times;</td><td>");
								out.println(sgr+i+se+"</td><td align=\"center\">");
								out.println("<a style=\"color:gray\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
								out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
								out.println("<td align=\"center\">"+sgr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							}
							if(flag){
								out.println("<td><label><input type=\"checkbox\"  disabled = \"disabled\" name=\"cvs_1\" value=\""+ag_id+":"+p_id+"\" id=\"cvs_"+ag_id+":"+p_id+"_0\" onClick=\"swap('"+ag_id+":"+p_id+"',0);\">CV1</label>");
								out.println("<br>");
								out.println("<label><input type=\"checkbox\"  disabled = \"disabled\" name=\"cvs_2\" value=\""+ag_id+":"+p_id+"\"s id=\"cvs_"+ag_id+":"+p_id+"_1\" onClick=\"swap('"+ag_id+":"+p_id+"',1);\">CV2</label></td>");
							}
							else{
								out.println("<td><b style=\"color:gray\">Not Applied</b></td>");
							}
							out.println("</tr>");
						}
					}
					// stat == 0 means fetched from package extra details ( Ref. big_q )
					else{
						if(flag){
							out.println("<tr><td align=\"center\"><b style=\"color:red\">&times;</b></td><td> "+sr+i+se+"</td><td align=\"center\">");
							out.println("<a style=\"color:red\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
							out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
							out.println("<td align=\"center\">"+sr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							out.println("<td align=\"center\"><b style=\"color:red\">Not Eligible</b></td></tr>");
						}
						else{
							out.println("<tr><td align=\"center\"><b style=\"color:red\">&times;</b></td><td> "+sgr+i+se+"</td><td align=\"center\">");
							out.println("<a style=\"color:gray\" href=\"#\"  onClick=\"return getAgencyDetails("+ag_id+","+p_id+");\">");
							out.println(rsab.getString("a_name")+"/"+package_name+"</a></input></td>");
							out.println("<td align=\"center\">"+sgr+rsab.getString("nature")+se+"</td><td align=\"center\">"+sgr+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+" "+tm2[0]+":"+tm2[1]+":"+tm2[2]+se+"</td>");
							out.println("<td align=\"center\"><b style=\"color:gray\">Not Eligible</b></td></tr>");

						}
					}
					i++;					
				}
			}
			rsab.close();			
			db.close();
                               
 %>
        </table>          
		<table align="center"><tr><td><input type="submit" name="submit" value="Submit"></td></tr></table>
		  </form>
		<p>&nbsp;</p>
		<table align="center">
		  <tr><td>
		<p style="color:green">&#9608; - Eligible but Not Interested</p>
        <p style="color:blue">&#9608; - Eligible and Interested</p>
        <p style="color:red">&#9608; - Not Eligible</p>
        <p style="color:gray">&#9608; - Last Date Completed</p>
        <p  style="color:purple">&#9608; - Restricted</p>
        <p style="color:green">&#10004; - Applied</p>
        <p style="color:red">&times; - Not Applied</p>
      </td></tr></table></div>
      
      <div name='div_get_placement_details' id='div_get_placement_details'></div>

<p align="center">&nbsp;</p>    
</div> 
</div>

</div> 
<!--end pagecell1--> 

</body>
</html>
