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

	String department_name=request.getParameter("q1");
	String program_name=request.getParameter("q2");
	
	
//out.println(button_value+agency_name+student_roll_number);

	
	
	

	try 
	{ 
	double ctc=0.0;
        double total_ctc=0.0;
        int no_of_placed_students=0;
   
        String get_deptid="select department_id from department_record where department_name='"+department_name+"';";
        db2.connect();
        ResultSet rd=db2.execSQL(get_deptid);
        rd.next();
        int dept_id=rd.getInt(1);
        rd.close();
        db2.close();
        
        
       String get_progid="select programme_id from programme_record where programme_name='"+program_name+"';";
        db2.connect();
        ResultSet rp=db2.execSQL(get_progid);
        rp.next();
        int prog_id=rp.getInt(1);
        rp.close();
        db2.close();
      
        String stud_id="select student_id from student where student_year="+year+";";
        db.connect();
        ResultSet rs=db.execSQL(stud_id);
        int student_id=0;
        int prsnt=0;
        String get_ctc="";
        double max_ctc=0.0;
  
        
      while(rs.next())
        {  student_id=rs.getInt(1);
           
          db2.connect();
          Connection conn=db2.dbCon;  
          
          PreparedStatement ps=conn.prepareStatement("select count(*) from student_record where student_id=? and department_id=? and programme_id=?");
          ps.setInt(1,student_id);
          ps.setInt(2,dept_id);
          ps.setInt(3,prog_id);
          ResultSet rt=ps.executeQuery();
         if(rt!=null)
         { 
      
           if(rt.next())
           {  prsnt=rt.getInt(1);
             rt.close();
             db2.close();
             
           }
           else
           out.println("naaah");
        }                          
         if(prsnt==1)
            {  get_ctc="select max(ctc) from placement_record where student_id="+student_id+";";
              
               ResultSet rc=db.execSQL(get_ctc);
               rc.next();
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
    db2.connect();
    Connection con=db2.dbCon;
   PreparedStatement pl=con.prepareStatement("select student_id from student_record where student_id=? and department_id=? and programme_id=?");
    pl.setInt(1,stude_id);
    pl.setInt(2,dept_id);
    pl.setInt(3,prog_id);
    ResultSet rl=pl.executeQuery();
    if(rl!=null)
    {
     if(rl.next())
      {
       total_pl_stud++;} 
    }  

    }
   
   ru.close();
   db.close();
   double avg_pckg=0.0;
   avg_pckg=(total_ctc/total_pl_stud);
   
   out.println(display1+"Total number of placed students = "+total_pl_stud+display2);
   out.println(display1+"Average Package(in Rs) = "+avg_pckg+display2);
  

  }
    

               
               
           
 
           
  




  /*   //my entry
        db.connect();
	ResultSet rs=db.execSQL("select student_roll_number from student where student_year="+year);
         String roll="";
	while(rs.next())
	{
             
           db.connect();
             ResultSet  re=db.execSQL("select student_id from student where student_roll_number="+rs.getString(1));
                   re.next();
                    int test=re.getInt(1);
               re.close();
                    db.close();
                     db.connect();
                    re=db.execSQL("select count(distinct student_id) from placement_record where student_id="+test);
                    if(re.next())  
             {roll=roll+rs.getString(1)+"-";}
             db.close();}
	
       rs.first();
        String code=getresponse(department_name,program_name,roll);
        String[] array=code.split("-");
        for(int i=0;i<array.length;i++)
            {
            
            if(!(array[i].equals("null")))
                {
                int temp=Integer.parseInt(array[i]);
                if(temp==1)
                  { 
                     db.connect();
             ResultSet    re=db.execSQL("select student_id from student where student_roll_number="+rs.getString(1));
                  re.next();
                    int temp1=re.getInt(1);
               re.close();
                    db.close();
                     db.connect();
                    re=db.execSQL("select max(ctc) from placement_record where student_id="+temp1+" group by student_id");
                    
                    if(re.next())
                       {no_of_placed_students+=1;
                       // out.println("student_id"+temp1+"*"+re.getDouble(1)+"*");
                        ctc=ctc+re.getDouble(1);}
                    re.close();
                     db.close();
                     
                     }
            }
            else
                out.println("Error in retrieving data for roll number-"+rs.getString(1));
            rs.next();
            
            }
                
            db.close();
            double average=ctc/no_of_placed_students;
            //out.println(no_of_placed_students);
            //out.println(ctc);
        //db.execSQL("select count(distinct student_id) from placement_record;");
          if(no_of_placed_students>0)  
	{out.println(display1+"The average package for students placed in Department:"+department_name+" and Program:"+program_name+"="+average+display2);
	}
	else
            		{out.println(display1+"No placement is there for the given branch and department"+display2);}
	
	
	
	*/
	
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


