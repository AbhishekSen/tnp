<%

if (request.getSession(false) != null )
	session.invalidate() ;

	response.sendRedirect("index.jsp");

	
%>

