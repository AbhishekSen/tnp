<%@page language="java" import="javazoom.upload.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<%@ page language="java" import="java.util.*,java.util.Properties" %>
<%@page language="java" import="pack.DbBean"%> 

<%@ include file="../utils/session_validator.jsp"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%
      String strPropPath="/opt/IITG-PROJECT/SW-IIT/placement_new/placement.properties";
      Properties ps=new Properties();
      ps.load(new FileInputStream(strPropPath));
      String gpath=ps.getProperty("gpath").trim();
      String apath=ps.getProperty("apath").trim();
      
      String str_path=gpath+"placement_uploads/student/uploads/";
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>
<%


	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");	

        db.fetchConfigDetails();
	String temp="select username from session where session_id='"+sid+"'";	
	db.connect();
	ResultSet r=db.execSQL(temp);
	String uname="";
	String roll_no="";
	
	if(r.next())
	{uname=r.getString(1);}
	
	temp="select student_roll_number from student_record where username='"+uname+"'";
	ResultSet r1=db.execSQL(temp);
	if(r1.next())
	{
		roll_no=""+r1.getInt(1);
	}
	db.close();
	r.close();
	r1.close();	
       

      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.

         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         int id = 0;
         if (mrequest != null && request != null)
         {
          todo = mrequest.getParameter("todo");
          id = Integer.parseInt(request.getParameter("id"));
         }
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {

                    UploadFile file = (UploadFile) files.get("uploadfile");
                    String fname=file.getFileName();                 
                    String fName[] = fname.split("\\.");
                    
                    if(id == 1)
                    {
	        	file.setFileName(roll_no+".pdf");
	            }
	            else if(id == 2)
	            {
	                file.setFileName(roll_no+"_1.pdf");
                    }
					long file_size=file.getFileSize();
					String conttype=""+file.getContentType();
					//String req1="application/pdf";
					//String req2="application/x-download";
                    //if (file != null )
                    if (file != null && fName.length>=2 && fName[1].equals("pdf"))
		    { 
                    // Uses the bean now to store specified by jsp:setProperty at the top.
					 if(id==1)
                                         {
                                            //System.out.println("file size: "+file_size);
                                            //System.out.println("content type: "+conttype);
						//if(id==1 && (conttype.equals(req1) || conttype.equals(req2) ) && file_size<=204800)
						if(id==1 && file_size<=204800)
						{
						   String f_name=gpath+"placement_uploads/student/uploads/"+roll_no+".pdf";
							File file1=new File(f_name);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									out.println("<Error>2</Error>");
								}
								else
								{
								        upBean.store(mrequest, "uploadfile");
							                out.println("<Error>3</Error>");
								}
							}
							else
							{
							        upBean.store(mrequest, "uploadfile");
							       // response.sendRedirect("../upload_cv/success.jsp");
							       out.println("<Error>3</Error>");
							}
						}
						else
						{
						//System.out.println("here I am");
						       out.println("<Error>1</Error>");
							
						}}
						if(id==2){
						if(id==2 && file_size<=204800)
						{
						   String f_name=gpath+"placement_uploads/student/uploads/"+roll_no+"_1.pdf";
							File file1=new File(f_name);
							if(file1.exists())
							{
								if(!file1.delete())
								{
									out.println("<Error>2</Error>");
								}
								else
								{
								        upBean.store(mrequest, "uploadfile");
							                out.println("<Error>3</Error>");
								}
							}
							else
							{
							        upBean.store(mrequest, "uploadfile");
							       // response.sendRedirect("../upload_cv/success.jsp");
							       out.println("<Error>3</Error>");
							}
						}
						else
						{
						       out.println("<Error>1</Error>");
							
						}}
                             }
			else
			       {
						//response.sendRedirect("../upload_cv/error.jsp");
						out.println("<Error>4</Error>");
                	       }
                  }
                else
                {
                 // out.println("<br>No uploaded files");
                 out.println("<Error>4</Error>");
				  
                }
	     }
         else 
                {//out.println("<BR> todo="+todo);
                out.println("<Error>4</Error>");
                }
      }

%>
