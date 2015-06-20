<%
out.println("<h1>Access to this page is denied from your account.</h1><br><br><h3> Click on any of the following options.........<br><br>");
%>
<a href="index1.jsp">Login Page</a>
<%
out.println("<br><br>");
//response.sendRedirect(request.getHeader("Referer"));

%>
Go to the previous page........ <input type="button" name="back" id="back" value="back" onClick="history.back()">
<%
out.println("<br><br>");
//response.sendRedirect(request.getHeader("Referer"));

%>
