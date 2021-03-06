<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="javax.mail.internet.MimeMessage,javax.mail.internet.InternetAddress,java.util.Properties,javax.mail.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<title>Training and Placement Cell</title>
<script type="text/javascript">

function load_events()
{
	if(document.getElementById("btech").checked!=true)
	document.getElementById("btech_table").style.display="none";
	if(document.getElementById("mtech").checked!=true)
	document.getElementById("mtech_table").style.display="none";
	if(document.getElementById("msc").checked!=true)
	document.getElementById("msc_table").style.display="none";
	if(document.getElementById("phd").checked!=true)
	document.getElementById("phd_table").style.display="none";
	//document.getElementById("ma_table").style.display="none";
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
         if(k==34 || k==39 ||k==92)
           alert("Please do not use single or double quotes or forward slash.");
         return ((k > 63 && k < 95) || (k > 96 && k < 127) || (k > 41 && k <64) || (k >39 && k<42) ||(k >34 && k<39) || k==13 || k == 8 || k == 9 || k == 32 || k == 33 || k==95 || k==46);
        */
}

function isvalid(str)
{
  
  var i=0;
  for(i=0;i<str.length;i++)
  {
    var k=str.charAt(i);
   
    if(k=='\\' || k=='\'' || k=='\"' || k=='`')
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

function validate_empty()
{	
	var message="";
	//alert("hi");
	
        findall();
       
        if(document.form2.job_description.value=="")
	  {
		//alert("check");
                message+="Please enter job description\n";
		//return false;
	  }	
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
              if(document.form2.cpi.value>10)
		      {
                        message+="Please enter valid cpi\n";
		      }
        }

	if(!is_int(document.form2.x_percentage.value))
                message+="Please enter valid X-Percentage\n";
        if(document.form2.x_percentage.value>100)
                message+="Please enter valid X-Percentage\n";
        if(!is_int(document.form2.xii_percentage.value))
                message+="Please enter valid XII-Percentage\n";
        if(document.form2.xii_percentage.value>100)
                message+="Please enter valid XII-Percentage\n";
	if(!isvalid(document.form2.cpi_other.value))
                message+="Please remove slashes and quotes from Other requirements field\n";


	if(document.form2.package_name1.value=="")
                message+="Please enter job profile  package name\n";
        else{
                    if(!isvalid(document.form2.package_name1.value))
                     {
                        message+="Please remove slashes and quotes from Profile package name field\n";
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
                return false ;
        }
        else
        {
                return true;
        }


}
</script>

</head>


<body onLoad="load_events()">
<%@page language="java" import="pack.DbBean"%> 



<jsp:useBean id="db" class="pack.DbBean" scope="session" />



<%@ include file="../utils/session_validator.jsp"%>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>

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
<!-- end masthead --> 
<div id="pagecell1"> 
  <!--pagecell1--> 
  <img alt="" src="../images/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="../images/tr_curve_white.gif" height="6" width="6" id="tr"> 
  <div id="pageName"> 
    <h2>Welcome</h2>
    <img alt="small logo" src="../images/logo-top.gif" height="57" width="67"/></div> 
  <div id="pageNav"> 
    <div id="sectionLinks"> 
      <a href="../placement_record/main.jsp" >Placement Record</a>
      <a href="../permanent_companies/main.jsp" >Permanent Organization's</a>	  
	  <a href="../temporary_companies/main.jsp"> Temporary Organization's</a>
      <a href="../student/main.jsp" >Student </a>
      <a href="../change_final_date/change_date.jsp">Change Date Requests</a>
      <a href="../agency/placement_query1.jsp" >Organization Query by Deptt/Prog</a>
      <a href="../average_package/average_package.jsp" >Average Package Query</a>
      <a href="../placement_schedule/main.jsp" >Placement Schedule</a>
      <a href="../upload/upload.jsp" >Upload Organization PPT's</a>
      <a href="../company_literature/browse.jsp" >Download Organization Literature</a>
      <a href="../../logout.jsp">LOGOUT</a>
      <img src="../images/bot.gif" alt="" width="177" height="298" />
    </div>
  </div>
 </td>
 <%
        db.fetchConfigDetails(); //newly added
	int department_id1=0;
	int programme_id1=0;
	String agency_id=null;
	
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String pack_id=request.getParameter("id");
	String submit=request.getParameter("submit");
	String agency_name=request.getParameter("agency_name");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	String bond=request.getParameter("bond1");
	
	String bond_duration=request.getParameter("bond_duration");
	if(bond_duration==null)
		bond_duration="0";
	String package_name=request.getParameter("package_name1");
 	String vacancy=request.getParameter("vacancy1");      
	//String programme_name1=request.getParameter("programme_name1");
	//String department_name1=request.getParameter("department_name1");
	String btech=request.getParameter("btech");
	String mtech=request.getParameter("mtech");
	String msc=request.getParameter("msc");
	String ma=request.getParameter("ma");
	String bdes=request.getParameter("bdes");
	String mdes=request.getParameter("mdes");
	String phd=request.getParameter("phd");
	String ctc=request.getParameter("ctc1");
	String ctc_mtech=request.getParameter("ctc_mtech");
        String ctc_msc=request.getParameter("ctc_msc");
        String ctc_phd=request.getParameter("ctc_phd");
	String shortlist=request.getParameter("shortlist");
	String cpi=request.getParameter("cpi");
	String cpi_other=request.getParameter("cpi_other");
	String bond_details=request.getParameter("bond_details");
	String duplicate=null ;
    String x_percentage=request.getParameter("x_percentage");
    String xii_percentage=request.getParameter("xii_percentage");
	String[] btech_group=request.getParameterValues("btech_chkbox");
	String[] mtech_group=request.getParameterValues("mtech_chkbox");
	String[] msc_group=request.getParameterValues("msc_chkbox");
	String[] phd_group=request.getParameterValues("phd_chkbox");
	int[] deps=new int[51];
	int[] progs=new int[8];
	int ag_id=0;
	if(pack_id==null)
	{response.sendRedirect("edit_vac.jsp");}
	else if(pack_id!=null&&submit==null)
	{
		db.connect();
		ResultSet rs=db.execSQL("select * from package_details where package_id="+pack_id+";");
		if(rs.next()&&rs!=null)
		{
			job_description=rs.getString("job_description");
			job_designation=rs.getString("job_designation");
			location_of_posting=rs.getString("location_of_posting");
			accomodation=""+rs.getInt("accomodation");
			bond=""+rs.getInt("bond");
			package_name=rs.getString("package_name");
			ctc=""+rs.getFloat("ctc");
			ctc_mtech=rs.getString("ctc_mtech");
                        ctc_msc=rs.getString("ctc_msc");
                        ctc_phd=rs.getString("ctc_phd");
			vacancy=""+rs.getInt("vacancy");
			bond_duration=rs.getString("bond_duration");
			pack_id=""+rs.getInt("package_id");
			agency_id=""+rs.getInt("agency_id");
            x_percentage=rs.getString("x_percentage");
            xii_percentage=rs.getString("xii_percentage");
            cpi=rs.getString("cpi");
            cpi_other=rs.getString("cpi_other");
            bond_details=rs.getString("bond_details");
            shortlist=rs.getString("shortlist");
			//out.println("bond3="+bond);
		}
		rs.close();
                ResultSet rset22=db.execSQL("select * from package_extra_details where package_id="+pack_id+";");
                while(rset22.next())
                {
                        deps[rset22.getInt("program_index")]=1;
                        ResultSet rset23=db.execSQL("select programme_id from prog_record where prog_id="+rset22.getInt("program_index")+";");
                        if(rset23.next())
                                progs[rset23.getInt(1)]=1;
                        rset23.close();
                }
                rset22.close();
		db.close();
	}
	else if(pack_id!=null&&submit!=null)
	{
		if(!(ma!=null||(msc!=null&&msc_group!=null)||bdes!=null||mdes!=null||(mtech!=null&&mtech_group!=null)||(btech!=null&&btech_group!=null)||(phd!=null&&phd_group!=null)))
		{response.sendRedirect("error3.jsp");}
		else
			{			
	
				String main_record1=" update package_details set package_name='"+package_name+"', vacancy='"+vacancy+"',job_description='"+job_description+"',job_designation='"+job_designation+"',location_of_posting='"+location_of_posting+"',accomodation='"+accomodation+"',bond='"+bond+"',bond_duration='"+bond_duration+"',ctc='"+ctc+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"',cpi='"+cpi+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',bond_details='"+bond_details+"',cpi_other='"+cpi_other+"',shortlist='"+shortlist+"' where package_id='"+pack_id+"';";			
				db.connect();
				int ij=db.updateSQL("delete from package_extra_details where package_id="+pack_id+";");
				ij*=db.updateSQL(main_record1);
	
				ResultSet rs=db.execSQL("select agency_id from package_details where package_id="+pack_id+";");
				if(rs.next())
					agency_id=""+rs.getInt(1);
				rs.close();

				int s1=db.updateSQL("delete from eligible_students where agency_id="+agency_id+" and package_id="+pack_id+";");
				db.close();
				
				if(btech!=null&&btech_group.length>0)
				{
					for(int i=0;i<btech_group.length;i++)
					{
						String btech_insert="";
						db.connect();
						ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+btech_group[i]+";");
						if(bt1.next())
							btech_insert="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+btech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
						s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_6sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+btech_group[i]+";");
						int res=db.updateSQL(btech_insert);
						db.close();
					}
				}
				if(mtech!=null&&mtech_group.length>0)
				{
					for(int i=0;i<mtech_group.length;i++)
					{
						String mtech_insert="";
						db.connect();
						ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+mtech_group[i]+";");
						if(bt1.next())
							mtech_insert="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+mtech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
						s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+mtech_group[i]+";");
						int res=db.updateSQL(mtech_insert);
						db.close();
					}
				}
				if(msc!=null&&msc_group.length>0)
				{
					for(int i=0;i<msc_group.length;i++)
					{
						String msc_insert="";
						db.connect();
						ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+msc_group[i]+";");
						if(bt1.next())
							msc_insert="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+msc_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
						s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+msc_group[i]+";");
						int res=db.updateSQL(msc_insert);
						db.close();
					}
				}
	
				if(phd!=null&&phd_group.length>0)
				{
					for(int i=0;i<phd_group.length;i++)
					{
						String phd_insert="";
						db.connect();
						ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+phd_group[i]+";");
						if(bt1.next())
							phd_insert="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+phd_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
						s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where program_id="+phd_group[i]+";");
						int res=db.updateSQL(phd_insert);
						db.close();
					}
				}
				
				if(bdes!=null)
				{
					db.connect();
					String stmnt="";
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+bdes+";");
					if(bt1.next())
						stmnt="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+bdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
					s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_6sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+bdes+";");
					int res=db.updateSQL(stmnt);
					db.close();
				}
				
				if(mdes!=null)
				{
					db.connect();
					String stmnt="";
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+mdes+";");
					if(bt1.next())
						stmnt="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+mdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
						bt1.close();
					s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+mdes+";");
					int res=db.updateSQL(stmnt);
					db.close();
				}
				
				if(ma!=null)
				{
					db.connect();
					String stmnt="";
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+ma+";");
					if(bt1.next())
						stmnt="insert into package_extra_details(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+pack_id+"','"+ma+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc+"')";
					bt1.close();
					s1+=db.updateSQL("insert into eligible_students(agency_id,package_id,student_id) select '"+agency_id+"','"+pack_id+"',student_id from student_record where cpi_2sem>="+cpi+" and x_percentage>="+x_percentage+" and xii_percentage>="+xii_percentage+" and program_id="+ma+";");
					int res=db.updateSQL(stmnt);
					db.close();
				}
				/*if(num_rows1==1 )
				{
					response.sendRedirect("success.jsp");
				}
				else
				{
					//out.println(main_record);
					//out.println(num_rows);//response.sendRedirect("error.jsp");
				}
				*/
			      db.connect();
			      int s2=db.updateSQL("delete from interested_students where student_id NOT IN (select student_id from  eligible_students where agency_id="+agency_id+" and package_id="+pack_id+") and agency_id="+agency_id+";");
			      db.close();
			}
                        db.connect();

                        // Mail Sending Part
                        ResultSet rs_agemail=db.execSQL("select agency_email,agency_person from agency where agency_id='"+agency_id+"';");
                        rs_agemail.next();
                        String agemail=rs_agemail.getString("agency_email");
                        String agperson=rs_agemail.getString("agency_person");
                        rs_agemail.close();
                         
                        String host = "naambor.iitg.ernet.in";
                        String from = "noreply@iitg.ernet.in";
                        String to = agemail;
                        Properties props = System.getProperties();
                        props.put("mail.smtp.host", host);
                        Session session1 = Session.getDefaultInstance(props, null);
                        MimeMessage message1 = new MimeMessage(session1);
                        message1.setFrom(new InternetAddress(from));
                        message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                        message1.setSubject("Profile Updation");
                        message1.setText("Dear "+agperson+",\nYour job profile has been updated by Admin.Please check.\n\nKindly contact Placement Cell @ 0361-2582175 for any further details.\n\nThanks & Regards\nPlacement Cell\nIIT Guwahati");
                        Transport.send(message1);
     
                        db.close();
			response.sendRedirect("edit_vac.jsp");
	
	}
	
 %>
<form name="form2" id="form2" method="post" onSubmit="return validate_empty();" action="edit.jsp?id=<%=pack_id%>">
   <table width="640" height="374" align="center" cellpadding="5" cellspacing="5">
     <tr>
       <td height="32" width="350" >Job description</td>
       <td width="307" ><input name="job_description" type="text" id="job_description" value="<%=job_description%>" ></td>
     </tr>
     <tr>
       <td height="32" >Job designation </td>
       <td ><input name="job_designation" type="text" id="job_designation" value="<%=job_designation%>"></td>
     </tr>
     <tr>
       <td height="32" >Place of posting </td>
       <td ><input name="location_of_posting" type="text" id ="location_of_posting" value="<%=location_of_posting%>"></td>
     </tr>
     <tr>
       <td width="350" height="31">Accomodation</td>
       <td ><label>
         <input name="accomodation" id="accomodation" type="radio" value="1" <% if(accomodation.equals("1"))out.println("checked"); %>>
       </label>
         Yes
         <label>
           <input name="accomodation" id="accomodation" type="radio" value="0" <% if(accomodation.equals("0"))out.println("checked"); %>>
         </label>
         NO</td>
     </tr>
     <tr>
       <td height="31" >Bond</td>
       <td ><input name="bond1" id="bond1" type="radio" value="1" <% if(bond.equals("1"))out.println("checked"); %>>
         Yes
         <input name="bond1" id="bond1" type="radio" value="0" <% if(bond.equals("0"))out.println("checked"); %>>
         NO</td>
     </tr>
     <tr>
       <td height="32" >Bond duration </td>
       <td><input name="bond_duration" type="text" id="bond_duration" value="<%=bond_duration%>" size="10">
         (in months)</td>
     </tr>
     <tr>
       <td height="32" ><p>Bond details </p></td>
       <td><input name="bond_details" type="text" id="bond_details" value="<%=bond_details%>" size="60"></td>
     </tr>
     <tr>
       <td height="31" >Shortlist by cpi?</td>
       <td ><label>
         <input name="shortlist" id="bond1" type="radio" value="1"  <% if(shortlist.equals("1"))out.println("checked"); %>>
       </label>
         Yes
         <label>
           <input name="shortlist" id="bond1" type="radio" value="0" <% if(shortlist.equals("0"))out.println("checked"); %>>
         </label>
         NO</td>
     </tr>
     <tr>
       <td height="32" >Cpi(minimum)</td>
       <td><input name="cpi" type="text" id="bond_duration4" value="<%=cpi%>" size="10">
         (on scale of 0-10)</td>
     </tr>
          <tr>
       <td height="32" >Tenth Percentage</td>
       <td><input name="x_percentage" type="text" value="<%=x_percentage%>" size="10">
         %</td>
     </tr>
     <tr>
       <td height="32" >Tweleth Percentage</td>
       <td><input name="xii_percentage" type="text" value="<%=xii_percentage%>" size="10">
         %</td>
     </tr>
     <tr>
       <td height="32" ><p>Other requirements</p></td>
       <td><input name="cpi_other" type="text" id="cpi_other" value="<%=cpi_other%>" size="60"></td>
     </tr>
   </table>
   <table width="640" height="203" align="center" cellpadding="5" cellspacing="5">
     <tr>
       <td width="132" height="35" >Package Name</td>
       <td width="471" ><input name="package_name1" type="text" id ="package_name1" value="<%=package_name%>"></td>
     </tr>
     <tr>
       <td height="32">Department</td>
       <td>Please Select your choices:</td>
     </tr>
     <tr>
       <td height="40">&nbsp;</td>
       <td nowrap><p>
         <input type="checkbox" name="btech" id="btech" onClick="activate_btech(this)" value="1" <% if(progs[1]==1)out.println("checked"); %>>
         <label for="btech" >B.Tech.</label>
       </p>
         <table border="1" align="center" id="btech_table">
           <tr>
             <td width="218"><label>
               <input type="checkbox" name="btech_chkbox" value="1" <% if(deps[1]==1)out.println("checked"); %> id="btech_chkbox_0">
               Computer Science & Engineering</label></td>
             <td width="238"><label>
               <input type="checkbox" name="btech_chkbox" value="2" <% if(deps[2]==1)out.println("checked"); %> id="btech_chkbox_1">
               Electronics & Communication Engineering</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="3" <% if(deps[3]==1)out.println("checked"); %> id="btech_chkbox_2">
               Mechanical Engineering</label></td>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="4" <% if(deps[4]==1)out.println("checked"); %> id="btech_chkbox_3">
               Civil Engineering</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="10" <% if(deps[10]==1)out.println("checked"); %> id="btech_chkbox_10">
               Electronics and Electrical Engineering</label></td>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="5" <% if(deps[5]==1)out.println("checked"); %> id="btech_chkbox_5">
               Biotechnology</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="6" <% if(deps[6]==1)out.println("checked"); %> id="btech_chkbox_6">
               Chemical Engineering</label></td>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="9" <% if(deps[9]==1)out.println("checked"); %> id="btech_chkbox_7">
               Chemical Science and Technology</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="8" <% if(deps[8]==1)out.println("checked"); %> id="btech_chkbox_8">
               Engineering Physics</label></td>
             <td><label>
               <input type="checkbox" name="btech_chkbox" value="7" <% if(deps[7]==1)out.println("checked"); %> id="btech_chkbox_9">
               Mathematics & Computing</label></td>
           </tr>
         </table>
         <label> <br>
           <input type="checkbox" name="bdes" value="11" id="btech_chkbox_4" <% if(progs[2]==1)out.println("checked"); %>>
           B.Des.</label>
         <p>
           <input type="checkbox" name="mtech" id="mtech" onClick="activate_mtech(this)" value="1" <% if(progs[3]==1)out.println("checked"); %>>
           <label for="mtech">M.Tech.</label>
         </p>
         <table border="1" name="mtech_table" id="mtech_table">
           <tr>
             <td width="233">Biotechnology</td>
             <td width="318"><p>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="24" <% if(deps[24]==1)out.println("checked"); %> id="mtech_chkbox_0">
                 Biotechnology</label>
               <br>
               <br>
             </p></td>
           </tr>
           <tr>
             <td>Chemical Engineering</td>
		  <td>
			    <!--    <label>
			      <input type="checkbox" name="mtech_chkbox" value="25" <% if(deps[25]==1)out.println("checked"); %> id="mtech_chkbox_1">
			      Petroleum Refinery Engineering
			      </label>
			   -->
			      <label>
			      <input type="checkbox" name="mtech_chkbox" value="48" <% if(deps[48]==1)out.println("checked"); %> id="mtech_chkbox_1">
			      Petroleum Science and Technology</label>
			      <br>
			      <label>
			      <input type="checkbox" name="mtech_chkbox" value="49" <% if(deps[49]==1)out.println("checked"); %> id="mtech_chkbox_15">
			      Materials Science and Technology</label>
		  </td>
           </tr>
           <tr>
             <td>Civil Engineering</td>
             <td><label>
               <input type="checkbox" name="mtech_chkbox" value="19" <% if(deps[19]==1)out.println("checked"); %> id="mtech_chkbox_2">
             </label>
               <label>Structural Engineering</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="20" <% if(deps[20]==1)out.println("checked"); %> id="mtech_chkbox_3">
                 Water Resources Engineering and Management</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="21" <% if(deps[21]==1)out.println("checked"); %>  id="mtech_chkbox_4">
                 Geotechnical Engineering</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="22" <% if(deps[22]==1)out.println("checked"); %> id="mtech_chkbox_5">
                 Environmental Engineering</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="23" <% if(deps[23]==1)out.println("checked"); %> id="mtech_chkbox_6">
                 Transportation System Engineering</label>
		 <br>
		 <label>
                 <input type="checkbox" name="mtech_chkbox" value="47" <% if(deps[47]==1)out.println("checked"); %> id="mtech_chkbox_7">
                 Infrastructure Engineering and Management
		 </label>
               </td>
           </tr>
           <tr>
             <td>Computer Science &amp; Engineering</td>
             <td><label>
               <input type="checkbox" name="mtech_chkbox" value="12" <% if(deps[12]==1)out.println("checked"); %> id="mtech_chkbox_8">
               Computer Science and Engineering</label>
               <br>
          <!--
              <label>
                 <input type="checkbox" name="mtech_chkbox" value="13" <% if(deps[13]==1)out.println("checked"); %> id="mtech_chkbox_8">
                 Information Security</label>
         -->
            </td>
           </tr>
           <tr>
		  <td>
			Electronics & Electrical Engineering
		  </td>
		  <td>
		      <label><input type="checkbox" name="mtech_chkbox" value="14" <% if(deps[14]==1)out.println("checked"); %> id="mtech_chkbox_9">Digital Signal Processing</label>
			<br>
		      <label><input type="checkbox" name="mtech_chkbox" value="15" <% if(deps[15]==1)out.println("checked"); %> id="mtech_chkbox_10"> VLSI</label>
			<br/>
		      <label><input type="checkbox" name="mtech_chkbox" value="45" <% if(deps[45]==1)out.println("checked"); %> id="mtech_chkbox_11">Applied Controls</label>
			<br/>
		      <label><input type="checkbox" name="mtech_chkbox" value="46" <% if(deps[46]==1)out.println("checked"); %> id="mtech_chkbox_12">Communications Enng</label>
		  </td>
           </tr>
           <tr>
             <td>Mechanical Engineering</td>
             <td><label>
               <input type="checkbox" name="mtech_chkbox" value="16" <% if(deps[16]==1)out.println("checked"); %> id="mtech_chkbox_16">
               Machine Design</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="17" <% if(deps[17]==1)out.println("checked"); %> id="mtech_chkbox_17">
                 Fluids and Thermal Sciences</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="18" <% if(deps[18]==1)out.println("checked"); %> id="mtech_chkbox_13">
                 Computer Assisted Manufacturing</label>
               <br>
               <label>
                 <input type="checkbox" name="mtech_chkbox" value="50" <% if(deps[50]==1)out.println("checked"); %> id="mtech_chkbox_18">
                 Computational Mechanics</label>
               </td>
           </tr>
         </table>
         <label> <br>
           <input type="checkbox" name="mdes" value="26" id="mtech_chkbox_14" <% if(progs[4]==1)out.println("checked"); %>>
           M.Des.</label>
         <p>
           <input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1" <% if(progs[5]==1)out.println("checked"); %>>
           <label for="msc">M.Sc.</label>
         </p>
         <table width="200" border="1" id="msc_table" name="msc_table">
           <tr>
             <td><p>
               <label>
                 <input type="checkbox" name="msc_chkbox" value="27" <% if(deps[27]==1)out.println("checked"); %> id="msc_chkbox_0">
                 Mathematics</label>
               <br>
               <br>
             </p></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="msc_chkbox" value="28" <% if(deps[28]==1)out.println("checked"); %> id="msc_chkbox_1">
               Physics</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="msc_chkbox" value="29" <% if(deps[29]==1)out.println("checked"); %> id="msc_chkbox_2">
               Chemistry</label></td>
           </tr>
         </table>
         <p>
           <input name="ma" type="checkbox" id="ma" value="30" <% if(progs[6]==1)out.println("checked"); %>>
           <label for="MA">M.A. in Development Studies</label>
         </p>
         <p>
           <input type="checkbox" name="phd" id="phd" onClick="activate_phd(this)" value="1" <% if(progs[7]==1)out.println("checked"); %>>
           <label for="phd">Ph.D.</label>
         </p>
         <table width="450" border="1" id="phd_table" name="phd_table">
           <tr>
             <td><p>
               <label>
                 <input type="checkbox" name="phd_chkbox" value="31" <% if(deps[31]==1)out.println("checked"); %> id="phd_chkbox_0">
                 Computer Science and Engineering</label>
               <br>
               <br>
             </p></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="32" <% if(deps[32]==1)out.println("checked"); %> id="phd_chkbox_1">
               Electronics and Communication Engineering</label>
               <br></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="33" <% if(deps[33]==1)out.println("checked"); %> id="phd_chkbox_2">
               Mechanical Engineering</label>
               <br></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="34" <% if(deps[34]==1)out.println("checked"); %> id="phd_chkbox_3">
               Civil Engineering</label>
               <br></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="35" <% if(deps[35]==1)out.println("checked"); %> id="phd_chkbox_4">
               Design</label>
               <br></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="36" <% if(deps[36]==1)out.println("checked"); %> id="phd_chkbox_5">
               Biotechnology</label>
               <br></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="37" <% if(deps[37]==1)out.println("checked"); %> id="phd_chkbox_6">
               Chemical Engineering</label>
               <br></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="38" <% if(deps[38]==1)out.println("checked"); %> id="phd_chkbox_7">
               Mathematics</label>
               <br></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="39" <% if(deps[39]==1)out.println("checked"); %> id="phd_chkbox_8">
               Physics</label>
               <br>
               <br></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="40" <% if(deps[40]==1)out.println("checked"); %> id="phd_chkbox_9">
               Chemistry</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="41" <% if(deps[41]==1)out.println("checked"); %> id="phd_chkbox_10">
               HSS</label></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="42" <% if(deps[42]==1)out.println("checked"); %> id="phd_chkbox_11">
               Centre for Energy</label></td>
           </tr>
           <tr>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="43" <% if(deps[43]==1)out.println("checked"); %> id="phd_chkbox_12">
               Centre for Environment</label></td>
             <td><label>
               <input type="checkbox" name="phd_chkbox" value="44" <% if(deps[44]==1)out.println("checked"); %> id="phd_chkbox_13">
               Centre for Nanotechnology</label></td>
           </tr>
         </table>
         <p>&nbsp;</p></td>
     <tr>
       <td height="32">No. of vacancy :</td>
       <td><input name="vacancy1" type="text" id="vacancy1" value="<%=vacancy%>"></td>
     <tr>
       <td height="32">CTC B.Tech:</td>
       <td><input name="ctc1" type="text" id="ctc1" value="<%=ctc%>">
         ( Lacs p.a.)</td>
     </tr>
     <tr>
       <td height="32">CTC M.Tech:</td>
       <td><input name="ctc_mtech" type="text" id="ctc_mtech" value="<%=ctc_mtech%>">
         ( Lacs p.a.)</td>
     </tr>
      <tr>
       <td height="32">CTC M.Sc:</td>
       <td><input name="ctc_msc" type="text" id="ctc_msc" value="<%=ctc_msc%>">
         ( Lacs p.a.)</td>
     </tr>
       <tr>
       <td height="32">CTC Ph.D:</td>
       <td><input name="ctc_phd" type="text" id="ctc_phd" value="<%=ctc_phd%>">
         ( Lacs p.a.)</td>
     </tr>
   </table>
 <table width="65" border="0" align="center">
                  <tr>
                    <td width="59">
                      <input type="submit" name="submit" id="submit" value="Approve">
                    </td>
      </tr>
</table></form>
  <p>&nbsp;</p>
  <tr>
    <td colspan="2" height="20">   
<div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
  GCom  </div> </td></tr></table>
</div> 
<!--end pagecell1--> 
<br> 
<script type="text/javascript">
    <!--
      var menuitem1 = new menu(7,1,"hidden");
			var menuitem2 = new menu(7,2,"hidden");
			var menuitem3 = new menu(7,3,"hidden");
			var menuitem4 = new menu(7,4,"hidden");
			var menuitem5 = new menu(7,5,"hidden");
			var menuitem6 = new menu(7,6,"hidden");
			var menuitem7 = new menu(7,7,"hidden");
    // -->
    </script> 
</body>
</html>
