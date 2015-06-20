<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-859-1" />
<link rel="stylesheet" type="text/css" href="../css/style1.css" />
<title>Placement Query</title>
</head>

<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<jsp:useBean id="db2" class="pack.DbBean2" scope="session"/>
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
<%@ include file="../utils/roll_cpi_client/web/index.jsp"%>

<%@ page import="java.util.*" %>
<%@ page language="java" import="java.sql.*" %>
<%
  db2.fetchConfigDetails();
  db.fetchConfigDetails(); //newly added
%>
<body>
<jsp:include page="../utils/query_head.html" flush="true"/>

<h2>Placement Query
</h2>

<%! String agency_name=null;
    String agency_id=null; %>

<% agency_name=request.getParameter("agency_name");
   agency_id=request.getParameter("agency_id");
   
 
   if(agency_id.equals("1"))
   agency_name="total_agency";
   

%>

<%! public void exportData(Connection conn,String filename) {
        Statement stmt;
        String query;
        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            
            //For comma separated file
            query = "SELECT * into OUTFILE  '"+filename+
                    "' FIELDS TERMINATED BY ',' FROM agency where agency_name='"+agency_name+"'";
            stmt.executeQuery(query);
		
            
        } catch(Exception e) {
            e.printStackTrace();
            stmt = null;
		
        }
    }


    public void exportData1(Connection conn,String filename) {
        Statement stmt;
        String query;
        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            
            //For comma separated file
            query = "SELECT * into OUTFILE  '"+filename+
                    "' FIELDS TERMINATED BY ',' FROM agency ";
            stmt.executeQuery(query);
		
            
        } catch(Exception e) {
            e.printStackTrace();
            stmt = null;
		
        }
    }  
%> 


<%   if(agency_id.equals("0"))
    { db.connect();
     Connection conn=db.dbCon;
     String test="/tmp/"+agency_name+".csv";
     exportData(conn,test);
     db.close();  
    }

    if(agency_id.equals("1"))
    { db.connect();
     Connection conn=db.dbCon;
     String test="/tmp/"+agency_name+".csv";
     exportData1(conn,test);
     db.close();  
    }


%>

<b><u><h3>Link to download .csv file is given as under<h3></u></b>
<a href="../../tmp/<%out.println(agency_name+".csv");%>" type="text/csv">Right clink on this link and select "Save Link as" to save file to your system"</a>
</body>
</html>

<%@ page import="java.util.*,java.io.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.lang.*" %>


<%
    	//read the file name.
	
	File f = new File ("/tmp/"+agency_name+".csv");
        long len=f.length();
     
        String leng=Long.toString(len);
        int length=Integer.parseInt(leng);

        byte totalbytes[]=new byte[length];
        
        InputStream in= new FileInputStream(f);
    
        
         in.read(totalbytes,0,length);
       f.delete();

       File f1=new File("/home/a.bhengra/placement/tmp/"+agency_name+".csv");
   //    f1.delete();
       f1.createNewFile();
   
       FileOutputStream fileout=new FileOutputStream(f1);
         fileout.write(totalbytes,0,length);
         fileout.flush();
         fileout.close();
      //   f1.delete();
 

%>  
