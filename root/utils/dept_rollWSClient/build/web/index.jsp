
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
    public String give_dept_roll(String roll_Number){
    <%
    try {
	pack_dept_roll.DeptRollWSService service = new pack_dept_roll.DeptRollWSService();
	pack_dept_roll.DeptRollWS port = service.getDeptRollWSPort();
	 // TODO initialize WS operation arguments here
	java.lang.String rollNumber = roll_Number;
	// TODO process result here
	java.lang.String result = port.getdeptRoll(rollNumber);
	//out.println("Result = "+result);
        return result;
    } catch (Exception ex) {
	return ex.toString();// TODO handle custom exceptions here
    }
    }
    %>
    <%-- end web service invocation --%>
    <%-- start web service invocation --%>
    <%!
    public String give_prog_roll(String roll_Number){
    <%
    try {
	pack_dept_roll.DeptRollWSService service = new pack_dept_roll.DeptRollWSService();
	pack_dept_roll.DeptRollWS port = service.getDeptRollWSPort();
	 // TODO initialize WS operation arguments here
	java.lang.String rollNumber = roll_Number;
	// TODO process result here
	java.lang.String result = port.getprogRoll(rollNumber);
	//out.println("Result = "+result);
         return result;
    } catch (Exception ex) {
	return ex.toString();// TODO handle custom exceptions here
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
