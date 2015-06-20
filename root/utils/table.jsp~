<%!
public String create_table(String str,pack.DbBean db)
{
	try
	 {

		db.connect(); 
		String sql=str;
		System.out.println(sql);
		ResultSet rs;
		rs= db.execSQL(sql); 
		ResultSetMetaData rsmd = rs.getMetaData();
		// Write table headings
		// result is an html script which automatically gives a formatted output.
		int columnCount = rsmd.getColumnCount();
		StringBuffer result = new StringBuffer(1024);
		result.append("<table border=\"1\">");
		result.append("<TR>");
		for (int i=1; i<=columnCount; i++) 
		{
			result.append("<TD><B>" + rsmd.getColumnName(i) + "</B></TD>\n");
		}
		result.append("</TR>");
		while (rs.next()) 
		{
			result.append("<TR>");
			for (int i=1; i<=columnCount; i++) 
			{
				result.append("<TD>" + rs.getString(i) + "</TD>" );
			}
			result.append("</TR>");
		}
		rs.close();
		db.close();
		result.append("</TABLE>");
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
