<%!
	String sql_convert_year(String date)
	{  
		
     
                if(date!=null)
		{
			String[] date_arr = date.split("-");
			StringBuffer result = new StringBuffer(1024);
			//result.append(date);
			result.append(date_arr[2]);//year
			return result.toString();
		}
		else {
		String s = "";
                return s;
}
             
        }   
	
%>
