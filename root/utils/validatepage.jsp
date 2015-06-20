<%@ page import="java.sql.*" %>
<%@ page import= "java.util.*" %>
<%@ page import = "javax.servlet.*" %>


<%
	try{
	
	String role = (String)session.getAttribute("role_id");
	
	if(role== null)
		//out.println("help : session invalid");
		response.sendRedirect("http://www.google.com");
	
	int num=0;
	
	String page1 = (String)session.getAttribute("Folder")+(String)session.getAttribute("Currpage");
	
		   
           try{
                //db.fetchConfigDetails(); //newly added
               	db.connect(); 
                String sql="select access from permission where page_name = '"+ page1+"' and role_id ='"+role+"';" ;
		//out.println(sql);
        int num_rows=0 ;
		

		ResultSet rs= db.execSQL(sql);
	
				while(rs.next())
					num++;
				
				rs.first();
				
				if(num==1)
				{		
					rs.first();	
					if(rs.getString(1).equals("0"))
						response.sendRedirect("root/utils/error.jsp");						
				}

			}
			catch (Exception e){
               out.println ("SQL Exception: "+e.getMessage());
           	}
           	finally{
               if (db != null){
                   try{
                       db.close ();
                   }
                   catch (Exception e) {  }
               }
           }
	}
	catch(Exception ex)
	{
		//if(ex==java.lang.NullPointerException)
				response.sendRedirect("logout.jsp");
	}
%>
