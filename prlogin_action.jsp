<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page language="java" import="encrypt.SimpleCrypt"%>
<%@page language="java" import="encrypt.StringEncrypter"%>

<%@ page language="java" import="java.io.*,java.sql.*,java.awt.*,java.awt.event.*"%>
<%@ page language="java" import="java.util.*,javax.swing.*,javax.swing.table.*"%>

<%@ page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>


<%
 try{
              db.fetchConfigDetails();
       	      db.connect();
               		
	      String id = request.getParameter("user");
	      String pw = request.getParameter("pass");
     
         String msg="select * from prlogin where userid='"+id+"' and password='"+pw+"';";
         ResultSet res=db.execSQL(msg);

         if(res.next())
         {

              /////
              String sid = null;
              sid = request.getSession(true).getId() ;

              String check="delete from session where username='"+id+"' ";
              int num_1=db.updateSQL(check);

              session.setAttribute("id",id);

              String sql_session = "select count(*) from session where username = '"+id+"' and session_id = '"+sid+"' " ;
              ResultSet rs=db.execSQL(sql_session);
              int num_session = 0 ;
              if (rs.next())
                    num_session=rs.getInt(1) ;
              rs.close() ;
              if(num_session==0)
              {
                   sql_session = "insert into session (username , session_id ) values ( '"+id+"' , '"+sid+"' ) " ;
                   int num = db.updateSQL(sql_session);
                   response.sendRedirect("generaternd.jsp"); 
              }
              else
                   response.sendRedirect("prlogin.jsp");
              

              //////

            }
            else
            {
                   response.sendRedirect("prlogin.jsp");
            }

              /*
              String msg="select * from prlogin where userid='"+id+"' and password='"+pw+"';";
              ResultSet res=db.execSQL(msg);

			    if(res.next())
			      {
				response.sendRedirect("generaternd.jsp");

                              }
			      else
			      {
				response.sendRedirect("prlogin.jsp");
			      }
			*/    

       }
       catch (Exception e){
              // out.println ("SQL Exception: "+e.getMessage());
           	}
           	finally{
               if (db!= null){
                   try{
                      db.close ();
                      }
                   catch (Exception e) {  }
               }
          }
%>
