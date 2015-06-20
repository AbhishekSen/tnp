
<%@page language="java" import="java.lang.*"%>
<%!
 
//use <% include file="drop_down.jsp" @>
public String get_unique_field(String str,pack.DbBean db)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		ResultSet rs=db.execSQL(str);
			//ResultSetMetaData rsmd = rs.getMetaData();
	//	int columnCount = rsmd.getColumnCount();
		String result=null ;
		int num = 0 ; 
		while(rs.next())
		num++; 
		rs.first(); 
		if( num == 1 ) 
			result =rs.getString(1);		 		  
		rs.close();
		db.close();
		return result;
  	}	
	catch(SQLException e) 
	{ 
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		return err;
		//throw new ServletException("Your query is not working: " + str , e); 
	} 
	catch (Exception e) 
	{
		String err=("<B>Error</B>");
		err+="<BR>";
		err+=e.toString();
		return err;
	}
}
%>
