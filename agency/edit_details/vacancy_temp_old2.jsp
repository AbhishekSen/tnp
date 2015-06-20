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
        if(k==34 || k==92)
           alert("Please do not use single or double quotes or forward slash.");
         return ((k > 63 && k < 92) || (k > 96 && k < 127) || (k > 41 && k <64) || (k >39 && k<42) ||(k >34 && k<40) || k==10 ||  k==13 || k == 8 || k == 9 || k == 27 || k == 32 || k == 33 || k==95
 || k==46 );
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




function validate_empty(ptr)
{	
          findall();
        var message="";
        if(document.form2.job_description.value=="")
                message+="Please enter Job description\n";
        else{
        if(!isvalid(document.form2.job_description.value))
        {
            message+="Please remove slashes and quotes from Job description field\n";
                    
        }
        }
        if(document.form2.job_designation.value=="")
                message+="Please enter Job designation\n";
        else{
        if(!isvalid(document.form2.job_designation.value))
        {
            message+="Please remove slashes and quotes from Job designation field\n";
                    
        }
        }
        if(document.form2.location_of_posting.value=="")
                message+="Please enter Place of posting\n";
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
                        message+="Please enter valid cpi\n";
        }

        if(!is_float(document.form2.x_percentage.value))
                message+="Please enter valid X-Percentage\n";
        if(document.form2.x_percentage.value>100)
                message+="Please enter valid X-Percentage\n";
        if(!is_float(document.form2.xii_percentage.value))
                message+="Please enter valid XII-Percentage\n";
        if(document.form2.xii_percentage.value>100)
                message+="Please enter valid XII-Percentage\n";

        if(!isvalid(document.form2.cpi_other2.value))
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
        message+="Please enter valid ctc for M.A.\n";

        if(!is_float(document.form2.ctc_phd.value))
        message+="Please enter valid ctc for Ph.D\n";

        if(!is_float(document.form2.gross.value))
                message+="Please enter valid gross for B.Tech\n";
        if(!is_float(document.form2.gross_mtech.value))
                message+="Please enter valid gross for M.Tech\n";
        if(!is_float(document.form2.gross_msc.value))
                message+="Please enter valid gross for M.Sc\n";
        if(!is_float(document.form2.gross_ma.value))
                message+="Please enter valid gross for M.A.\n";         

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
                        message+="Please enter Bond details\n";
                else{
                    if(!isvalid(document.form2.bond_details.value))
                     {
                        message+="Please remove slashes and quotes from Bond Details field\n";
                     }
                }
        }
        else{
             if(document.form2.bond_details.value!="")
            message+="Please check yes if you want to enter bond details\n"

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
                return false ;
        }
        else
        {
                return true;
        } 
}

function enabletxt()
{
  if(document.getElementById("shortlist").checked==true)
  {
    document.getElementById("cpi").disabled=false;
  }
  else
  {
    document.getElementById("cpi").value="";
    document.getElementById("cpi").disabled=true;
  }
}

function enabletxt1()
{
  if(document.getElementById("bond1").checked==true)
  {
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


<script src="../js/datetimepicker.js"></script>
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

	int department_id1=0;
	int programme_id1=0;
	int agency_id=0;
	String display1="<div valign='center' class='result'>" ;
	String display2="<br></div>" ;
	String package_id=request.getParameter("id");
	String submit=request.getParameter("submit");
	String agency_name=request.getParameter("agency_name");
	String job_description=request.getParameter("job_description");
	String job_designation=request.getParameter("job_designation");
	String location_of_posting=request.getParameter("location_of_posting");
	String accomodation=request.getParameter("accomodation");
	
	String package_name1=request.getParameter("package_name1");
 	String vacancy1=request.getParameter("vacancy1");      
	//String programme_name1=request.getParameter("programme_name1");
	//String department_name1=request.getParameter("department_name1");
	String btech=request.getParameter("btech");
	String mtech=request.getParameter("mtech");
	String msc=request.getParameter("msc");
	String ma=request.getParameter("ma");
	String bdes=request.getParameter("bdes");
	String mdes=request.getParameter("mdes");
	String phd=request.getParameter("phd");
	String ctc1=request.getParameter("ctc1");
	String ctc_mtech=request.getParameter("ctc_mtech");
        String ctc_msc=request.getParameter("ctc_msc");
        String ctc_ma=request.getParameter("ctc_ma");
        String ctc_phd=request.getParameter("ctc_phd");
        String curr=request.getParameter("currency"); 


	String shortlist=request.getParameter("shortlist");
        String cpi="";     
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
        }
	//String cpi=request.getParameter("cpi");
	String cpi_other=request.getParameter("cpi_other2");
        String x_percentage=request.getParameter("x_percentage");
        String xii_percentage=request.getParameter("xii_percentage");
	String bond=request.getParameter("bond1");
        String bond_details="";
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
        }
	//String bond_details=request.getParameter("bond_details");
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
	int[] deps=new int[51];
	int[] progs=new int[8];
	int major[]= new int[11];
	int minor[][]= new int[11][11];
	String cpi_minor_table="";
	try{
		String get_data="select agency_name,agency_id from agency where username='"+username+"';" ;
		db.connect(); 
		ResultSet ras= db.execSQL(get_data);
		if(ras.next()) 
		{
				agency_name=ras.getString(1);
				agency_id=ras.getInt(2);
		}
		ras.close();
		ResultSet rrs=db.execSQL("select count(*) from package_details_temp where package_id='"+package_id+"' and agency_id="+agency_id+";");
		int count1=0;
		if(rrs.next())
			count1=rrs.getInt(1);
		rrs.close();
		db.close();
		
		if(submit==null && agency_name!=null &&count1!=0)
		{	
		
			String sql_get_data2="select * from package_details_temp where package_id='"+package_id+"' and agency_id="+agency_id+";";
			db.connect();
			ResultSet rs_package=db.execSQL(sql_get_data2);
			if(rs_package.next())
			{
				job_description=rs_package.getString("job_description");
				job_designation=rs_package.getString("job_designation");
				location_of_posting=rs_package.getString("location_of_posting");
				bond=rs_package.getString("bond");
				package_name1=rs_package.getString("package_name");
				vacancy1=rs_package.getString("vacancy");      
				//programme_name1=request.getParameter("programme_name1");
				//department_name1=request.getParameter("department_name1");
				ctc1=rs_package.getString("ctc");
				ctc_mtech=rs_package.getString("ctc_mtech");
                                ctc_msc=rs_package.getString("ctc_msc");
                                ctc_ma=rs_package.getString("ctc_ma");
                                ctc_phd=rs_package.getString("ctc_phd");
				duplicate=null ;
				cpi=rs_package.getString("cpi");
                x_percentage=rs_package.getString("x_percentage");
                xii_percentage=rs_package.getString("xii_percentage");
				cpi_other=rs_package.getString("cpi_other");
				bond_details=rs_package.getString("bond_details");
				shortlist=rs_package.getString("shortlist");
				gross=rs_package.getString("gross");
                                gross_mtech=rs_package.getString("gross_mtech");
                                gross_msc=rs_package.getString("gross_msc");
                                gross_ma=rs_package.getString("gross_ma");
                                gross_phd=rs_package.getString("gross_phd");
				bonus=rs_package.getString("bonus");
				take_home_during=rs_package.getString("take_home_during");
				take_home_after=rs_package.getString("take_home_after");
				/*String[] btech_group=rs_package.getParameterValues("btech_chkbox");
				String[] mtech_group=rs_package.getParameterValues("mtech_chkbox");
				String[] msc_group=rs_package.getParameterValues("msc_chkbox");
				String[] phd_group=rs_package.getParameterValues("phd_chkbox");*/
				
			
				
			}
			
			rs_package.close();

			ResultSet rset22=db.execSQL("select * from package_extra_details_temp where package_id="+package_id+";");
			while(rset22.next())
			{
				deps[rset22.getInt("program_index")]=1;
				String query="select programme_id from prog_record where prog_id="+rset22.getInt("program_index")+";";
				ResultSet rset23=db.execSQL(query);
				if(rset23.next())
					progs[rset23.getInt(1)]=1;
				rset23.close();
			}
			rset22.close();

                        ResultSet rscurr=db.execSQL("select pay_mode_temp from agency_currency where agency_id="+agency_id+" and package_id_temp="+package_id+";"); 
                        if(rscurr.next())
                        {
                          curr=rscurr.getString("pay_mode_temp");
                        }
                        rscurr.close();
			db.close();

		    db.connect();
		    ResultSet rscurr33=db.execSQL("select * from minor_details_temp where agency_id="+agency_id+" and package_id="+package_id+";"); 
                    while(rscurr33.next())
                    {
			  cpi_minor_table = rscurr33.getString("CPI");

			  major[(rscurr33.getInt("major")-1)]= 1;
					   minor[(rscurr33.getInt("major")-1)][(rscurr33.getInt("minor")-1)]= 1;
                    }
					rscurr33.close();
                    rscurr.close();
			db.close();			
			
		}
		else if(submit!=null && agency_name!=null && agency_id!=0&&count1!=0)
		{
                      String main_record1=" update package_details_temp set package_name='"+package_name1+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"', vacancy='"+vacancy1+"',job_description='"+job_description+"',job_designation='"+job_designation+"',location_of_posting='"+location_of_posting+"',bond='"+bond+"',ctc='"+ctc1+"',shortlist='"+shortlist+"',cpi='"+cpi+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"',ctc_ma='"+ctc_ma+"',gross_ma='"+gross_ma+"' where agency_id="+agency_id+" and package_id="+package_id+";"; 			
      
   			//String main_record1=" update package_details_temp set package_name='"+package_name1+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"', vacancy='"+vacancy1+"',job_description='"+job_description+"',job_designation='"+job_designation+"',location_of_posting='"+location_of_posting+"',bond='"+bond+"',ctc='"+ctc1+"',shortlist='"+shortlist+"',cpi='"+cpi+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"' where agency_id="+agency_id+" and package_id="+package_id+";";
			

                 try
                 {                   			
                        //System.out.println("qry1: "+main_record1);
			db.connect();
			int sr=db.updateSQL(main_record1);
                        db.updateSQL("update agency_currency set pay_mode_temp='"+curr+"' where agency_id="+agency_id+" and package_id_temp="+package_id+";");

			//sr*=db.updateSQL("delete from package_extra_details_temp where package_id="+package_id+" or agency_id="+agency_id+";");
			sr*=db.updateSQL("delete from package_extra_details_temp where package_id="+package_id+" and agency_id="+agency_id+";");
			db.close();
			String auto_inc_number=package_id;
                    if(btech!=null&&btech_group.length>0)
                    {
                            for(int i=0;i<btech_group.length;i++)
                            {
 

                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+btech_group[i]+"'");
                                                                      tmp.next();
                                   String btech_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+btech_group[i]+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(btech_insert);
                                    tmp.close();
                                    db.close();
                            }
						      db.connect();
						      db.updateSQL("delete from minor_details_temp where agency_id="+agency_id+" and package_id="+package_id+" ;");
						      db.close();
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
										String btech_insert="";
										String str1="btech_minor_chkbox_"+(i+1)+"_"+(k+1);

										if(request.getParameter(str1)!= null)
										{
											db.connect();
										    if(i==10)
										       btech_insert="insert into minor_details_temp(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+package_id+"','1','"+request.getParameter(str)+"','"+request.getParameter(str1)+"','"+cpi_minor+"')";
										    else
										      btech_insert="insert into minor_details_temp(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+package_id+"','2','"+request.getParameter(str)+"','"+request.getParameter(str1)+"','"+cpi_minor+"')";
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
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+mtech_group[i]+"'");
                                                                      tmp.next();
                                   String mtech_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+mtech_group[i]+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(mtech_insert);
                                    tmp.close();
                                    db.close();
                            }
                    }

                    if(msc!=null&&msc_group.length>0)
                    {
                            for(int i=0;i<msc_group.length;i++)
                            {
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+msc_group[i]+"'");
                                                                      tmp.next();
                                   String msc_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+msc_group[i]+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(msc_insert);
                                    tmp.close();
                                    db.close();
                            }
                    }
                    if(phd!=null&&phd_group.length>0)
                    {
                            for(int i=0;i<phd_group.length;i++)
                            {
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+phd_group[i]+"'");
                                                                      tmp.next();
                                   String phd_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+phd_group[i]+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(phd_insert);
                                    tmp.close();
                                    db.close();
                            }
                    }
                    if(ma!=null)
                    {
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+ma+"'");
                                                                      tmp.next();
                                   String ma_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+ma+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(ma_insert);
                                    tmp.close();
                                    db.close();
                    }
                    if(bdes!=null)
                    {
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+bdes+"'");
                                                                      tmp.next();
                                   String bdes_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+bdes+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(bdes_insert);
                                    tmp.close();
                                    db.close();
                    }
                    if(mdes!=null)
                    {
                                   db.connect();
                                   ResultSet tmp = db.execSQL("select programme_id,department_id from prog_record where prog_id='"+mdes+"'");
                                                                      tmp.next();
                                   String mdes_insert="insert into package_extra_details_temp(package_id,program_index,agency_id,ctc,programme_id,department_id) values ('"+auto_inc_number+"','"+mdes+"','"+agency_id+"','"+ctc1+"','"+tmp.getString("programme_id")+"','"+tmp.getString("department_id")+"')";
                                    sr*=db.updateSQL(mdes_insert);
                                    tmp.close();
                                    db.close();
                    }
			if(sr!=0)
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
                                message1.setSubject(" '"+agency_name+"' job profile is pending for your approval");
                                message1.setText("Dear Placement Cell,\n\t\t'"+agency_name+"' has filled up the job profile details.\n\t\tPlease complete the approval part.");
                                Transport.send(message1);

				response.sendRedirect("success.jsp");
			}
			else
			{
				//out.println(main_record);
				//out.println(num_rows);//
				response.sendRedirect("error.jsp");
				//out.println("delete from package_extra_details_temp where package_id="+package_id+" or agency_id="+agency_id+";");
			}




		}// end try
 	        catch(SQLException sq)
  	 	{
   		  %>
     		 <script type="text/javascript">
      		   alert("Unable to process !! Please login again");
       		   location.href="../../logout.jsp";
                 </script>
                 <%					   
                }// end catch
      
	        catch(Exception sq)
  		{
   		 %>
                  <script type="text/javascript">
	           alert("Unable to process !! Please login again");
		   location.href="../../logout.jsp";
		  </script>
   		<% 
                } //end catch


                } // end of else if
		else
		{
			response.sendRedirect("../main.jsp");
		}

%>

<body onload = "load_events();">
<div id = "container">
		<div id = "header">
		  <div>
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
			 <%-- <div id = "search">
                  <input type = "text" /><input type = "button" class = "button" value = "search"/>
                </div> --%>
		  </div>
		  <hr style = "float:left;width:100%;">
		  </div>
		  <div id = "body">
			<div id = "divMain">
			 <div class = "mainMenu">
				<div id="VerticalSlidingMenu">
					<ul class="SlidingMenu">
					  <li><a href='../instructions.jsp'>Instructions</a></li>
					  <li><a href="edit.jsp">Edit Job Application Form</a></li>
					  <li><a href="../vacancies/add_vacancy.jsp">Job Profile &amp; Salary Details</a></li>
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
			<form name="form2" id="form2" method="post" onSubmit="return validate_empty();" action="vacancy_temp.jsp">
			<table width="80%" align="center">
				<input type="hidden" name="id" value="<%=package_id%>"/>
				<tr>
				<td><div class="tabber">
				  <div class="tabbertab" id="step[3]">
					<h2>Job Profile Form</h2>
					<table width="640" height="523" align="center" cellpadding="5" cellspacing="5">
					  <tr>
						<td height="32" width="350" >*Job description</td>
						<td width="307" ><textarea name="job_description"  id="job_description"  onkeypress="return alpha(event);" cols="51" rows="5" ><%=job_description%></textarea></td>
					  </tr>
					  <tr>
						<td height="32" >*Job designation </td>
						<td ><input name="job_designation" type="text" id="job_designation" value="<%=job_designation%>" onkeypress="return alpha(event);"></td>
					  </tr>
					  <tr>
						<td height="32" >*Place of posting </td>
						<td ><input name="location_of_posting" type="text" id ="location_of_posting" value="<%=location_of_posting%>" onkeypress="return alpha(event);"></td>
					  </tr>
					  <tr>
						<td height="31" >*Shortlist by cpi?</td>
						<td ><label>
						  <input name="shortlist" id="shortlist" type="radio" value="1"  <% if(shortlist.equals("1")&& Float.parseFloat(cpi)>0 )out.println("checked"); %> onClick="enabletxt();" >
						</label>
						  Yes
						  <label>
							<input name="shortlist" id="shortlist" type="radio" value="0" <% if(shortlist.equals("0") || Float.parseFloat(cpi)==0)out.println("checked"); %> onClick="enabletxt();" >
						  </label>
						  NO</td>
					  </tr>
					  <tr>
						<td height="32" >Minimum Cpi (Students profile having this minimum CPI or above will only be accessible)</td>
						<td><input name="cpi" type="text" id="cpi" value="<%=cpi%>" size="10" <% if(Float.parseFloat(cpi)==0)out.println("disabled"); %> onkeypress="return alpha(event);" >
						  (on scale of 0-10)</td>
					  </tr>
					<tr>
						<td height="32" >Tenth Percentage</td>
						<td><input name="x_percentage" type="text" id="x_percentage" value="<%=x_percentage%>" size="10" onkeypress="return alpha(event);">
						  %</td>
					  </tr>
					  <td height="32" >Twelfth Percentage</td>
						<td><input name="xii_percentage" type="text" id="xii_percentage" value="<%=xii_percentage%>" size="10" onkeypress="return alpha(event);">
						  %</td>
					  </tr>
					  <tr>
						<td height="32" ><p>Other requirements</p></td>
						<td><input name="cpi_other2" type="text" id="cpi_other4" value="<%=cpi_other%>" size="60" onkeypress="return alpha(event);" ></td>
					  </tr>
					  <tr>
						<td height="32">*No. of vacancy :</td>
						<td><input name="vacancy1" type="text" id="vacancy1" value="<%=vacancy1%>" onkeypress="return alpha(event);"></td>
                                          </tr>
                                          <tr>
                                                <td height="32">*Currency Details:</td>
                                                <td>
                                                    <select name="currency" id="currency">
                                                       <option value="INR"   <%if(curr != null && curr.equals("INR"))out.println("selected");%>>INR</option>         
                                                       <option value="US$"   <%if(curr != null && curr.equals("US$"))out.println("selected");%> >US$</option>  
                                                       <option value="EURO"  <%if(curr != null && curr.equals("EURO"))out.println("selected");%>>EURO</option>        
                                                       <option value="POUND" <%if(curr != null && curr.equals("POUND"))out.println("selected");%> >POUND</option>      
                                                    </select>
                                               </td>       
                                          </tr>
					  <tr>
						<td height="32">*CTC B.Tech:</td>
						<td><input name="ctc1" type="text" id="ctc1" value="<%=ctc1%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">*CTC M.Tech:</td>
						<td><input name="ctc_mtech" type="text" id="ctc_mtech" value="<%=ctc_mtech%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">*CTC M.Sc:</td>
						<td><input name="ctc_msc" type="text" id="ctc_msc" value="<%=ctc_msc%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
                                          <tr>
		           	             <td height="32">*CTC M.A.(Development Studies):</td>
			                     <td><input name="ctc_ma" type="text" id="ctc_ma" value="<%=ctc_ma%>">
				             <%=curr%></td>
	                                  </tr>

					  <tr>
						<td height="32">*CTC Ph.D:</td>
						<td><input name="ctc_phd" type="text" id="ctc_phd" value="<%=ctc_phd%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">*Gross B.Tech:</td>
						<td><input name="gross" type="text" id="gross" value="<%=gross%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">*Gross M.Tech:</td>
						<td><input name="gross_mtech" type="text" id="gross_mtech" value="<%=gross_mtech%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					   <tr>
						<td height="32">*Gross M.Sc:</td>
						<td><input name="gross_msc" type="text" id="gross_msc" value="<%=gross_msc%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
                                          <tr>
			                     <td height="32">*Gross M.A.(Development Studies):</td>
				             <td><input name="gross_ma" type="text" id="gross_ma" value="<%=gross_ma%>">
				             <%=curr%></td>
			                  </tr>
					   <tr>
						<td height="32">*Gross Ph.D:</td>
						<td><input name="gross_phd" type="text" id="gross_phd" value="<%=gross_phd%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">Take Home during training period :</td>
						<td><input name="take_home_during" type="text" id="take_home_during" value="<%=take_home_during%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">Take Home after training period :</td>
						<td><input name="take_home_after" type="text" id="take_home_after" value="<%=take_home_after%>" onkeypress="return alpha(event);">
						  <%=curr%></td>
					  </tr>
					  <tr>
						<td height="32">Bonus/Perks/Incentive (if any):</td>
						<td><input name="bonus" type="text" id="bonus" value="<%=bonus%>" size="60" onkeypress="return alpha(event);"></td>
					  </tr>
					  <tr>
						<td height="31" >Bond</td>
						<td ><input name="bond1" id="bond1" type="radio" value="1" <% if(bond.equals("1"))out.println("checked"); %> onClick="enabletxt1();">
						  Yes
						  <input name="bond1" id="bond1" type="radio" value="0" <% if(bond.equals("0"))out.println("checked"); %> onClick="enabletxt1();">
						  NO</td>
					  </tr>
					  <tr>
						<td height="32" ><p>Bond details </p></td>
						<td><input name="bond_details" type="text" id="bond_details" value="<%=bond_details%>" size="60" onkeypress="return alpha(event);" <%if(bond.equals("0")) out.println("disabled");%> ></td>
					  </tr>
					  <tr>
						<td height="35" >*Profile Name</td>
						<td><input name="package_name1" type="text" id ="package_name1" value="<%=package_name1%>" onkeypress="return alpha(event);"></td>
					  </tr>
					</table>
					<table width="640" height="129" align="center" cellpadding="5" cellspacing="5">
					  <tr>
						<td height="32"><b>Department</b></td>
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
								<td>
						<label>
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
								<td>
						<label>
									<input type="checkbox" name="mtech_chkbox" value="12" <% if(deps[12]==1)out.println("checked"); %> id="mtech_chkbox_8">
									Computer Science and Engineering</label>
									<br>
									
					</td>
							</tr>
							<tr>
								<td>Electronics & Electrical Engineering</td>
								<td>
						<label>
									<input type="checkbox" name="mtech_chkbox" value="14" <% if(deps[14]==1)out.println("checked"); %> id="mtech_chkbox_9">
								 Signal Processing</label>
									<br>
									<label>
									<input type="checkbox" name="mtech_chkbox" value="15" <% if(deps[15]==1)out.println("checked"); %> id="mtech_chkbox_10">
									VLSI
						</label>
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
										     <td><input name="cpi_minor" type="text" id="cpi_minor" value="<%=cpi_minor_table%>" size="10" onkeypress="return alpha(event);" >
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
										  <input type="checkbox" name='<%=str1%>' value='<%=(k+1)%>' <% if(major[k]==1)out.println("checked"); %> id='<%=str1%>'>
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
										  <input type="checkbox" name='<%=str%>' value='<%=(i+1)%>' <% if(minor[k][i]==1)out.println("checked"); %> id='<%=str%>'>
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
					<p>&nbsp;</p><p>&nbsp;</p>
				  </div>
				</div></td>
			  </tr>
			  <tr>
				<td align="center"><input type="submit" name="submit" id="submit" value="Submit">
			  </tr>
			  </td>
			  </form>
			</table>
			</div>
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
<%
}
  catch(Exception e)
  {
        e.printStackTrace();
  }



%>
