<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>IIT Guwahati</title>
</head>

<body topmargin="0" leftmargin="0">

 

<%@page language="java" import="pack.DbBean"%> 
<%@page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>


<%@page language="java" import="encrypt.SimpleCrypt"%>
<%@page language="java" import="encrypt.StringEncrypter"%>


<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%db.fetchConfigDetails();%>

<%!

int string_to_integer(String str){
	int return_value = 0 ; 
   	try {
		    return_value = Integer.parseInt(str) ;
	    }
	catch(NumberFormatException e ){
			//System.out.println("Invalid format of ::" +str+"\n<br>");
		   	return_value  = -1 ;
		}  
	return return_value ;
}		
%>

<%
	String username = request.getParameter("username");	
	String p = request.getParameter("password");
	if(p==null && username==null)
	{
	 username = request.getParameter("username1");	
	 p = request.getParameter("password1");
	}
	db.connect();
    String check="delete from session where username='"+username+"' ";
    int num_1=db.updateSQL(check);
    db.close();
	String sid = null; 
	sid = request.getSession(true).getId() ;
	out.println(sid);
	StringEncrypter en = new StringEncrypter("DESede") ;
	int restart=0;
	String encrypted_password = "" ; 
	if ( p != null && p!= "")
		encrypted_password = en.encrypt(p);
	out.println("\n<br>Encrypted password in database is  ::'"+encrypted_password+"'::\n<br>");
	db.connect();
	String sql_login_username="select * from login where username = '"+username+"' ";
	ResultSet rs=db.execSQL(sql_login_username);
	int num_rows_login = 0 ;
	while (rs.next())
		num_rows_login++ ;
		
	if (num_rows_login == 1 ){	
		rs.first();
		String uid = rs.getString(1);
		String psswd = rs.getString(2);
		String role_id = rs.getString(3);
		session.setAttribute("uid",uid);
		//Cookie cookie= new Cookie("username",uid);
		//response.addCookie(cookie);
		rs.close(); 
		db.close();
		out.println("Encrypted password in database is  ::"+psswd+"::\n<br>");		
		if (p.equals(psswd)){ // encrypted comparison. 
			String sql_session = "select session_id from session where username = '"+username+"' and session_id = '"+sid+"' " ;
			db.connect();
			rs=db.execSQL(sql_session);
			int num_session = 0 ; 
			if (rs.next())
				num_session++ ;
			rs.close() ;	
			//out.println("\n <br>Session id  is ::"+request.getSession(false)); 
			if ( num_session == 0 && sid != null && sid != "" ){
				
				sql_session = "insert into session (username , session_id ) values ( '"+username+"' , '"+sid+"' ) " ;
				int num = db.updateSQL(sql_session);
                                out.println(num);
				int role_type = string_to_integer(role_id); 
				switch(role_type){
					case 2:  // STUDENTS 
                                                  
		                                  ResultSet ctm1=db.execSQL("select count(*) from student_record where username = '"+username+"';");
		                                   int temp=0;
		                                   if(ctm1.next())
			                              temp=ctm1.getInt(1);
		                                      ctm1.close();
							rs.close() ;
							db.close();					
							//response.sendRedirect("index.jsp");
                                                        if(temp!=0)
                                                        response.sendRedirect("student/instructions/info.jsp");
                                                        else
                                                         response.sendRedirect("index.jsp");
							break;

					case 1 : // AGENCY
							rs.close() ;
							db.close();
                                                        response.sendRedirect("index.jsp");						
							//response.sendRedirect("agency/main.jsp");
							break ; 		
					case 0 : //ADMINISTRATOR 
							rs.close() ;
							db.close();
                                                        response.sendRedirect("index.jsp");						
							//response.sendRedirect("root/main.jsp");
							break ; 
				}
				db.close();
	
			}
			else {
				rs.close() ;
				db.close();				
			//out.println(" The session is already in use by the application  \n<br>");
			response.sendRedirect("index.jsp");
			}
%>

<div align="center">
  <center>

<table border="0" width="750">
  <tr>
    <td width="100%" align="right"><a href="logout_self.jsp" target="_top">Logout </a></td>
  </tr>
</table>

  </center>
</div>
			<%
		} // password is valid ,  encrypted_password.equals(psswd)

		else {
		// redirect to initial page 
		//out.println("\n <br>Session id ,  password is not matching ::"+null); 
		response.sendRedirect("index.jsp");
		}
	} // usernmae is present in the database or not 
	else {
	// redirect to initial page 
	//out.println("\n <br>Session id  is , username does not exist ::"+null); 
	response.sendRedirect("index.jsp");
	}

%>
</body>

</html>
