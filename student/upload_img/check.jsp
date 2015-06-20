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
      
      String str_path=apath+"tnp/image_uploads/";

      String str_path_backup=gpath+"placement_uploads/student/image_uploads/";
	//String str_path="/opt/tomcat7/webapps/placement_new/image_uploads/";
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value='<%=str_path%>' />
</jsp:useBean>
<jsp:useBean id="upBean2" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean2" property="folderstore" value='<%=str_path_backup%>' />
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
	        	file.setFileName(roll_no+"_img.jpeg");
	            }
	            else if(id == 2)
	            {
	                file.setFileName(roll_no+"_sign.jpeg");
                    }
					long file_size=file.getFileSize();
					String conttype=""+file.getContentType();
					//String req1="application/pdf";
					//String req2="application/x-download";
                    //if (file != null )
                    if (file != null && fName.length>=2 && (fName[1].equals("jpeg") || fName[1].equals("JPEG")))
		    { 
                    // Uses the bean now to store specified by jsp:setProperty at the top.
					 if(id==1)
                                         {
                                            //System.out.println("file size: "+file_size);
                                            //System.out.println("content type: "+conttype);
						//if(id==1 && (conttype.equals(req1) || conttype.equals(req2) ) && file_size<=204800)
						if(id==1 && file_size<=51200)
						{
						 
							String f_name=apath+"tnp/image_uploads/"+roll_no+"_img.jpeg";
						String f_name_backup=gpath+"placement_uploads/student/image_uploads/"+roll_no+"_img.jpeg";
							//String f_name="/opt/tomcat7/webapps/placement_new/image_uploads/"+roll_no+"_img.jpeg";

							File file1=new File(f_name);
							File file2 = new File(f_name_backup);  //for saving backup file



							if(file1.exists() && file2.exists())
							{
						 FileInputStream fileInputStream = new FileInputStream(f_name);
						FileOutputStream fileOutputStream = new FileOutputStream(f_name_backup);
							int bufferSize;
								if(!file1.delete() && !file2.delete())
								{
									out.println("<Error>2</Error>");
								}
								else
								{
								        upBean.store(mrequest, "uploadfile");
									
									byte[] bufffer = new byte[512];
									   while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
										   fileOutputStream.write(bufffer, 0, bufferSize);
										}
							                out.println("<Error>3</Error>");
							                       fileInputStream.close();
							                        fileOutputStream.close();
								}
							}
							else
							{
								file1.delete();
								file2.delete();
							        upBean.store(mrequest, "uploadfile");
						 FileInputStream fileInputStream = new FileInputStream(f_name);
						FileOutputStream fileOutputStream = new FileOutputStream(f_name_backup);
							int bufferSize;
								byte[] bufffer = new byte[512];
								   while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
									   fileOutputStream.write(bufffer, 0, bufferSize);
									}								
							       out.println("<Error>3</Error>");
									fileInputStream.close();
								        fileOutputStream.close();
							}
						}
						else
						{
						//System.out.println("here I am");
						       out.println("<Error>1</Error>");
							
						}}
						if(id==2){
						if(id==2 && file_size<=51200)
						{
						   //String f_name=gpath+"../../../images/"+roll_no+"_sign.jpeg";
							String f_name=apath+"tnp/image_uploads/"+roll_no+"_sign.jpeg";
						String f_name_backup=gpath+"placement_uploads/student/image_uploads/"+roll_no+"_sign.jpeg";
							//String f_name="/opt/tomcat7/webapps/placement_new/image_uploads/"+roll_no+"_sign.jpeg";
			
							File file1=new File(f_name);
							File file2 = new File(f_name_backup);  //for saving backup file
							if(file1.exists() && file2.exists())
							{
						 FileInputStream fileInputStream = new FileInputStream(f_name);
						FileOutputStream fileOutputStream = new FileOutputStream(f_name_backup);
							int bufferSize;
								if(!file1.delete() && !file2.delete())
								{
									out.println("<Error>2</Error>");
								}
								else
								{
								        upBean.store(mrequest, "uploadfile");
									byte[] bufffer = new byte[512];
									   while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
										   fileOutputStream.write(bufffer, 0, bufferSize);
										}
							                out.println("<Error>3</Error>");
							                       fileInputStream.close();
							                        fileOutputStream.close();
								}
							}
							else
							{
								file1.delete();
								file2.delete();
							        upBean.store(mrequest, "uploadfile");
						 FileInputStream fileInputStream = new FileInputStream(f_name);
						FileOutputStream fileOutputStream = new FileOutputStream(f_name_backup);
							int bufferSize;
								byte[] bufffer = new byte[512];
								   while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
									   fileOutputStream.write(bufffer, 0, bufferSize);
									}							    
							       out.println("<Error>3</Error>");
							                       fileInputStream.close();
							                        fileOutputStream.close();
							}
						}
						else
						{
						       out.println("<Error>1</Error>");
							
						}}
                             }
			else
			       {
						
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
