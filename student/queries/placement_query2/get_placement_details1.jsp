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
<%@ include file="../../utils/dept_rollWSClient/web/index.jsp"%>
<%@ include file="../../utils/deptprog_roll_client/web/index.jsp"%>

<%
  db2.fetchConfigDetails(); 
  db.fetchConfigDetails(); //newly added
%>

<%
	String button_value=request.getParameter("q0");


	String check_agency_year=request.getParameter("q1");
	String agency_year=request.getParameter("q2");
       
	


	try 
	{ 

                StringBuffer sql_select=new StringBuffer(1024);
		StringBuffer sql_from=new StringBuffer(1024);
		StringBuffer sql_where=new StringBuffer(1024);

		sql_select.append(" select distinct agency_name") ;

		sql_from.append(" from agency S ,placement_record P");
		
		sql_where.append(" where S.agency_year='"+agency_year+"' and P.agency_id=S.agency_id " ) ;
		
		

		
		
		String sql_query=sql_select+" "+sql_from+" "+sql_where+" ;";
	
		

		db.connect(); 
		ResultSet rs= db.execSQL(sql_query);  
		
           if(rs.next())
           { out.println("<b>Following are the students who got placed</b>");

            do    
           {    String number="";
		ResultSetMetaData rsmd = rs.getMetaData();//out.println(sql_query);
		int columnCount = rsmd.getColumnCount();//out.println(sql_query);
		StringBuffer result = new StringBuffer(1024);//out.println(sql_query);
	   
	
	
	
	      
	
	
	
			result.append("<table border='1' name='table_query_placement_details'"+
			" id='table_query_placement_details' class='sortable' cellpadding='5'>");
			result.append("<TR>");
			
    result.append("<th>Agency name</th>");
    result.append("<th>Roll number</th>");
   result.append("<th>Prog Name</th>");
   result.append("<th>Dept Name</th>");
    result.append("</tr>");
                        //out.println(columnCount);
	
			     //   result.append("<tr>");
			//	result.append("<td>" + rsmd.getColumnName(1) + "</td>\n");
                               int agency_id=0;
  //	out.println(" i  m here");
	String get_id="select agency_id from agency where agency_name='"+rs.getString(1)+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);	re.next();
 	
	agency_id=re.getInt(1);
 //       out.println(agency_id);
	re.close();
        db.close();
        db.connect();
    String stud_roll_num="select student.student_roll_number,student.student_id from student,placement_record where student.student_id=placement_record.student_id and placement_record.agency_id="+agency_id+";";
ResultSet rm=db.execSQL(stud_roll_num);

 
        int dept=0;
         int prog=0;
        String prog_name="";
        String dept_name="";
         String roll="";
		 String s="";
		 int count=0;
      String roll_num="";
      int stud_id=0;

  // out.println("i m here");
    while(rm.next())
      { roll_num=rm.getString(1);
        stud_id=rm.getInt(2);
        String get_prog_dept="select programme_id,department_id from student_record where student_id="+stud_id+";";
        db2.connect();
        ResultSet rd=db2.execSQL(get_prog_dept);
        rd.next();
        prog=rd.getInt(1);
        dept=rd.getInt(2);
        rd.close();
        String get_prog="select programme_name from programme_record where programme_id="+prog+";";
        ResultSet rp=db2.execSQL(get_prog);
        rp.next();
        prog_name=rp.getString(1);
        rp.close();
        String get_dept="select department_name from department_record where department_id="+dept+";";
        ResultSet rt=db2.execSQL(get_dept);
        rt.next();
        dept_name=rt.getString(1);
        rt.close();
  //      out.println(prog_name);
  //      out.println(dept_name);
        db2.close();
        result.append("<tr>");
        result.append("<td>" +rs.getString(1) + "</td>");
        result.append("<td>"+roll_num+"</td>");
        result.append("<td>"+prog_name+"</td>");
        result.append("<td>"+dept_name+"</td>");
        result.append("</tr>");
        
        
      }
  
    result.append("</table>"); 
     out.println(result.toString());         
    rm.close();
    db.close();
 

    /*		 while(re.next())
             {out.println(" i  m here");
             roll=roll+re.getString(1)+"-";
             }
                 //out.println(roll);
         re.first();
             do
             {out.println(" i  m here");
             prog=give_prog_roll(re.getString(1));
             dept=give_dept_roll(re.getString(1));
             if((s.indexOf(dept+"~"+prog))==-1)
             {   out.println(" i  m here");
			 s=s+dept+"~"+prog+"$";
			 result.append("<th>" + prog+"/"+dept + "</th>\n");
			 String temp=getresponse(dept,prog,roll);
			 String[] array=temp.split("-");
			 count=0;
			 for(int j=0;j<array.length;j++)
			 {
			 if(array[j].equals("1"))
						count++;	 
			 }
			 number=number+count+"-";
			 
	    }
             
             
             
             
             
             
             }while(re.next());
	db.close(); 
			
			result.append("</TR>");  */
	//	}
	//out.println(sql_query);
//out.println(columnCount);

		
	//	rs.first();
		
		//out.println(j);
		
	/*		result.append("<TR>");
			
			result.append("<TD align='center'>" + rs.getString(1) + "</TD>" );
		String[] no_of_students=number.split("-");
		for(int k=0;k<no_of_students.length;k++)
		{result.append("<TD align='center'>" + no_of_students[k] + "</TD>" );}

			result.append("</TR>");
		
		
		db.close();
		result.append("</TABLE>");
                //out.println(s);
		out.println(result.toString());   */

         
  	
        
           }while (rs.next());
         }
      else
      out.println("<b>There are no records for the year "+agency_year+"</b>");
		
	//	if(num_rows==0)
		//	out.println("<br><b>No Student Matched based on the given criteria.</b>");
       // out.println(result.toString()); 			
       
  //  result.append("</table>"); 
   //  out.println(result.toString()); 

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


