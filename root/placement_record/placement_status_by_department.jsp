<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">

</script>
<%@page language="java" import="pack.DbBean,javazoom.upload.*"%> 

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>

</head>

<center><strong>View Placement Status</strong></center>

<form name="statsform"  method="post" id="statsform" action="#" onsubmit="return getStatsByDepartment();" enctype="multipart/form-data">
  <table width="511" height="117" border="0" align="center">
    <tr>
      <td>Select Company</td>
      <td><select name="programme_name" id="programme_name" >
        <%!String package_list;%>
        <% String package_list=drop_down("select programme_name from prog_record;",db); %>
        <option value="0">-------------Show for All Programs--------------------</option>
        <%=package_list%>
      </select></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="200" border="0" align="center">
    <tr>
      <td><div align="center">
        <input type="submit" name="submit" value="Submit">
        <colgroup>
          </colgroup>
      </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
</form>

</html>

