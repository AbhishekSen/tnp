<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style type="text/css">
  .rw{

	margin-top:20px;
	line-height:30px;
    
      }
</style>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="../sessionvalidate.jsp"%>
</head>
<body>
   <div align='center'>
      <div class="rw" style="font-size:14px;"><b>Enter Student Code below:<b></div><br>
   <form name="attendanceForm" action="#" method="get" onsubmit= "return getStudentAttendance();" enctype="multipart/form-data">
    <input id="inputCode" type="text" name="code" size="25"></input>
    <input type="submit" name="submit" value="submit" onclick="return checkAttendanceForm();"></input> 
   </form>
     
  </div>

</body>
</html>

