<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="../../images/iit_icon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Training &amp; Placement Cell, IIT Guwahati.</title>
<script src='../../javascript/jquery.min.js'></script>
<script type="text/javascript" src="../../javascript/jquery-ui.min.js"></script>
<script type="text/javascript" src="../../javascript/jquery.sliding-menu.js"></script>
<script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>

<meta charset="iso-8859-1">


<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />

<%
	int agency_id=0;
	if(request != null && request.getParameter("id") != null)
                agency_id=Integer.parseInt(request.getParameter("id"));
%>
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
       if(!is_float(document.form2.ctc_ma.value))
                message+="Please enter valid ctc for M.A\n";

       if(!is_float(document.form2.ctc_phd.value))
                message+="Please enter valid ctc for Ph.D\n";
        if(!is_float(document.form2.gross.value))
                message+="Please enter valid gross for B.Tech\n";
        if(!is_float(document.form2.gross_mtech.value))
                message+="Please enter valid gross for M.Tech\n";
        if(!is_float(document.form2.gross_msc.value))
                message+="Please enter valid gross for M.Sc\n";

        if(!is_float(document.form2.gross_ma.value))
                message+="Please enter valid gross for M.A\n";

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
                document.form2.action="addJobProfile.jsp?id="+<%=agency_id%>+"";
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

<%
  try
  {
	int department_id1=0;
	int programme_id1=0;

                
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
       // String package_id=request.getParameter("id");
	String submit=request.getParameter("submit");
	String agency_name=request.getParameter("agency_name");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	String package_name1=request.getParameter("package_name1");
 	String vacancy1=request.getParameter("vacancy1");      
	String btech=request.getParameter("btech");
	String mtech=request.getParameter("mtech");
	String msc=request.getParameter("msc");
	String ma=request.getParameter("ma");
	String bdes=request.getParameter("bdes");
	String mdes=request.getParameter("mdes");
	String phd=request.getParameter("phd");
        String curr=request.getParameter("currency");
	String ctc1=request.getParameter("ctc1");
        String ctc_mtech=request.getParameter("ctc_mtech");
        String ctc_msc=request.getParameter("ctc_msc");
        String ctc_ma=request.getParameter("ctc_ma");
        String ctc_phd=request.getParameter("ctc_phd");
        String x_percentage=request.getParameter("x_percentage");
        String xii_percentage=request.getParameter("xii_percentage");

	String shortlist=request.getParameter("shortlist");
        //System.out.println("short: "+shortlist);

        String cpi="";       
        //System.out.println("outside if 0: "+cpi);
        if(shortlist != null )       
        {
		if(shortlist.equals("0"))
		{
            	     cpi="0";
		}
		else
		{
    	   	      cpi=request.getParameter("cpi").trim().toString();
		}
           	//System.out.println("Inside if 1 "+cpi);
        }

	String cpi_other=request.getParameter("cpi_other");

	String bond=request.getParameter("bond1");
        String bond_details="";
	//System.out.println("bond: "+bond);
        if(bond != null)
	{
		if(bond.equals("0"))
		{
			bond_details=" ";
		}
		else
		{
	            bond_details=request.getParameter("bond_details").trim().toString();
		}
		//System.out.println("bond: "+bond);
	}

	String duplicate=null ;
	String take_home_during=request.getParameter("take_home_during");
	String take_home_after=request.getParameter("take_home_after");
	String bonus=request.getParameter("bonus");
	String gross=request.getParameter("gross");
        String gross_mtech=request.getParameter("gross_mtech");
        String gross_msc=request.getParameter("gross_msc");
        String gross_ma=request.getParameter("gross_ma");
        String gross_phd=request.getParameter("gross_phd");
	String[] btech_group=request.getParameterValues("btech_chkbox");
	String[] mtech_group=request.getParameterValues("mtech_chkbox");
	String[] msc_group=request.getParameterValues("msc_chkbox");
	String[] phd_group=request.getParameterValues("phd_chkbox");
	int succ=1;

	if(submit!=null)
	{
		String get_data="select agency_name from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet ras= db.execSQL(get_data);
		if(ras.next()) 
		{
				agency_name=ras.getString("agency_name");
								
		}
		ras.close();
		db.close();
    
	
		/*if(submit!=null && agency_name!=null )
		{	
		
			String sql_get_data="select agency_id from agency where agency_name='"+agency_name+"';" ;
			db.connect(); 
			ResultSet rs_agency= db.execSQL(sql_get_data);
			if(rs_agency.next()) 
			{
				agency_id=rs_agency.getInt(1);
			}
			rs_agency.close();
			db.close();
			
		}*/
		if(submit!=null && agency_name!=null && agency_id!=0)
		{
                    db.connect();	
                    /*ResultSet qryexist=db.execSQL("select * from package_details_temp where agency_id="+agency_id+";");
                    if(qryexist.next())
                    {
                       // Deleting temporary record if already exist
                       db.updateSQL("delete from package_details_temp where agency_id="+agency_id+";");
                       db.updateSQL("delete from agency_currency where agency_id="+agency_id+";");                       
                       db.updateSQL("delete from package_extra_details_temp where agency_id="+agency_id+";");
                    } 
                    qryexist.close();*/

                    String main_record1=" insert into package_details_temp (package_name, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_details,ctc,ctc_mtech,ctc_msc,ctc_phd,gross,gross_mtech,gross_msc,gross_phd,bonus,take_home_during,take_home_after,shortlist,cpi,x_percentage,xii_percentage,cpi_other,ctc_ma,gross_ma)"+" values ('"+agency_name+'-'+package_name1+"','"+vacancy1+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+",'"+bond_details+"',"+ctc1+",'"+ctc_mtech+"','"+ctc_msc+"','"+ctc_phd+"','"+gross+"','"+gross_mtech+"','"+gross_msc+"','"+gross_phd+"','"+bonus+"','"+take_home_during+"','"+take_home_after+"','"+shortlist+"','"+cpi+"','"+x_percentage+"','"+xii_percentage+"','"+cpi_other+"','"+ctc_ma+"','"+gross_ma+"');";		

			//String main_record1=" insert into package_details_temp (package_name, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_details,ctc,ctc_mtech,ctc_msc,ctc_phd,gross,gross_mtech,gross_msc,gross_phd,bonus,take_home_during,take_home_after,shortlist,cpi,x_percentage,xii_percentage,cpi_other)"+" values ('"+agency_name+'-'+package_name1+"','"+vacancy1+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+",'"+bond_details+"',"+ctc1+",'"+ctc_mtech+"','"+ctc_msc+"','"+ctc_phd+"','"+gross+"','"+gross_mtech+"','"+gross_msc+"','"+gross_phd+"','"+bonus+"','"+take_home_during+"','"+take_home_after+"','"+shortlist+"','"+cpi+"','"+x_percentage+"','"+xii_percentage+"','"+cpi_other+"');";
		
                        System.out.println("qry: "+main_record1);	
			ResultSet sr=db.man_stmnt(main_record1);
			String auto_inc_number="";
			//need change Umang
			if(sr.next())
			{
			        auto_inc_number=""+sr.getInt(1);
                                db.updateSQL("insert into agency_currency values("+agency_id+","+auto_inc_number+","+auto_inc_number+",'"+curr+"','"+curr+"');"); 

			}
			sr.close();
			db.close();
			
			if(btech!=null&&btech_group.length>0)
			{
				for(int i=0;i<btech_group.length;i++)
				{
					String btech_insert="";
					db.connect();
					ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+btech_group[i]+";");
					if(bt1.next())
						btech_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+btech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(btech_insert);
					db.close();
				}

							String cpi_minor=request.getParameter("cpi_minor");

							for(int i=0;i<=10;i++)
							{
								String str= "btech_major_chkbox_"+(i+1);
								if(request.getParameter(str)!= null)
								{
								for(int k=0;k<=10;k++)
								{
									if(i!=k)
									{
										String str1="btech_minor_chkbox_"+(i+1)+"_"+(k+1);
										String btech_insert="";
										if(request.getParameter(str1)!= null)
										{
											db.connect();
										    if(i==10)
											btech_insert="insert into minor_details_temp(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+auto_inc_number+"','2','"+request.getParameter(str)+"','"+request.getParameter(str1)+"','"+cpi_minor+"')";

										    else
											btech_insert="insert into minor_details_temp(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+auto_inc_number+"','1','"+request.getParameter(str)+"','"+request.getParameter(str1)+"','"+cpi_minor+"')";
										    db.updateSQL(btech_insert);
											db.close();
										}
									
									}
								}
								}
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
						mtech_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+mtech_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(mtech_insert);
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
						msc_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+msc_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(msc_insert);
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
						phd_insert="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+phd_group[i]+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
					succ*=db.updateSQL(phd_insert);
					db.close();
				}
			}
			
			if(bdes!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+bdes+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+bdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			
			if(mdes!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+mdes+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+mdes+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			
			if(ma!=null)
			{
				db.connect();
				String stmnt="";
				ResultSet bt1=db.execSQL("select department_id,programme_id from prog_record where prog_id="+ma+";");
				if(bt1.next())
					stmnt="insert into package_extra_details_temp(package_id,program_index,department_id,programme_id,agency_id,ctc) values ('"+auto_inc_number+"','"+ma+"','"+bt1.getInt(1)+"','"+bt1.getInt(2)+"','"+agency_id+"','"+ctc1+"')";
					bt1.close();
				succ*=db.updateSQL(stmnt);
				db.close();
			}
			if(succ!=0)
			{
 
				// Mail Sending Part
                                String host = "naambor.iitg.ernet.in";
                                String from = "noreply@iitg.ernet.in";
                                String to = "placement@iitg.ernet.in";
                                Properties props = System.getProperties();
                                props.put("mail.smtp.host", host);
                                Session session1 = Session.getDefaultInstance(props, null);

                               MimeMessage message1 = new MimeMessage(session1);
                                message1.setFrom(new InternetAddress(from));
                                message1.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
                                message1.setSubject("'"+agency_name+"' job profile is pending for your approval");
                                message1.setText("Dear Placement Cell,\n\t\tOne company '"+agency_name+"' has filled up the job profile details.\n\t\tPlease complete the approval part.");
                                Transport.send(message1);	
				response.sendRedirect("success1.jsp");
			}
			else
			{
				//out.println(main_record);
				//out.println(num_rows);//
				response.sendRedirect("error.jsp");
			}
		}

	}

  }
  catch(SQLException sq)
  {
   %>
     <script type="text/javascript">
       alert("Unable to process !! Please login again");
       location.href="../../logout.jsp";
     </script> 
   <%
  }
  catch(Exception sq)
  {
   %>
    <script type="text/javascript">
       alert("Unable to process !! Please login again");
       location.href="../../logout.jsp";
    </script>
   <%
  } 

%>
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css">
</head>

<body onload = "load_events();">
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Welcome  <%=username%></a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>

<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="topnav">
    <ul class="clear">
      <li><a href="http://iitg.ernet.in" target="_blank" title="IIT Guwahati">IIT Guwahati Home</a>
       
      </li>
      <li><a href="http://iitg.ernet.in/placement" target="_blank" title="Training & Placement Cell">T&P Cell</a>
        
      </li>
     
      <li><a href="http://www.iitg.ernet.in/acad/courses_syllabee.php"  target="_blank" title="Courses Offered">Courses Offered & Syllabi</a></li>
      <li class="last-child"><a href="../../logout.jsp" title="Logout">Logout</a></li>
    </ul>
  </nav>
</div>
<!-- content -->
<div class="wrapper row3" style="width:100%;">

<!-- ################################################################################################ -->
<div id="container">
  <div id="sidebar_1" class="sidebar one_quarter first" style="background:#DFDFDF;color:#000">
  <aside>
        <!-- ########################################################################################## -->
        <h2 align="center">Recruiter</h2>
        <nav>
          <ul>
            <li><a href="../instuctions.jsp">Instructions</a></li>
            <li align="center"> <span style="color:darkgrey; text-align:center;"> Add Job Profile</span>
              <ul>
                <li><a href="../edit_details/edit.jsp">Edit Job Application Form</a></li>
                <li><a href="../vacancies/add_vacancy.jsp">Job Profile & Salary Details</a></li>
              </ul>
            </li>
            <li><span style="color:darkgrey; text-align:center;">Students Details</span>
            <ul>
                <li><a href="../cv_query/cv_query.jsp">Eligible Students</a></li>
                <li><a href="../student_details/student_details.jsp">Using Roll No.</a></li>
            </ul>
            </li><li><a href="../calendar/view.jsp">Update Organization Schedule</a>
            </li><li><a href="../uploads/upload.jsp">Upload Organization Literature</a>
            </li><li><a href="../change_password/change_password.jsp">Change Password</a>
            </li><li><a href="../../logout.jsp">Logout</a>
            </li>
            
           
          
          </ul>
        </nav>
        <!-- /nav --><!-- /section --><!-- /section -->
        <!-- ########################################################################################## -->
    </aside>
</div>
    <!-- ################################################################################################ -->
    <div id="portfolio"  class="three_quarter">
      <ul class="clear">
			 <div id = "center">
						<div class="feature">
						  <form name="form2" id="form2" method="post" onSubmit="return validate_empty();" action="">
							<table width="100%" border="1">
							  <tr><br>
									<h2 align="center">Job Application &amp; Salary Details</h2>
									<p>&nbsp;</p>
									<table border="1" height="523"cellpadding="5" cellspacing="5">
									  <tr>
										<td height="32" style="width=50%" >*Job description</td>
										<td  style="width=50%" ><span id="sprytextarea1">
										  <textarea name="job_description" id="job_description" onKeyPress="return alpha(event);" cols="51" rows="5" ></textarea>
									    <span class="textareaRequiredMsg">A value is required.</span></span></td>
									  </tr>
									  <tr>
										<td height="32" >*Job designation </td>
										<td ><span id="sprytextfield1">
										  <input name="job_designation" type="text" id="job_designation" onKeyPress="return alpha(event);" style="border=thin">
									    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
									  </tr>
									  <tr>
										<td height="32" >*Place of posting </td>
										<td ><span id="sprytextfield2">
										  <input name="location_of_posting" type="text" id ="location_of_posting" onKeyPress="return alpha(event);">
									    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
									  </tr>
									  <tr>
										<td height="31" >*Shortlist by cpi?</td>
										<td ><label>
										  <input name="shortlist" id="shortlist" type="radio" value="1" onClick="enabletxt();" >
										  </label>
										  Yes
										  <label>
											<input name="shortlist" type="radio" id="shortlist" value="0" checked onClick="enabletxt();" >
										  </label>
										  NO</td>
									  </tr>
									  <tr>
										<td height="32" >*Minimum CPI (Students profile having this minimum CPI or above will only be accessible):</td>
										<td><span id="sprytextfield3">
                                        <input name="cpi" type="text" id="bond_duration4" size="10" disabled onKeyPress="return alpha(event);" >
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span>
										  (on scale of 0-10)</td>
									  </tr>
									  <tr>
										<td height="32" >*Tenth Percentage ( in % )</td>
										<td><span id="sprytextfield4">
                                        <input name="x_percentage" type="text" id="x_percentage" value="0" size="10" onKeyPress="return alpha(event);" >
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
									  </tr>
									  <td height="32" >*Twelfth Percentage( in % )</td>
										<td><span id="sprytextfield5">
                                        <input name="xii_percentage" type="text" id="xii_percentage" value="0" size="10" onKeyPress="return alpha(event);">
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span></td>
									  </tr>
									  <tr>
										<td height="32" ><p>Other requirements</p></td>
										<td><input name="cpi_other" type="text" id="cpi_other" size="60" value="" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td height="32">*No. of vacancy :</td>
										<td><span id="sprytextfield6">
                                        <input name="vacancy1" type="text" id="vacancy1" value="0" onKeyPress="return alpha(event);">
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span></span></td>
                                      </tr>
                                                                          <tr>
                                                                                <td height="32">*Currency Details:</td>
                                                                                <td><span id="spryselect1">
                                                                                  <select name="currency" id="currency">
                                                                                    <option value="INR" selected>INR</option>
                                                                                    <option value="US$">US$</option>
                                                                                    <option value="EURO">EURO</option>
                                                                                    <option value="POUND">POUND</option>
                                                                                  </select>
                                                                                <span class="selectRequiredMsg">Please select an item.</span></span></td>       
                                                                          </tr>
									  <tr>
										<td height="32">*CTC B.Tech:</td>
										<td><input name="ctc1" type="text" id="ctc1" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">*CTC MTech:</td>
										<td><input name="ctc_mtech" type="text" id="ctc_mtech" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">*CTC M.Sc:</td>
										<td><input name="ctc_msc" type="text" id="ctc_msc" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
                                                                          <tr>
					                                    <td height="32">*CTC MA(Development Studies):</td>
					                                    <td><input name="ctc_ma" type="text" id="ctc_ma" value="0">
					                                    </td>
					                                  </tr>

									  <tr>
										<td height="32">*CTC Ph.D:</td>
										<td><input name="ctc_phd" type="text" id="ctc_phd" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">*Gross B.Tech:</td>
										<td><input name="gross" type="text" id="gross" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">*Gross M.Tech:</td>
										<td><input name="gross_mtech" type="text" id="gross_mtech" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">*Gross M.Sc:</td>
										<td><input name="gross_msc" type="text" id="gross_msc" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
                                                                          <tr>
										<td height="32">*Gross M.A(Development Strudies):</td>
										<td><input name="gross_ma" type="text" id="gross_ma" value="0">
										</td>
									  </tr>

									  <tr>
										<td height="32">*Gross Ph.D:</td>
										<td><input name="gross_phd" type="text" id="gross_phd" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">Take Home during training period :</td>
										<td><input name="take_home_during" type="text" id="take_home_during" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">Take Home after training period :</td>
										<td><input name="take_home_after" type="text" id="take_home_after" value="0" onkeypress="return alpha(event);">
										</td>
									  </tr>
									  <tr>
										<td height="32">Bonus/Perks/Incentive (if any):</td>
										<td><input name="bonus" type="text" id="bonus" size="60" value="0" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td height="31" >*Bond</td>
										<td ><input name="bond1" id="bond1" type="radio" value="1" onClick="enabletxt1();">
										  Yes
										  <input name="bond1" id="bond1" type="radio" value="0" checked onClick="enabletxt1();">
										  NO</td>
									  </tr>
									  <tr>
										<td height="32" ><p>Bond details </p></td>
										<td><input name="bond_details" type="text" id="bond_details" size="60" onkeypress="return alpha(event);" disabled></td>
									  </tr>
									</table>
									<table width="100%" height="129" align="center" border="1" cellpadding="5" cellspacing="5">
									  <tr>
										<td width="30%" height="35" align="left" >*Profile Name</td>
										<td width="70%" align="left"><span id="sprytextfield7">
                                        <input name="package_name1" type="text" id ="package_name1" onKeyPress="return alpha(event);">
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span></td>
									  </tr>
									  <tr>
										<td height="32" align="left">*Department</td>
										<td align="left">Please Select your choices:</td>
									  </tr>
									  <tr>
										<td height="40">&nbsp;</td>
										<td nowrap align="left"><p>
										  <input type="checkbox" name="btech" id="btech" value="1" onClick="activate_btech(this);" >
										  <label for="btech" >B.Tech.</label>
										</p>
										  <table border="1" align="center" id="btech_table">
											<tr>
											  <td width="50%"><label>
												<input type="checkbox" name="btech_chkbox" value="1"  id="btech_chkbox_0">
												Computer Science & Engineering</label></td>
											  <td width="50%"><label>
												<input type="checkbox" name="btech_chkbox" value="2" id="btech_chkbox_1">
												Electronics & Communication Engineering</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="3"  id="btech_chkbox_2">
												Mechanical Engineering</label></td>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="4"  id="btech_chkbox_3">
												Civil Engineering</label></td>
											</tr>
											<tr>
	 									  <td><label>
												<input type="checkbox" name="btech_chkbox"  value="10" id="btech_chkbox_10">
												Electronics and Electrical Engineering</label></td>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="5"  id="btech_chkbox_5">
												Biotechnology</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="6"  id="btech_chkbox_6">
												Chemical Engineering</label></td>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="9"  id="btech_chkbox_7">
												Chemical Science and Technology</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="8"  id="btech_chkbox_8">
												Engineering Physics</label></td>
											  <td><label>
												<input type="checkbox" name="btech_chkbox" value="7"  id="btech_chkbox_9">
												Mathematics & Computing</label></td>
											</tr>
										  </table>
										  <label> <br>
											<input type="checkbox" name="bdes" value="11" id="btech_chkbox_4" >
											B.Des.</label>
										  <p>
											<input type="checkbox" name="mtech" id="mtech" onClick="activate_mtech(this)" value="1" >
											<label for="mtech">M.Tech.</label>
										  </p>
										  <table border="1" name="mtech_table" id="mtech_table">
											<tr>
											  <td width="50%">Biotechnology</td>
											  <td width="50%"><p>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="24" id="mtech_chkbox_0">
												  Biotechnology</label>
												<br>
												<br>
											  </p></td>
											</tr>
											<tr>
											  <td>Chemical Engineering</td>
									<td>
										<label>
										<input type="checkbox" name="mtech_chkbox" value="48"  id="mtech_chkbox_1">
										Petroleum Science and Technology</label>
										<br>
										<label>
										<input type="checkbox" name="mtech_chkbox" value="49"  id="mtech_chkbox_15">
										Materials Science and Technology</label>
									</td>
											</tr>
											<tr>
											  <td>Civil Engineering</td>
											  <td><label>
												<input type="checkbox" name="mtech_chkbox" value="19" id="mtech_chkbox_2">
											  </label>
												<label>Structural Engineering</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="20" id="mtech_chkbox_3">
												  Water Resources Engineering and Management</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="21" id="mtech_chkbox_4">
												  Geotechnical Engineering</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="22" id="mtech_chkbox_5">
												  Environmental Engineering</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="23"  id="mtech_chkbox_6">
												  Transportation System Engineering</label>
									  <br>
									  <label>
									  <input type="checkbox" name="mtech_chkbox" value="47"  id="mtech_chkbox_7">
									  Infrastructure Engineering and Management
									  </label>
									</td>
											</tr>
											<tr>
											  <td>Computer Science &amp; Engineering</td>
											  <td>
									  <label>
									  <input type="checkbox" name="mtech_chkbox" value="12" id="mtech_chkbox_8">
									  Computer Science and Engineering</label>
								  </td>
											</tr>
											<tr>
											  <td>Electronics & Electrical Engineering</td>
											  <td>
									 <label><input type="checkbox" name="mtech_chkbox" value="14" id="mtech_chkbox_9">Signal Processing</label>
										  <br/>
										<label><input type="checkbox" name="mtech_chkbox" value="15"  id="mtech_chkbox_10">VLSI</label>
										  <br/>
										<label><input type="checkbox" name="mtech_chkbox" value="45"  id="mtech_chkbox_11">Power and Control</label>
										   <br/>
										<label><input type="checkbox" name="mtech_chkbox" value="46"  id="mtech_chkbox_12">Communications Enng</label>
								  </td>
											</tr>
											<tr>
											  <td>Mechanical Engineering</td>
											  <td><label>
												<input type="checkbox" name="mtech_chkbox" value="16" id="mtech_chkbox_16">
												Machine Design</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="17" id="mtech_chkbox_17">
												  Fluids and Thermal Sciences</label>
												<br>
												<label>
												  <input type="checkbox" name="mtech_chkbox" value="18" id="mtech_chkbox_13">
												  Computer Assisted Manufacturing</label>
                                                                                                <br>
                                                                                                <label>
                                                                                      <input type="checkbox" name="mtech_chkbox" value="50" id="mtech_chkbox_18">
                                                                                                  Computational Mechanics</label>
                                              </td>
											</tr>
										  </table>
										  <label> 
											<input type="checkbox" name="mdes" value="26" id="mtech_chkbox_14" >
											M.Des.</label>
										  <p>
											<input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1" >
											<label for="msc">M.Sc.</label>
										  </p>
										  <table width="100%" border="1" id="msc_table" name="msc_table">
											<tr>
											  <td><p>
												<label>
												  <input type="checkbox" name="msc_chkbox" value="27" id="msc_chkbox_0">
												  Mathematics</label>
												<br>
												<br>
											  </p></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="msc_chkbox" value="28"  id="msc_chkbox_1">
												Physics</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="msc_chkbox" value="29" id="msc_chkbox_2">
												Chemistry</label></td>
											</tr>
										  </table>
										  <p>
											<input name="ma" type="checkbox" id="ma" value="30" >
											<label for="MA">M.A. in Development Studies</label>
										  </p>
										  <p>
											<input type="checkbox" name="phd" id="phd" onClick="activate_phd(this)" value="1" >
											<label for="phd">Ph.D.</label>
										  </p>
										  <table width="100%" border="1" id="phd_table" name="phd_table">
											<tr>
											  <td><p>
												<label>
												  <input type="checkbox" name="phd_chkbox" value="31" id="phd_chkbox_0">
												  Computer Science and Engineering</label>
												<br>
												<br>
											  </p></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="32"  id="phd_chkbox_1">
												Electronics and Communication Engineering</label>
												<br></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="33"  id="phd_chkbox_2">
												Mechanical Engineering</label>
												<br></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="34"  id="phd_chkbox_3">
												Civil Engineering</label>
												<br></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="35"  id="phd_chkbox_4">
												Design</label>
												<br></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="36"  id="phd_chkbox_5">
												Biotechnology</label>
												<br></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="37"  id="phd_chkbox_6">
												Chemical Engineering</label>
												<br></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="38"  id="phd_chkbox_7">
												Mathematics</label>
												<br></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="39"  id="phd_chkbox_8">
												Physics</label>
												<br>
												<br></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="40"  id="phd_chkbox_9">
												Chemistry</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="41" id="phd_chkbox_10">
												HSS</label></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="42"  id="phd_chkbox_11">
												Centre for Energy</label></td>
											</tr>
											<tr>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="43"  id="phd_chkbox_12">
												Centre for Environment</label></td>
											  <td><label>
												<input type="checkbox" name="phd_chkbox" value="44"  id="phd_chkbox_13">
												Centre for Nanotechnology</label></td>
											</tr>
										  </table>
										  <p>&nbsp;</p></td>

 										   
										  <table>
										    <tr>
											<td>
											    <b>Please select allowed minor courses</b>
											</td>
											<td>
											</td>
										    </tr>
										    <tr>
										     <td height="32" >Minimum CPI</td>
										     <td><input name="cpi_minor" type="text" id="cpi_minor" size="10" onkeypress="return alpha(event);" >
										  (on scale of 0-10)</td>
										    </tr>
										    <tr>
										     <td height="32" ><div style="font-size:12px;color:red;">(Enter minimum CPI for students eligible though minor courses)</div></td>
										     <td>
										                     
										      </td>
										    </tr>
										  </table>
										  <table border="1" align="center" id="btech_table1">


										  <tr><td>Major Department</td><td>Minor Department</td></tr>
										  <%
										  String dep_fullnames[]={"Computer Science & Engineering", "Electronics & Communication Engineering", "Mechanical Engineering", "Civil Engineering", "Biotechnology","Chemical Engineering","Mathematics & Computing" , "Engineering Physics","Chemical Science and Technology","Electronics and Electrical Engineering","Design(B.Des)" };
										  String dep_names[]={"CSE", "ECE", "ME", "Civil", "BT", "Chem", "MnC", "EP", "CST", "EEE","Design"};
										  for(int k=0;k<=10;k++)
										  {
										  String str1="btech_major_chkbox_"+(k+1);
										  %>
										  <tr>
										  <td>
										  <label>
										  <input type="checkbox" name='<%=str1%>' value='<%=(k+1)%>' id='<%=str1%>'>
										  <%out.println(dep_fullnames[k]);%>
										  </label>
									      </td>
											<td>
											<table>
											<tr>
											<%
											
											for(int i=0;i<=10;i++)
											{
											if(k!=i)
											{
											String str= "btech_minor_chkbox_"+(k+1)+"_"+(i+1);
											%>
										  <td>
										  <table>
										  <tr>
										  <td>
										  <input type="checkbox" name='<%=str%>' value='<%=(i+1)%>'  id='<%=str%>'>
										  </td>
										  </tr>
										  <tr>
										  
										  <td>
										  <%out.println(dep_names[i]);%>
										  </td>
										  </tr>
										  </table>
										  </td>
										  	
											<%
											}
											}
											%>	
										  <tr>
										  </table>
										  </td>		
										  </tr>
										  <%
										  }
										  %>

										  </table>
								    </table>
									
								  </div>
								  
								</div></td>
							  </tr>
							  <tr width="100%" align="center">
								<td><p align="center"><br><input type="submit" name="submit" id="submit" value="Submit">&nbsp;&nbsp;</p></td>
							  </tr>
							 
							</table>
						  </form>
						  </div>


            </div>
     	  </ul>
     </div>

<div class="clear"><!-- Footer -->
</div>
</div>
<!-- Footer -->
<div class="wrapper row4" style="position:inherit; top: 92%; background:#000">
  <div id="copyright" class="clear">
  <p><center></center> </p>
    <p class="fl_left"><center>
        Copyright &copy; 2014 - All Rights Reserved - Placement Cell, IIT Guwahati
    </center></p>
    
  </div>
</div>
<script type="text/javascript">
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {validateOn:["blur"]});
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["blur"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "real", {validateOn:["blur"], minValue:0, maxValue:10});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "integer", {validateOn:["blur"], minValue:1, maxValue:100});
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "integer", {validateOn:["blur"], minValue:1, maxValue:100});
var sprytextfield6 = new Spry.Widget.ValidationTextField("sprytextfield6", "integer", {validateOn:["blur"], minValue:1});
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {validateOn:["blur"]});
var sprytextfield7 = new Spry.Widget.ValidationTextField("sprytextfield7", "none", {validateOn:["blur"]});
</script>
</body>
</html>
