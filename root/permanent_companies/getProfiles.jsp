<%@page language="java" import="java.util.*,gcom.*" %>
<%@page language="java" import="javazoom.upload.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>

<%!String profile_list;%>
<% 
int agencyId = 0;
   if(request!=null)	
   {
        agencyId = Integer.parseInt(request.getParameter("agencyId"));
	   System.out.println("Agency Id: "+agencyId);
   }



				System.out.println("The request came :"+agencyId);
                    db.fetchConfigDetails(); //newly added
                    db.connect();
                    profile_list=my_drop_down("select package_id,package_name from package_details where agency_id="+agencyId+";",db,"-------------------Select a profile--------------------");
                   db.close();
		out.println("<select name=\"profile_name\" id=\"profile_name\" onChange=\return selectedProfileChanged();\">");
 %>
               <%=profile_list%>
<%
              out.println("</select>");
%>