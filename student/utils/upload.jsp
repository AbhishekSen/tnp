<%@ page language="java" import="org.apache.commons.fileupload.*,java.io.*" %>
<%!
public boolean store_upload(HttpServletRequest req, HttpServletResponse res, String Filename, String location) 
{
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(4096);
        // the location for saving data that is larger than getSizeThreshold()
        factory.setRepository(new File("/tmp"));

        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum size before a FileUploadException will be thrown
        upload.setSizeMax(1000000);

     try{
        List fileItems = upload.parseRequest(req);
        // assume we know there are two files. The first file is a small
        // text file, the second is unknown and is written to a file on
        // the server
        Iterator i = fileItems.iterator();
        
        FileItem fi = (FileItem)i.next();
        
        
		fi.write(new File(location+Filename));
	    return true;
		}
	catch(FileUploadException e)
		{ String we=e.toString();
		  System.out.println(we);
		  return false;		
		}
	catch(Exception f)
		{ String fe=f.toString();
		  System.out.println(fe);
		  return false;	
		}
		//return false;		
    }
%>