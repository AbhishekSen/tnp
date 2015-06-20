<%@page language="java" import="java.util.*,gcom.*,java.lang.*,java.util.*,java.io.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">



</head>
<body onLoad="document.form_query_placement.student_roll_number.focus();">
<!--assigning values to dbbean--> 
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>



<%@ include file="../sessionvalidate.jsp"%>

<%@page language="java" import="java.sql.*"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ page import="java.util.*" %>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rst= db.execSQL(sql_username);
		if(rst.next()) 
		{
		username = rst.getString(1);
		}
		
		rst.close();
		db.close();
	
%>


  <div id="content"> 
    <div class="feature">
      <p>
        <%
		String submit=request.getParameter("submit");
		
		String Content="";

	   String display1="<div align='center' class='result'><b>" ;
	   String display2="</b><br></div>" ;
	   out.println(display1+"The Present Placement Status is as follows :"+display2);  
	   out.println(display1+""+display2); 
       out.println("<table align='center' cellpadding='5' cellspacing='5' border='0' name='table_query_placement_details'"+"id='table_query_placement_details' class='imagetable' >");
       out.println("<tr>");
   	   out.println("<th>Sl.No.</th>");
       out.println("<th>Department</th>");
	   out.println("<th>Programme</th>");
	   out.println("<th>Registered Students</th>");
	   out.println("<th>Placed Students</th>");
	   out.println("<th>% Placed </th>");
	   out.println("<th>Average Package</th>");
       out.println("</tr>");
	   if(submit!=null)
	   Content="Sl.No.,Department,Programme,Registered Students,% Placed,Average Package\n";	
 
	
        double total_ctc=0.0;
        int dept_id=1;
        int prog_id=1;
		int i=1;
		db.connect();
		ResultSet ctm1=db.execSQL("select count(*) from department_record;");
		int dept_max=0;
		if(ctm1.next())
			dept_max=ctm1.getInt(1);
		ctm1.close();
		ResultSet ctm2=db.execSQL("select count(*) from programme_record;");
		int prog_max=0;
		if(ctm2.next())
			prog_max=ctm2.getInt(1);
		ctm2.close();
		db.close();
		for(dept_id=1;dept_id<=dept_max;dept_id++)
		{
		for(prog_id=1;prog_id<=prog_max;prog_id++)
		{
			db.connect();
			ResultSet ct=db.execSQL("select count(*) from prog_record where department_id="+dept_id+" and programme_id="+prog_id+";");
			int is_true=0;
			if(ct.next()){
				is_true=ct.getInt(1);
			}
			ct.close();
			db.close();
	if(is_true!=0)
		{
		String get_deptname="select department_name from department_record where department_id='"+dept_id+"';";
        db.connect();
        ResultSet rd=db.execSQL(get_deptname);
        rd.next();
        String dept_name=rd.getString(1);
        rd.close();
        db.close();
        
        
        String get_progname="select programme_name from programme_record where programme_id='"+prog_id+"';";
        db.connect();
        ResultSet rp=db.execSQL(get_progname);
        rp.next();
        String prog_name=rp.getString(1);
        rp.close();
        db.close();

        String stud_id="select distinct student_id, package_id from placement_record;";
        db.connect();
        ResultSet rs=db.execSQL(stud_id);
        int student_id=0;
		int package_id=0;
		double placed=0;
		double percent=0;
	    double avg_package=0;
		int  reg_stud=0;
		
    	while(rs.next())
	    {
			student_id=rs.getInt(1);
			package_id=rs.getInt(2);
			int department_id=0;
			int programme_id=0;
			float ctc=0;
			

			String sql_query="select department_id, programme_id , ctc from package_extra_details where package_id="+package_id+";";
			db.connect();

			ResultSet raw=db.execSQL(sql_query);
			while(raw.next())
			{
				department_id=raw.getInt(1);
				programme_id=raw.getInt(2);
				ctc=raw.getFloat(3);
				if(package_id==124 && dept_id==1 && prog_id==3) 
				{System.out.println(student_id+ " "+department_id+" "+programme_id);
				
				
				}
				if(department_id==dept_id && programme_id==prog_id)
				{
					placed=placed+1;
					total_ctc=total_ctc+ctc;
				}
			}
			raw.close();
			db.close();

			
			String get_reg_stud="select count(*) from student_record where department_id='"+dept_id+"' and programme_id='"+prog_id+"';";
       	        db.connect();
        	ResultSet rod=db.execSQL(get_reg_stud);
        	rod.next();
        	reg_stud=rod.getInt(1);
        	rod.close();
        	db.close();
		}

		
			if(placed!=0)
			avg_package=total_ctc/placed;
			else
			avg_package=0;
			if(reg_stud!=0)
			{
			percent=(placed/reg_stud)*100;
		
			}
			if(reg_stud==0)
			percent=0;



   
   out.println("<tr><td>"+i+"</td><td>"+dept_name+"</td><td>"+prog_name+"</td><td>"+reg_stud+"</td><td>"+placed+"</td><td>"+percent+"</td><td>"+avg_package+"</td></tr>");
   			if(submit!=null)
			Content+=i+","+dept_name+","+prog_name+","+reg_stud+","+placed+","+percent+","+avg_package+"\n";
  			i++;
			//placed=0;
			rs.close();
			db.close();
		}
		}
		}
	out.println("</table>");
	if(submit!=null)
	{
		try
		{
			String filename="placement_status.xls";
		
			//out.println(Content);
			byte requestBytes[] = Content.getBytes();
			ByteArrayInputStream bis1 = new ByteArrayInputStream(requestBytes);
			response.reset();
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			byte[] buf = new byte[10000];
			int len;
			while ((len = bis1.read(buf)) > 0)
			{
				response.getOutputStream().write(buf, 0, len);
			}
			bis1.close();
			response.getOutputStream().flush(); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

%>
        
        
        
        
      </p>
      <table border="0" align="center">
        <tr>
          <td><form name="downloadCSVForm" method="post" action="" onsubmit="return downloadCSV();">
            <input type="submit" name="submit" id="submit" value="Export data to CSV">
          </form></td>
        </tr>
      </table>
    </div> 

  </div>

</body>
</html>
