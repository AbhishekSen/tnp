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
<%@ page import="java.util.*" %>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/sql_convert_date.jsp"%>
<%@ include file="../../utils/id_by_nameClient/web/index.jsp"%>
 
<% 
   db2.fetchConfigDetails(); 
   db.fetchConfigDetails(); //newly added
%>
<%
	String button_value=request.getParameter("q0");


	 
	String department_name=request.getParameter("q1");
	String program_name=request.getParameter("q2");
	
	String agency_year=request.getParameter("q3");
  
        db2.connect();
        Connection conn=db2.dbCon;
        PreparedStatement ps=conn.prepareStatement("select department_id from department_record where department_name=?");
        ps.setString(1,department_name);
        ResultSet rs=ps.executeQuery();
        rs.next();
        int department_id=rs.getInt(1);
        rs.close();
        db2.close();


         db2.connect();
        Connection cone=db2.dbCon;
        PreparedStatement pp=cone.prepareStatement("select programme_id from programme_record where programme_name=?");
        pp.setString(1,program_name);
        ResultSet rp=pp.executeQuery();
        rp.next();
        int program_id=rp.getInt(1);
        rp.close();
        db2.close();


    



	 
	int agency_id=0;
	
	String get_id="select distinct S.agency_id from agency S ,department P ,program_package K where K.program_id="+program_id+" and P.department_id="+department_id+" and S.agency_year="+agency_year+" and S.agency_id=P.agency_id and S.agency_id=K.agency_id ;";
	
	db.connect();
	ResultSet re=db.execSQL(get_id);
	if(re.next())
	
     {	agency_id=re.getInt(1);
	re.close();
	db.close();
                
      


	try 
	{ 

		StringBuffer sql_select=new StringBuffer(1024);
		StringBuffer sql_from=new StringBuffer(1024);
		StringBuffer sql_where=new StringBuffer(1024);

		sql_select.append(" select distinct S.agency_name , P.no_of_vacancies") ;

		sql_from.append(" from agency S ,department P ,program_package K");
		
		sql_where.append(" where P.department_id='"+department_id+"' and K.program_id='"+program_id+"' and S.agency_year='"+agency_year+"' and S.agency_id=P.agency_id and S.agency_id=K.agency_id " ) ;
		
db.connect();
Connection conm=db.dbCon;		
PreparedStatement pq=conm.prepareStatement("select distinct agency.agency_name,department.no_of_vacancies from agency,department,program_package where department.department_id=? and program_package.program_id=? and agency.agency_year=? and agency.agency_id=department.agency_id and agency.agency_id=program_package.agency_id");
pq.setInt(1,department_id);
pq.setInt(2,program_id);
pq.setString(3,agency_year);
ResultSet rq=pq.executeQuery();
String agency_name="";
int no_of_vacancies=0;
if(rq!=null)
{ if(rq.next())
  {
    
    out.println("<table border='4' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='sortable' cellpadding='5'>");
    out.println("<tr>");
    out.println("<th>Company Name</th>");
    out.println("<th>No_Of_Vacancies</th>");
    out.println("</tr>");                        


   do
   {
    agency_name=rq.getString(1);
    no_of_vacancies=rq.getInt(2);
    out.println("<tr><td><b>"+agency_name+"</b></td><td><b>"+no_of_vacancies+"</b></td></tr>");
   }while(rq.next());
  
   out.println("</table>");  


   }
 else
 out.println("<b>There are no companies with vacancies for the respective department and programme.</b>");
 
}
else
out.println("uuff");

 		
		
	//	String sql_query=sql_select+" "+sql_from+" "+sql_where+" ;";
	
		

	//	db.connect(); //out.println(sql_query);
	/*	ResultSet rs= db.execSQL(sql_query);  //out.println(sql_query);
		ResultSetMetaData rsmd = rs.getMetaData();//out.println(sql_query);
		int columnCount = rsmd.getColumnCount();//out.println(sql_query);
		StringBuffer result = new StringBuffer(1024);//out.println(sql_query);
	
	
	
	
	
	
	
	
	
			result.append("<table border='1' name='table_query_placement_details'"+
			" id='table_query_placement_details' class='sortable' cellpadding='5'>");
			result.append("<TR>");
			result.append("<th>Sl.No.</th>");
			//result.append("<th>Agency name</th>");
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
	//out.println(j);
		while (rs.next()) 
		{//out.println(j);
			j++;
			//out.println(j);
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
	//	if(num_rows==0)
		//	out.println("<br><b>No Student Matched based on the given criteria.</b>");	*/		

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

 out.println("<b>There are no companies with vacancies for the respective department and programme.</b>");

    
%>


