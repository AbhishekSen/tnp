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
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>

<%
        db.fetchConfigDetails(); //newly added
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);

	String department_name=request.getParameter("q1");
	String programme_name=request.getParameter("q2");
	
	
//out.println(button_value+agency_name+student_roll_number);

	
	
	

	try 
	{ 
	double ctc=0.0;
        double total_ctc=0.0;
        int no_of_placed_students=0;
   
        String get_deptid="select department_id from department_record where department_name='"+department_name+"';";
        db.connect();
        ResultSet rd=db.execSQL(get_deptid);
        rd.next();
        int dept_id=rd.getInt(1);
        rd.close();
        db.close();
        
        
       String get_progid="select programme_id from programme_record where programme_name='"+programme_name+"';";
        db.connect();
        ResultSet rp=db.execSQL(get_progid);
        rp.next();
        int prog_id=rp.getInt(1);
        rp.close();
        db.close();
      
        String stud_id="select student_id from student_record where is_activated=1;";
        db.connect();
        ResultSet rs=db.execSQL(stud_id);
        int student_id=0;
        int prsnt=0;
        String get_ctc="";
        double max_ctc=0.0;
  
        
      while(rs.next())
        {  student_id=rs.getInt(1);
           


          ResultSet rt=db.execSQL("select count(*) from student_record where student_id="+student_id+" and department_id="+dept_id+" and programme_id="+prog_id+";");
         if(rt!=null)
         { 
      
           if(rt.next())
           {  
		   		prsnt=rt.getInt(1);
           }

        }       
		rt.close();
                   
         if(prsnt==1)
            {  
				//db.connect();
				int package_id=0;
				String get_package_id="select package_id from placement_record where student_id="+student_id+";";
				ResultSet rpack= db.execSQL(get_package_id);
				if(rpack.next())
					package_id=rpack.getInt(1);
				rpack.close();
				
			
				get_ctc="select ctc from package_extra_details where package_id="+package_id+";";
              	max_ctc=0;
               ResultSet rc=db.execSQL(get_ctc);
               if(rc.next())
               		max_ctc=rc.getDouble(1);
               rc.close();
			   
             
            }
           total_ctc+=max_ctc;  
        
        }  
       rs.close();
       db.close();
  if(total_ctc==0.0)
    out.println(display1+"No students are placed yet for the given department and programme "+display2);
      
  else
  {

  String plac_stud="select distinct student_id from placement_record;";
  db.connect();
  ResultSet ru=db.execSQL(plac_stud);
  int stude_id=0;
  int total_pl_stud=0;
  while(ru.next())
   {
    stude_id=ru.getInt(1);
    ResultSet rl=db.execSQL("select student_id from student_record where student_id="+stude_id+" and department_id="+dept_id+" and programme_id="+prog_id+";");
    if(rl!=null)
    {
		if(rl.next())
		{
			total_pl_stud++;
		} 
	}  
	rl.close();
   }
   
   ru.close();
   db.close();
   double avg_pckg=0.0;
   avg_pckg=(total_ctc/total_pl_stud);
   
   out.println(display1+"Total number of placed students = "+total_pl_stud+display2);
   out.println(display1+"Average Package(in Rs.Lakhs) = "+avg_pckg+display2);
  

  }
    	
  	}	
	catch(SQLException e) 
	{ 
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
		//throw new ServletException("Your query is not working: " + str , e); 
	} 
	catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		out.println(err);
	}

%>


