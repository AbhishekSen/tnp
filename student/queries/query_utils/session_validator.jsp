
<%@page language="java" import="java.lang.*"%>
<%!
public String session_validate(String sid,pack.DbBean db)
{
	try { 
	
	
	String logout = "false" ;		
		// if database parameters are not set. 
	//if ( db == null || db.dbURL.equals("jdbc:mysql://") || db.dbURL.equals("jdbc:mysql:///") || db.getUserName() == "" )
		//return "true" ;

        // temporarily blocked 
	//if ( (db == null) ||  (db.dbURL.equals("jdbc:mysql:///")) || db.dbURL.equals("jdbc:mysql://") ) 	
	//	return "true";
        //db.fetchConfigDetails(); //newly added
	String sql_session_validate = "select session_id from session where session_id like '"+sid+"'  " ;
	db.connect();	
	ResultSet rs=db.execSQL(sql_session_validate);
	int num_rows_session = 0; 
	while (rs.next())
		num_rows_session++ ;
	rs.close() ;
	db.close() ;
	if (num_rows_session != 1 )
		logout = "true" ; 
	return logout; 
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
