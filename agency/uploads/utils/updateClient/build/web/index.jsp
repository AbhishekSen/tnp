
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%-- start web service invocation --%>
    <%!
    public void update_deptWS(int dept_Id,String roll_Number){
    try {
	pack_update.UpdateQueryWSService service = new pack_update.UpdateQueryWSService();
	pack_update.UpdateQueryWS port = service.getUpdateQueryWSPort();
	 // TODO initialize WS operation arguments here
	int deptId = dept_Id;
	java.lang.String rollNumber = roll_Number;
	port.executeDept(deptId, rollNumber);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    }
    %>
    <%-- end web service invocation --%>

        <%-- start web service invocation --%>
    <%!
    public void update_progWS(int prog_Id,String roll_Number){
    try {
	pack_update.UpdateQueryWSService service = new pack_update.UpdateQueryWSService();
	pack_update.UpdateQueryWS port = service.getUpdateQueryWSPort();
	 // TODO initialize WS operation arguments here
	int progId = prog_Id;
	java.lang.String rollNumber = roll_Number;
	port.executeProg(progId, rollNumber);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    }
    %>
    <%-- end web service invocation --%>
    <%-- start web service invocation --%>
    <%!
    public void update_rollWS(String roll_Number1,String roll_Number2){
    try {
	pack_update.UpdateQueryWSService service = new pack_update.UpdateQueryWSService();
	pack_update.UpdateQueryWS port = service.getUpdateQueryWSPort();
	 // TODO initialize WS operation arguments here
	java.lang.String rollNumber1 = roll_Number1;
	java.lang.String rollNumber2 = roll_Number2;
	port.executeRoll(rollNumber1, rollNumber2);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    }
    %>
    <%-- end web service invocation --%>

    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    </body>
</html>
