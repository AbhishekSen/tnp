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
	String button_value=request.getParameter("q0");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
Calendar rightNow = Calendar.getInstance();
 
int year = rightNow.get(Calendar.YEAR);

	 
	String student_roll_number=request.getParameter("q1");
	
	
        db.fetchConfigDetails(); //newly added

	
	int student_id=0;
	
	String get_id="select student_id from student_record where student_roll_number='"+student_roll_number+"';";
	db.connect();
	ResultSet re=db.execSQL(get_id);//let we get cpi 6.0
	if(re.next())
    {	
	student_id=re.getInt(1);
	re.close();
	db.close();
        
	
      
                       


                    
   

         float cpi=0;
         db.connect();
         Connection conn=db.dbCon;    
         PreparedStatement ps=conn.prepareStatement("select cpi_6sem from student_record where student_id=?");
         ps.setInt(1,student_id);
          ResultSet rs=ps.executeQuery();
       if(rs!=null)
         { if(rs.next())
             {cpi=rs.getFloat(1); 
                rs.close();
                db.close();
          
          out.println(display1+"Student is eligible for the following companies"+display2);   

       out.println("<table border='0' name='table_query_placement_details'"+
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
      out.println("<table border='0' name='table_query_placement_details'"+
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
    out.println(display1+"Student with roll number "+student_roll_number+" has not attended any test yet"+display2);
    rr.close();
    db.close();
    out.println("</table");
      
 }
else
out.println(display1+"Student has not yet registered for placement"+display2);

%>


