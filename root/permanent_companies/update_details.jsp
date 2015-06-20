<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.lang.*" %>
<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%
        db.fetchConfigDetails(); //newly added
	String submit=request.getParameter("submit");
	//out.println(submit);
	if(submit!=null)
	{
		String cv_final_date=request.getParameter("cv_final_date");
		String cv_final_hour=request.getParameter("cv_final_hour");
		String am_pm=request.getParameter("am_pm");
		String cv_final_min=request.getParameter("cv_final_min");
		String agency_id=request.getParameter("agency_id");
		String[] fd=cv_final_date.split("-");
		int hour=Integer.parseInt(cv_final_hour);
		int min=Integer.parseInt(cv_final_min);
		int mon=Integer.parseInt(fd[1]);
		int yr=Integer.parseInt(fd[2]);
		int day=Integer.parseInt(fd[0]);
		int r=0;
		if(!(hour<0 || hour>23 || min<0 || min>59 || mon<1 || mon>12 || yr<2000 || yr>9999 || day<0 || day >31))
		{
			if ((mon!=1 && mon!=3 && mon!=5 && mon!=7 && mon!=8 && mon!=10 && mon!=12) && day>30) out.println("Invalid Day for the given month");
			else if(mon==2 && day>29) out.println("Invalid Day for February");
			else if(mon==2 && day>28 && (yr%4)!=0) out.println("Invalid Day for February in non-leap Year "+yr);
			else if(mon==2 && day>28 && (yr%400)!=0 && (yr%4)==0) out.println("Invalid Day for February in Year "+yr);
			else
			{
				if(am_pm.equals("0"))
					if(cv_final_hour.equals("12"))
						hour=0;
					else
						hour=Integer.parseInt(cv_final_hour);
				else
					if(cv_final_hour.equals("12"))
						hour=12;
					else
						hour=12+Integer.parseInt(cv_final_hour);
				db.connect();
				//out.println("update agency set cv_final_date='"+fd[2]+"-"+fd[1]+"-"+fd[0]+"', cv_final_time='"+hour+":"+cv_final_min+":00' where agency_id='"+agency_id+"';");
				r=db.updateSQL("update agency set cv_final_date='"+fd[2]+"-"+fd[1]+"-"+fd[0]+"', cv_final_time='"+hour+":"+cv_final_min+":00' where agency_id='"+agency_id+"';");
				db.close();
				//out.println("f");
			}
		}
		else
			out.println("Invalid Parameters");
			
		if(r==1)
		out.println("Database has been successfully updated.");
		else
		out.println("There has been an error please try again.");
	}

%>
