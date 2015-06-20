<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;

	if (session_validate(sid,db).equals("true") ) 
	{

		response.sendRedirect("../logout.jsp");
		return;
	}
				
%>
