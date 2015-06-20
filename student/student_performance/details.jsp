<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">



<link rel="stylesheet" href="../js/example.css" TYPE="text/css" MEDIA="screen">


<script src="../js/datetimepicker.js"></script>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>

<%@ include file="../sessionvalidate.jsp"%>
<%
        db.fetchConfigDetails(); //newly added
	
		String agency_name="";
		String agency_id=request.getParameter("id");
		String package_id = request.getParameter("pid");
		db.connect();
		ResultSet ra123=db.execSQL("select agency_name from agency where agency_id='"+agency_id+"';");
		if(ra123.next())
		agency_name=ra123.getString(1);
		ra123.close();
		db.close();
%>



<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>

<%  	//out.println("rohan 1");
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;

	String agency_address="";
	String agency_website="";
	String agency_profile="";
	String nature_business="";
	String gd="";
	String aptitude_test="";
	String interview="";
	String aptitude_duration="";
	String cpi="";
	String technical_test="";
	String technical_duration="";
	String company_about="";
	String x_percentage="";
        String xii_percentage="";

%>
<body background="form/New/jee3.jpg">


  <div id="content">
    <div class="feature">
    <%	
		String sql_get_data="select * from agency where agency_name='"+agency_name+"';" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
				nature_business=rs.getString("nature_business");
				agency_website=rs.getString("agency_website");
				agency_profile=rs.getString("agency_profile");
				cpi=rs.getString("cpi");
				aptitude_test=rs.getString("aptitude_test");
				aptitude_duration=rs.getString("aptitude_duration");
				gd=rs.getString("gd");
				technical_test=rs.getString("technical_test");
				technical_duration=rs.getString("technical_duration");
				company_about=rs.getString("company_about");
		}
		rs.close();
		ResultSet ru=db.execSQL("select cpi,x_percentage,xii_percentage from package_details where agency_id="+agency_id+" and package_id="+package_id+";");
		if(ru.next())
		{
			cpi=ru.getString("cpi");
			x_percentage=ru.getString("x_percentage");
			xii_percentage=ru.getString("xii_percentage");
		}
		ru.close();
		db.close();
		
	
	%>
 
        <table class="imagetable" width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF"><div class="tabber">
              <div class="tabbertab" id="tabbertab" id="step[1]" >
                <h2>Organization Details</h2>
                <center>
                  <p>&nbsp;</p>
                  <table width="580" height="153" border="0" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="350" ><strong>Name of the Organization</strong></td>
                      <td ><%=agency_name%></td>
                    </tr>
                    <tr>
                      <td height="10" ><strong>Website</strong></td>
                      <td ><%=agency_website%></td>
                    </tr>
                    <tr>
                      <td height="37"><strong>Type of Organization</strong></td>
                      <td><%=nature_business%></td>
                    </tr>
                    <tr>
                      <td height="34"><strong>Industry Sector </strong></td>
                      <td ><%=agency_profile%></td>
                    </tr>
                    <tr>
                      <td height="34"><strong>About Organization </strong></td>
                  <td ><%=company_about.replace("\n","<br/>")%></td>
                    </tr>
                  </table>
                </center>
              </div>
              <div class="tabbertab" id="tabbertab" id="step[2]">
                <h2>Eligibility</h2>
                <p>&nbsp;</p>
                <center>
                  <table width="580" align="center" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="350"  ><strong>Cpi(minimum):</strong></td>
                      <td  ><%=cpi%></td>
                    </tr>
                    <tr>
                      <td width="350"  ><strong>Tenth Percentage:</strong></td>
                      <td  ><%=x_percentage%>%</td>
                    </tr>
                    <tr>
                      <td width="350"  ><strong>Tweleth Percentage:</strong></td>
                      <td  ><%=xii_percentage%>%</td>
                    </tr>
                      <tr>
                      <td ><strong>GD</strong></td>
                      <td ><b><% if(gd.equals("0"))out.println("No");else out.println("Yes"); %></b></td>
                    </tr>
                    <tr>
                      <td ><strong>Written Test duration (in minutes)</strong></td>
                      <td><b><% if(aptitude_test.equals("0"))out.println("No");else out.println("Yes"); %></b>, duration(<%=aptitude_duration%>)</td>
                    </tr>
                    <tr>
                      <td ><strong>Online Test duration (in minutes)</strong></td>
                      <td><b><% if(technical_test.equals("0"))out.println("No");else out.println("Yes"); %></b>, duration(<%=technical_duration%>)</td>
                    </tr>

                  </table>
                </center>
              </div>
              <div class="tabbertab" id="tabbertab" id="step[3]">
                <h2>Vacancies</h2>
                <p>&nbsp;</p>
<%
				  //String agency_id="";
				  
				  db.connect();

				  String t1="select * from package_details where agency_id='"+agency_id+"' and package_id='"+package_id+"'";
				  ResultSet r1=db.execSQL(t1);
				  String tds="<td height=\"32\" width=\"296\" >";
				  String tde="</td>";
				  String package_name="";
				  String ctc="";
				  String ctc_mtech="";
				  String dep="";
				  String prog="";
				  String no_vac="";  
				  int i=1;
				  String j="";
				  String curr="";
				  if(r1.next())
				  {
					  package_name=r1.getString("package_name");
					  ctc=r1.getString("ctc");
					  no_vac=r1.getString("vacancy");j=""+i;

					  out.println("<table width=\"580\" height=\"123\" align=\"center\" cellpadding=\"5\" cellspacing=\"5\">");

					  out.println("<tr>"+tds+"Job Description</td>"+tds+r1.getString("job_description")+"</td></tr>");
					  out.println("<tr>"+tds+"Job Designation</td>"+tds+r1.getString("job_designation")+"</td></tr>");
					  out.println("<tr>"+tds+"Place of Posting</td>"+tds+r1.getString("location_of_posting")+"</td></tr>");
					  out.println("<tr>"+tds+"Accomodation</td>"+tds);if(r1.getInt("accomodation")==1){out.println("Yes");}else{out.println("No");}out.println("</td></tr>");
					  out.println("<tr>"+tds+"Bond</td>"+tds);if(r1.getInt("bond")==1){out.println("Yes");}else{out.println("No");}out.println("</td></tr>");
					  if(r1.getInt("bond")==1){out.println("<tr>"+tds+"Bond Duration</td>"+tds+r1.getInt("bond_duration")+"</td></tr>");}
					  i++;
					  out.println("<tr>"+tds+"Package</td>"+tds+package_name+"</td></tr>");
					  ResultSet rr=db.execSQL("select program_index from package_extra_details where agency_id="+agency_id+" and package_id="+package_id+";");
					  out.println("<tr>"+tds+"Eligible Programmes</td><td>");
					  
					  out.println("<table>");
  
					  while(rr.next())
					  {
						  dep=rr.getString("program_index");
						  ResultSet r2=db.execSQL("select programme_name from prog_record where prog_id='"+dep+"'");
						  if(r2.next())
						  {
							  out.println("<tr><td><b>"+r2.getString("programme_name")+"</b><br/></td><tr>");
						  }
						  r2.close();
					  }
					   rr.close();
					  out.println("</table>");
					
					  out.println("<table>");


					ResultSet rr1=db.execSQL("select * from minor_details where agency_id="+agency_id+" and package_id="+package_id+";");

					out.println("<br>");

					out.println("<tr><td>Major Dept</td><td>Minor Dept</td></tr>");


					String dep_names[]={"CSE", "ECE", "ME", "CVL", "BT", "CL", "MnC", "EP", "CST", "EEE", "Design"};
					String cpi_minor_table="";
					while(rr1.next())
					{
						cpi_minor_table=rr1.getString("CPI");
						out.println("<tr><td>"+dep_names[rr1.getInt("major")-1]+"</td><td>"+dep_names[rr1.getInt("minor")-1]+"</td></tr>");						
					}
					  out.println("<br>");

					   out.println("<tr><td>Min CPI for Minor:</td><td>"+cpi_minor_table+"</td></tr>");
					  out.println("</table></td></tr></table>");
					  out.println("</td></tr>");

                                          ResultSet r23=db.execSQL("select pay_mode from agency_currency where agency_id='"+agency_id+"' and package_id='"+r1.getString("package_id")+"'");
					  if(r23.next())
					  {
					      curr=r23.getString("pay_mode");
					  }
                                          r23.close();
					  out.println("<tr>"+tds);
					  out.println("<table>");
					  out.println("<tr><td>No. of Jobs offered :</td><td> "+no_vac+"</td></tr>");
					 
					  out.println("<tr><td>CTC :</td><td> "+ctc+" "+curr+"</td></tr>");
					 
					  out.println("<tr><td>CTC MTech : </td><td>"+r1.getString("ctc_mtech")+" "+curr+"</td></tr>");
					  out.println("</table></td></tr></table>");
					
                                    
                                          /*
					  ResultSet r23=db.execSQL("select pay_mode from agency_currency where agency_id='"+agency_id+"' and package_id='"+r1.getString("package_id")+"'");
					  if(r23.next())
					    {
					      curr=r23.getString("pay_mode");
					    }
					  out.println(tds+"No. of Jobs offered</td>"+tds+no_vac+"</td></tr>");
					  out.println(tds+"CTC</td>"+tds+ctc+curr+"</td></tr>");
					  out.println(tds+"CTC MTech</td>"+tds+r1.getString("ctc_mtech")+curr+"</td></tr>");
					  out.println("</table>");
                                          */
				  }
				  r1.close();
				  db.close();
				  %>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </div>
              
            </div></td>
          </tr>

          </td>
        </table>

     
    </div>
  </div>

</body>

</html>

