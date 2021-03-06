<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.lang.*,java.util.*,java.io.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>

</head>


<body onLoad="document.form_placement_record.agency_name.focus();">
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
	db.fetchConfigDetails();
	String q1=request.getParameter("1");
	String q2=request.getParameter("2");
	if(q1!=null)
	{
		if(q1.equals("btech"))
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Gap in Study,Reason for Gap,CPI 6sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,SPI 4sem,SPI 5sem,SPI 6sem,SPI 7sem,";
			Content+="Backlog,Backlog Courses\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from student_record where programme_id=1 or programme_id=2;");
			while(rs.next())
			{

				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_6sem");
				Content+=","+rs.getString("spi_1sem");
				Content+=","+rs.getString("spi_2sem");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_4sem");
				Content+=","+rs.getString("spi_5sem");
				Content+=","+rs.getString("spi_6sem");
				Content+=","+rs.getString("spi_7sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			rs.close();
			db.close();
			
			String filename="stud_btech.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(q1.equals("mtech"))
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from student_record where programme_id=3 or programme_id=4;");
			while(rs.next())
			{
				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");

                                System.out.println("dept_id: "+st_department_id+", prog id: "+st_program_id);
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
                                   
                                System.out.println("Here 123456");
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept_name;
				Content+=","+st_pg_name;
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch".replaceAll(",","\t"));
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason");
				Content+=","+rs.getString("cpi_2sem");
				Content+=","+rs.getString("spi_1sem");
				Content+=","+rs.getString("spi_2sem");
				Content+=","+rs.getString("spi_3sem");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			rs.close();
			db.close();
			
			String filename="stud_mtech.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}

		else if(q1.equals("phd"))
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from student_record where programme_id=7;");
			while(rs.next())
			{
				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");

                                System.out.println("dept_id: "+st_department_id+", prog id: "+st_program_id);
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
                                   
//                                System.out.println("Here 123456");
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept_name;
				Content+=","+st_pg_name;
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch".replaceAll(",","\t"));
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason");
				Content+=","+rs.getString("cpi_2sem");
				Content+=","+rs.getString("spi_1sem");
				Content+=","+rs.getString("spi_2sem");
				Content+=","+rs.getString("spi_3sem");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			rs.close();
			db.close();
			
			String filename="stud_phd.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(q1.equals("msc"))
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from student_record where programme_id=5;");
			while(rs.next())
			{
				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch").replaceAll(",","\t");
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_1sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			rs.close();
			db.close();
			
			String filename="stud_msc.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(q1.equals("ma"))
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			db.connect();
			ResultSet rs=db.execSQL("select * from student_record where programme_id=6;");
			while(rs.next())
			{

				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch").replaceAll(",","\t");
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_1sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			rs.close();
			db.close();
			
			String filename="stud_ma.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(q1.equals("stu_reg"))
		{
			db.connect();
			String Content="Programme Name,Total Students,Registered Students\n";
			ResultSet rs=db.execSQL("select * from prog_record;");
			while(rs.next())
			{
				ResultSet r1=db.execSQL("select count(*) from student_record where program_id="+rs.getInt("prog_id")+" and is_registered=1;");
				ResultSet r2=db.execSQL("select count(*) from student_record where program_id="+rs.getInt("prog_id")+";");
				r1.next();
				r2.next();
				Content+=rs.getString("programme_name")+","+r2.getInt(1)+","+r1.getInt(1)+"\n";
				r1.close();
				r2.close();
			}
			rs.close();
			db.close();
			
			String filename="reg_status.csv";
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[1000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
	}
	else if(q2!=null)
	{
		db.connect();
		ResultSet r1=db.execSQL("select * from prog_record where prog_id="+q2+";");
		r1.next();
		String filename=r1.getString("programme_name");
		filename+=".csv";
		int duration=0;
		duration=r1.getInt("duration");
		r1.close();
		ResultSet rs=db.execSQL("select * from student_record where program_id="+q2+";");
		if(duration==2)
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			while(rs.next())
			{

				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category").replaceAll(",","\t");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch").replaceAll(",","\t");
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_1sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			
			
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=\"" +filename+"\"");
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(duration==4)
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Gap in Study,Reason for Gap,CPI 6sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,SPI 4sem,SPI 5sem,SPI 6sem,SPI 7sem,";
			Content+="Backlog,Backlog Courses\n";
			while(rs.next())
			{

				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_6sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_1sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_4sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_5sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_6sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_7sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}

			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=\""+filename+"\"");
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		else if(duration==0)
		{
			String Content="Roll Number,Name,Department,Programme,DOB,Category,Rank,Hostel,Room,Webmail ID,Email,Contact Number 1,Contact Number 2";
			Content+=",Address Line1,Line2,Line3,PIN";
			Content+=",Home Number,X Board,X Medium,X Percentage,X Division,X Year,XII Board,XII Medium,XII Percentage,XII Division,XII Year,";
			Content+="Grad Degree,Grad Branch,Grad Board,Grad Medium,Grad Percentage,Grad Division,Grad Year,";
			Content+="Others,Others Board,Others Medium,Others Percentage,Others Division,Others Year,";
			Content+="Gap in Study,Reason for Gap,CPI 2sem,";
			Content+="SPI 1sem,SPI 2sem,SPI 3sem,";
			Content+="Backlog,Backlog Courses\n";
			while(rs.next())
			{

				String st_dept_name="NA";
                                String st_pg_name="NA";
				int st_department_id=rs.getInt("department_id");
				int st_program_id=rs.getInt("program_id");
				ResultSet st_dept=db.execSQL("select department_name from department_record where department_id="+st_department_id);
				if(st_dept.next())
				  st_dept_name=st_dept.getString(1);
				ResultSet st_pg=db.execSQL("select programme_name from prog_record where prog_id="+st_program_id);
                                if(st_pg.next())
				  st_pg_name=st_pg.getString(1);
				Content+=rs.getString("student_roll_number");
				Content+=","+rs.getString("student_name");
				Content+=","+st_dept.getString(1);
				Content+=","+st_pg.getString(1);
				Content+=","+rs.getString("date_of_birth");
				Content+=","+rs.getString("category").replaceAll(",","\t");
				Content+=","+rs.getString("jee_rank").replaceAll(",","\t");
				Content+=","+rs.getString("hostel").replaceAll(",","\t");
				Content+=","+rs.getString("room_no").replaceAll(",","\t");
				Content+=","+rs.getString("username");
				Content+=","+rs.getString("email_alternative").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("contact_number2").replaceAll(",","\t");
				Content+=","+rs.getString("permanent_address").replaceAll(",","\t");//.replaceAll("\n","");
				Content+=","+rs.getString("address2").replaceAll(",","\t");
				Content+=","+rs.getString("address3").replaceAll(",","\t");
				Content+=","+rs.getString("pin").replaceAll(",","\t");
				Content+=","+rs.getString("home_contact_number").replaceAll(",","\t");
				Content+=","+rs.getString("x_board").replaceAll(",","\t");
				Content+=","+rs.getString("x_medium").replaceAll(",","\t");
				Content+=","+rs.getString("x_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("x_div").replaceAll(",","\t");
				Content+=","+rs.getString("x_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("xii_board").replaceAll(",","\t");
				Content+=","+rs.getString("xii_medium").replaceAll(",","\t");
				Content+=","+rs.getString("xii_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("xii_div").replaceAll(",","\t");
				Content+=","+rs.getString("xii_pass_year").replaceAll(",","\t");
				Content+=","+rs.getString("grad_degree").replaceAll(",","\t");
				Content+=","+rs.getString("grad_branch").replaceAll(",","\t");
				Content+=","+rs.getString("grad_board").replaceAll(",","\t");
				Content+=","+rs.getString("grad_medium").replaceAll(",","\t");
				Content+=","+rs.getString("grad_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("grad_div").replaceAll(",","\t");
				Content+=","+rs.getString("grad_year").replaceAll(",","\t");
				Content+=","+rs.getString("others").replaceAll(",","\t");
				Content+=","+rs.getString("others_board").replaceAll(",","\t");
				Content+=","+rs.getString("others_medium").replaceAll(",","\t");
				Content+=","+rs.getString("others_percentage").replaceAll(",","\t");
				Content+=","+rs.getString("others_div").replaceAll(",","\t");
				Content+=","+rs.getString("others_year").replaceAll(",","\t");
				if(rs.getString("gap_in_study").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("gap_reason").replaceAll(",","\t");
				Content+=","+rs.getString("cpi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_1sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_2sem").replaceAll(",","\t");
				Content+=","+rs.getString("spi_3sem").replaceAll(",","\t");
				if(rs.getString("backlog").equals("1"))
					Content+=",Yes";
				else
					Content+=",No";
				Content+=","+rs.getString("backlog_courses").replaceAll(",","\t")+"\n";
				//Content+=","+rs.getString("permanent_address");
				//Content+=","+rs.getString("pin")+"\n";
			}
			
			
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=\"" +filename+"\"");
			byte[] buf = new byte[100000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}

		rs.close();
		db.close();
	}
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
    <img alt="small logo" src="../images/logo-top.gif" height="45" width="55"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp">Student </a>
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
 <table align="center">
 <tr><td>
  <p align="center"><strong>1. <a href="get_csv.jsp?1=btech">Get all B.Tech. &amp; B.Des Students Details.</a></strong></p>
  </tr></td><tr><td>
<p align="center"><strong>2.<a href="get_csv.jsp?1=mtech">Get all M.Tech. Students Details.</a></strong></p>
</tr></td><tr><td>
<p align="center"><strong>3.<a href="get_csv.jsp?1=phd">Get all Ph.D. Students Details.</a></strong></p>
</tr></td><tr><td>
<p align="center"><strong>4. <a href="get_csv.jsp?1=msc">Get all M.Sc. Students Details.</a><a href="eligibility_query/eligibility_query.jsp"></a></strong></p>
</tr></td><tr><td>
<p align="center"><strong>5. <a href="get_csv.jsp?1=ma">Get all M.A. Students Details.</a><a href="attendance/placement_record.jsp"></a></strong></p>
</tr></td></td><tr><td align="center">
<form name="form1" method="post" action="get_csv.jsp">
  <p>
    <label for="2"></label>
    <strong>5.Get By Programme</strong></p>
  <p>
    <select name="2" id="2">
    <%
		db.connect();
		ResultSet ru=db.execSQL("select * from prog_record;");
		while(ru.next())
		{
			out.println("<option value=\""+ru.getInt("prog_id")+"\">"+ru.getString("programme_name")+"</option>");
		}
		ru.close();
		db.close();
	%>
    </select>
    <input type="submit" name="submit" id="submit" value="Submit">
  </p>
</form>
</tr></td><tr><td>
<p align="center"><strong>6. <a href="get_csv.jsp?1=stu_reg">Get details of student registration.</a></strong></p>
</tr></td></td></table>

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
