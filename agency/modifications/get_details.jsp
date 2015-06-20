<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>Placement Query</title>






<script type="text/javascript">

function activate(check_box,activate_tag)
{
	if(check_box.value=="1")
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
		document.getElementById(activate_tag).disabled=true;
}



</script>
</head>

<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>

<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>
<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>

<%@ include file="../utils/drop_down2.jsp"%>

<%@ page import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>

<body>
<jsp:include page="../utils/query_head.html" flush="true"/>

<h2>Placement Query
</h2>

<% String agency_name=request.getParameter("agency_name");out.println(agency_name);
   String department_name=request.getParameter("department_name");
  out.println(department_name);
  String no_of_vacancy=request.getParameter("vacancy");
  out.println(no_of_vacancy);%>


<%! String agency_id=null;
    int dept=0; 
    int agency_id1=0;
    int no_of_vacancy1=0;%>

<% 
 db.fetchConfigDetails(); //newly added
 out.println("hmmm");

 //String agency_name=request.getParameter("agency_name");out.println(agency_name);
 String department=request.getParameter("department");
 db.connect();
 String agency="select agency_id from agency where agency_name='"+agency_name+"';";
 ResultSet rs=db.execSQL(agency);
 if(rs!=null)
{ rs.next();
  agency_id=rs.getString(1);}
 rs.close();
 db.close();

 // if(department!=null)
  out.println(agency_id);
 
 if(department.equals("0"))
  dept=99;

  if(department.equals("1"))
  {
    String  dept_id="select department_id from department_record where department_name='"+department_name+"';";
    db.connect();
   ResultSet rd=db.execSQL(dept_id);
  if(rd!=null)
   {rd.next();
    dept=rd.getInt(1);
   }
  rd.close();
  db.close();
 }

  //agency_id1=Integer.parseInt(agency_id);
  //no_of_vacancy1=Integer.parseInt(no_of_vacancy);

 if(agency_id!=null)
 {  out.println("okkk");
  out.println(dept);
  			String main_record=" delete from vacancies where agency_id="+agency_id+" and department_id="+dept+" ;";
				//out.println(main_record);
				db.connect();
				int num_rows1=db.updateSQL(main_record);
				//	out.println("affected rows:"+num_rows);
				db.close();	
				if(num_rows1==1)
					{
						out.println("AGENCY DETAILS DELETED");
					 

					}
					else
				out.println("Could not delete agency details");
 
  String update="insert into vacancies (department_id,no_of_vacancies,agency_id)"+
			" values ('"+dept+"','"+no_of_vacancy+"','"+agency_id+"');";
  db.connect();
  int num_rows=db.updateSQL(update);
  if(num_rows==1)
   out.println("Department and no of vacancy updated");
  else
 out.println("not done!!!!!!!!!!!!!!!!!!...........");
  db.close();

 }
 else
 out.println("<b>Agency is not yet registered for placement</b>");
%>

<jsp:include page="../utils/foot.html" flush="true"/>

</body>
</html>
