<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<jsp:useBean id="db2" class="pack.DbBean2" scope="session"/>
<%@ include file="../../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/sql_convert_date.jsp"%>
<%@ include file="../../utils/deptprog_roll_client/web/index.jsp"%>
<%@ include file="../../utils/dept_rollWSClient/web/index.jsp"%>
<%@ include file="../../utils/id_by_nameClient/web/index.jsp"%>
<%@ page import="java.util.*" %>
<% 
  db2.fetchConfigDetails(); 
  db.fetchConfigDetails(); //newly added
%>

<%
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);

	String agency_name=request.getParameter("q1");
	String student_roll_number=request.getParameter("q2");
	
	
//out.println(button_value+agency_name+student_roll_number);

	
	int student_id=0;
	
	String get_id="select student_id from student where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);
	re.next();
	
	student_id=re.getInt(1);
	re.close();
	db.close();
	int agency_id=0;
	
	get_id="select agency_id from agency where agency_name='"+agency_name+"';";
	db.connect();
	 re=db.execSQL(get_id);
	re.next();
	
	agency_id=re.getInt(1);
	re.close();
	db.close();
	

	try 
	{ 
	
	int j=0;
	int old_agency_id=0;
String get_number="select agency_id from placement_record where student_id="+student_id+";";
	db.connect();
	ResultSet rs=db.execSQL(get_number);
	while(rs.next())
	{j++;
	 old_agency_id=rs.getInt(1);}
	rs.close();
	db.close();
	
	if (j==0)
	{out.println(display1+"Student has not used any of his job cards"+display2);
	out.println(display1+"Student is not eligible to use his second card in the above company"+display2);}
	if (j==1)
  {      out.println(display1+"Student has used only one job card"+display2);
	double old_ctc=0.0;
	double new_ctc=0.0;
        
        
	String get_ctc="select ctc from placement_record where student_id="+student_id+";";
	db.connect();
	ResultSet rs1=db.execSQL(get_ctc);
       
        rs1.next();
      	old_ctc=rs1.getDouble(1);
	rs1.close();
	db.close();
        out.println("old_ctc="+old_ctc);
        out.println(agency_id);
        String get_prog_id="select program_id from program_package where agency_id="+agency_id+";";
        db.connect();
         ResultSet rs2=db.execSQL(get_prog_id);
     
        rs2.next();
        
        int prog_id=rs2.getInt(1);         //******
        rs2.close();
        db.close();

	get_ctc="select ctc from program_package where agency_id="+agency_id+" and program_id="+prog_id+";";//let b.tech for now.
	db.connect();
	ResultSet rs3=db.execSQL(get_ctc);
        
         rs3.next();
      	new_ctc=rs3.getDouble(1);
	rs3.close();
	db.close();
        out.println(" im here");
        out.println("new_ctc="+new_ctc);
	//80%block begins.
	int no_of_dept_students=0;
	int no_of_placed_students=0;
       
        out.println("i m here");

  /*      out.println(student_roll_number);
       String get_studid="select  student_id from student where student_roll_number="+student_roll_number+";";
        db.connect();
        ResultSet rn=db.execSQL(get_studid);
        rn.next();
        int stud_id=rn.getInt(1);
        rn.close();
        db.close();
        out.println(stud_id);   */
  out.println(student_id);
//try
        String get_dept="select department_id,start_date from student_record where student_id="+student_id+";";
        db2.connect();
        ResultSet rd=db2.execSQL(get_dept);
        rd.next();
        int dept_id=rd.getInt(1);
       String start_date=rd.getString(2);
      // start_date+="-";
       String delim="-";
       StringTokenizer st=new StringTokenizer(start_date,delim);
      String[] arr={"","",""};
       int i=0;

       while(st.hasMoreTokens())
          {arr[i]=st.nextToken();
           i++;}
 
      
       String year1=arr[0];
       String month=arr[1];
       String day=arr[2];
       out.println(year1);
       out.println(month);
       out.println(day);       
        int year2=Integer.parseInt(year1);
        int month2=Integer.parseInt(month);
        int day2=Integer.parseInt(day);
      // java.sql.Date start_date1=new java.sql.Date(year2,month2,day2);    
	
      java.sql.Date start_date1=java.sql.Date.valueOf(start_date);
       out.println(year2);
       out.println(month2);
       out.println(day2);
        rd.close();
        db2.close();
      //  out.println(stud_id);
        out.println(dept_id);
        out.println(start_date);
        out.println(start_date1);                
//catch(Exception e)
  //  {out.println("its an error");}
        

        db2.connect();
        Connection conn=db2.dbCon;
        PreparedStatement ps=conn.prepareStatement("select student_id from student_record where department_id=? and start_date=?");  //
        ps.setInt(1,dept_id);
        ps.setDate(2,start_date1);
      ResultSet rt=ps.executeQuery();
        int total_dept_stud=0;
       while(rt.next())
        {total_dept_stud++;}out.println(total_dept_stud);
        rt.close();
        db2.close();
        out.println(total_dept_stud);
        out.println("i m here"); 
       // out.println(start_date1);       
        
        String get_record="select student_id from placement_record;";
        db.connect();
        ResultSet rr=db.execSQL(get_record);
        int stud_rec_id=0;
        int placed_dept_stud=0;
        String placed_stud="";
                 
        while(rr.next())
        {   
          stud_rec_id=rr.getInt(1);
          db2.connect();
          Connection cone=db2.dbCon;
       PreparedStatement pp=cone.prepareStatement("select * from student_record where student_id=? and department_id=?");
       pp.setInt(1,stud_rec_id);
       pp.setInt(2,dept_id);
    
          
         ResultSet rm=pp.executeQuery();  
          if(rm!=null)
        { if(rm.next())
         {placed_dept_stud++;out.println(placed_dept_stud);}
          rm.close();
        } 
          else
          out.println("ohh noo");
          db2.close();
        }
       rr.close();
       db.close();
       out.println(placed_dept_stud);  

     float percent=(placed_dept_stud*100)/total_dept_stud;out.println(percent);
  
     if((new_ctc>=1.2*old_ctc)&&percent>=80) 
       out.println(display1+"Student is eligible to use his second card in the above company"+display2);
	
    else
     out.println(display1+"Student is not eligible to use his second card in the above company"+display2); 
	        
  /*   }
   else
   out.println(display1+"NO ctc is available from "+agency_name+"display2);  

  }
  else
  out.println(display1+"No ctc is available from the previous company, where roll number "+student_roll_number+" got placed."+display2);   */
 
   


/*      String dept_stud="select student_id from student_record where department_id="+dept_id+"and start_date='"+year2+"-"+month2+"-"+day2+"';";
        db2.connect();
        ResultSet rt=db2.execSQL(dept_stud);
        
        int total_dept_stud=0;
         while(rt.next())
         {total_dept_stud++;}
        rt.close();
        db2.close();
        out.println(total_dept_stud);        
        out.println("i m here");          
     

    String dept=give_dept_roll(student_roll_number);
        
        db.connect();
	 rs=db.execSQL("select student_roll_number from student where student_year="+year);
         String roll="";
	while(rs.next())
	{
         roll=roll+rs.getString(1)+"-";}
	
       rs.first();
        String code=getresponse(dept,get_prog,roll);
        String[] array=code.split("-");
        for(int i=0;i<array.length;i++)
            {out.println("i m here");
            
            if(!(array[i].equals("null")))
                {
                int temp=Integer.parseInt(array[i]);
                if(temp==1)
                  {  no_of_dept_students++;
                     db.connect();
               re=db.execSQL("select student_id from student where student_roll_number="+rs.getString(1));
                   re.next();
                    int test=re.getInt(1);
               re.close();
                    db.close();
                     db.connect();
                    re=db.execSQL("select count(distinct student_id) from placement_record where student_id="+test);
                    if(re.next())
                       no_of_placed_students+=re.getInt(1); 
                    re.close();
                     db.close();
                     
                     }
            }
            else
                out.println("Error in retrieving data for roll number-"+rs.getString(1));
            rs.next();
            
            }
                
            db.close();
            float percent=(no_of_placed_students*100)/no_of_dept_students;
        //db.execSQL("select count(distinct student_id) from placement_record;");
            out.println("<b>Previous company ctc:"+old_ctc+"</b><br>");
            out.println("<b>"+"New company ctc:"+new_ctc+"</b><br>");
	out.println("<b>The number of students placed in Department:"+dept+" and Program:"+get_prog+"="+no_of_placed_students+"/"+no_of_dept_students+"</b>");
	out.println("<br><b>Percent="+percent+"%</b>");
	
	//80%block over.
	if((new_ctc>=1.2*old_ctc)&&percent>=80)
	{out.println(display1+"Student is eligible to use his second card in the above company"+display2);}
	else
		{out.println(display1+"Student is not eligible to use his second card in the above company"+display2);}
	
	
	
	
	
	     
         */  
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


