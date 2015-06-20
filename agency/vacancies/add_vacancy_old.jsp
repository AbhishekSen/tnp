<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<link rel='stylesheet' href='../../stylesheet/style.css'>
<link rel="stylesheet" href="../../stylesheet/styles.css" type="text/css" media="screen" /> 
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
<script type="text/javascript">
		jQuery(function(){
		  jQuery('#HorizontalSlidingMenu .SlidingMenu').slidingMenu();
		  jQuery('#VerticalSlidingMenu .SlidingMenu').slidingMenu({ initialOpacity: 0.5 });
		  
		  jQuery('#slideUp').show();
		  jQuery('#slideUp').slideUp("slow");	
		});
		
	</script>

<script type="text/javascript">


function load_events()
{
	document.getElementById("btech_table").style.display="none";
	document.getElementById("mtech_table").style.display="none";
	document.getElementById("msc_table").style.display="none";
	document.getElementById("phd_table").style.display="none";
	document.getElementById("ma_table").style.display="none";
}

function activate_btech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("btech_table").style.display="block";	
	}
	else
	{
		document.getElementById("btech_table").style.display="none";
	}
}

function activate_mtech(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("mtech_table").style.display="block";	
	}
	else
	{
		document.getElementById("mtech_table").style.display="none";
	}
}

function activate_msc(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("msc_table").style.display="block";	
	}
	else
	{
		document.getElementById("msc_table").style.display="none";
	}
}

function activate_phd(check_box)
{
	if(check_box.checked==true)
	{
		document.getElementById("phd_table").style.display="block";	
	}
	else
	{
		document.getElementById("phd_table").style.display="none";
	}
}


function is_float(str)
{
	//alert("in float");
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
	if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(new_key==".")
		{
			j++;
		}
		else if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
		if(j>1)
		{
			return false;
		}
	}
	return true;
}

function is_int(str)
{
	var check = true;
	var value = str; //get characters
	//check that all characters are digits, ., -, or ""
	var j=0;
		if(value.length==0)
		return false;
	for(var i=0;i < value.length; ++i)
	{
		var new_key = value.charAt(i); //cycle through characters
		if(((new_key < "0") || (new_key > "9")) &&  !(new_key == ""))
		{
			return false;
		}
	}
	return true;
}

function alpha(e)
{
        var k;

        if(e.keyCode ==0)
        {
           k = e.which;
        }
        else
        {
           k = e.keyCode;
        }
       
        //ENABLING LEFT,RIGHT,UPPER,DOWN ARROW//
       if(k > 36 && k< 41  && e.charCode==0) 
       {
        return true;
       }
       return ((k > 63 && k < 91) || (k > 96 && k < 123) || (k > 43 && k < 58) || (k >39 && k<42) || k==13 || k == 8 || k == 9 || k == 32 || k==95 || k==46);

        /*
         if(k==34 || k==92)
           alert("Please do not use single or double quotes or forward slash.");
         return ((k > 63 && k < 92) || (k > 96 && k < 127) || (k > 41 && k <64) || (k >39 && k<42) ||(k >34 && k<40) || k==10 ||  k==13 || k == 8 || k == 9 || k == 27 || k == 32 || k == 33 || k==95 || k==46 );
        */
}

function isvalid(str)
{
  
  var i=0;
  for(i=0;i<str.length;i++)
  {
    var k=str.charAt(i);
   
    if(k=='\\' || k=='\'' || k=='\"' ||  k=='`')
    {
      return false;
    }
    
  }
  return true;
}

function alltrim(str)
{
	return str.replace(/^\s+|\s+$/g, '');
}

function findall()
{
	var i=0;
    for(i = 0; i < document.form2.elements.length; i++)
    {
        document.form2.elements[i].value=alltrim(document.form2.elements[i].value);
    }
}

function validate_empty(ptr)
{	
          findall();
        var message="";

        if(document.form2.job_description.value=="")
                message+="Please enter job description\n";
        else{
        if(!isvalid(document.form2.job_description.value))
        {
            message+="Please remove slashes and quotes from Job description field\n";
                    
        }
        }
        if(document.form2.job_designation.value=="")
                message+="Please enter job designation\n";
        else{
        if(!isvalid(document.form2.job_designation.value))
        {
            message+="Please remove slashes and quotes from Job designation field\n";
                    
        }
        }
        if(document.form2.location_of_posting.value=="")
                message+="Please enter location of posting\n";
        else{
        if(!isvalid(document.form2.location_of_posting.value))
        {
            message+="Please remove slashes and quotes from Place of posting field\n";
                    
        }
        }
        if(document.form2.shortlist[0].checked==true)
        {
                if(!is_float(document.form2.cpi.value))
                        message+="Please enter valid cpi\n";
              if(document.form2.cpi.value > 10)
                        message+="Please enter valid CPI\n";
        }
        if(!is_float(document.form2.x_percentage.value))
                message+="Please enter valid X-Percentage\n";
        if(document.form2.x_percentage.value>100)
                message+="Please enter valid X-Percentage\n";
        if(!is_float(document.form2.xii_percentage.value))
                message+="Please enter valid XII-Percentage\n";
        if(document.form2.xii_percentage.value>100)
                message+="Please enter valid XII-Percentage\n";


        if(!isvalid(document.form2.cpi_other.value))
                message+="Please remove slashes and quotes from Other requirements field\n";

        if(!is_int(document.form2.vacancy1.value))
        {
                message+="Please enter valid vacancy\n";
        }
        else
        {
           if(parseInt(document.getElementById("vacancy1").value) > 500)
           {
                message+="Invalid Entry in the vacancy field..Please contact placement cell\n";
           }
        }

        if(!is_float(document.form2.ctc1.value))
                message+="Please enter valid ctc for B.Tech\n";
       if(!is_float(document.form2.ctc_mtech.value))
                message+="Please enter valid ctc for M.Tech\n";
       if(!is_float(document.form2.ctc_msc.value))
                message+="Please enter valid ctc for M.Sc\n";
       if(!is_float(document.form2.ctc_phd.value))
                message+="Please enter valid ctc for Ph.D\n";
        if(!is_float(document.form2.gross.value))
                message+="Please enter valid gross for B.Tech\n";
        if(!is_float(document.form2.gross_mtech.value))
                message+="Please enter valid gross for M.Tech\n";
        if(!is_float(document.form2.gross_msc.value))
                message+="Please enter valid gross for M.Sc\n";
        if(!is_float(document.form2.gross_phd.value))
                message+="Please enter valid gross for Ph.D\n";

        if(document.form2.take_home_during.value!="")
        {
          if(!is_float(document.form2.take_home_during.value))
                message+="Please enter valid data in Take home during training field\n";
        }
        if(document.form2.take_home_after.value!="")
        {
          if(!is_float(document.form2.take_home_after.value))
                message+="Please enter valid data in Take home after training field\n";
        }

        if(document.form2.bonus.value!="")
        {
          if(!isvalid(document.form2.bonus.value))
                message+="Please remove slashes and quotes from Bonus field\n";
        }

        if(document.form2.bond1[0].checked==true)
        {

                if(document.form2.bond_details.value=="")
                        message+="Please enter bond details\n";
                else{
                    if(!isvalid(document.form2.bond_details.value))
                     {
                        message+="Please remove slashes and quotes from Bond Details field\n";
                     }
                }
        }
        else{
            if(document.form2.bond_details.value!="")
            message+="Please check Yes if you want to enter Bond details\n"

        }
        if(document.form2.package_name1.value=="")
                message+="Please enter job profile name\n";
        else{
                    if(!isvalid(document.form2.package_name1.value))
                     {
                        message+="Please remove slashes and quotes from Profile name field\n";
                     }
        }
     
        var bval=document.getElementById("btech").checked;
        var bdval=document.getElementById("btech_chkbox_4").checked;
        var mval=document.getElementById("mtech").checked;
        var mdval=document.getElementById("mtech_chkbox_14").checked;
        var mscval=document.getElementById("msc").checked;
        var maval=document.getElementById("ma").checked;
        var phdval=document.getElementById("phd").checked;
         
        if(bval==false && bdval==false  && mval==false &&  mdval==false && mscval==false && maval==false && phdval==false)
        {
           message+="Please select atleast one programme \n";
        }
        else
        {
         if(bval==true)
        {
          if(!(document.getElementById("btech_chkbox_0").checked || document.getElementById("btech_chkbox_1").checked || document.getElementById("btech_chkbox_2").checked || document.getElementById("btech_chkbox_3").checked || document.getElementById("btech_chkbox_5").checked || document.getElementById("btech_chkbox_6").checked || document.getElementById("btech_chkbox_7").checked || document.getElementById("btech_chkbox_8").checked || document.getElementById("btech_chkbox_9").checked || document.getElementById("btech_chkbox_10").checked ))
          {
            message+="Please select atleast one programme from BTech or uncheck Btech checkbox\n";
          }              
        } 
        if(mval==true)
        {
          if(!(document.getElementById("mtech_chkbox_0").checked || document.getElementById("mtech_chkbox_1").checked || document.getElementById("mtech_chkbox_2").checked || document.getElementById("mtech_chkbox_3").checked ||document.getElementById("mtech_chkbox_4").checked || document.getElementById("mtech_chkbox_5").checked || document.getElementById("mtech_chkbox_6").checked || document.getElementById("mtech_chkbox_7").checked || document.getElementById("mtech_chkbox_8").checked || document.getElementById("mtech_chkbox_9").checked || document.getElementById("mtech_chkbox_10").checked || document.getElementById("mtech_chkbox_11").checked || document.getElementById("mtech_chkbox_12").checked || document.getElementById("mtech_chkbox_13").checked ||document.getElementById("mtech_chkbox_15").checked || document.getElementById("mtech_chkbox_16").checked || document.getElementById("mtech_chkbox_17").checked))
          {
            message+="Please select atleast one programme from MTech or uncheck Mtech checkbox\n";
          }              
          
        }       
        if(mscval==true)
        {
          if(!(document.getElementById("msc_chkbox_0").checked || document.getElementById("msc_chkbox_1").checked || document.getElementById("msc_chkbox_2").checked ))
          {
            message+="Please select atleast one programme from MSc or uncheck MSc checkbox\n";    
          }          

        }
        if(phdval==true)   
        {
          if(!(document.getElementById("phd_chkbox_0").checked || document.getElementById("phd_chkbox_1").checked || document.getElementById("phd_chkbox_2").checked || document.getElementById("phd_chkbox_3").checked ||document.getElementById("phd_chkbox_4").checked || document.getElementById("phd_chkbox_5").checked || document.getElementById("phd_chkbox_6").checked || document.getElementById("phd_chkbox_7").checked || document.getElementById("phd_chkbox_8").checked || document.getElementById("phd_chkbox_9").checked || document.getElementById("phd_chkbox_10").checked || document.getElementById("phd_chkbox_11").checked || document.getElementById("phd_chkbox_12").checked || document.getElementById("phd_chkbox_13").checked ))
          {
            message+="Please select atleast one programme from PHD or uncheck PHD checkbox\n";    
          }         
 
        }
     }
        if (message!="")
        {
                alert(message);
                document.form2.action=null;
                return false ;
        }
        else
        {
                document.form2.action="add_vacancy.jsp";
                return true;
        }

}

function enabletxt()
{
  if(document.getElementById("shortlist").checked==true)
  {
    document.getElementById("bond_duration4").value="0";
    document.getElementById("bond_duration4").disabled=false;
  }
  else
  {
    document.getElementById("bond_duration4").value="";
    document.getElementById("bond_duration4").disabled=true;
  }
}

function enabletxt1()
{
  if(document.getElementById("bond1").checked==true)
  {
    document.getElementById("bond_details").value="";
    document.getElementById("bond_details").disabled=false;
  }
  else
  {
    document.getElementById("bond_details").value="";
    document.getElementById("bond_details").disabled=true;
  }
}


</script>

<script src="../js/datetimepicker.js"></script>
<script type="text/javascript" src="../js/tabber.js"></script>
<link rel="stylesheet" href="../js/example.css" TYPE="text/css" MEDIA="screen">


</script><script src="../js/datetimepicker.js"></script>
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>

<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

<%
                db.fetchConfigDetails(); //newly added
		String username="";
		String sql_username="select username from session where session_id = '"+sid+"';" ;
		db.connect();
		ResultSet rus= db.execSQL(sql_username);
		if(rus.next()) 
		{
		username = rus.getString(1);
		}
		
		rus.close();
		db.close();
	
%>

<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page language="java" import="javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,java.util.Properties,javax.mail.*"%>
<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>


</head>

<body onload = "load_events();">
<div id = "container">
            <div id = "header">
              <div>
              <div id="globalLink" style = "float:left;width:40%;"> 
                   <br/> <span id="spancompany"><u>Welcome <%=username%></u></span>
                </div>
                <div id = "menu">
                    <div id="HorizontalSlidingMenu">
                      <ul class="SlidingMenu Horizontal">
                        <li><a href="../instructions.jsp" id="gl1" class="glink" onMouseOver="ehandler(event,menuitem1);">Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/">IITG Home</a></li>
                        <li><a href="http://www.iitg.ernet.in/placement/">Placement Cell</a></li>
                      </ul>
                      <div class="ClearFix"></div>
                    </div>
                </div>
              </div>
              <div  id = "headerTop">
                <div id ="title">
                  <span id = "spanTitleFirst">
                    Training & Placement Cell - 
                  </span>
                  <span id = "spanTitleSecond">
                    IIT Guwahati
                  </span>
                </div>

              </div>
              <hr style = "float:left;width:100%;">
              </div>
              <div id = "body">
                <div id = "divMain">
                 <div class = "mainMenu">
					<div id="VerticalSlidingMenu">
						<ul class="SlidingMenu">
						  <li><a href='../instructions.jsp'>Instructions</a></li>
						  <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
						  <li><a href="add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
						  <li><a href="../student_eligibility/eligibility.jsp">Eligible Students</a></li>
						  <li><a href="../student_details/student_details.jsp">Students Details Query</a></li>
						  <li><a href="../cv_query/cv_query.jsp">CV Query</a></li>
						  <li><a href="../calendar/view.jsp">Organization Schedule</a></li>
						  <li><a href="../uploads/upload.jsp">Upload Organization Literature</a></li>
						  <li><a href="../change_password/change_password.jsp">Change Password</a></li>
						  <li><a href="../../logout.jsp">Logout</a></li>
						 
						</ul>
					  </div>
                 </div>
                 <div class = "mainContainer" id="mainContainer">
          					<div id = "slideUp" style = "display:none;color:white;">
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          						slide up<br/>
          					</div> 
        <div id = "center" class = "center">
		<div class="feature">
<%

	db.connect();
	int gency_id=0;
	ResultSet rset=db.execSQL("select agency_id from agency where username='"+username+"';");
	if(rset.next())
	{
		gency_id=rset.getInt(1);
	}
	rset.close();
	int ccounApr=0;
	int ccounTmp=0;
	int which=0;
	//Fetching approved profiles
	ResultSet rset1=db.execSQL("select count(*) from package_details where agency_id="+gency_id+";");
	if(rset1.next())
		ccounApr=rset1.getInt(1);
	rset1.close();

        // Fetching Temporary Profiles
	ResultSet rset3=db.execSQL("select count(*) from package_details_temp where agency_id="+gency_id+";");
	if(rset3.next())
		ccounTmp=rset3.getInt(1);
	rset3.close();
        
        //Fetching approved profiles
                	                out.println("<center>");
        out.println("<p><b>List of Approved profiles:</b></p><br>");
        out.println("<table border=1>");
	ResultSet rset2=db.execSQL("select package_id,package_name from package_details where agency_id="+gency_id+";");

	while(rset2.next())
	{
	                out.println("<tr>");
	                out.println("<td>");
	               	out.println("<a href='../edit_details/vacancy_appr.jsp?id=" +rset2.getInt(1)+ "'>" +rset2.getString(2)+ "</a>");
			out.println("</td>");
			out.println("</td>");
	                out.println("</tr>");
        }
	rset2.close();
        out.println("</table><br>");
        //Fetching temporary profiles
        out.println("<p><b>List of Temporary/Unapproved profiles:</b></p><br>");
        out.println("<table border=1>");
        rset2=db.execSQL("select package_id,package_name from package_details_temp where agency_id="+gency_id+";");
	while(rset2.next())
	{
	                out.println("<tr>");
	                out.println("<td>");
	               	out.println("<a href='../edit_details/vacancy_temp.jsp?id=" +rset2.getInt(1)+ "'>" +rset2.getString(2)+ "</a>");
			out.println("</td>");
	                out.println("</tr>");
        }
	rset2.close();
        out.println("</table><br>");
        out.println("<br><hr>");
        out.println("<br><a href='addJobProfile.jsp?id="+gency_id+"'>Add new Job Profile</a>");
        	                out.println("</center>");
        
%>
        </div>
	</div>
	        </div>
              <div id = "footer">
              <span>&#169; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
              </div>
        </div>
      </div>

</body>
</html>
