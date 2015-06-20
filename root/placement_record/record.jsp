<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
<script type="text/javascript">
function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency ID\n" ;
	
  if (ptr.student_roll_number.value.length == 0 )
        message+="Please enter the Student ID \n" ;
		
  if (ptr.basic.value.length == 0  )
        message+="Please select the Package \n" ;
		
  if (ptr.location_of_posting.value.length == 0)
  		message+="Please enter the Location of Posting \n" ;
		
  if (ptr.remarks.value.length == 0)
  		message+="Please enter the Remarks \n" ;
		

		
	
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
<body onmousemove="closesubnav(event);"> 
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />




<%@ include file="../utils/session_validator.jsp"%>
<%
//db.fetchConfigDetails(); //newly added
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<jsp:useBean id="obj_placement_record" class="pack_placement_record.placement_record" scope="page"/>
<jsp:setProperty name="obj_placement_record" property="agency_name" param="agency_name" />
<jsp:setProperty name="obj_placement_record" property="student_roll_number" param="student_roll_number" />
<jsp:setProperty name="obj_placement_record" property="basic" param="basic" />
<jsp:setProperty name="obj_placement_record" property="hra" param="hra" />
<jsp:setProperty name="obj_placement_record" property="others" param="others" />
<jsp:setProperty name="obj_placement_record" property="gross" param="gross" />
<jsp:setProperty name="obj_placement_record" property="take_home" param="take_home" />
<jsp:setProperty name="obj_placement_record" property="ctc" param="ctc" />
<jsp:setProperty name="obj_placement_record" property="location_of_posting" param="location_of_posting" />
<jsp:setProperty name="obj_placement_record" property="remarks" param="remarks" />


<%
int j=0;

String[] student_roll_number=request.getParameterValues("student_roll_number");
String package_name=request.getParameter("package_name");
db.fetchConfigDetails(); //newly added
db.connect(); // new

String info="";
int agency_id=0;
int student_id=0;
int department_id=0;
int programme_id=0;
int package_id=0;

	String display1="<tr><td>" ;
	String display2="</tr></td>" ;
	String submit=request.getParameter("submit");
	String sql_get_data="";
	//String basic=request.getParameter("basic");
	//String location_of_posting=request.getParameter("location_of_posting");
	//String remarks=request.getParameter("remarks");
	//String hra=request.getParameter("hra");
	//String others=request.getParameter("others");
	//String gross=request.getParameter("gross");
	//String take_home=request.getParameter("take_home");
	float ctc=0;
	float ctc1=0;
	float ctc2=0;
	float ctc3=0;
	int total_jobs=0;
	float total_salary=0;
        int temp_jobs=0;
	float temp_salary=0;
	int program_id=0;
	//String confirmation=request.getParameter("confirmation");
//out.println(confirmation);
		int ijkl=0;
		int num_rows=1;
                int done=0;
                int temp_j;
	if(submit!=null && package_name!=null && student_roll_number.length!=0)
	{	
			
			while(ijkl<student_roll_number.length)	
			{
				String student_roll_number1=student_roll_number[ijkl];
				ijkl++;
			
				sql_get_data="select package_id,ctc,ctc_mtech,ctc_msc,ctc_phd from package_details where package_name='"+package_name+"';" ;		
				//db.connect(); 
				ResultSet rsp= db.execSQL(sql_get_data);
				if(rsp.next()) 
				{
					ctc=rsp.getFloat("ctc");
					ctc1=rsp.getFloat("ctc_mtech");
					ctc2=rsp.getFloat("ctc_msc");
					ctc3=rsp.getFloat("ctc_phd");
					package_id=rsp.getInt("package_id");
				}
				rsp.close();
				//db.close();
				sql_get_data="select student_id,department_id,programme_id,program_id from student_record where student_roll_number='"+student_roll_number1+"';" ;
				//out.println(sql_get_data);
				//db.connect(); 
				ResultSet re= db.execSQL(sql_get_data);
				if(re.next()) 
				{
					student_id=re.getInt("student_id");
					department_id=re.getInt("department_id");
					programme_id=re.getInt("programme_id");
					program_id=re.getInt("program_id");
				}
				//out.println(old_department_id);
				re.close();  
				//db.close();
				if(programme_id==3 || programme_id==4)
				    {
					ctc=ctc1;

				    }
				if(programme_id==5 || programme_id==6)
				    {
					ctc=ctc2;
				    }
				if(programme_id==7)
				  {
					ctc=ctc3;

				  }
	
				String get_number="select count(*) from placement_record where student_id="+student_id+";";
				//db.connect();
				ResultSet rs=db.execSQL(get_number);
				//out.println("*"+j+"*");
				j=0;
				while(rs.next())
				{
					j=rs.getInt(1);
				}
				rs.close();
				//db.close();
				//out.println(j);
				if(j==2)
				{
					info+=display1+"<br/>Student (Roll No."+student_roll_number1+") has been already registered for two companies"+display2;
				}
			
				if(j==1||j==0)		
				{	
					if(package_id!=0 && student_id!=0)
					{	
                                                
						//out.println(confirmation);
						String main_record="insert into placement_record(package_id,student_id)"+" values ("+package_id+","+student_id+");";
						//out.println("rohan 3");
						//db.connect();
						ResultSet rset=db.execSQL("select total_jobs,total_salary from placement_status where prog_id="+program_id+";");
						if(rset.next())
						{
							temp_jobs=rset.getInt("total_jobs");
							temp_salary=rset.getFloat("total_salary");
						}
						rset.close();
						//db.close();
                                                total_jobs=temp_jobs+1;
                                                total_salary=temp_salary+ctc;
                                                temp_j=j+1;
						/*if(temp_jobs==0 || temp_salary==0)
						{
							info+=display1+"Student (Roll No."+student_roll_number1+") details could not be updated."+display2;
						}
						else
						{*/
                                                       //db.connect();
							num_rows=db.updateSQL("update placement_status set total_jobs="+total_jobs+",total_salary="+total_salary+" where prog_id="+program_id+";");
							num_rows=db.updateSQL("update student_record set job_status=1,job_number="+temp_j+" where student_id="+student_id+";");
							num_rows=db.updateSQL(main_record);
                                                           done=1;
                                                       //db.close();
						/*}*/
						
					}
					else if(package_id!=0)
						info+=display1+"Invalid Student (Roll No."+student_roll_number1+")"+display2;
					else if(student_id!=0)
						info+=display1+"Invalid Package :"+package_name+display2;
					if(j==1 && done!=0)
						info+=display1+"Student (Roll No."+student_roll_number1+") now has two packages."+display2;
					if(j==0 && done!=0)
						info+=display1+"Student (Roll No."+student_roll_number1+") now has one package."+display2;
				}
                               if(j==1)
                                {
                                      //db.connect();
                                      String sql_restrict="update eligible_students set status=1 where student_id="+student_id+";";
                                      int num_restrict=db.updateSQL(sql_restrict);
                                      //db.close();
                                }
                              if(j==0)
                               {
                                     String sql_countid="select count(*) from eligible_students where student_id="+student_id+";";
                                     int num_id=0;
                                     //db.connect();
                                     ResultSet rsaq=db.execSQL(sql_countid);
                                     if(rsaq.next())
                                      {
                                         num_id=rsaq.getInt(1);
                                      }
                                      rsaq.close();
                                      //db.close();
                                     String[] db_agencyid = new String[num_id];
                                   String sql_getagencyid="select agency_id from eligible_students where student_id="+student_id+";";
                                    int index=0;
                                   //db.connect();
                                   ResultSet rs5=db.execSQL(sql_getagencyid);
                                   while(rs5.next())
                                     {
                                         db_agencyid[index]=rs5.getString(1);
                                            index++;       
                                     }
                                     rs5.close();
                                     //db.close();
                                    index=0;
                                   while(index<db_agencyid.length)
                                      {
                                           int new_agencyid=Integer.parseInt(db_agencyid[index]);
                                                 index++;
                                           String sql_packageid="select package_id from package_details where agency_id="+new_agencyid+";";
                                           int new_packageid=0;
                                           //db.connect();
                                        ResultSet rsab=db.execSQL(sql_packageid);
                                        while(rsab.next())
                                        {
                                           new_packageid=rsab.getInt(1);
                       
                                           String sql_newctc="select ctc,ctc_mtech,ctc_msc,ctc_phd from package_details where package_id="+new_packageid+";";
                                           float new_ctc=0;
					   float new_ctc1=0;
					   float new_ctc2=0;
					   float new_ctc3=0;
                                           //db.connect();
                                           ResultSet rsab1=db.execSQL(sql_newctc);
                                           if(rsab1.next())
                                            {
						new_ctc=rsab1.getFloat(1);
						new_ctc1=rsab1.getFloat(2);
						new_ctc2=rsab1.getFloat(3);
						new_ctc3=rsab1.getFloat(4);
                                            }
                                            rsab1.close();
                                            //db.close(); 
                                          
                                           
                                            int dept_id=0;
					    int pgmme_id=0;
                                          String get_dept="select department_id,programme_id from student_record where student_id="+student_id+";";
                                          //db.connect();
                                          ResultSet rsab2=db.execSQL(get_dept);
                                          if(rsab2.next())
		                          {
                                           dept_id=rsab2.getInt(1);
					   pgmme_id=rsab2.getInt(2);
		                          }
                                          rsab2.close();
                                          //db.close();

 					  if(pgmme_id==3 || pgmme_id==4)
					  {
						new_ctc=new_ctc1;

					    }
					if(pgmme_id==5 || pgmme_id==6)
					    {
						new_ctc=new_ctc2;
					    }
					if(pgmme_id==7)
					    {
						new_ctc=new_ctc3;

					    }
                                          
                                         String sql_temp="select count(*) from student_record where department_id="+dept_id+";";
                                        int total_dept_stud=0;
                                        //db.connect();
                                       ResultSet rsab3=db.execSQL(sql_temp);
                                       if(rsab3.next())
                                       {
                                          total_dept_stud=rsab3.getInt(1);
                                       }
                                       rsab3.close();
                                         
                                       String get_record="select distinct student_id from placement_record;";
                                       //db.connect();
                                       ResultSet rr=db.execSQL(get_record);
                                       int stud_rec_id=0;
                                       int placed_dept_stud=0;
                                        
                                          while(rr.next())
                                             {   
                                                  stud_rec_id=rr.getInt(1);
                                                  //db.connect();
                                                  sql_temp="select * from student_record where student_id="+stud_rec_id+" and department_id="+dept_id+";";
                                                  ResultSet rsab4=db.execSQL(sql_temp);
                                                  if(rsab4!=null)
                                                  { 
                                                      if(rsab4.next())
                                                         {placed_dept_stud++;}
                                                  }    
                                                     //else
                                                     rsab4.close();
                                                     //db.close();
                                              }
                                           rr.close();
                                           //db.close();

                                    float percent=(placed_dept_stud*100f)/total_dept_stud;
                                    
                                    String sql_para="select * from second_card";
                                    String per_para="0";
                                    String sal_para="0";
                                    //db.connect();
                                    rr=db.execSQL(sql_para);
                                    if(rr.next())
		                    {
                                         per_para=rr.getString(1);
                                         if(per_para==null || per_para.equals(""))
                                           per_para="0";

                                         sal_para=rr.getString(2);
                                         if(sal_para==null || sal_para.equals(""))
                                            sal_para="0";   
                                         
                                         out.println("per_para: "+per_para);
                                         out.println("sal_para: "+sal_para);
   
		                    }
                                   float salary_para = Float.parseFloat(sal_para);
                                   int percent_para = Integer.parseInt(per_para);

                                   rr.close();
                                   //db.close();
                                   
                                     if(!((new_ctc>=salary_para*ctc) && percent>=percent_para))       
                                       {
                                           sql_temp="update eligible_students set status=1 where agency_id="+new_agencyid+" and student_id="+student_id+" and package_id="+new_packageid+";";
                                           //db.connect();
                                           int num_update=db.updateSQL(sql_temp);
                                           //db.close();
                                       }
                           
                                            } // while for one package id per agency id
                                            rsab.close();
                                            //db.close(); 
                                    }
                                     
                               }	
		
			}//end of while

		}
		if(num_rows!=0 && done!=0)
		{
			info+=display1+"Records updated successfully"+display2;
		}

                db.close();
%>
	
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati</h1> 
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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="main.jsp">Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp" > Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp" >Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../logout.jsp">LOGOUT</a>
            <img src="../images/bot.gif" alt="" width="181" height="243" />
    </div>
</div></td>

<form method="post" name="form_placement_record" id="form_placement_record2" onSubmit="return validate_empty(this)">
  <p><strong>Placement Record</strong></p>
  <table  border="0">
<%=info%>
  </table>
  <p>&nbsp; </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>
  .<br>
  </p>
</form>






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
