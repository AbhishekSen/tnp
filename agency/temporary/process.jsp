<%-- 
    Document   : check_captcha
    Created on : Jun 11, 2011, 10:26:59 AM
    Author     : @runabh'sonly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />

<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<% db.fetchConfigDetails();%>
<%@ page language="java" import="java.sql.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ page language="java" import="javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,java.util.Properties,javax.mail.*"%>

<%
String cap=(String)session.getAttribute("security_code");
String input_cap=request.getParameter("input_cap").trim();

if(input_cap.equals(cap))
{
        String submit=request.getParameter("submit");
        String company_name=request.getParameter("company_name");
        String company_address=request.getParameter("company_address");
        String company_website=request.getParameter("company_website");
        String category=request.getParameter("category");
        String sector=request.getParameter("sector");
        String category_other=request.getParameter("category_other");
        String sector_other=request.getParameter("sector_other");
        String fcp_name=request.getParameter("fcp_name");
        String fcp_email=request.getParameter("fcp_email");
        String fcp_mobile=request.getParameter("fcp_mobile");
        String fcp_phone=request.getParameter("fcp_phone");
        String fcp_fax=request.getParameter("fcp_fax");
        String fcp_designation=request.getParameter("fcp_designation");
        String company_about=request.getParameter("company_about");

        if(submit!=null && company_name!=null && company_website!=null && company_address!=null &&company_about!=null&& category!=null && sector!=null && fcp_name!=null && fcp_email!=null && fcp_mobile!=null && fcp_phone!=null &&fcp_designation!=null)
        {
                if(!(category.equals("other") && category_other==null))
                {
                        if(!(sector.equals("other") && sector_other==null))
                        {
                                int num_rows=0;
                                if (category.equals("other") && category_other!=null)
                                {
                                        category=category_other;
                                }
                                if (sector.equals("other") && sector_other!=null)
                                {
                                        sector=sector_other;
                                }

                                String main_record="insert into temporary_company (company_name,company_address,company_website,category,sector,fcp_name,fcp_email,fcp_mobile,fcp_phone,fcp_fax,fcp_designation,company_about) values ('"+company_name+"','"+company_address+"','"+company_website+"','"+category+"','"+sector+"','"+fcp_name+"','"+fcp_email+"','"+fcp_mobile+"','"+fcp_phone+"','"+fcp_fax+"','"+fcp_designation+"','"+company_about+"');";

                                db.connect();
                                num_rows=db.updateSQL(main_record);
                                if(num_rows==1 )
                                {
                                
                                     // for keeping a bkup of new registration copy
                                     String main_record_bkup="insert into temporary_company_bkup (company_name,company_address,company_website,category,sector,fcp_name,fcp_email,fcp_mobile,fcp_phone,fcp_fax,fcp_designation,company_about) values ('"+company_name+"','"+company_address+"','"+company_website+"','"+category+"','"+sector+"','"+fcp_name+"','"+fcp_email+"','"+fcp_mobile+"','"+fcp_phone+"','"+fcp_fax+"','"+fcp_designation+"','"+company_about+"');";
 
                                     db.updateSQL(main_record_bkup);
                                     db.close();     


                                        // Mail Sending Part
                                        String host = "naambor.iitg.ernet.in";
		                        String from = "noreply@iitg.ernet.in";
			                String to = "placement@iitg.ernet.in"; 
                                        Properties props = System.getProperties();             
                                        props.put("mail.smtp.host", host);
                                        Session session1 = Session.getDefaultInstance(props, null);
                                        
                                        /*MimeMessage message1 = new MimeMessage(session1);
		                        message1.setFrom(new InternetAddress(from));
			                message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			                message1.setSubject(" '"+company_name+"' registration is pending for your approval");
			                message1.setText("Dear Placement Cell,\n\t\tOne new company has registered with the name '"+company_name+"'.\n\t\tPlease complete the approval part.");
                                        Transport.send(message1); */
                                         

                                        response.sendRedirect("success.jsp");
                                }
                                else
                                {
                                        response.sendRedirect("error.jsp");
                                }
                        }
                        else
                        {
                                response.sendRedirect("error.jsp");
                        }
                }
        }

}
else
{
 %>
   <script type="text/javascript">
    alert("Wrong Verification Code");
    location.href="new_registration.jsp";
   </script>
 <% 
}

%>
    </body>
</html>
