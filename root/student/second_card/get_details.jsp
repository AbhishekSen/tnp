<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/sql_convert_date.jsp"%>

<%@ page import="java.util.*" %>

<%
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;


	String package_name=request.getParameter("q1");
	String student_roll_number=request.getParameter("q2");
	
	
//out.println(button_value+agency_name+student_roll_number);
        db.fetchConfigDetails(); //newly added
	
	int student_id=0;
	
	String get_id="select student_id from student_record where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);
	re.next();
	
	student_id=re.getInt(1);
	re.close();
	db.close();
	int package_id=0;
	
	get_id="select package_id from package_details where package_name='"+package_name+"';";
	db.connect();
	 re=db.execSQL(get_id);
	re.next();
	
	package_id=re.getInt(1);
	re.close();
	db.close();
	

	try 
	{ 
	
	int j=0;
	int old_package_id=0;
	String get_number="select package_id from placement_record where student_id="+student_id+";";
	db.connect();
	ResultSet rs=db.execSQL(get_number);
	while(rs.next())
	{j++;
	 old_package_id=rs.getInt(1);}
	rs.close();
	db.close();
	
	if (j==0)
	{out.println(display1+"Student has not used any of his job cards"+display2);
	out.println(display1+"Student is not eligible to use his second card in the above company"+display2);}
	if (j==1)
  {      out.println(display1+"Student has used only one job card"+display2);
	double old_ctc=0.0;
	double new_ctc=0.0;
        
        
	String get_ctc="select ctc from package_details where package_id="+old_package_id+";";
	db.connect();
	ResultSet rs1=db.execSQL(get_ctc);
       
        rs1.next();
      	old_ctc=rs1.getDouble(1);
	rs1.close();
	db.close();
        out.println(" old_ctc="+old_ctc+" ");
        /*String get_prog_id="select programme_id from package_details where package_id="+package_id+";";
        db.connect();
         ResultSet rs2=db.execSQL(get_prog_id);
     
        rs2.next();
        
        int prog_id=rs2.getInt(1);         //******
        rs2.close();
        db.close();*/

	get_ctc="select ctc from package_details where package_id="+package_id+";";//let b.tech for now.
	db.connect();
	ResultSet rs3=db.execSQL(get_ctc);
        
         rs3.next();
      	new_ctc=rs3.getDouble(1);
	rs3.close();
	db.close();
        
        out.println(" new_ctc="+new_ctc+" ");
	//80%block begins.
	int no_of_dept_students=0;
	int no_of_placed_students=0;
       
        
        int dept_id=0;
        String get_dept="select department_id from student_record where student_id="+student_id+";";
        db.connect();
        ResultSet rd=db.execSQL(get_dept);
        if(rd.next())
		{
       dept_id=rd.getInt(1);
		}
        rd.close();
        db.close();
     

        db.connect();
        Connection conn=db.dbCon;
        PreparedStatement ps=conn.prepareStatement("select student_id from student_record where department_id=?");  //
        ps.setInt(1,dept_id);
        ResultSet rt=ps.executeQuery();
        int total_dept_stud=0;
        while(rt.next())
        {total_dept_stud++;}out.println(" total department students "+total_dept_stud+" ");
        rt.close();
        db.close();
             
        String get_record="select distinct student_id from placement_record;";
        db.connect();
        ResultSet rr=db.execSQL(get_record);
        int stud_rec_id=0;
        int placed_dept_stud=0;
        String placed_stud="";
                 
        while(rr.next())
        {   
          stud_rec_id=rr.getInt(1);
          db.connect();
          Connection cone=db.dbCon;
       PreparedStatement pp=cone.prepareStatement("select * from student_record where student_id=? and department_id=?");
       pp.setInt(1,stud_rec_id);
       pp.setInt(2,dept_id);
    
          
         ResultSet rm=pp.executeQuery();  
          if(rm!=null)
        { if(rm.next())
         {placed_dept_stud++;}
          rm.close();
		  
        }    
          else
          
          db.close();
        }
       rr.close();
       db.close();
         out.println(" placed dept student "+placed_dept_stud+" ");

     float percent=(placed_dept_stud*100f)/total_dept_stud;
	 
  out.println(" percent placed "+percent+" ");

        String sql_para="select * from second_card";
         String per_para="";
         String sal_para="";
         db.connect();
        ResultSet rs5=db.execSQL(sql_para);
        if(rs5.next())
		{
                   per_para=rs5.getString(1);
                   sal_para=rs5.getString(2);
		}
       float salary_para = Float.parseFloat(sal_para);
       int percent_para = Integer.parseInt(per_para);

        rs5.close();
        db.close();
  // out.println(" Check "+percent_para+" "+salary_para); 

     if((new_ctc>=salary_para*old_ctc) && percent>=percent_para) 
       out.println(display1+"Student is eligible to use his second card in the above company"+display2);
	
    else
     out.println(display1+"Student is not eligible to use his second card in the above company"+display2); 
	        
  
        } 

         
	if (j==2)
	{out.println(display1+"Student has used both of his job cards"+display2);
	out.println(display1+"Student is not eligible to use his second card in the above company"+display2);}   

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


