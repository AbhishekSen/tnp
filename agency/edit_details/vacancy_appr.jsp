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
                message+="Please enter valid ctc for BTECH\n";
        if(!is_float(document.form2.ctc_mtech.value))
                message+="Please enter valid ctc for MTech\n";
        if(!is_float(document.form2.ctc_msc.value))
                message+="Please enter valid ctc for MSc\n";
        if(!is_float(document.form2.ctc_ma.value))
                message+="Please enter valid ctc for MA\n";

        if(!is_float(document.form2.ctc_phd.value))
                message+="Please enter valid ctc for PhD\n";
        if(!is_float(document.form2.gross.value))
                message+="Please enter valid gross for BTech\n";
        if(!is_float(document.form2.gross_mtech.value))
                message+="Please enter valid gross for MTech\n";
        if(!is_float(document.form2.gross_msc.value))
                message+="Please enter valid gross for MSc\n";

        if(!is_float(document.form2.gross_ma.value))
                message+="Please enter valid gross for MA\n";
 
        if(!is_float(document.form2.gross_phd.value))
                message+="Please enter valid gross for PhD\n";

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
                return false ;
        }
        else
        {
                return true;
        }

}	 

function enabletxt()
{
  if(document.getElementById("bond2").checked==true)
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


</script><script src="../js/datetimepicker.js"></script>
<script src="SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
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
        String curr=request.getParameter("currency");

	String ctc1=request.getParameter("ctc1");
	String ctc_mtech=request.getParameter("ctc_mtech");
        String ctc_msc=request.getParameter("ctc_msc");
        String ctc_ma=request.getParameter("ctc_ma");    
        String ctc_phd=request.getParameter("ctc_phd");
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
        String x_percentage=request.getParameter("x_percentage");
        String xii_percentage=request.getParameter("xii_percentage");
	String cpi_other=request.getParameter("cpi_other");
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

            String get_data="select agency_name,agency_id from agency where username='"+username+"';" ;
            db.connect();
            ResultSet ras= db.execSQL(get_data);
            if(ras.next())
            {
                            agency_name=ras.getString(1);
                            agency_id=ras.getInt(2);
            }
            ras.close();
            ResultSet rrs=db.execSQL("select count(*) from package_details where package_id='"+package_id+"' and agency_id="+agency_id+";");
            int count1=0;
            if(rrs.next())
                    count1=rrs.getInt(1);
            rrs.close();
            db.close();
            if(submit==null && agency_name!=null &&count1!=0)
            {


                    String sql_get_data2="select * from package_details where package_id='"+package_id+"' and agency_id='"+agency_id+"';";
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


                    }

                    rs_package.close();
                    ResultSet rset22=db.execSQL("select * from package_extra_details where package_id="+package_id+";");
                    while(rset22.next())
                    {
                            deps[rset22.getInt("program_index")]=1;
                            ResultSet rset23=db.execSQL("select programme_id from prog_record where prog_id="+rset22.getInt("program_index")+";");
                            if(rset23.next())
                                    progs[rset23.getInt(1)]=1;
                            rset23.close();
                    }
                    rset22.close();
                    ResultSet rscurr=db.execSQL("select pay_mode from agency_currency where agency_id="+agency_id+" and package_id="+package_id+";"); 
                    if(rscurr.next())
                    {
                       curr=rscurr.getString("pay_mode");
                    }
                    rscurr.close();

                  

		    ResultSet rscurr33=db.execSQL("select * from minor_details where agency_id="+agency_id+" and package_id="+package_id+";"); 
                    while(rscurr33.next())
                    {
			cpi_minor_table = rscurr33.getString("CPI");


                        major[(rscurr33.getInt("major")-1)]= 1;
			minor[(rscurr33.getInt("major")-1)][(rscurr33.getInt("minor")-1)]= 1;
                    }
						
					rscurr33.close();

		      db.close();
            }
            else if(submit!=null && agency_name!=null && agency_id!=0 && count1!=0)
            {
              try
              {
                    db.connect();
                    int sr=1;
                    sr*=db.updateSQL("delete from package_extra_details_temp where agency_id="+agency_id+" and package_id="+package_id+";");
                    //sr*=db.updateSQL("delete from package_details_temp where agency_id="+agency_id+";");
                    //sr=1;
                    ResultSet peekRec=db.execSQL("select * from package_details_temp where agency_id="+agency_id+" and package_id="+package_id+";"); 
                    String main_record1 = null;
                    ResultSet sr2 = null;
                    String auto_inc_number="";
                    if(peekRec.next())
                    {
                        main_record1 = "update package_details_temp set package_name='"+package_name1+"',vacancy='"+vacancy1+"',job_description='"+job_description+"',job_designation='"+job_designation+"',location_of_posting='"+location_of_posting+"',bond='"+bond+"',ctc='"+ctc1+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"',shortlist='"+shortlist+"',cpi='"+cpi+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"',old_package_id='"+package_id+"' ,ctc_ma='"+ctc_ma+"',gross_ma='"+gross_ma+"' where agency_id="+agency_id+" and package_id="+package_id+";";

                        //main_record1 = "update package_details_temp set package_name='"+package_name1+"',vacancy='"+vacancy1+"',job_description='"+job_description+"',job_designation='"+job_designation+"',location_of_posting='"+location_of_posting+"',bond='"+bond+"',ctc='"+ctc1+"',ctc_mtech='"+ctc_mtech+"',ctc_msc='"+ctc_msc+"',ctc_phd='"+ctc_phd+"',shortlist='"+shortlist+"',cpi='"+cpi+"',x_percentage='"+x_percentage+"',xii_percentage='"+xii_percentage+"',cpi_other='"+cpi_other+"',bond_details='"+bond_details+"',gross='"+gross+"',gross_mtech='"+gross_mtech+"',gross_msc='"+gross_msc+"',gross_phd='"+gross_phd+"',bonus='"+bonus+"',take_home_during='"+take_home_during+"',take_home_after='"+take_home_after+"',old_package_id='"+package_id+"' where agency_id="+agency_id+" and package_id="+package_id+";";
                        db.updateSQL(main_record1);
                        auto_inc_number = package_id;
                    }
                    else
                    {
                        main_record1="insert into package_details_temp(package_name,agency_id,vacancy,job_description,job_designation,location_of_posting,bond,ctc,ctc_mtech,ctc_msc,ctc_phd,shortlist,cpi,x_percentage,xii_percentage,cpi_other,bond_details,gross,gross_mtech,gross_msc,gross_phd,bonus,take_home_during,take_home_after,old_package_id,ctc_ma,gross_ma) values('"+package_name1+"','"+agency_id+"','"+vacancy1+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"','"+bond+"','"+ctc1+"','"+ctc_mtech+"','"+ctc_msc+"','"+ctc_phd+"','"+shortlist+"','"+cpi+"','"+x_percentage+"','"+xii_percentage+"','"+cpi_other+"','"+bond_details+"','"+gross+"','"+gross_mtech+"','"+gross_msc+"','"+gross_phd+"','"+bonus+"','"+take_home_during+"','"+take_home_after+"','"+package_id+"','"+ctc_ma+"','"+gross_ma+"');";

                        //main_record1="insert into package_details_temp (package_name,agency_id,vacancy,job_description,job_designation,location_of_posting,bond,ctc,ctc_mtech,ctc_msc,ctc_phd,shortlist,cpi,x_percentage,xii_percentage,cpi_other,bond_details,gross,gross_mtech,gross_msc,gross_phd,bonus,take_home_during,take_home_after,old_package_id) values('"+package_name1+"','"+agency_id+"','"+vacancy1+"','"+job_description+"','"+job_designation+"','"+location_of_posting+"','"+bond+"','"+ctc1+"','"+ctc_mtech+"','"+ctc_msc+"','"+ctc_phd+"','"+shortlist+"','"+cpi+"','"+x_percentage+"','"+xii_percentage+"','"+cpi_other+"','"+bond_details+"','"+gross+"','"+gross_mtech+"','"+gross_msc+"','"+gross_phd+"','"+bonus+"','"+take_home_during+"','"+take_home_after+"','"+package_id+"');";
                        sr2=db.man_stmnt(main_record1);
                        if(sr2.next())
                        {
                                auto_inc_number=""+sr2.getInt(1);
                        }
                  }
                   
                    db.updateSQL("update agency_currency set pay_mode_temp='"+curr+"' , package_id_temp='"+ auto_inc_number+"' where agency_id="+agency_id+" and package_id="+package_id+";");
                    peekRec.close();   
                    sr2.close();
                    db.close();
                   
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
                    }
						      db.connect();
						      db.updateSQL("delete from minor_details_temp where agency_id="+agency_id+" and package_id="+auto_inc_number+" ;");
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
										String str1="btech_minor_chkbox_"+(i+1)+"_"+(k+1);
										if(request.getParameter(str1)!= null)
										{
											db.connect();
											String btech_insert="insert into minor_details_temp(agency_id,package_id,program_index,major,minor,CPI) values ('"+agency_id+"','"+auto_inc_number+"','1','"+request.getParameter(str)+"','"+request.getParameter(str1)+"','"+cpi_minor+"')";
											db.updateSQL(btech_insert);
											db.close();
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
                            message1.setSubject(" '"+agency_name+"' has updated job profile");
                            message1.setText("Dear Placement Cell,\n\t\t '"+agency_name+"' has updated the job profile .Please do the approval part.");
                            Transport.send(message1);

                            response.sendRedirect("success1.jsp");
                    }
                    else
                    {
                            //out.println(main_record);
                            //out.println(num_rows);//
                            response.sendRedirect("error.jsp?id=0");
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
            } // end catch     
         }// end of else if
         else
         {
                    response.sendRedirect("error.jsp?id=1");
          }

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<style type="text/css">
.aa {
	color: #333;text-align: left;
}

ab {
	color: #333;
	text-align: left;
}
ab {
	color: #333;
	text-align: left;
}
</style>
<link href="SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css">
<head>
<title>Training &amp; Placement Cell</title>
<meta charset="iso-8859-1">

<link rel="shortcut icon" href="../../images/demo/favicon.ico" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../layout/styles/main.css" rel="stylesheet" type="text/css" media="all">
<link href="../../layout/styles/mediaqueries.css" rel="stylesheet" type="text/css" media="all">
 <link rel="stylesheet" href="../../css/style.css" media="screen" type="text/css" />
<!--[if lt IE 9]>
<link href="../layout/styles/ie/ie8.css" rel="stylesheet" type="text/css" media="all">
<script src="../layout/scripts/ie/css3-mediaqueries.min.js"></script>
<script src="../layout/scripts/ie/html5shiv.min.js"></script>
<![endif]-->
</head>
<body onLoad="load_events()">
<div class="wrapper row1">
  <header id="header" class="full_width clear">
    <hgroup>
      <h1><a>Welcome  <%=username%></a></h1>
      <h2><a href="http://www.iitg.ernet.in/placement/" target="_blank">Training & Placement Portal</a>, <a href="http://www.iitg.ernet.in/" target="_blank">IIT Guwahati</a></h2>
    </hgroup><a href="http://www.iitg.ernet.in/" target="_blank"><img src="../../images/salamanderskins_logo.gif" alt="IIT Guwahati" class="logo"></a>
    
  </header>
</div>

<!-- ################################################################################################ -->

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
<div class="wrapper row3">

<!-- ################################################################################################ -->
<div id="container" style="position:relative">
  <div id="sidebar_1" class="sidebar one_quarter first" style="background:#DFDFDF;color:#000">
  <aside>
        <!-- ########################################################################################## -->
        <h2 align="center">Recruiter</h2>
        <nav>
          <ul>
            <li><a href="../instructions.jsp">Instructions</a></li>
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
    <div id="portfolio" class="three_quarter" style="background:#DFDFDF">
      <ul class="clear"> 
      
<form name="form2" id="form2" method="post" onSubmit="return validate_empty();" action="vacancy_appr.jsp">
							  <input type="hidden" name="id" value="<%=package_id%>"/>
							  <table width="100%" align="center" class="aa" style="border:groove">
							  <tr>
								<td>
									<h2 align="center">Job Profile Form</h2>
									
									<table width="100%"  align="center" cellpadding="5" cellspacing="5" border="1">
									  <tr>
										<td width="40%" align="right"   >*Job description</td>
										<td width="60%" align="left" class="ab" ><span id="sprytextarea1">
                                        <textarea name="job_description"  id="job_description"  onKeyPress="return alpha(event);" cols="51" rows="5" ><%=job_description%></textarea>
                                        <span class="textareaRequiredMsg">A value is required.</span><span class="textareaMinCharsMsg">Minimum number of characters not met.</span></span></td>
									  </tr>
									  <tr>
										<td align="right" >*Job designation</td>
										<td align="left" ><span id="sprytextfield1">
										  <input name="job_designation" type="text" id="job_designation" value="<%=job_designation%>" onKeyPress="return alpha(event);" >
									    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
									  </tr>
									  <tr>
										<td align="right" >*Place of posting</td>
										<td align="left" ><span id="sprytextfield2">
										  <input name="location_of_posting" type="text" id ="location_of_posting" value="<%=location_of_posting%>" onKeyPress="return alpha(event);">
									    <span class="textfieldRequiredMsg">A value is required.</span></span></td>
									  </tr>
									  <tr>
										<td align="right"  >Shortlist by cpi?</td>
										<td align="left" ><input name="shortlist" id="bond3" type="radio" value="1" <% if(shortlist.equals("1")&& Float.parseFloat(cpi)>0 )out.println("checked"); %> onClick="enabletxt();">
										  Yes
                                          <label>
                                            <input name="shortlist" id="bond2" type="radio" value="0" <% if(shortlist.equals("0") || Float.parseFloat(cpi)==0)out.println("checked"); %> onClick="enabletxt();" >
					    </label>
										  No</td>
									  </tr>
									  <tr>
										<td align="right" >Minimum Cpi (Students profile having this minimum CPI or above will only be accessible)</td>
										<td align="left"><span id="sprytextfield3">
                                        <input name="cpi" type="text" id="cpi" value="<%=cpi%>" size="10" <% if(Float.parseFloat(cpi)==0)out.println("disabled"); %> onKeyPress="return alpha(event);" >
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span>
										  (on scale of 0-10)</td>
									  </tr>
									  <tr>
										<td align="right" >Tenth Percentage</td>
										<td align="left"><span id="sprytextfield4">
                                        <input name="x_percentage" type="text" id="x_percentage" value="<%=x_percentage%>" size="10" onKeyPress="return alpha(event);">
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span></span>
										  %</td>
									  </tr>
									  <td align="right" >Twelfth Percentage</td>
										<td align="left"><span id="sprytextfield5">
                                        <input name="xii_percentage" type="text" id="xii_percentage" value="<%=xii_percentage%>" size="10" onKeyPress="return alpha(event);">
                                        <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span><span class="textfieldMinValueMsg">The entered value is less than the minimum required.</span><span class="textfieldMaxValueMsg">The entered value is greater than the maximum allowed.</span></span>
										  %</td>
									  </tr>
									  <tr>
										<td align="right" ><p>Other requirements</p></td>
										<td align="left"><input name="cpi_other" type="text" id="cpi_other" value="<%=cpi_other%>" size="60" onkeypress="return alpha(event);" ></td>
									  </tr>
									  <tr>
										<td align="right">No. of vacancy :</td>
										<td align="left"><input name="vacancy1" type="text" id="vacancy1" value="<%=vacancy1%>" onkeypress="return alpha(event);"></td>
									  </tr>
 									  <tr>
                                               				     <td align="right">*Currency Details:</td>
                                                			     <td align="left"><span id="spryselect1">
                                                			       <select name="currency" id="currency">
                                                			         <option value="INR"   <%if(curr != null && curr.equals("INR"))out.println("selected");%>>INR</option>
                                                			         <option value="US$"   <%if(curr != null && curr.equals("US$"))out.println("selected");%> >US$</option>
                                                			         <option value="EURO"  <%if(curr != null && curr.equals("EURO"))out.println("selected");%>>EURO</option>
                                                			         <option value="POUND" <%if(curr != null && curr.equals("POUND"))out.println("selected");%> >POUND</option>
                                              			         </select>
                                               			         <span class="selectRequiredMsg">Please select an item.</span></span></td>       
                       				  </tr>	

									  <tr>
										<td align="right">*CTC B.Tech:</td>
										<td align="left"><input name="ctc1" type="text" id="ctc1" value="<%=ctc1%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">*CTC M.Tech:</td>
										<td align="left"><input name="ctc_mtech" type="text" id="ctc_mtech" value="<%=ctc_mtech%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">*CTC M.Sc:</td>
										<td align="left"><input name="ctc_msc" type="text" id="ctc_msc" value="<%=ctc_msc%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
                                                                          <tr>
										<td align="right">*CTC M.A.(Development Studies):</td>
										<td align="left"><input name="ctc_ma" type="text" id="ctc_ma" value="<%=ctc_ma%>">
										  <%=curr%></td>
									  </tr>

									 <tr>
										<td align="right">*CTC Ph.D:</td>
										<td align="left"><input name="ctc_phd" type="text" id="ctc_phd" value="<%=ctc_phd%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">*Gross B.Tech:</td>
										<td align="left"><input name="gross" type="text" id="gross" value="<%=gross%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">*Gross M.Tech:</td>
										<td align="left"><input name="gross_mtech" type="text" id="gross_mtech" value="<%=gross_mtech%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">*Gross M.Sc:</td>
										<td align="left"><input name="gross_msc" type="text" id="gross_msc" value="<%=gross_msc%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
                                                                          <tr>
										<td align="right">*Gross M.A(Development Studies):</td>
										<td align="left"><input name="gross_ma" type="text" id="gross_ma" value="<%=gross_ma%>">
										  <%=curr%></td>
									  </tr>

									  <tr>
										<td align="right">*Gross Ph.D:</td>
										<td align="left"><input name="gross_phd" type="text" id="gross_phd" value="<%=gross_phd%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">Take Home during training period :</td>
										<td align="left"><input name="take_home_during" type="text" id="take_home_during" value="<%=take_home_during%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">Take Home after training period :</td>
										<td align="left"><input name="take_home_after" type="text" id="take_home_after" value="<%=take_home_after%>" onkeypress="return alpha(event);">
										  <%=curr%></td>
									  </tr>
									  <tr>
										<td align="right">Bonus/Perks/Incentive (if any):</td>
										<td align="left"><input name="bonus" type="text" id="bonus" value="<%=bonus%>" size="60" onkeypress="return alpha(event);"></td>
									  </tr>
									  <tr>
										<td align="right" >Bond</td>
										<td align="left" >
										  <input name="bond1" id="bond1" type="radio" value="1"    <% if(bond.equals("1"))out.println("checked"); %>onClick="enabletxt1();"  >
										  
										  Yes
										  <input name="bond1" id="bond1" type="radio" value="0" <% if(bond.equals("0"))out.println("checked"); %>onClick="enabletxt1();" >
										  NO</td>
									  </tr>
									  <tr>
										<td align="right" ><p>Bond details </p></td>
										<td align="left"><input name="bond_details" type="text" id="bond_details" value="<%=bond_details%>" size="60" onkeypress="return alpha(event);" <%if(bond.equals("0")) out.println("disabled");%>   ></td>
									  </tr>
									  <tr>
										<td align="right" ><p>*Profile Name(e.g. GET,MT) </p></td>
										<td align="left"><input name="package_name1" type="text" id ="package_name1" value="<%=package_name1%>" onkeypress="return alpha(event);" /></td>
									  </tr>
								    </table>
									<table width="100%" align="center" cellpadding="5" style="border:groove" cellspacing="5">									  
									  <tr>
									   <td height="32" align="left"class="aa" ><b>Programs at a Glance</b></td>
									  </tr>
									  <tr>
									  <td align="left" nowrap>
									  <table border="1" align="center" id="programs_table" class="aa" >
									  <tr>
											  <td width="218"><label>Name of the Programme</label></td>
											  <td width="238"><label>Duration of the course</label></td>
											  <td width="238"><label>Admission through</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Bachelor of Technology-B.Tech</label></td>
											  <td width="238"><label>4 years</label></td>
											  <td width="238"><label>JEE</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Bachelor of Design-B.Des</label></td>
											  <td width="238"><label>4 years</label></td>
											  <td width="238"><label>JEE+Aptitude Test for Design</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Master of Technology-M.Tech</label></td>
											  <td width="238"><label>2 years</label></td>
											  <td width="238"><label>GATE+Interview</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Master of Design-M.Des</label></td>
											  <td width="238"><label>2 years</label></td>
											  <td width="238"><label>CEED+Interview</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Master of Science-M.Sc</label></td>
											  <td width="238"><label>2 years</label></td>
											  <td width="238"><label>JAM</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Master of Arts-MA in Development Studies</label></td>
											  <td width="238"><label>2 years</label></td>
											  <td width="238"><label>Entrance Test</label></td>
									  </tr>
									  <tr>
											  <td width="218"><label>Ph.D Programmes</label></td>
											  <td width="238"><label>All Departments & Centers</label></td>
											  <td width="238"><label>All Departments & Centers</label></td>
									  </tr>
									 </table>
									  <tr>
										<td height="32" align="left"class="aa" ><b>Department</b></td>
									  </tr>
										<tr>
										<td height="32" align="left"class="aa" >Please Select your choices:</td>
										</tr>
										<tr>
										<td align="left" nowrap>
										  <p>
											<input type="checkbox" name="btech" id="btech" onClick="activate_btech(this)" value="1" <% if(progs[1]==1)out.println("checked"); %>>
											<label for="btech" class="aa" >B.Tech.</label>
										</p>
										  <table border="1" align="center" id="btech_table"class="aa" >
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
									  <td><label><input type="checkbox" name="btech_chkbox" value="10" <% if(deps[10]==1)out.println("checked"); %>id="btech_chkbox_10">
										  Electronics and Electrical Engineering
									  </label>
									  </td>
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
										  <label class="aa" >
											<br>
											<input type="checkbox" name="bdes" value="11" id="btech_chkbox_4" <% if(progs[2]==1)out.println("checked"); %>>
								B.Des.</label>
										  <p>
											<input type="checkbox" name="mtech" id="mtech" onClick="activate_mtech(this)" value="1" <% if(progs[3]==1)out.println("checked"); %>>
											<label for="mtech" class="aa" >M.Tech.</label>
										  </p>
										  <table border="1" name="mtech_table" id="mtech_table"class="aa" >
											<tr>
											  <td width="233">Biotechnology</td>
											  <td width="100%"><p>
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
								<!--
									<label>
									<input type="checkbox" name="mtech_chkbox" value="25" <% if(deps[25]==1)out.println("checked"); %> id="mtech_chkbox_1">
									Petroleum Refinery Engineering</label>
													<br>
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
									  <td>
									  <input type="checkbox" name="mtech_chkbox" value="19" <% if(deps[19]==1)out.println("checked"); %> id="mtech_chkbox_2">
									  <label>Structural Engineering</label>
									  <br>
									  <input type="checkbox" name="mtech_chkbox" value="20" <% if(deps[20]==1)out.println("checked"); %> id="mtech_chkbox_3">
									  <label>Water Resources Engineering and Management</label>
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
											</tr>
											<tr>
									<td>
										  Electronics & Electrical Engineering
									</td>
									<td>
										<label><input type="checkbox" name="mtech_chkbox" value="14" <% if(deps[14]==1)out.println("checked"); %> id="mtech_chkbox_9">Signal Processing</label>
										  <br/>
										<label><input type="checkbox" name="mtech_chkbox" value="15" <% if(deps[15]==1)out.println("checked"); %> id="mtech_chkbox_10">VLSI</label>
										  <br/>
										<label><input type="checkbox" name="mtech_chkbox" value="45" <% if(deps[45]==1)out.println("checked"); %> id="mtech_chkbox_11">
										  Power and Control</label>
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
										  <label class="aa" >
											<br>
											<input type="checkbox" name="mdes" value="26" id="mtech_chkbox_14" <% if(progs[4]==1)out.println("checked"); %>>
											M.Des.</label>
										  <p>
											<input type="checkbox" name="msc" id="msc" onClick="activate_msc(this)" value="1" <% if(progs[5]==1)out.println("checked"); %>>
											<label class="aa" for="msc">M.Sc.</label>
										  </p>
										  <table width="200" border="1" id="msc_table" name="msc_table">
											<tr>
											  <td><p>
												<label class="aa">
												  <input type="checkbox" name="msc_chkbox" value="27" <% if(deps[27]==1)out.println("checked"); %> id="msc_chkbox_0">
												  Mathematics & Computing</label>
												<br>
												<br>
											  </p></td>
											</tr>
											<tr>
											  <td><label class="aa">
												<input type="checkbox" name="msc_chkbox" value="28" <% if(deps[28]==1)out.println("checked"); %> id="msc_chkbox_1">
												Physics</label></td>
											</tr>
											<tr>
											  <td><label class="aa">
												<input type="checkbox" name="msc_chkbox" value="29" <% if(deps[29]==1)out.println("checked"); %> id="msc_chkbox_2">
												Chemistry</label></td>
											</tr>
										  </table>
										  <p>
											<input name="ma" type="checkbox" id="ma" value="30" <% if(progs[6]==1)out.println("checked"); %>>
											<label class="aa" for="MA">M.A. in Development Studies</label>
										  </p>
										  <p>
											<input type="checkbox" name="phd" id="phd" onClick="activate_phd(this)" value="1" <% if(progs[7]==1)out.println("checked"); %>>
											<label for="phd" class="aa">Ph.D.</label>
									</p>

										  <table class="aa" width="450" border="1" id="phd_table" name="phd_table">
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
												<br>
										      </td>
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
											  <td> <label>
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
										     <td><input name="cpi_minor" type="text" id="cpi_minor" value="<%=cpi_minor_table%>" size="10" onkeypress="return alpha(event);">
										  (on scale of 0-10)</td>
										    </tr>
										    <tr>
										     <td height="32" ><div style="font-size:12px;color:red;">(Enter minimum CPI for students eligible though minor courses)</div></td>
										     <td>
										                     
										      </td>
										    </tr>
										  </table>


										  <table border="1" align="center" id="btech_table1" class="aa">
										  <tr><td class="aa">Major Department</td><td class="aa">Minor Department</td></tr>

										  <%
										  String dep_fullnames[]={"Computer Science & Engineering", "Electronics & Communication Engineering", "Mechanical Engineering", "Civil Engineering", "Biotechnology","Chemical Engineering","Mathematics & Computing" , "Engineering Physics","Chemical Science and Technology","Electronics and Electrical Engineering","Design(B.Des)" };
										  String dep_names[]={"CSE", "ECE", "ME", "Civil", "BT", "Chem", "MnC", "EP", "CST", "EEE","Design"};
										  for(int k=0;k<=10;k++)
										  {
										  String str1="btech_major_chkbox_"+(k+1);
										  %>
										  <tr>
										  <td class="aa">
										  <label>
										  <input type="checkbox" name='<%=str1%>' value='<%=(k+1)%>' <% if(major[k]==1)out.println("checked"); %> id='<%=str1%>'>
										  <%out.println(dep_fullnames[k]);%>
										  </label>
									      </td>
											<td class="aa">
											<table class="aa">
											<tr>
											<%
											
											for(int i=0;i<=10;i++)
											{
											if(k!=i)
											{
											String str= "btech_minor_chkbox_"+(k+1)+"_"+(i+1);
											%>
										  <td class="aa">
										  <table class="aa">
										  <tr>
										  <td class="aa">
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
									<p align="center">
									  <input type="submit" name="submit" id="submit" value="Submit">
									</p>
								 </td>

							  </tr>
							  </td>
							</table>
	    </form>
      
      
</ul></div></div>
<div class="clear"><!-- Footer -->
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
<!-- Scripts -->
<script src="../../js/jquery-latest.min.js"></script>
<script src="../../js/jquery-ui.min.js"></script>
<script>window.jQuery || document.write('<script src="../layout/scripts/jquery-latest.min.js"><\/script>\
<script src="../layout/scripts/jquery-ui.min.js"><\/script>')</script>
<script>jQuery(document).ready(function($){ $('img').removeAttr('width height'); });</script>
<script src="../../layout/scripts/jquery-mobilemenu.min.js"></script>
<script src="../../layout/scripts/custom.js"></script>
<script type="text/javascript">
var sprytextarea1 = new Spry.Widget.ValidationTextarea("sprytextarea1", {validateOn:["blur"], hint:"min. 10 chars", minChars:10});
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "none", {validateOn:["blur"]});
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2", "none", {validateOn:["blur"]});
var sprytextfield3 = new Spry.Widget.ValidationTextField("sprytextfield3", "real", {minValue:0, maxValue:10, validateOn:["blur"]});
var sprytextfield4 = new Spry.Widget.ValidationTextField("sprytextfield4", "integer", {hint:"int value", validateOn:["blur"], maxValue:100, minValue:1});
var sprytextfield5 = new Spry.Widget.ValidationTextField("sprytextfield5", "integer", {validateOn:["blur"], hint:"int value", minValue:1, maxValue:100});
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1", {validateOn:["blur"]});
</script>
</body>
</html>
