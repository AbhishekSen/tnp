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
<%@ include file="../../utils/roll_cpi_client/web/index.jsp"%>

<%@ page import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%
  db2.fetchConfigDetails();
  db.fetchConfigDetails(); //newly added
%>

<%@ page import="java.util.*,java.io.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.lang.*" %>

<%
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);

	String check_student_roll_number=request.getParameter("q1");
	String student_roll_number=request.getParameter("q2");
	
	int student_id=0;
	
	String get_id="select student_id from student where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);//let we get cpi 6.0
	if(re.next())
	
       { student_id=re.getInt(1);
	re.close();
	db.close();
	


	try 
	{ 

		StringBuffer sql_select=new StringBuffer(1024);
		StringBuffer sql_from=new StringBuffer(1024);
		StringBuffer sql_where=new StringBuffer(1024);
                
                


               String get_cpi="select * from spi_cpi_record where student_id="+student_id+";";
               db2.connect();
               ResultSet rs1=db2.execSQL(get_cpi);
               if(rs1.next())
               

             
              { out.println(display1+"Student is eligible for the following companies"+display2);
                String cpi=rs1.getString(5);
               db2.close();
               

		sql_select.append(" select *") ;

		sql_from.append(" from agency P ");
		
		sql_where.append(" where P.cpi<='"+cpi+"' and P.agency_year="+year ) ;//temparory 6.0
		
		
		String sql_query=sql_select+" "+sql_from+" "+sql_where+" ;";
	
		

		db.connect(); //out.println(sql_query);
		ResultSet rs= db.execSQL(sql_query);  //out.println(sql_query);
		ResultSetMetaData rsmd = rs.getMetaData();//out.println(sql_query);
		int columnCount = rsmd.getColumnCount();//out.println(sql_query);
		StringBuffer result = new StringBuffer(1024);//out.println(sql_query);
	
	
	
			result.append("<table border='1' name='table_query_placement_details'"+
			" id='table_query_placement_details' class='sortable' cellpadding='5'>");
			result.append("<TR>");
			result.append("<th>Sl.No.</th>");
			for (int i=1; i<=columnCount; i++) 
			{
			
				result.append("<th>" + rsmd.getColumnName(i) + "</th>\n");
			}
			result.append("</TR>");
	

		int j=0;
	
		while (rs.next()) 
		{
			j++;
			result.append("<TR>");
			result.append("<td align='center'>"+j+"</td>");
			for (int i=1; i<=columnCount; i++)
			{result.append("<TD align='center'>" + rs.getString(i) + "</TD>" );}

			result.append("</TR>");
		}
		rs.close();
		db.close();
		result.append("</TABLE>");
		out.println(result.toString());
			

  	}

else
{out.println("Student with roll number "+student_roll_number+" has no cpi record");}


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
{out.println("Student with roll number "+student_roll_number+" has not yet registered for placement");}

%>


