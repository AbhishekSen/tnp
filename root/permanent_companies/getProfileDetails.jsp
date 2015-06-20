<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
    
    <head>
        <title>Company Profile</title>
	  <script language="javascript">
	  function printpage()
	  {
	  document.getElementById("print").style.display='none';
	  document.getElementById("print1").style.display='none';
	  //document.getElementById("back").style.display='none';
	  window.print();
	  }


	  </script>

 <%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />


<%@ include file="../utils/sql_convert_date.jsp"%>
<%@ include file="../utils/session_validator.jsp"%>


<%@ page language="java" import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>

<%@ include file="../utils/get_unique_field.jsp"%>
<%@ include file="../utils/encode_sql.jsp"%>
<%@ include file="../utils/table.jsp"%>
<%@ include file="../utils/drop_down.jsp"%>
<%@ include file="../utils/drop_down2.jsp"%>


        <style type="text/css">
            
            body{
                
                margin:0 0 0 0;
                font-family:arial;
                
                
            }
            .wrraper{
                
                width:100%;
                height:auto;
                
            }
            .head1{
                width:100%;
                height:100px;
                /*border:1px solid red;*/
                background:#FBCDF9;
                
            }
            .wrapper1{
                
                width:980px;
               /* height:700px;*/
                margin-top:-100px;
               /* border:1px solid green;*/
                margin-right:auto;
                margin-left:auto;
                
            }
            
            .logo{
                
                float:left;
                
                width:978px;
                /*height:100px;*/
               
                /*background:#cccccc;*/
                
            }
            
            .mid_cont{
                
                float:left;
               /* height:500px;*/
                width:978px;
               /* border:1px solid black;*/
                background:#F2F8FC;
                border-top:2px solid black;
            }
            .footer{
                
                float:left;
                height:50px;
                width:978px;
               /* border:1px solid black; */
                background:#F2F8FC;
            }
            .row{
                
                float:left;
                width:978px;
                /*height:125px;*/
                /*background:#E8F3FA;*/
                margin-top:6px;
                
            }
            .r_blnk{
                
                float:left;
                width:840px;
              /*  height:120px;*/
              /*  border:1px solid yellow;*/
                
            }
            .pht{
                
                float:left;
                width:120px;
                height:116px;
                border:2px solid #000000;    
            }
            .txt_hdr{
                
              
               
            }
            .txt_hdr_st{
                
                font-size:18px;
                color:#FFFFFF;
                background:#000000;
                width:380px;
                font-weight:bold;
                margin-top:10px;
                margin-left:300px;
                text-align:center;
                 
            }
            .text{
                
                float:left;
                width:820px;
                /*height:35px;*/
               /* border:1px solid blue;*/
              
            }
            
            .left_text{
                
                float:left;
                width:200px;
                height:30px;
               /* background:#83F79E;*/
                padding-left:20px;
                line-height:30px;
                font-size:16px;
                font-weight:bold;
                
                
                
            }
            .right_text{
                
                float:left;
                width:600px;
                height:30px;
               /* background:#F7CF83;*/
                line-height:30px;
                font-size:16px;
                
            }
            .bld_inp{
                
                margin-left:10px;
                letter-spacing:3px;
                
            }
            
            .row ul{
                
               
                list-style:disc;
                
            }
            .row ul li{
                
                font-size:16px;
                /*font-weight:bold;*/
                line-height:30px;
                text-align:justify;
                padding-right:20px;
                
            }
            .lg_img{
                
                float:left;
                width:120px;
                height:100px;
                /*border:1px solid red;*/
                background:#0DF529;
            }
            .lg_txt{
                
                float:left;
                width:600px;
                height:100px;
               /* border:1px solid black;*/
                
                
            }
            
            table
            {
                border-collapse:collapse;
                font-size:11px;
            }
            table, td, th
            {
                border:1px solid black;
                padding-left:5px;
            
            }   

            
        </style>
        
        
    </head>
    <body>
<%
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");		
%>
<%
	db.fetchConfigDetails();
	int agencyId,packageId;
	String company_name, company_address, company_website, ppt, company_fax, company_category, sector, head_hr_name, fcp_name,scp_name, head_hr_phone, fcp_phone, scp_phone, head_hr_mobile, fcp_mobile,scp_mobile,head_hr_email,fcp_email,scp_email, ctc_btech, ctc_bdes, ctc_mtech, ctc_mdes, ctc_msc, ctc_ma, ctc_phd, gross_btech, gross_bdes,  gross_mtech, gross_mdes, gross_msc, gross_ma, gross_phd, job_designation, bond_details, location_of_posting, shortlist_from_resume, technical_test, aptitude_test, gd,cpi, x_percentage, xii_percentage, other_criteria, other_requirements, number_of_rooms, number_of_executives ;

	shortlist_from_resume = "N.A.";
	technical_test = "N.A.";
	aptitude_test = "N.A.";
	gd = "N.A.";
	ppt = "N.A.";
	x_percentage = "N.A.";
	xii_percentage = "N.A.";
	other_criteria = "N.A.";
	other_requirements = "N.A.";
	number_of_rooms = "N.A.";
	number_of_executives = "N.A.";
	

	company_name = "NA";
	company_address = "NA";
	company_website = "NA";
	company_fax = "NA";
	company_category = "NA";
	sector = "NA";
	
	head_hr_name = "NA";
	fcp_name = "NA";
	scp_name = "NA";
	
	head_hr_phone = "NA";
	fcp_phone = "NA";
	scp_phone = "NA";

	head_hr_mobile = "NA";
	fcp_mobile = "NA";
	scp_mobile = "NA";

	head_hr_email = "NA";
	fcp_email = "NA";
	scp_email = "NA";
	
	agencyId = 0;
	packageId = 0;
	if(request != null)
	{
		agencyId = Integer.parseInt(request.getParameter("company_name").trim());
		packageId = Integer.parseInt(request.getParameter("profile_name").trim());
		//response.setParameter("company_name",agencyId);
		//response.setParameter("profile_name",packageId);
	}

	System.out.println("AgencyId: "+agencyId+"PackageId: "+packageId);

	String sql_agency_details="select agency_id,agency_name,nature_business,agency_website,agency_profile,aptitude_test,gd,interview, no_of_rooms, no_of_rounds, no_of_executive, ppt, gd, technical_test, agency_person, agency_email, agency_address, agency_phone, agency_fax, agency_mobile, category, sector, head_hr_name, head_hr_email, head_hr_phone, head_hr_mobile, head_hr_fax, scp_name, scp_email, scp_phone, scp_mobile, fcp_designation, head_hr_designation from agency where agency_id = "+agencyId+";";

	int temp = 0;

	db.connect();
	ResultSet rs= db.execSQL(sql_agency_details);
	if(rs.next())
	{
		company_name = rs.getString("agency_name");
		company_address = rs.getString("agency_address");
		company_website = rs.getString("agency_website");
		company_fax = rs.getString("agency_fax");
		company_category = rs.getString("category");
		sector = rs.getString("sector");
		
		head_hr_name = rs.getString("head_hr_name");
		fcp_name = rs.getString("agency_person");
		scp_name = rs.getString("scp_name");

		head_hr_phone = rs.getString("head_hr_phone");
		fcp_phone = rs.getString("agency_phone");
		scp_phone = rs.getString("scp_phone");
		
		head_hr_mobile = rs.getString("head_hr_mobile");
		fcp_mobile = rs.getString("agency_mobile");
		scp_mobile = rs.getString("scp_mobile");
		
		head_hr_email = rs.getString("head_hr_email");
		fcp_email = rs.getString("agency_email");
		scp_email = rs.getString("scp_email");
		number_of_executives = rs.getString("no_of_executive");

		number_of_rooms = rs.getString("no_of_rooms");
		temp = Integer.parseInt(rs.getString("ppt"));
		if(temp > 0)
		{
			ppt = "Yes";
			temp = 0;
		}
		temp = Integer.parseInt(rs.getString("gd"));
		if(temp > 0)
		{
			gd = "Yes";
			temp = 0;
		}
		temp = rs.getInt("technical_test");
		if(temp > 0)
		{
			technical_test = "Yes";
			temp = 0;
		}
		temp = Integer.parseInt(rs.getString("aptitude_test"));
		if(temp > 0)
		{
			aptitude_test = "Yes";
			temp = 0;
		}
		
	}
	rs.close();
	String sql_package_details = "select bond,bond_details,job_designation,location_of_posting,ctc,ctc_mtech,ctc_msc,ctc_ma,ctc_phd,gross,gross_mtech,gross_msc,gross_ma,gross_phd,x_percentage,xii_percentage,cpi,cpi_other from package_details where package_id="+packageId+";";

	

	int bond = 0;
	
	cpi = "N.A.";
	ctc_btech = "NA";
	ctc_bdes = "NA";
	ctc_mtech = "NA";
	ctc_mdes = "NA";
	ctc_msc = "NA";
	ctc_ma = "NA";
	ctc_phd = "NA";

	gross_btech = "NA";
	gross_bdes = "NA";
	gross_mtech = "NA";
	gross_mdes = "NA";
	gross_msc = "NA";
	gross_ma = "NA";
	gross_phd = "NA";

	job_designation = "N.A.";
	bond_details = "N.A.";
	location_of_posting = "N.A.";

	db.connect();
	rs= db.execSQL(sql_package_details);
	if(rs.next())
	{
		ctc_btech = rs.getString("ctc");
		ctc_bdes = rs.getString("ctc");
		ctc_mtech = rs.getString("ctc_mtech");
		ctc_mdes = rs.getString("ctc_mtech");
		ctc_msc = rs.getString("ctc_msc");
		ctc_ma = rs.getString("ctc_ma");
		ctc_phd = rs.getString("ctc_phd");

		gross_btech = rs.getString("gross");
		gross_bdes = rs.getString("gross");
		gross_mtech = rs.getString("gross_mtech");	
		gross_mdes = rs.getString("gross_mtech");
		gross_msc = rs.getString("gross_msc");
		gross_ma = rs.getString("gross_ma");
		gross_phd = rs.getString("gross_phd");	

		x_percentage = rs.getString("x_percentage");
		xii_percentage = rs.getString("xii_percentage");
		cpi = rs.getString("cpi");
		other_criteria = rs.getString("cpi_other");
		
		bond = 0;
		bond = rs.getInt("bond");
		job_designation = rs.getString("job_designation");
		location_of_posting = rs.getString("location_of_posting");

		if(bond > 0)
			bond_details = rs.getString("bond_details");

		
	}
	
	rs.close(); 

	String eligible_departments = "N.A.";

	String sql_eligible_department = "select programme_name from package_extra_details,prog_record where (package_extra_details.program_index = prog_record.prog_id) && package_id ="+packageId+";";

	db.connect();
	eligible_departments = make_list(sql_eligible_department,db);
	rs.close();

	String eligible_minor_department = "N.A.";
	String sql_eligible_minor_department = "select major,minor from minor_details where package_id = "+packageId+";";

	db.connect();
	eligible_minor_department = make_minor_list(sql_eligible_minor_department, db);
	rs.close();


	
	String agency_pay_mode = "N.A.";

	String sql_agency_pay_mode = "select pay_mode from agency_currency where package_id = " + packageId + ";";
	db.connect();
	rs= db.execSQL(sql_agency_pay_mode);
	if(rs.next())
	{
		agency_pay_mode = rs.getString("pay_mode");
	}
	rs.close();
	db.close();
     %>
        <div class="wrraper">
            <div class="head1">
            </div>    
            <div class="wrapper1">
                <div class="logo">
                    <div class="lg_img">
			<img src="../images/iitg_web_mid.gif" width="119" height="99">
			
                    </div>
                    <div class="lg_txt">
                        <div style="font-size:24px;font-weight:bold;padding-left:10px;">TRAINING & PLACEMENT CELL</div>
                        <div style="font-size:18px;font-weight:bold;padding-left:10px;line-height:30px;">INDIAN INSTITUTE OF TECHNOLOGY GUWAHATI </div>
                        <div style="font-size:18px;font-weight:bold;padding-left:10px;line-height:30px;">GUWAHATI-781039</div>
                    </div>
                    <div style="float:left;width:200px;height:80px; font-size:14px;margin-top:10px;">
                        <b>Company Id:</b><b>&nbsp;&nbsp;<%=agencyId %></b>
                        <br/>
                        <br/>
                        <input align="center" type="button" id="print" value="PRINT" onclick="printpage();" />
                    </div> 
                </div>
                <div class="mid_cont">
                    <div class="row" style="margin-top:10px;">
                        <div class="r_blnk">
                            <div class="txt_hdr">
                               <div class="txt_hdr_st">Job Announcement Form</div>
                            </div>
                            <div class="text" style="margin-top:52px;">
  
                        </div>

                        <div class="text">
                                <div class="left_text">
                                    Company name
                                </div>
                                <div class="right_text">
                                    <b>:</b><b class="bld_inp"><%=company_name%></b>
                                </div>    
                        </div>  
                    </div>


                    <div class="row">
                        <div class="text">
                                <div class="left_text">
                                 Company Address
                                </div>
                                <div class="right_text" style="height:auto;">
                                    <p style="margin-top:0px;padding-top:2px;font-size:14px;">:&nbsp;&nbsp;<%=company_address%>&nbsp;</p>
                                </div>    
                        </div>  
                    </div>

                    <div class="row">
                        <div class="text">
                                <div class="left_text">
                                    Website
                                </div>
                                <div class="right_text">
                                    <b>:</b><u class="bld_inp"><%=company_website%></u>
                                </div>    
                        </div>  
                    </div>



                    <div class="row">
                        <div class="text">
                                <div class="left_text">
                                    Fax
                                </div>
                                <div class="right_text">
                                    <b>:</b>&nbsp;&nbsp;<%=company_fax%>
                                </div>    
                        </div>  
                    </div>

                    <div class="row">
                        <div class="text">
                                <div class="left_text">
                                   Category
                                </div>
                                <div class="right_text">
                                    <b>:</b><b class="bld_inp"><%=company_category%></b>
                                </div>    
                        </div>  
                    </div>

                    <div class="row">
                        <div class="text">
                                <div class="left_text">
                                   	Sector
                                </div>
                                <div class="right_text">
                                    <b>:</b><b class="bld_inp"><%=sector%></b>
                                </div>    
                        </div>  
                    </div>
                   

<div class="row" style="width:100%;">
	<h3>&nbsp;&nbsp;Contact Details:</h3>
</div>

<div class="row" style="height:20px width:100%;">
	<div class="text" style="width:970px;">
		<div class="right_text" style="height:auto; width:910px;" >
			<table width="900px" class="tab" align="center">
				<tr>
					<th width="16%" align ="center">&nbsp;&nbsp;&nbsp;</th>					<th width="28%" align="center">Head HR</th>
					<th width="28%" align = "center">First Contact Person</th>
					<th width="28%" align="center">Second Contact Person</th>				</tr>
				<tr>
					<td align="center"><b>Name</b></td>
					<td align="center"><%=head_hr_name%></td>
					<td align="center"><%=fcp_name%></td>
					<td align="center"><%=scp_name%></td>
				</tr>
				<tr>
					<td align="center"><b>Phone</b></td>
					<td align="center"><%=head_hr_phone%></td>
					<td align="center"><%=fcp_phone%></td>
					<td align="center"><%=scp_phone%></td>
				</tr>
				<tr>
					<td align="center"><b>Mobile</b></td>
					<td align="center"><%=head_hr_mobile%></td>
					<td align="center"><%=fcp_mobile%></td>
					<td align="center"><%=scp_mobile%></td>
				</tr>
				<tr>
					<td align="center"><b>Email</b></td>
					<td align="center"><%=head_hr_email%></td>
					<td align="center"><%=fcp_email%></td>
					<td align="center"><%=scp_email%></td>
				</tr>                                        
			</table>
		</div>    
	</div>  
</div>





<div class="row" style="height:20px width:100%;">
	<h3>&nbsp;&nbsp;Job Profile:</h3>
</div>

<div class="row" style="width:100%;">
	<div class="text" style="width:970px;">
		<div class="right_text" style="height:auto; width:910px;" >
			<table width="900px" class="tab" align="center">
				<tr>
					<th width="16%" align ="center">Currency: <%=agency_pay_mode%></th>					<th width="12%" align="center">B.Tech.</th>
					<th width="12%" align = "center">B.Des.</th>
					<th width="12%" align="center">M.Tech.</th>
					<th width="12%" align="center">M.Des.</th>
					<th width="12%" align="center">M.Sc.</th>
					<th width="12%" align="center">M.A.</th>
					<th width="12%" align="center">Ph.D</th>
				</tr>
				<tr>
					<td align="center"><b>Cost to Company (CTC)</b></td>
					<td align="center"><%=ctc_btech%></td>
					<td align="center"><%=ctc_bdes%></td>
					<td align="center"><%=ctc_mtech%></td>
					<td align="center"><%=ctc_mdes%></td>
					<td align="center"><%=ctc_msc%></td>
					<td align="center"><%=ctc_ma%></td>
					<td align="center"><%=ctc_phd%></td>
				</tr>
				<tr>
					<td align="center"><b>Gross</b></td>
					<td align="center"><%=gross_btech%></td>
					<td align="center"><%=gross_bdes%></td>
					<td align="center"><%=gross_mtech%></td>
					<td align="center"><%=gross_mdes%></td>
					<td align="center"><%=gross_msc%></td>
					<td align="center"><%=gross_ma%></td>
					<td align="center"><%=gross_phd%></td>
				</tr>
			</table>
		</div>    
	</div>  
</div>
<div class="row" sytle = "height:20px">
	&nbsp;&nbsp;Bond : <%=bond_details %>
</div>


<div class="row" style="width:100% height:20px;">
	<h3>&nbsp;&nbsp;Selection Process:</h3>
</div>

<div class="row" style="width:100%;">
	<div class="text" style="width:970px;">
		<div class="right_text" style="height:auto; width:910px;" >
			<table width="900px" class="tab" align="center">
				<tr>
					<td align="center" width="28%">Shortlist from Resumes:&nbsp;&nbsp;<%= shortlist_from_resume%></td>
					<td align="center" width="24%">Written Test: &nbsp;&nbsp;<%=aptitude_test%></td>
					<td align="center" width="24%">GD :&nbsp;&nbsp; <%=gd%></td>
					<td align="center" width="24%">Online Test : &nbsp;&nbsp;<%=technical_test%></td>
				</tr>
				<tr>
					<td align="center"><b>Eligibility Criteria</b></td>
					<td align="center"colspan="3">CPI :&nbsp;&nbsp; <%=cpi%>&nbsp;/&nbsp;10&nbsp;&nbsp; |&nbsp;&nbsp; Xth : &nbsp;&nbsp;<%=x_percentage%>&nbsp; % &nbsp;&nbsp;| &nbsp;&nbsp; XIIth : <%=xii_percentage%> &nbsp; % &nbsp;&nbsp;|&nbsp;&nbsp;Other Criteria : &nbsp;&nbsp;&nbsp;<%=other_criteria %></td>
				</tr>                                      
				<tr>
					<td align="center"><b>Logistics Requirements </b></td>
					<td align="center" colspan="3">PPT :&nbsp;&nbsp;<%=ppt%>&nbsp; | &nbsp;&nbsp;Room : &nbsp;&nbsp; <%=number_of_rooms%>&nbsp; | &nbsp;&nbsp; Executives : &nbsp;&nbsp;<%=number_of_executives%>&nbsp;&nbsp; | &nbsp;&nbsp; Other requirements : &nbsp;&nbsp;<%=other_requirements%></td>
				</tr>
			</table>
		</div>    
	</div>  
</div>




<div class="row" style="height:20px width:100%;">
	Eligible Departments :
</div>

<div class="row" style="width:100%;">
	<div class="text" style="width:970px;">
		<div class="right_text" style="height:auto; width:910px;" >
			<table width="900px" class="tab" align="center">
				<tr>
					<th width = "60%">
						General
					</th>
					<th width = "40%">
						Minor
					</th>
				</tr>
				<tr>
					<td align = "center">
						<%=eligible_departments%>
					</td>
					<td align = "center">
						<%=eligible_minor_department %>
					</td>
				</tr>
			</table>
		</div>    
	</div>  
</div>



                    </div>
                    
                </div>
                <div class="footer">
                    <div class="row" style="margin-top:5px;border-top:2px solid black;">
                        <div style="text-align:center;font-size:14px;line-height:30px;">Phone:  +91 361 2582175,  Fax: +91 361 2690762,  E-mail: placement@iitg.ernet.in</div>
                    </div>
		    <form>
		    <input align="center" id="print1" type="button" value="PRINT" onclick="printpage();">          
		    </form>
                </div>    
            </div>
        ,</div>
    </body>     
</html>


