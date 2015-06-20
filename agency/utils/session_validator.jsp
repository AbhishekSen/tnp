
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
	String sql_session_validate = "select session_id,username from session where session_id='"+sid+"'  " ;
	db.connect();	
	String username="";
	ResultSet rs=db.execSQL(sql_session_validate);
	int num_rows_session = 0; 
	if (rs.next())
	{
		//num_rows_session=1;
		username=rs.getString("username");
	}
	rs.close() ;
	ResultSet re=db.execSQL("select count(*) from login where username='"+username+"' and role_id=1;");
	if(re.next())
		num_rows_session=re.getInt(1);
	re.close();
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
