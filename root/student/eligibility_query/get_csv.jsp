<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%
        db.fetchConfigDetails(); //newly added
	String Content="";
	String submit=request.getParameter("submit");
	String package_id=request.getParameter("agen_name");   
	Content+="Sl.No.,Student Roll Number,Student Name,Current cpi,Department,Programme,10th percentage,12th percentage,Contact Number\n";
	


	db.connect();
	int i=1;
	ResultSet ra=db.execSQL("select student_id from interested_students where package_id="+package_id+";");
	while(ra.next())
	{
                 String sql_temp="select status from eligible_students where student_id='"+ra.getString(1)+"' and package_id="+package_id+";";
                                   int status=0;
                                    
                                     ResultSet rr=db.execSQL(sql_temp);
                                     if(rr.next())
                                      {
                                            status=rr.getInt(1);
                                      }                                     

                                      rr.close();

             if(status!=1)
              {
		ResultSet rs=db.execSQL("select student_roll_number,student_name,cpi_6sem,cpi_2sem,program_name,programme_id,x_percentage,xii_percentage,contact_number,program_id,department_id from student_record where student_id= "+ra.getInt(1)+";");
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


			Content+=i+","+rs.getInt("student_roll_number")+","+rs.getString("student_name")+",";
			if(rs.getInt("programme_id")==1||rs.getInt("programme_id")==2)
			{
				Content+=rs.getString("cpi_6sem")+",";
			}
			else
			{
				Content+=rs.getString("cpi_2sem")+",";
			}
			//Content+=rs.getString("program_name")+"\n";
                        Content+=st_dept_name+","+st_pg_name+","+rs.getString("x_percentage")+","+rs.getString("xii_percentage")+","+rs.getString("contact_number")+"\n";
			i++;
		}
		rs.close();
            }
	}
	ra.close();
	db.close();  
	
	if(submit!=null)
	{
		String filename="student_list.csv";
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
