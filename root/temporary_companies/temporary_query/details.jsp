<%@ page language="java" import="java.util.*,gcom.*" %>
<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page language="java" import="javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,java.util.Properties,javax.mail.*"%>

<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../../css/emx_nav_left.css" type="text/css">
<script type="text/javascript">
var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function change_data()
{
	var i;
	i=document.getElementById("content");
	var str="Now i've changed this whole feature!!!"
	str+= "<br>This may just be <BR> useful in AJAX.<br><br>Let us see!!";
	i.innerHTML=str;
	document.getElementById("infobar").innerHTML="<h3 id=\"infotitle\">Data Changed! </h3><br><br><br> <a href=\"javascript:clearinfo()\" id=\"infohide\">Hide</a><br>";
	document.getElementById("pagecell1").style.top='180px';
	var j=document.styleSheets[0];
	alert(document.getElementById("infobar").style.position);
	alert(document.getElementById("infobar").offsetHeight);
}
function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112px';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}
function validate_empty(ptr)
{	
 var message="";
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Agency\n" ;
	
  if (ptr.agency_email.value.length == 0 )
        message+="Please enter the Email. \n" ;
		
  if (ptr.agency_person.value.length == 0  )
        message+="Please enter the Person \n" ;
		
  if (ptr.agency_website.value.length == 0)
  		message+="Please enter the Website of Posting \n" ;
	
  if (message.length > 0)
  {
    alert(message);
    return false ;
  } 
  else
  {
	return true;
  } 

}

</script>
<script src="../../js/datetimepicker.js"></script>
<script type="text/javascript" src="../../js/tabber.js"></script>
<link rel="stylesheet" href="../../js/example.css" TYPE="text/css" MEDIA="screen">

<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../../utils/sql_convert_date.jsp"%>

<%@ include file="../../utils/session_validator.jsp"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>

<%@ include file="../../utils/get_unique_field.jsp"%>
<%@ include file="../../utils/encode_sql.jsp"%>
<%@ include file="../../utils/table.jsp"%>
<%@ include file="../../utils/drop_down_2.jsp"%>
<%@ include file="../../utils/drop_down2.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../../logout.jsp");	

        db.fetchConfigDetails(); //newly added
   
  try
  {
     
	String company_id=request.getParameter("company_id");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String add=request.getParameter("add");
	String remove=request.getParameter("remove");
	String company_name="";
	String company_address="";
	String company_website="";
	String company_about="";
	String category="";
	String sector="";
	String fcp_name="";
	String fcp_email="";
	String fcp_mobile="";
	String fcp_phone="";
	String fcp_fax="";
	String fcp_designation="";
	String random_password="";
	String message=null;
	int upd=0,aa=0;
	int del=1;
	int errno=0;
	if(add!=null&&username!=null&&password!=null)
	{
		
		if(!username.equals(""))
		{
			message="";
			db.connect();
			int i1=0;
			ResultSet rset1=db.execSQL("select count(*) from login where username='"+username+"';");
			rset1.next();
			i1=rset1.getInt(1);
			rset1.close();
			db.close();
			if(i1==0)
			{	
				db.connect();
				//upd=db.updateSQL("insert into login(username,password,role_id) values('"+username+"','"+password+"','1');");
                                aa= db.updateSQL("insert into login(username,password,role_id) values('"+username+"','"+password+"','1');"); 
				//upd+=db.updateSQL(" insert into agency (agency_name,agency_website,agency_address,company_about,agency_phone,agency_mobile,agency_fax, agency_profile, nature_business,agency_email,agency_person,category,sector,fcp_designation,username,password) select company_name,company_website,company_address,company_about,fcp_phone,fcp_mobile,fcp_fax,sector,category,fcp_email,fcp_name,category,sector,fcp_designation,'"+username+"','"+password+"' from temporary_company where company_id="+company_id+";");
                                   
                                if(aa>0) // i.e. if above query is executed successfully
                                {
                                  upd=db.updateSQL(" insert into agency (agency_name,agency_website,agency_address,company_about,agency_phone,agency_mobile,agency_fax, agency_profile, nature_business,agency_email,agency_person,category,sector,fcp_designation,username,password) select company_name,company_website,company_address,company_about,fcp_phone,fcp_mobile,fcp_fax,sector,category,fcp_email,fcp_name,category,sector,fcp_designation,'"+username+"','"+password+"' from temporary_company where company_id="+company_id+";");
                                 
                                  //System.out.println("upd:  "+upd);
                                 
                                }   

				db.close();
			}
			else
			{
				errno=1;
			}
		}
	}
	else if(remove!=null)
	{
		db.connect();
		del=db.updateSQL("delete from temporary_company where company_id="+company_id+";");
		db.close();
		response.sendRedirect("placement_query.jsp");
	}
	
	int i=0;
	for(i=0;i<11;i++)
	{
		int j=(int)(Math.random()*62);
		if(j>=0&&j<=9)
			random_password+=""+j;
		else if(j>=10&&j<=35)
		{
			switch(j-9)
			{
				case 1:
					random_password+="a";
					break;
				case 2:
					random_password+="b";
					break;
				case 3:
					random_password+="c";
					break;
				case 4:
					random_password+="d";
					break;
				case 5:
					random_password+="e";
					break;
				case 6:
					random_password+="f";
					break;
				case 7:
					random_password+="g";
					break;
				case 8:
					random_password+="h";
					break;
				case 9:
					random_password+="i";
					break;
				case 10:
					random_password+="j";
					break;
				case 11:
					random_password+="k";
					break;
				case 12:
					random_password+="l";
					break;
				case 13:
					random_password+="m";
					break;
				case 14:
					random_password+="n";
					break;
				case 15:
					random_password+="o";
					break;
				case 16:
					random_password+="p";
					break;
				case 17:
					random_password+="q";
					break;
				case 18:
					random_password+="r";
					break;
				case 19:
					random_password+="s";
					break;
				case 20:
					random_password+="t";
					break;
				case 21:
					random_password+="u";
					break;
				case 22:
					random_password+="v";
					break;
				case 23:
					random_password+="w";
					break;
				case 24:
					random_password+="x";
					break;
				case 25:
					random_password+="y";
					break;
				case 26:
					random_password+="z";
					break;
			}
		}
		else if(j>=36&&j<=62)
		{
			switch(j-35)
			{
				case 1:
					random_password+="A";
					break;
				case 2:
					random_password+="B";
					break;
				case 3:
					random_password+="C";
					break;
				case 4:
					random_password+="D";
					break;
				case 5:
					random_password+="E";
					break;
				case 6:
					random_password+="F";
					break;
				case 7:
					random_password+="G";
					break;
				case 8:
					random_password+="H";
					break;
				case 9:
					random_password+="I";
					break;
				case 10:
					random_password+="J";
					break;
				case 11:
					random_password+="K";
					break;
				case 12:
					random_password+="L";
					break;
				case 13:
					random_password+="M";
					break;
				case 14:
					random_password+="N";
					break;
				case 15:
					random_password+="O";
					break;
				case 16:
					random_password+="P";
					break;
				case 17:
					random_password+="Q";
					break;
				case 18:
					random_password+="R";
					break;
				case 19:
					random_password+="S";
					break;
				case 20:
					random_password+="T";
					break;
				case 21:
					random_password+="U";
					break;
				case 22:
					random_password+="V";
					break;
				case 23:
					random_password+="W";
					break;
				case 24:
					random_password+="X";
					break;
				case 25:
					random_password+="Y";
					break;
				case 26:
					random_password+="Z";
					break;
			}
		}
	}
%>
<body background="form/New/jee3.jpg">

<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="../pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="masthead"> 
 <h1 id="siteName">Training &amp; Placement Cell - IIT Guwahati.</h1> 
  <div id="utility"> 
    <a href="http://www.iitg.ernet.in/">IITG Home</a> | <a href="http://www.iitg.ernet.in/placement/">Placement Cell</a> | <a href="https://webmail.iitg.ernet.in/src/login.php">Webmail</a> 
  </div> 
  <div id="globalNav"> 
    <img alt="" src="../images/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="../images/glbnav_right.gif" height="32" width="4" id="gnr">
    <!--end globalLinks--> 
    <form id="search" action=""> 
      <input name="searchFor" type="text" size="10"> 
      <a href="">search</a> 
    </form>
    <div id="globalLink"> <a href="../main.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></div>
  </div> 
  <!-- end globalNav --> 
  
</div>

<div id="pagecell1">
  <!--pagecell1-->
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr">
  <div id="pageName">
    <h2>Welcome</h2>
    <img alt="small logo" src="../../images/logo-top.gif" height="45" width="55"/></div>
  <div id="pageNav">
    <div id="sectionLinks">
            <a href="../../placement_record/main.jsp" >Placement Record</a>
      <a href="../../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../main.jsp"> Temporary Organization's</a>
      <a href="../../student/main.jsp" >Student </a>
      <a href="../../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
     <a href="../../../logout.jsp">LOGOUT</a></div>
  </div>
  <div id="content">
    <div class="feature">
      <%	
		String sql_get_data="select * from temporary_company where company_id="+company_id+";" ;
		db.connect(); 
		ResultSet rs= db.execSQL(sql_get_data);
		if(rs.next()) 
		{
				
	company_name=rs.getString("company_name");
	company_address=rs.getString("company_address");
	company_website=rs.getString("company_website");
	company_about=rs.getString("company_about");
	category=rs.getString("category");
	sector=rs.getString("sector");
	fcp_name=rs.getString("fcp_name");
	fcp_email=rs.getString("fcp_email");
	fcp_mobile=rs.getString("fcp_mobile");
	fcp_phone=rs.getString("fcp_phone");
	fcp_fax=rs.getString("fcp_fax");
	fcp_designation=rs.getString("fcp_designation");
								
		}
		rs.close();
		db.close();
		
	if(upd!=0)
	{
		message="";
		message+="To:"+fcp_email+"\n\n";
		message+="Dear "+fcp_name+",\nYour online registration has been approved. You can now login with the following login details.\n\n";
		message+="\tUsername:"+username+"\n\tPassword:"+password+"\n\n";
		message+="Kindly contact Placement Cell @ 0361-2582175 for any further details.\n\n";
		message+="Thanks & Regards\n";
		message+="Placement Cell\n";
		message+="IIT Guwahati\n";

		db.connect();	                 	
		int ijk=db.updateSQL("delete from temporary_company where company_id="+company_id+";");
		db.close();

                //System.out.println("fcp_email:  "+fcp_email);
                
                // Mail part to be incorporated here
                String host = "naambor.iitg.ernet.in";
                String from = "noreply@iitg.ernet.in";
                String to = fcp_email;
                // Get system properties
                Properties props = System.getProperties();
                // Setup mail server
                props.put("mail.smtp.host", host);
                // Get session
                Session session1 = Session.getDefaultInstance(props, null);
                // Define message



		//MIME CLOSED HERE


                MimeMessage message1 = new MimeMessage(session1);
                message1.setFrom(new InternetAddress(from));
                message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                message1.setSubject("Login Information");
                //message1.setText("Dear "+fcp_name+",\nYour online registration has been approved. You can now login with the following login details:\n\n\tUsername:"+username+"\n\tPassword:"+password+"\n\nKindly contact Placement Cell @ 0361-2582175 for any further details.\n\nThanks & Regards\nPlacement Cell\nIIT Guwahati\n");                
                message1.setText("Dear "+fcp_name+",\nYour online registration has been approved. You can now login with the following login details:\n\n\tUsername:"+username+"\n\tPassword:"+password+"\n\nPlease visit the link https://auto.iitg.ernet.in/tnp and log on to company login with the above credentials.\n For recovering your password, in case of if you forget your password kindly login and answer a security question at login->change Password->Set your security Question to recover your password here.\n  Then follow the given instructions to complete your job profile and salary details.\n\nKindly contact Placement Cell @ 0361-2582175 for any further details.\n\nThanks & Regards\nPlacement Cell\nIIT Guwahati\n");                
                // Send message
               Transport.send(message1); 
                
	}
	%>
    <%
		if(upd!=0)
		{     
		out.println("<!--");
		}
		
		%> 
        
        <table width="80%" align="center">
          <tr>
            <td bgcolor="#FFFFFF">
                <h2><strong>Temporary Organization Details</strong></h2>
                <h2><% if(errno==1) out.println("The selected username already exixts. Please select another.");%><h2>
                <center>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <table width="600" border="0" align="center">
                    <tr>
                      <td width="179">Name of the Organization</td>
                      <td width="411"><label for="company_name"><%=company_name%></label></td>
                    </tr>
                    <tr>
                      <td>Postal Address</td>
                      <td><label for="company_address"><%=company_address%></label></td>
                    </tr>
                    <tr>
                      <td>Website</td>
                      <td><label for="company_website2"><%=company_website%></label></td>
                    </tr>
                    <tr>
                      <td>About Company</td>
                      <td><label for="company_website"><%=company_about%></label></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <table width="787" border="1" align="center">
                    <tr>
                      <td width="377"><strong>Category </strong></td>
                      <td width="394"><strong>Sector </strong></td>
                    </tr>
                    <tr>
                      <td><p><%=category%></p></td>
                      <td><p><%=sector%></p></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <table width="810" border="0" align="center">
                    <tr>
                      <td><table width="302" border="0" align="center">
                        <tr>
                          <td><strong>Contact Details:</strong></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><table width="302" border=".5" align="center">
                        <tr>
                          <td width="72">&nbsp;</td>
                          <td width="220"><strong>First Contact Person</strong></td>
                        </tr>
                        <tr>
                          <td><strong>Name:</strong></td>
                          <td><label for="fcp_name"><%=fcp_name%></label></td>
                        </tr>
                        <tr>
                          <td><strong>Designation:</strong></td>
                          <td><label for="fcp_email2"><%=fcp_designation%></label></td>
                        </tr>
                        <tr>
                          <td><strong>E-mail:</strong></td>
                          <td><label for="fcp_email"><%=fcp_email%></label></td>
                        </tr>
                        <tr>
                          <td><strong>Mobile:</strong></td>
                          <td><label for="fcp_mobile"><%=fcp_mobile%></label></td>
                        </tr>
                        <tr>
                          <td><strong>Phone:</strong></td>
                          <td><label for="fcp_phone"><%=fcp_phone%></label></td>
                        </tr>
                        <tr>
                          <td><strong>Fax:</strong></td>
                          <td><label for="fcp_fax"><%=fcp_fax%></label></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
                  <p>&nbsp;</p>
                  <form name="form1" method="post" action="details.jsp?company_id=<%=company_id%>">
                    <table width="500" border="0" align="center">
                      <tr>
                        <td><strong>Username:</strong></td>
                        <td><label for="username"></label>
                          <input type="text" name="username" id="username"></td>
                      </tr>
                      <tr>
                        <td width="167"><strong>Password:</strong></td>
                        <td width="323"><label for="password"></label>
                          <input type="text" name="password" id="password" value="<%=random_password%>">
                          <label for="password"></label></td>
                      </tr>
                    </table>
                    <table width="600" border="0">
                      <tr>
                        <td width="295"><input type="submit" name="add" id="add" value="Add Organization"></td>
                        <td width="295" align="right"><input type="submit" name="remove" id="remove" value="Remove Organization"></td>
                      </tr>
                    </table>
                    <p></p>
                  </form>
          <%

			if(upd!=0)
			{
			  	out.println("-->");
			}
			if(upd==0)
				out.println("<!--");
		%>
        
                
                <table align="center">
                <tr><td>
                <textarea cols="80" rows="30"><%=message%></textarea>
                </td></tr>
                </table>
<%
	if(upd==0)
		out.println("-->");

    }
    catch(SQLException sq)
    {
      out.println(sq.getMessage());
      sq.printStackTrace();
    }
    catch(Exception ex)
    {
      out.println(ex.getMessage());
      ex.printStackTrace();
    }

%>
                </center>
              </td>
    </table>
        <p>&nbsp;</p>
<p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
     
      <p align="center">&nbsp;</p>
    </div>
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name </div>
</div>
</body>

</html>

