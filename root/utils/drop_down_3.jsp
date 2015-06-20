
<%! 
//use <% include file="drop_down.jsp" @>
public String drop_down(String str,pack.DbBean db)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		String sql=str;
		System.out.println(sql);
		ResultSet rs= db.execSQL(sql);   
		//int columnCount = rsmd.getColumnCount();
		StringBuffer result = new StringBuffer(1024);
		while (rs.next()) 
		{	
			result.append("<option value=\"");
			result.append(rs.getString(2));
			result.append("\" > " );
			result.append(rs.getString(1));
			result.append("</option>");
		}	
		
		rs.close();
		db.close();
		return result.toString();

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
