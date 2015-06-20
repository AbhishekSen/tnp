<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../sessionvalidate.jsp"%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rst= db.execSQL(sql_username);
		if(rst.next()) 
		{
		username = rst.getString(1);
		}
		
		rst.close();
		db.close();
	
%>


<div id="pagecell1"> 
  <!--pagecell1--> 
  <p align="center"><strong>Policies and Regulations:</strong></p>
 <br/>
<p>&nbsp;</p>
<p align="center"><a href="http://shilloi.iitg.ernet.in/~placement/intra/Policies%20and%20Regulations.pdf">Click Here For Policies and Regulations</a></p> 
<p>&nbsp;</p>  
</div> 

</body>
</html>
