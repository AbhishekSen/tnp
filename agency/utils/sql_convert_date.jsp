<%!
	String sql_convert_date(String date)
	{  
		
     
                if(date!=null)
		{
			String[] date_arr = date.split("-");
			StringBuffer result = new StringBuffer(1024);
			//result.append(date);
			result.append(date_arr[2]);//year
			result.append("-");
			if(date_arr[1].length()==1)//month
			{	
				result.append("0");
				result.append(date_arr[1]);
			}			
			else
				result.append(date_arr[1]);

			result.append("-");
			if(date_arr[0].length()==1)//day
			{	
				result.append("0");
				result.append(date_arr[0]);
			}			
			else
				result.append(date_arr[0]);

			return result.toString();
		}
		else {
		String s = "";
                return s;
}
             
        }   
	
%>
