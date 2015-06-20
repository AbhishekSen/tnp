<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
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
<%@ include file="../../utils/roll_name_client/web/index.jsp"%>

<%
	String button_value=request.getParameter("q0");


	String check_student_roll_number=request.getParameter("q1");
	String student_roll_number=request.getParameter("q2");
	
	
//out.println(button_value+check_student_roll_number+student_roll_number);
  
        db.fetchConfigDetails(); //newly added	
	int student_id=0;
	
	String get_id="select student_id from student where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);
	
    if(re.next())    
 
       { 
         //re.next();
	
	student_id=re.getInt(1);
	re.close();
	db.close();
	//out.println("*"+student_id+"*");
	//String programme_id=null;

//	if(check_department_name.equals("true"))
//	{
//		department_id=get_unique_field("select department_id from department_record where department_name='"+
//		encode_sql(department_name)+"' ;",db);
//	}
//
//	if(check_programme_name.equals("true"))
//	{
//		programme_id=get_unique_field("select programme_id from programme_record where programme_name='"+
//		encode_sql(programme_name)+"' ;",db);
//	}

	try 
	{ 

		StringBuffer sql_select=new StringBuffer(1024);
		StringBuffer sql_from=new StringBuffer(1024);
		StringBuffer sql_where=new StringBuffer(1024);

		sql_select.append(" select *") ;

		sql_from.append(" from placement_record P ");
		
		sql_where.append(" where P.student_id="+student_id ) ;
		
		

		//if(check_student_roll_number.equals("true"))
			//sql_where.append(" and  A.agency_name like '%"+ encode_sql(agency_name) +"%' ");
		
		String sql_query=sql_select+" "+sql_from+" "+sql_where+" ;";
	
		//out.println(sql_query);

		db.connect(); //out.println(sql_query);
		ResultSet rs= db.execSQL(sql_query);  //out.println(sql_query);
		if(rs.next())
              { ResultSetMetaData rsmd = rs.getMetaData();//out.println(sql_query);
		int columnCount = rsmd.getColumnCount();//out.println(sql_query);
		StringBuffer result = new StringBuffer(1024);//out.println(sql_query);
	        out.println(columnCount);
	/*	int num_rows=0;
		while (rs.next())
		{
			 num_rows+=1 ;
		}
*/		
	//	if(num_rows>0 )
	//	{
	//out.println(sql_query);
	
	
	
	
	
	
			result.append("<table border='1' name='table_query_placement_details'"+
			" id='table_query_placement_details' class='sortable' cellpadding='5'>");
			result.append("<TR>");
			result.append("<th>Sl.No.</th>");
			result.append("<th>agency_name</th>");
                        result.append("<th>student_name</th>");
			for (int i=1; i<=columnCount; i++) 
			{
			
				result.append("<th>" + rsmd.getColumnName(i) + "</th>\n");
			}
			result.append("</TR>");
	//	}
	//out.println(sql_query);
//out.println(columnCount);

		int j=0;
	//	rs.first();
		//while (rs.next())
                do  
		{//out.println("rohan");
			j++;
			result.append("<TR>");
			result.append("<td align='center'>"+j+"</td>");
			String agency_name=null;
			String get_name="select agency_name from agency where agency_id="+rs.getInt(1)+";";
	db.connect();
	ResultSet rn=db.execSQL(get_name);
	rn.next();
agency_name=rn.getString(1);
	rn.close();
	db.close();
	result.append("<td align='center'>"+agency_name+"</td>");
                        String student_name=get_name(student_roll_number);
                  result.append("<td align='center'>"+student_name+"</td>");      
			for (int i=1; i<=columnCount; i++)
			{result.append("<TD align='center'>" + rs.getString(i) + "</TD>" );}

			result.append("</TR>");
		}while(rs.next());
		rs.close();
		db.close();
		result.append("</TABLE>");
		out.println(result.toString());
	//	if(num_rows==0)
		//	out.println("<br><b>No Student Matched based on the given criteria.</b>");			
          }
        else
        out.println("The student with roll number "+student_roll_number+" is not yet placed yet!!");


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

    }

else
{out.println("the student is not yet registered for placement");}


%>


