<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />

<%@page language="java" import="pack.DbBean"%> 
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<% db.fetchConfigDetails();%>
<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
 

<%
	String submit=request.getParameter("submit");
	String company_name=request.getParameter("company_name");
	String company_address=request.getParameter("company_address");
	String company_website=request.getParameter("company_website");
	String category=request.getParameter("category");
	String sector=request.getParameter("sector");
	String category_other=request.getParameter("category_other");
	String sector_other=request.getParameter("sector_other");
	String fcp_name=request.getParameter("fcp_name");
	String fcp_email=request.getParameter("fcp_email");
	String fcp_mobile=request.getParameter("fcp_mobile");
	String fcp_phone=request.getParameter("fcp_phone");
	String fcp_fax=request.getParameter("fcp_fax");
	String fcp_designation=request.getParameter("fcp_designation");
	String company_about=request.getParameter("company_about");

 
//out.println(confirmation);

	if(submit!=null && company_name!=null && company_website!=null && company_address!=null &&company_about!=null&& category!=null && sector!=null && fcp_name!=null && fcp_email!=null && fcp_mobile!=null && fcp_phone!=null &&fcp_designation!=null)
	{
		if(!(category.equals("other") && category_other==null))
		{
			if(!(sector.equals("other") && sector_other==null))
			{				
				int num_rows=0;
				if (category.equals("other") && category_other!=null)
				{
					category=category_other;
				}
				if (sector.equals("other") && sector_other!=null)
				{
					sector=sector_other;
				}
					
				String main_record="insert into temporary_company (company_name,company_address,company_website,category,sector,fcp_name,fcp_email,fcp_mobile,fcp_phone,fcp_fax,fcp_designation,company_about) values ('"+company_name+"','"+company_address+"','"+company_website+"','"+category+"','"+sector+"','"+fcp_name+"','"+fcp_email+"','"+fcp_mobile+"','"+fcp_phone+"','"+fcp_fax+"','"+fcp_designation+"','"+company_about+"');";
									
				db.connect();
				num_rows=db.updateSQL(main_record);
				db.close();	
				if(num_rows==1 )
				{			
					response.sendRedirect("success.jsp");
				}
				else
				{
					response.sendRedirect("error.jsp");
				}
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
	}
	
	
%>
