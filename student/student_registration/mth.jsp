<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />



<html>
    
    <head>
        <title>Student Registration</title>
	  <script language="javascript">
	  function printpage()
	  {
	  document.getElementById("print").style.display='none';
	  document.getElementById("print1").style.display='none';
	  //document.getElementById("back").style.display='none';
	  window.print();
	  }


	  </script>

	  <%//@page language="java" import="pack.dbbean"%> 
	  <%@page language="java" import="java.sql.*"%>
	  <%@ page import="java.util.*" %>
	  <%@ page import="java.util.Calendar" %>
	  <%@ page import="java.util.Date" %>        
	  <%@ page import="java.text.SimpleDateFormat" %>
	  <%@ page import="sun.net.smtp.SmtpClient, java.io.*" %>


        <style type="text/css">
            
            body{
                
                margin:0 0 0 0;
                font-family:arial;
                
                
            }
            .wrraper{
                
                width:100%;
                height:auto;
                
            }
            .head1{
                width:100%;
                height:100px;
                /*border:1px solid red;*/
                background:#FBCDF9;
                
            }
            .wrapper1{
                
                width:980px;
               /* height:700px;*/
                margin-top:-100px;
               /* border:1px solid green;*/
                margin-right:auto;
                margin-left:auto;
                
            }
            
            .logo{
                
                float:left;
                
                width:978px;
                /*height:100px;*/
               
                /*background:#cccccc;*/
                
            }
            
            .mid_cont{
                
                float:left;
               /* height:500px;*/
                width:978px;
               /* border:1px solid black;*/
                background:#F2F8FC;
                border-top:2px solid black;
            }
            .footer{
                
                float:left;
                height:50px;
                width:978px;
               /* border:1px solid black; */
                background:#F2F8FC;
            }
            .row{
                
                float:left;
                width:978px;
                /*height:125px;*/
                /*background:#E8F3FA;*/
                margin-top:6px;
                
            }
            .r_blnk{
                
                float:left;
                width:840px;
              /*  height:120px;*/
              /*  border:1px solid yellow;*/
                
            }
            .pht{
                
                float:left;
                width:120px;
                height:116px;
                border:2px solid #000000;    
            }
            .txt_hdr{
                
              
               
            }
            .txt_hdr_st{
                
                font-size:18px;
                color:#FFFFFF;
                background:#000000;
                width:380px;
                font-weight:bold;
                margin-top:10px;
                margin-left:300px;
                text-align:center;
                 
            }
            .roll_no{
                
                float:left;
                width:820px;
                /*height:35px;*/
               /* border:1px solid blue;*/
              
            }
            
            .left_roll_no{
                
                float:left;
                width:200px;
                height:30px;
               /* background:#83F79E;*/
                padding-left:20px;
                line-height:30px;
                font-size:16px;
                font-weight:bold;
                
                
                
            }
            .right_roll_no{
                
                float:left;
                width:600px;
                height:30px;
               /* background:#F7CF83;*/
                line-height:30px;
                font-size:16px;
                
            }
            .bld_inp{
                
                margin-left:10px;
                letter-spacing:3px;
                
            }
            
            .row ul{
                
               
                list-style:disc;
                
            }
            .row ul li{
                
                font-size:16px;
                /*font-weight:bold;*/
                line-height:30px;
                text-align:justify;
                padding-right:20px;
                
            }
            .lg_img{
                
                float:left;
                width:120px;
                height:100px;
                /*border:1px solid red;*/
                background:#0DF529;
            }
            .lg_txt{
                
                float:left;
                width:600px;
                height:100px;
               /* border:1px solid black;*/
                
                
            }
            
            table
            {
                border-collapse:collapse;
                font-size:11px;
            }
            table, td, th
            {
                border:1px solid black;
                padding-left:5px;
            
            }   

            
        </style>
        
        
    </head>
    <body>
     <% 
	  String student_roll_number=(String)session.getAttribute("rollno").toString();
	  String uid=(String)session.getAttribute("uid").toString();
	  String stdid=(String)session.getAttribute("stdid").toString();

	  //System.out.println("Student_roll"+student_roll_number);
	 // System.out.println("userid"+uid);
String img_absolute_path="../../image_uploads/";
	String img_path="";
	String sign_path="";
	  String name="",dob="",sex="";
	  String category="";
	  String jee_rank="";
	  String hostel="";
          String nationality="";
	  String room_no="";
	  String email1="";
	  String email2="";
	  String mobile1="";
	  String mobile2="";
	  String address="";
	  String pin="";
	  String telephone="";
	  String x_board="";
	  String x_medium="";
	  String x_marks="";
	  String x_year="";
	  String xii_board="";
	  String xii_medium="";
	  String xii_marks="";
	  String xii_year="";

	  String gap="";
	  String gap_reason="";
	  String cpi="";
	  String backlog="";
	  String sem1="";
	  String sem2="";
	  String sem3="";
	  String sem4="";
	  String sem5="";
	  String sem6="";
	  String sem7="";
	  String programme_id="";
	  String department_id="";
	  String core="";
	  String govt="";
	  String IT="";
	  String management="";
	  String fin_and_banking_sector="";
	  String dream_company="";
	  String program_name="";
	  String gap_duration="";
	  String x_div="";
	  String xii_div="";
	  String backlog_courses="";
	  String comp_1="";
	  String comp_2="";
	  String comp_3="";
	  String comp_4="";
	  String comp_5="";
	  String address2="";
	  String address3="";
	  String program_id="";
	  String program_name1="";
          String grad_degree="";
          String grad_branch="";
          String grad_medium="";
          String grad_percentage="";
	  String grad_year="";
	  String grad_board="";
	  String grad_div="";
	  String others="";
	  String others_board="";
	  String others_medium="";
	  String others_div="";
	  String others_percentage="";
	  String others_year="";
		img_path = img_absolute_path+student_roll_number+"_img.jpeg";
	sign_path = img_absolute_path+student_roll_number+"_sign.jpeg";
	
  	  String sql_get_data="select * from student_record where student_roll_number='"+student_roll_number+"'" ;
	  db.connect(); 
	  ResultSet rs= db.execSQL(sql_get_data);
	  if(rs.next()) 
	  {
		  name=rs.getString("student_name");
		  dob=rs.getString("date_of_birth");
		  sex=rs.getString("sex");


		  //System.out.println("name---"+name);
		  //System.out.println("dob::"+dob);
		 // System.out.println("sex::"+sex);
		  if(sex==null)
			sex="0";
		  if(sex.equals("0"))
			sex="F";
		  else 
			sex="M";
		  
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
		  gap=rs.getString("gap_in_study");
		  if(gap==null)
			gap="0";
		  if(gap.equals("0"))
			gap="No";
		  else
			gap="Yes";
		  gap_reason=rs.getString("gap_reason");
		  cpi=rs.getString("cpi_2sem");
		  backlog=rs.getString("backlog");
		  if(backlog.equals("0"))
			backlog="No";
		  else
			backlog="Yes"; 
		  sem1=rs.getString("spi_1sem");
		  sem2=rs.getString("spi_2sem");
		  sem3=rs.getString("spi_3sem");
		  sem4=rs.getString("spi_4sem");
		  sem5=rs.getString("spi_5sem");
		  sem6=rs.getString("spi_6sem");
		  sem7=rs.getString("spi_7sem");
		  programme_id=""+rs.getString("programme_id");
		  department_id=""+rs.getString("department_id");
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
		ResultSet rsss=db.execSQL("select programme_name from programme_record where programme_id="+programme_id+";");
		if(rsss.next())
			program_name=rsss.getString(1);
		rsss.close();
		ResultSet rs2=db.execSQL("select department_name from department_record where department_id="+department_id+";");
		if(rs2.next())
			program_name+=" "+rs2.getString(1);
		rs2.close();
		if(program_id!=null)
		{
			ResultSet r_s1=db.execSQL("select programme_name from prog_record where prog_id="+program_id+";");
			if(r_s1.next())
				program_name1=r_s1.getString(1);
			r_s1.close();
		}
		String record="insert into print_status values ('"+uid+"');";
		//out.println("tyyy"+record);
		int num_rows=0;
		num_rows =db.updateSQL(record);
		db.close();


     %>
        <div class="wrraper">
            <div class="head1">
            </div>    
            <div class="wrapper1">
                <div class="logo">
                    <div class="lg_img">
			<img src="iitg_web_mid.gif" width="119" height="99">
			
                    </div>
                    <div class="lg_txt">
                        <div style="font-size:24px;font-weight:bold;padding-left:10px;">TRAINING & PLACEMENT CELL</div>
                        <div style="font-size:18px;font-weight:bold;padding-left:10px;line-height:30px;">INDIAN INSTITUTE OF TECHNOLOGY GUWAHATI </div>
                        <div style="font-size:18px;font-weight:bold;padding-left:10px;line-height:30px;">GUWAHATI-781039</div>
                    </div>
                    <div style="float:left;width:200px;height:80px; font-size:14px;margin-top:10px;">
                        <b>Student ID:</b><b>&nbsp;&nbsp;<%=stdid%></b>
                        <br/>
                        <br/>
                        <input align="center" type="button" id="print" value="PRINT" onclick="printpage();" />
                    </div> 
                </div>
                <div class="mid_cont">
                    <div class="row" style="margin-top:10px;">
                        <div class="r_blnk">
                            <div class="txt_hdr">
                               <div class="txt_hdr_st">REGISTRATION FORM FOR 2013-2014</div>
                            </div>
                            <div class="roll_no" style="margin-top:52px;">
                                <div class="left_roll_no">
                                    Roll No
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=student_roll_number%></b>
                                </div>    
                            </div>    
                        </div>
                        
                       <div style="position:absolute; right: 100px; top: 200px;border:2px solid #000000;">
                       <p><img src="<%=img_path%>"width="119" height="116" align="right"></p></br><p>
			</div>
			<div style="position:absolute; right: 100px; top: 340px;border:2px solid #000000;">
                       <img src="<%=sign_path%>"width="119" height="50" align="right"></p>
                       
                       </div>    
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Name
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=name%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Date of Birth 
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=dob%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Gender
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=sex%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no" style="font-size:12px;">
                                    Category<span style="font-size:8px"> (SC/ST/OBC/GEN/PH/FOREIGN)</span>
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=category%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Nationality
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=nationality%></b>
                                </div>    
                        </div>  
                    </div>                  
  
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Program
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=program_name%></b>
                                </div>    
                        </div>  
                    </div>
		    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Specialization
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=program_name1%></b>
                                </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no" style="font-size:12px;">
                                     GATE/JAM/NET Rank (AIR)
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=jee_rank%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Hostel
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=hostel%></b>
                                </div>    
                        </div>  
                    </div>
		    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    Room No
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=room_no%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                    E-mail
                                </div>
                                <div class="right_roll_no" style="font-size:12px;">
                                    <b>:</b><b class="bld_inp">(1)&nbsp;<%=uid%>@iitg.ernet.in &nbsp;&nbsp;&nbsp;(2)&nbsp;<%=email2%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 Mobile No
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp">(1)&nbsp;<%=mobile1%>&nbsp;&nbsp;&nbsp;(2)&nbsp;<%=mobile2%></b>
                                </div>    
                        </div>  
                    </div>
		    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 Telephone:
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=telephone%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 Permanent Address
                                </div>
                                <div class="right_roll_no" style="height:auto;">
                                    <p style="margin-top:0px;padding-top:2px;font-size:14px;">:&nbsp;&nbsp;<%=address%>&nbsp;<%=address2%> &nbsp;<%=address3%>&nbsp;pin:&nbsp;<%=pin%></p>
                                </div>    
                        </div>  
                    </div>
		    <div class="row" style="width:100%;font-size:12px;">
			Academic Details:
		    </div>
                    <div class="row" style="width:100%;">
                        <div class="roll_no" style="width:970px;">
                                
                                <div class="right_roll_no" style="height:300px; width:910px;">
                                   <table width="900px" border="1" class="tab" align="center">
                                        <tr><td>LEVEL</td><td>Board/Institution</td><td>Medium</td><td>Class/Div</td><td>% of Marks</td><td>Year of passing</td></tr>
                                        <tr><td>X STD</td><td><%=x_board%></td><td><%=x_medium%></td><td><%=x_div%></td><td><%=x_marks%></td><td><%=x_year%></td></tr>
                                        <tr><td>XII STD/DIP./EQUIV</td><td><%=xii_board%></td><td><%=xii_medium%></td><td><%=xii_div%></td><td><%=xii_marks%></td><td><%=xii_year%></td></tr>
					<tr><td>Degree :<%=grad_degree%><br/>(B.E./B.Tech/B.Sc./Diploma)</td><td><%=grad_board%></td><td><%=grad_medium%></td><td><%=grad_div%></td><td><%=grad_percentage%></td><td><%=grad_year%></td></tr>
                                        <tr><td>Branch :<%=grad_branch%></td><td></td><td></td><td></td><td></td><td></td></tr>
                                        <tr><td>Other :<%=others%></td><td><%=others_board%></td><td><%=others_medium%></td><td><%=others_div%></td><td><%=others_percentage%></td><td><%=others_year%></td></tr>
                                    </table>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 Gap in study 
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=gap%> &nbsp;&nbsp;&nbsp;&nbsp;Duration:&nbsp;<%=gap_duration%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 Reason
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=gap_reason%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 CPI (up to 2nd semester)
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=cpi%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no">
                                 SPI in all semesters 
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp">Backlog:&nbsp;&nbsp;<%=backlog%>&nbsp;&nbsp;Courses:&nbsp;&nbsp;<%=backlog_courses%></b>
                                </div>    
                        </div>  
                    </div>
                    <div class="row">
                        <div class="roll_no" style="width:970px;">
                                <div class="right_roll_no" style="height:auto; width:650px;" >
                                   <table width="640" border="1" class="tab" align="center">
                                        <tr><td>1st sem</td><td>2nd sem</td><td>3rd sem</td></tr>
                                        <tr><td><%=sem1%></td><td><%=sem2%></td><td><%=sem3%></tr>
                                    </table>
                                </div>    
                        </div>  
                    </div>  
		    <div class="row">
                        <div class="roll_no">
                                <div class="left_roll_no" style="font-size:12px;">
                                 Dream Company:
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp"><%=dream_company%></b>
                                </div>    
                        </div>  
                    </div>
		    <div class="row">
		    </div>
                    <div class="row" style="margin-top:100px;font-size:16px;font-family:Times roman;">
			<div class="roll_no">
                                <div class="left_roll_no">
                                 Preferred Job
                                </div>
                                <div class="right_roll_no">
                                    <b>:</b><b class="bld_inp">Priority</b>
                                </div>    
                        </div>
			<div class="roll_no" style="width:970px;">
                                <div class="right_roll_no" style="height:auto; width:650px;" >
                                   <table width="640" border="1" class="tab" align="center">
                                        <tr><td>Core Sector </td><td>Govt. Sector </td><td>IT Sector </td><td>Management Sector </td><td>Fin. & Banking Sector</td></tr>
                                        <tr><td><%=core%></td><td><%=govt%></td><td><%=IT%></td><td><%=management%></td><td><%=fin_and_banking_sector%></td></tr>
                                    </table>
                                </div>    
                        </div>  
                        <p style="padding-left:20px;padding-right:10px;line-height:30px;">
                                
				<center><h1>Declaration<h1/></center>
                            I hereby declare that the information filled in the form is correct to the best of my knowledge. I shall strictly abide by the policies and regulations as set by the Training & Placement Cell for Campus recruitment in 2013-2014.
                        </p>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:left;">
                        <b style="padding-left:20px;">Date:</b>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:left;">
                        <b style="padding-left:20px;">Place:</b>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:right;">
                        <b style="padding-right:40px;">Signature of the Student</b>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:left;">
                        <b style="padding-left:20px;">Countersigned by</b>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:left;">
                        <b style="padding-left:20px;">..........................................................</b>
                    </div>
                    <div class="row" style="margin-top:15px;font-size:16px;font-family:Times roman; text-align:left;">
                        <b style="padding-left:20px;">Faculty I/C for Placement of the Department with seal</b>
                    </div>
                    <div class="row" style="margin-top:40px;border-top:2px solid black;">
                        &nbsp;
                    </div>
                    <div class="row" style="margin-top:5px;font-size:16px;font-family:Times roman;">
                        <ul>
                            <li>Students holding a job through Placement Cell will be allowed to appear for the next interview only on fulfilling certain criteria as laid down by the Placement Cell from time to time.</li>
                            <li>If a student gets a second job offer, he/she must give a letter of regret to the company, which offered the first (previous) job and letter of acceptance for the second immediately.  This means that a student can hold only one job at a time.</li>
                            <li>After accepting a job offer, if any student decides to withdraw his/her acceptance any time during the year, he/she must inform the company concerned through the Placement Cell immediately.</li>
                            <li>Placement Cell has the authority to take appropriate action against any student found violating the above policies.</li>
                            <li>In no circumstances, a student will be allowed to sit for the third job, when he/she has already got two jobs using the second card option.</li>
                            <li>The details of the rules and regulation are given in the placement intranet website <b>http://shilloi.iitg.ernet.in/~placement/intra/Policies%20and%20Regulations.pdf</b></li>
                        </ul>    
                    </div>
                    
                </div>
                <div class="footer">
                    <div class="row" style="margin-top:5px;border-top:2px solid black;">
                        <div style="text-align:center;font-size:14px;line-height:30px;">Phone:  +91 361 2582175,  Fax: +91 361 2690762,  E-mail: placement@iitg.ernet.in</div>
                    </div>
		    <form>
		    <input align="center" id="print1" type="button" value="PRINT" onclick="printpage();">          
		    </form>
                </div>    
            </div>
        ,</div>
    </body>     
</html>

