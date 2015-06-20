
<%! 
//use <% include file="drop_down.jsp" @>
public String drop_down(String str,pack.DbBean db)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		String sql=str;

		ResultSet rs= db.execSQL(sql);   
		//int columnCount = rsmd.getColumnCount();
		StringBuffer result = new StringBuffer(1024);
		while (rs.next()) 
		{	
			result.append("<option value=\"");
			result.append(rs.getString(1));
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
public String my_drop_down(String str,pack.DbBean db,String msg)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		String sql=str;

		ResultSet rs= db.execSQL(sql);   
		//int columnCount = rsmd.getColumnCount();
		StringBuffer result = new StringBuffer(1024);
		result.append("<option value=\"");
		result.append(0);
		result.append("\">");
		result.append(msg);
		result.append("</option>");
		while (rs.next()) 
		{	
			result.append("<option value=\"");
			result.append(rs.getString(1));
			result.append("\" > " );
			result.append(rs.getString(2));
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
public String make_list(String str,pack.DbBean db)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		String sql=str;

		ResultSet rs= db.execSQL(sql);   
		//int columnCount = rsmd.getColumnCount();
		StringBuffer result = new StringBuffer(2048);
		while (rs.next()) 
		{	
			result.append(rs.getString("programme_name"));
			result.append("<br/>" );
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

public String make_minor_list(String str,pack.DbBean db)
{
	String dep_names[]={"CSE", "ECE", "ME", "CVL", "BT", "CHM", "MnC",
"EP", "CST", "EEE", "Design"};
	try 
	{
		db.connect(); 
		String sql=str;

		ResultSet rs= db.execSQL(sql);   
		StringBuffer result = new StringBuffer(2048);

			result.append("<b>Major ");
			result.append(" : ");
			result.append(" Minor</b>");
			result.append("<br/>" );

		while (rs.next()) 
		{	
			result.append(dep_names[rs.getInt("major")-1]);
			result.append(" <b>:</b> ");
			result.append(dep_names[rs.getInt("minor")-1]);
			result.append("<br/>" );
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
