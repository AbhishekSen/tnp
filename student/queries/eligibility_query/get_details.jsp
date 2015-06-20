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
<%@ include file="../../utils/new_verification_client/web/index.jsp"%>

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
        
	
	
//out.println(button_value+check_student_roll_number+student_roll_number);

	

	 out.println(display1+"Following students are eligible for the company"+display2);
	String get_cpi="select cpi from agency where agency_name='"+agency_name+"';";
	db.connect();
	ResultSet re=db.execSQL(get_cpi);//let we get cpi 6.0
	re.next();
	
String cpi=re.getString(1);
 float cpi1=Float.parseFloat(cpi);
     
	re.close();
	db.close();
    
//    String roll="";
         
  //       String value="";
         db.connect();
         db2.connect();
     
     ResultSet rs=db.execSQL("select student_id from student where student_year="+year);

     
   while(rs.next())
   { int stud_id=rs.getInt(1);
     
     String get_cpi_stud="select cpi from spi_cpi_record where student_id="+stud_id+";";
     
     ResultSet rn=db2.execSQL(get_cpi_stud);
     
     if(rn.next())
    { float stud_cpi=rn.getFloat(1);
     
     if(stud_cpi>=cpi1)
     { String stud_roll="select student_roll_number from student where student_id="+stud_id+";";
       ResultSet rr=db.execSQL(stud_roll);
       rr.next();
       String roll_num=rr.getString(1);
       out.println(display1+roll_num+" is eligible"+display2);
       rr.close();
      }
       
    }
   // else
   //  out.println(display1+"Student has no cpi record"+display2);
   rn.close();
  }
    
     db2.close();
    rs.close();
     db.close();
  
      /* while(rs.next())
        {i++;
         roll=roll+rs.getString(1)+"-";
    
              
         }
        rs.first();
        //out.println(roll);
        value=verify(cpi,roll);
      
        //out.println(value);
         String[] array=value.split("-");
         int k=0;
       for(int j=0;j<i;j++)
            {
             
             // out.println(array[j]);
              if(!(array[j].equals("null")))
                   {
                    int temp=Integer.parseInt(array[j]);
                   if(temp==1)
                       {k++; 
                        out.println(display1+k+")"+rs.getString(1)+display2);}
              
                    }
                else
                  out.println("Error in retrieving data of roll number="+rs.getString(1)+"<br>");
              
              rs.next();
             
             }*/
//db.close();         
%>


