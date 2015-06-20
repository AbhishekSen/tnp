<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.lang.*" %>
<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />

<%
        db.fetchConfigDetails(); //newly added
	String cname=request.getParameter("cname").replace("'","`");
	db.connect();
	ResultSet rs=db.execSQL("select agency_id,agency_name,cv_final_date,cv_final_time,username from agency where agency_name like '%"+cname+"%' or username like '%"+cname+"%';");
	//out.println("select agency_id,agency_name from agency where agency_name like '%"+cname+"%' or username like '%"+cname+"%';");
	//out.println("<form name=\"form_temp\" method=\"post\" \"\">");
	String ops="<option value=\"";
	String opm="\">";
	String ope="</option>";
	int i=0;
	out.println("<table align=\"center\" id=\"tab1\" name=\"tab1\">");
	out.println("<tr><th>Username &nbsp;&nbsp;</th><th>Organization Name &nbsp;&nbsp;</th><th>Final CV Date &nbsp;&nbsp;</th><th>Final CV Time</th></tr>");
	while(rs.next())
	{
		String nds="Not Set";
		String nts="Not Set";
		String[] st={"00","00","00"};
		boolean flg=true;
		if(rs.getString("cv_final_date")!=null)
		{
			nds=rs.getString("cv_final_date");
			String[] sk=nds.split("-");
			nds=sk[2]+"-"+sk[1]+"-"+sk[0];
		}
		if(rs.getString("cv_final_time")!=null)
		{
			nts=rs.getString("cv_final_time");
			st=nts.split(":");
			if(Integer.parseInt(st[0])>12)
			{
				st[0]=""+(Integer.parseInt(st[0])-12);
				flg=false;
			}
			else if(Integer.parseInt(st[0])==0)
				st[0]="12";
		}
		out.println("<tr><td><input type=\"hidden\" name=\"hid"+i+"\" id=\"hid"+i+"\" value=\""+rs.getString("agency_id")+"\">"+rs.getString("username")+"&nbsp;&nbsp;&nbsp;</td>");
		out.println("<td>"+rs.getString("agency_name")+"&nbsp;&nbsp;&nbsp;</td>");
		out.println("<td>");
		
		out.println("<input readonly name=\"cv_final_date"+i+"\" type=\"text\" id=\"cv_final_date"+i+"\" value=\""+nds+"\" onclick=\"displayCalendar(document.forms[1].cv_final_date"+i+",'dd-mm-yyyy',this)\"></a>&nbsp;&nbsp;&nbsp;</td>");
		out.println("<td><input type=\"text\" name=\"hours"+i+"\" id=\"hours"+i+"\" value=\""+st[0]+"\" onkeyup=\"checkhour(this)\" size=\"3\"/>");
		out.println(":<input type=\"text\" name=\"mins"+i+"\" id=\"mins"+i+"\" value=\""+st[1]+"\" onkeyup=\"checkmin(this)\" size=\"3\"/>");
		if(flg)
			out.println("<select name=\"am_pm"+i+"\" id=\"am_pm"+i+"\">"+ops+"0"+opm+"AM"+ope+ops+"1"+opm+"PM"+ope+"</select></td>");
		else
			out.println("<select name=\"am_pm"+i+"\" id=\"am_pm"+i+"\">"+ops+"0"+opm+"AM"+ope+ops+"1"+"\" selected>"+"PM"+ope+"</select></td>");
		out.println("<td><input type=\"button\" value=\"Update\" name=\"but"+i+"\" id=\"but"+i+"\" onClick=\"update_db('"+i+"')\"></td></tr>");
		i++;
	}
	out.println("</table>");
	if(i==0)
	{
		out.println("<p align=\"center\"><b>There are no Results</b></p>");
	}
	i=0;
	rs.close();
	db.close();

%>

