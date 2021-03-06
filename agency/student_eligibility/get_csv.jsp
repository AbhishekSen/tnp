<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*,java.io.*,java.text.*"%>
<%@ page import="java.util.*" %>
<%
        db.fetchConfigDetails(); //newly added
	String Content="";
	String submit=request.getParameter("submit");
	String username=request.getParameter("username"); 
	String package_id=request.getParameter("pid");  
	Content+="Sl.No.,Student Roll Number,Student Name,CPI,Department,Programme,X_Percentage,X_Pass_Year,XII_Percentage,XII_Pass_Year,Category,Gender,DOB,Primary Phone Number,Alternate Phone Number,Primary EmailID,Alternate EmailID,Permanent Address Line1,Address line2,Address Line2,Pin,JEE/GATE rank,Nationality,Remarks\n";
	
	String get_cpi="select agency_id from agency where username='"+username+"';";
	db.connect();
	ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
	
	String agency_id="";
	if(re.next())
		agency_id=""+re.getInt("agency_id");
	re.close();
	db.close();

	db.connect();
	int i=1;
	ResultSet ra=db.execSQL("select student_id from interested_students where agency_id="+agency_id+" and package_id='"+package_id+"';");
	while(ra.next())
	{
              /*
                ResultSet prec = db.execSQL("select count(*) from placement_record where student_id='+"ra.getString(1)"+'");
                if(prec.next())
                {
                        if(prec.getInt(1)>0) continue;
                } 
                prec.close();
               */

                 String sql_temp="select status from eligible_students where student_id='"+ra.getString(1)+"' and agency_id="+agency_id+" and package_id='"+package_id+"';";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
                                     if(rr.next())
                                      {
                                            status=rr.getInt(1);
                                      }                                     

                                      rr.close();

             if(status!=1)
              {
		ResultSet rs=db.execSQL("select * from student_record where student_id= "+ra.getInt(1)+";");
		if(rs.next())
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
			
			
			
			
			Content+=i+","+rs.getInt("student_roll_number")+","+rs.getString("student_name")+",";
			if(rs.getInt("programme_id")==1||rs.getInt("programme_id")==2)
			{
				Content+=rs.getString("cpi_6sem")+",";
			}
			else
			{
				Content+=rs.getString("cpi_2sem")+",";
			}
			Content+=st_dept_name+",";
			Content+=st_pg_name+",";
		
                        String x_pcgt=rs.getString("x_percentage");
                        if(x_pcgt!=null)
                           Content+=x_pcgt.replaceAll(",",".")+",";
                        else Content+=""+",";

                        String x_pass_year=rs.getString("x_pass_year");
                        if(x_pass_year!=null)
                           Content+=x_pass_year.replaceAll(",",".")+",";
                        else Content+=""+",";
                        
                        String xii_pcgt=rs.getString("xii_percentage");
                        if(xii_pcgt!=null)
                           Content+=xii_pcgt.replaceAll(",",".")+",";
                        else Content+=""+",";

                        String xii_pass_year=rs.getString("xii_pass_year");
                        if(xii_pass_year!=null)
                           Content+=xii_pass_year.replaceAll(",",".")+",";
                        else Content+=""+",";
	
                        String stud_cat=rs.getString("category");
                        if(stud_cat!=null)
                           Content+=stud_cat.replaceAll(",",".")+",";
                        else Content+=""+",";

			Integer sex = rs.getInt("sex");
			if(sex != null && sex==0) Content+="F"+",";
			else if(sex != null && sex==1) Content+="M"+",";
			else Content+=""+",";
			
			java.util.Date date_of_birth = rs.getDate("date_of_birth");
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy");
			String dob=dateFormat.format(date_of_birth);
			if(dob != null) Content+=dob+",";
			else Content+=""+",";
			
			String contact1 = rs.getString("contact_number");
			if(contact1!=null) Content+=contact1+",";
			else Content+=""+",";
			
			String contact2 = rs.getString("contact_number2");
			if(contact2!=null) Content+=contact2+",";
			else Content+=""+",";
			
			String email = rs.getString("email");
			if(email!=null) 
                           Content+=email.replaceAll(",",".")+",";
			else Content+=""+",";
			
			
			String email_alternative = rs.getString("email_alternative");
			if(email_alternative!=null) 
                           Content+=email_alternative.replaceAll(",",".")+",";
			else Content+=""+",";
			
			
			String permanent_address = rs.getString("permanent_address");
			if(permanent_address!=null) Content+=permanent_address.replaceAll(","," ")+",";
			else Content+=""+",";
			
			String address2 = rs.getString("address2");
			if(address2!=null) Content+=address2.replaceAll(","," ")+",";
			else Content+=""+",";

			String address3 = rs.getString("address3");
			if(address3!=null) Content+=address3.replaceAll(","," ")+",";
			else Content+=""+",";
					
						
			String pin = rs.getString("pin");
			if(pin!=null) Content+=pin+",";
			else Content+=""+",";
			
			String jee_rank = rs.getString("jee_rank");
			if(jee_rank!=null) Content+=jee_rank+",";
			else Content+=""+",";

			String nationality = rs.getString("nationality");
			if(nationality!=null) Content+=nationality+",";
			else Content+=""+",";

                  ResultSet prec = db.execSQL("select count(*) from placement_record where student_id='"+ra.getString(1)+"';");
                  if(prec.next())
                  {
                        if(prec.getInt(1)>0)  // continue;
                        {
                          Content+="Already Placed";
                        } 
                        else
                        {
                          Content+="Available";
                        }  
                  } 
                  prec.close();
                        			
			Content+="\n";
			
			i++;
		}
		rs.close();
            }
	}
	ra.close();
	db.close();  
	
	if(submit!=null)
	{
	        db.connect();
	        String pname="";
	        ResultSet rst=db.execSQL("select package_name from package_details where package_id= "+package_id+";");
		if(rst.next())
		{ 
		       pname=rst.getString(1); 
		}
		rst.close();
		db.close();
		String filename="student_list_"+pname+".csv";
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
%>
