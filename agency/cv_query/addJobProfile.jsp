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
		
			String main_record1=" insert into package_details_temp (package_name, vacancy, agency_id,job_description,job_designation,location_of_posting,accomodation,bond,bond_details,ctc,ctc_mtech,ctc_msc,ctc_phd,gross,gross_mtech,gross_msc,gross_phd,bonus,take_home_during,take_home_after,shortlist,cpi,x_percentage,xii_percentage,cpi_other)"+" values ('"+agency_name+'-'+package_name1+"','"+vacancy1+"','"+agency_id+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"',"+accomodation+","+bond+",'"+bond_details+"',"+ctc1+",'"+ctc_mtech+"','"+ctc_msc+"','"+ctc_phd+"','"+gross+"','"+gross_mtech+"','"+gross_msc+"','"+gross_phd+"','"+bonus+"','"+take_home_during+"','"+take_home_after+"','"+shortlist+"','"+cpi+"','"+x_percentage+"','"+xii_percentage+"','"+cpi_other+"');";
		
			ResultSet sr=db.man_stmnt(main_record1);
			String auto_inc_number="";
			//need change Umang
			if(sr.next())
			{
			        auto_inc_number=""+sr.getInt(1);
                                db.updateSQL("insert into agency_currency values("+agency_id+","+auto_inc_number+",'"+curr+"','"+curr+"');"); 

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
                <div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
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
						  <form name="form2" id="form2" method="post" onSubmit="return validate_empty();" action="">
							<table width="80%" align="center">
							  <tr>
								<td bgcolor="#FFFFFF"><div class="tabber">
								  <div class="tabbertab" id="step[3]">
									<h2>Job Application &amp; Salary Details</h2>
									<p>&nbsp;</p>
									<table width="640" height="523" align="center" cellpadding="5" cellspacing="5">
									  <tr>
										<td height="32" width="350" >*Job description</td>
										<td width="307" ><textarea name="job_description" id="job_description" onkeypress="return alpha(event);" cols="51" rows="5" ></textarea></td>
									  </tr>
									  <tr>
										<td height="32" >*Job designation </td>
										<td ><input name="job_designation" type="text" id="job_designation" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td height="32" >*Place of posting </td>
										<td ><input name="location_of_posting" type="text" id ="location_of_posting" onkeypress="return alpha(event);"></td>
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
										<td><input name="cpi" type="text" id="bond_duration4" size="10" disabled onkeypress="return alpha(event);">
										  (on scale of 0-10)</td>
									  </tr>
									  <tr>
										<td height="32" >*Tenth Percentage</td>
										<td><input name="x_percentage" type="text" id="x_percentage" value="0" size="10" onkeypress="return alpha(event);">
										  %</td>
									  </tr>
									  <td height="32" >*Twelfth Percentage</td>
										<td><input name="xii_percentage" type="text" id="xii_percentage" value="0" size="10" onkeypress="return alpha(event);">
										  %</td>
									  </tr>
									  <tr>
										<td height="32" ><p>Other requirements</p></td>
										<td><input name="cpi_other" type="text" id="cpi_other" size="60" value="" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td height="32">*No. of vacancy :</td>
										<td><input name="vacancy1" type="text" id="vacancy1" value="0" onkeypress="return alpha(event);"></td>
                                                                          </tr>
                                                                          <tr>
                                                                                <td height="32">*Currency Details:</td>
                                                                                <td>
                                                                                    <select name="currency" id="currency">
  										      <option value="INR" selected>INR</option> 	
  										      <option value="US$">US$</option> 	
  										      <option value="EURO">EURO</option> 	
  										      <option value="POUND">POUND</option> 	
 									            </select>
                                                                                </td>       
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
									<table width="640" height="129" align="center" cellpadding="5" cellspacing="5">
									  <tr>
										<td width="132" height="35" >*Profile Name</td>
										<td width="471" ><input name="package_name1" type="text" id ="package_name1" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td height="32">*Department</td>
										<td>Please Select your choices:</td>
									  </tr>
									  <tr>
										<td height="40">&nbsp;</td>
										<td nowrap><p>
										  <input type="checkbox" name="btech" id="btech" value="1" onClick="activate_btech(this);" >
										  <label for="btech" >B.Tech.</label>
										</p>
										  <table border="1" align="center" id="btech_table">
											<tr>
											  <td width="218"><label>
												<input type="checkbox" name="btech_chkbox" value="1"  id="btech_chkbox_0">
												Computer Science & Engineering</label></td>
											  <td width="238"><label>
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
											  <td width="233">Biotechnology</td>
											  <td width="318"><p>
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
										<label><input type="checkbox" name="mtech_chkbox" value="45"  id="mtech_chkbox_11">Applied Controls</label>
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
												  Computer Assisted Manufacturing</label></td>
											</tr>
										  </table>
										  <label> <br>
											<input type="checkbox" name="mdes" value="26" id="mtech_chkbox_14" >
											M.Des.</label>
										  <p>
											<input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1" >
											<label for="msc">M.Sc.</label>
										  </p>
										  <table width="200" border="1" id="msc_table" name="msc_table">
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
										  <table width="450" border="1" id="phd_table" name="phd_table">
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
									  </table>
									<p>&nbsp;</p>
								  </div>
								  
								</div></td>
							  </tr>
							  <tr>
								<td align="center"><input type="submit" name="submit" id="submit" value="Submit">
							  </tr>
							  </td>
							</table>
						  </form>
						  <p align="center">&nbsp;</p>
						</div>

            </div>
                          <div id = "footer">
              <span>&#169; 2009  Indian Institute of Technology Guwahati. Queries to: webmaster[at]iitg.ernet.in</span>
            </div>
        </div>
</body>
</html>
