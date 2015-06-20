<%!
	String sql_convert_day(String date)
	{  
                if(date!=null)
		{
			String[] date_arr = date.split("-");
			StringBuffer result = new StringBuffer(1024);
			//result.append(date);
			result.append(date_arr[0]);
			return result.toString();
		}
		else {
		String s = "";
                return s;
}
             
        }   
	
%>
