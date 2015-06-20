
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

        <%-- start web service invocation --%><hr/>
   <%!
    public String drop_down_departmentWS(){
    try {
	pack_drop.DropDepartmentService service = new pack_drop.DropDepartmentService();
	pack_drop.DropDepartment port = service.getDropDepartmentPort();
	// TODO process result here
	java.lang.String result = port.dropDownDeptWS();
	//out.println("Result = "+result);
        return result;
    } catch (Exception ex) {
	 return ex.toString();// TODO handle custom exceptions here
    }
    }
    %>
    <%-- end web service invocation --%><hr/>

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
