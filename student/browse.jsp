<%@page language="java" import="java.util.*,gcom.*" %>
<jsp:useBean id="conbean" class="gcom.SessionManager" scope="session" />
<jsp:setProperty name="conbean" property="userid" value="HARSHA" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="SHORTCUT ICON" href="../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="css/emx_nav_left.css" type="text/css">
<script type="text/javascript">
<!--
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
// -->


</script>
</head>
<%@page language="java" import="pack.DbBean"%>
<jsp:useBean id="db" class="pack.DbBean" scope="session"/>
<%@ include file="sessionvalidate.jsp"%>



<%@page language="java" import="java.sql.*"%>
<%@ include file="utils/encode_sql.jsp"%>
<%@ include file="utils/get_unique_field.jsp"%>
<%@ include file="utils/sql_convert_date.jsp"%>


<%@ page import="java.util.*" %>

<%
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
<%
	
	String display1="<div align='center' class='result'><b>" ;
	String display2="</b><br></div>" ;
        
	

		



	
	        out.println(display1+"Details of the Company literature is as follows:"+display2);   
			out.println(display1+""+display2); 

       		out.println("<div align='center'><table border='0' align='center' cellpadding='5' cellspacing='5' name='table_query_placement_details'"+
			"id='table_query_placement_details' class='imagetable' cellpadding='5'>");
                     
			out.println("<tr>");
			out.println("<th>Sl.No.</th>");
                        out.println("<th>Company Name</th>");
			out.println("<th>Profile Name</th>");
			out.println("<th>File Name</th>");
                        out.println("</tr>");
	 

         db.connect();
   ResultSet rs=db.execSQL("select cl.file_name,pd.package_name,a.agency_name from company_literature as cl,package_details as pd, agency as a where cl.agency_id=pd.agency_id and cl.agency_id=a.agency_id and cl.package_id=pd.package_id order by cl.agency_id;");
   int i=1;
   while(rs.next())
   {
      //int agency_id=rs.getInt(1);
      String filename=rs.getString(1);
      String profile_name=rs.getString(2);
      String agency_name=rs.getString(3);
     out.println("<tr><td> " + i + "</td><td>"+agency_name+"</td><td>"+profile_name+"</td><td><a href='#' onClick='return getOrgLitFile(\"" + filename + "\");'>Click to download </a></td></tr>");
      i++;
  }  
     rs.close();
     db.close();
  
    out.println("</table></div>");   
%>

</body>
</html>
