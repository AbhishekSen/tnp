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

	 
	String student_roll_number=request.getParameter("q1");
	
	


	
	int student_id=0;
	
	String get_id="select student_id from student where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);//let we get cpi 6.0
	if(re.next())
    {	
	student_id=re.getInt(1);
	re.close();
	db.close();
        
	
      
                       


                    
   

         float cpi=0;
         db2.connect();
         Connection conn=db2.dbCon;    
         PreparedStatement ps=conn.prepareStatement("select cpi from spi_cpi_record where student_id=?");
         ps.setInt(1,student_id);
          ResultSet rs=ps.executeQuery();
       if(rs!=null)
         { if(rs.next())
             {cpi=rs.getFloat(1); 
                rs.close();
                db2.close();
          
          out.println(display1+"Student is eligible for the following companies"+display2);   

       out.println("<table border='4' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='sortable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
                        out.println("<th>Company Name</th>");
                        out.println("</tr>");
                
        db.connect();
        Connection con=db.dbCon;
        PreparedStatement pa=con.prepareStatement("select agency_name from agency where cpi<=?");
        pa.setFloat(1,cpi);
        ResultSet ra=pa.executeQuery();
        String cmp_name="";
        int i=0;       
        while(ra.next())
            { 
             cmp_name=ra.getString(1);
             i++;
             out.println("<tr><td>"+i+"</td><td>"+cmp_name+"</td></tr>");
              }  
            out.println("</table>");
               
            ra.close();
            db.close(); 
         }
     else
              out.println(display1+"Student has no cpi record"+display2);
     }


   
    
    db.connect();
    Connection cone=db.dbCon;  
    PreparedStatement pr=cone.prepareStatement("select agency_name from agency,appearance where agency.agency_id=appearance.agency_id and appearance.student_id=? and agency.cpi<=?");
    pr.setInt(1,student_id);
    pr.setFloat(2,cpi);
    ResultSet rr=pr.executeQuery();
    String agency_name="";
    if(rr.next())
    {
      out.println(display1+"Student attended test for the following companies"+display2);
      out.println("<table border='4' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='sortable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
                        out.println("<th>Company Name</th>");
                        out.println("</tr>");
      int i=0;
    
     do
     {agency_name=rr.getString(1);
      i++;
      out.println("<tr><td>"+i+"</td><td>"+agency_name+"</td></tr>"); 
      
    }while(rr.next());
   
   }
  
    else
    out.println(display1+"Student with roll number "+student_roll_number+" have not attended any test yet"+display2);
    rr.close();
    db.close();
    out.println("</table");
      
 }
else
out.println(display1+"Student has not yet registered for placement"+display2);




/*




   
                 
		
          String cpi=get_cpi(student_roll_number);
                
		sql_select.append(" select agency_name") ;

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
			
			
				result.append("<th>" + rsmd.getColumnName(1) + "</th>\n");
			
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
	//	if(num_rows==0)
		out.println("STUDENT IS ELIGIBLE FOR "+j+" COMPANIES");			

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
	
	
	
	
	
	out.println(display1+"Student attended test for the following companies"+display2);
	try 
	{ 

		StringBuffer sql_select1=new StringBuffer(1024);
		StringBuffer sql_from1=new StringBuffer(1024);
		StringBuffer sql_where1=new StringBuffer(1024);
		
		 String cpi1=get_cpi(student_roll_number);
                
		sql_select1.append(" select agency_name") ;

		sql_from1.append(" from agency P ,appearance K ");
		
		sql_where1.append(" where P.cpi<='"+cpi1+"' and P.agency_year="+year+" and K.student_id='"+student_id+"' and P.agency_id=K.agency_id ") ;//temparory 6.0
		
		

		
		
		String sql_query1=sql_select1+" "+sql_from1+" "+sql_where1+" ;";
		
	
		

		db.connect(); //out.println(sql_query);
		ResultSet rs1= db.execSQL(sql_query1);  //out.println(sql_query);
		ResultSetMetaData rsmd1 = rs1.getMetaData();//out.println(sql_query);
		int columnCount = rsmd1.getColumnCount();//out.println(sql_query);
		StringBuffer result1 = new StringBuffer(1024);//out.println(sql_query);
	
	
	
	
	
	
	
	
			result1.append("<table border='1' name='table_query_placement_details1'"+
			" id='table_query_placement_details1' class='sortable' cellpadding='5'>");
			result1.append("<TR>");
			result1.append("<th>Sl.No.</th>");
			
				result1.append("<th>" + rsmd1.getColumnName(1) + "</th>\n");
			
			result1.append("</TR>");
	

		int k=0;
	
		while (rs1.next()) 
		{
			k++;
			result1.append("<TR>");
			result1.append("<td align='center'>"+k+"</td>");
			for (int n=1; n<=columnCount; n++)
			{result1.append("<TD align='center'>" + rs1.getString(n) + "</TD>" );}

			result1.append("</TR>");
		}
		rs1.close();
		db.close();
		result1.append("</TABLE>");
		out.println(result1.toString());
		
		
		out.println("STUDENT ATTENDED TEST FOR "+k+" COMPANIES");	
	//	if(num_rows==0)
		//	out.println("<br><b>No Student Matched based on the given criteria.</b>");			

  	}	
	
		
	
	
	catch(SQLException e1) 
	{ 
		String err1=("<B>Error</B>");
		err1+="<BR>";
		err1+=e1.toString();
		out.println(err1);
		//throw new ServletException("Your query is not working: " + str , e); 
	} 
	catch (Exception e1) 
	{
		String err1=("<B>Error</B>");
		err1+="<BR>";
		err1+=e1.toString();
		out.println(err1);
	}  
 */

%>


