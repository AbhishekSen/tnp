
<%@page import="java.util.*"%>

<%!
	
	String compare_dates(String date1,String date2)
	{
		
		
		StringBuffer result = new StringBuffer(1024);
		
	      if(date1!=null && date2!=null)
		{
			String[] date1_arr = date1.split("-");
			String[] date2_arr = date2.split("-");
		    int year1=Integer.parseInt(date1_arr[0]);
			int year2=Integer.parseInt(date2_arr[0]);
		    int month1=Integer.parseInt(date1_arr[1]);
		    int month2=Integer.parseInt(date2_arr[1]);
		    int day1=Integer.parseInt(date1_arr[2]);
		    int day2=Integer.parseInt(date2_arr[2]); //return("t"+year1+"t"+year2+"t");
			if(year1>year2)
			 {
			  result.append("t"); 
			 }
			
			else 
			{
			    
				  if(year1<year2) 
			         result.append("Update Failed as Date entered is before the previous updated date.");
					  
					
					  

				  else
			       {
				     
					 if(month1>month2)  
					
					   result.append("t"); 
			          		
			         else 
					    {
					     
						    if(month1<month2)
					     
							  result.append("Update Failed as Date entered is before the previous updated date.");
						     else
						     {
							    
							   if(day1>day2){ 
							     result.append("t");}
			                    			
			                   else
							    {
							       if(day1<day2)
					                 result.append(" Update Failed as Date entered is before the previous updated date.");
									 
									
									else
									    result.append("t");
									  
									
							   }
				             }
				          }         
				  }
				 } 
		return result.toString();
	   }
   else return("t");
  }

long days(long time)
{
long millisec_per_day = 24*3600*1000;
 
long t= time/millisec_per_day;

return t;

}
	
 
	
%>