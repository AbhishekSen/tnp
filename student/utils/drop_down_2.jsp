
<%!
//use <% include file="drop_down.jsp" @>
    import java.util.Date;
    import java.text.DateFormat;
    import java.text.SimpleDateFormat;
public String drop_down_2(pack.DbBean db)
{
	try 
	{
                //db.fetchConfigDetails(); //newly added 
		db.connect(); 
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        Date date = new Date();
		String[] dt=dateFormat.(date).split("/");
		ResultSet rs= db.execSQL("select agency_name,nature_business,final_agency_date from agency;");   
		StringBuffer result = new StringBuffer(1024);
		while (rs.next()) 
		{	

			String[] dt2=rs.getString("final_agency_date").split("-");
			if(parseInt(dt[0])<=parseInt(dt2[0]))
			if(parseInt(dt[1])<=parseInt(dt2[1]))
			if(parseInt(dt[2])<=parseInt(dt2[2]))
			{
			result.append("<option value=\"");
			result.append(rs.getString("agency_name"));
			result.append("\" > " );
			result.append(rs.getString("agency_name"));
			result.append("(");
			result.append(rs.getString("nature_business"));
			result.append(")   ");
			result.append(dt2[2]+"-"+dt2[1]+"-"+dt2[0]);
			result.append("</option>");
			}
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
