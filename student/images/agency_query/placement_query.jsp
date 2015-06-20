<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>GCom-The IIT Guwahati Community. Enjoy!</title>
<link rel="stylesheet" href="../css/emx_nav_left.css" type="text/css">
<%@page language="java" import="pack.DbBean"%>

<jsp:useBean id="db" class="pack.DbBean" scope="session" />
<%@ include file="../utils/sql_convert_date.jsp"%>

<%@ include file="../utils/session_validator.jsp"%>
<%@page language="java" import="java.sql.*,java.util.*,java.text.*,java.lang.*"%>
<%@ include file="../utils/encode_sql.jsp"%>

<%
        db.fetchConfigDetails(); //newly added
	String sid = null; 
	sid = request.getSession(false).getId() ;
	if (session_validate(sid,db).equals("true") ) 
		response.sendRedirect("../../logout.jsp");
	String student_roll_number="";
	String student_id="0";
	String username="";
	db.connect();
	ResultSet rsac=db.execSQL("select username from session where session_id='"+sid+"'");
	rsac.next();
	username=rsac.getString(1);
	rsac.close();
	ResultSet rsad=db.execSQL("select student_id,student_roll_number from student_record where username='"+username+"';");
	rsad.next();
	student_id=rsad.getString("student_id");
	student_roll_number=rsad.getString("student_roll_number");
	rsad.close();
	db.close();
%>


<%
	//inserting into interesting_students table
	String[] agency_ids=request.getParameterValues("agency_id");
	String submit=request.getParameter("submit");
	
	if(submit!=null)
	{
		db.connect();
		
		int i_ag=db.updateSQL("delete from interested_students where student_id='"+student_id+"';");
		int i_id=0;
		//if(agency_ids!=null)
		//out.println("\n"+agency_ids.length+"\n");
		while(agency_ids!=null && i_id<agency_ids.length)
		{
			i_ag*=db.updateSQL("insert into interested_students(agency_id,student_id) values ('"+agency_ids[i_id++]+"','"+student_id+"');");
		}
		db.close();
	}
	
%>
<style type="text/css">

#evtcal a:link {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}		/* unvisited link */
#evtcal a:visited {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}	/* visited link */
#evtcal a:hover {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: underline;}	/* mouse over link */
#evtcal a:active {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}		/* selected link */

</style>
	<%
		int rows=0;
		String sql_count="select count(*) from schedule ;" ;
		db.connect();
		ResultSet rs5= db.execSQL(sql_count);
		if(rs5.next()) 
		{
		rows= rs5.getInt(1);
		}
		
		rs5.close();
		db.close();
		
		//out.println(rows);
		
		String[][] db_events = new String[rows][11];
		String sql_schedule="select * from schedule ;" ;
		db.connect();
		ResultSet res5= db.execSQL(sql_schedule);
		int i5=0;
		while(res5.next()) 
		{

		db_events[i5][0]=res5.getString("recurring");
		db_events[i5][1]=res5.getString("month");
		db_events[i5][2]=res5.getString("day");
		db_events[i5][3]=res5.getString("year");
		db_events[i5][4]=res5.getString("starting_time");
		db_events[i5][5]=res5.getString("end_time");
		db_events[i5][6]=res5.getString("company_name");
		db_events[i5][7]=res5.getString("description");
		db_events[i5][8]=res5.getString("venue");
		db_events[i5][9]=res5.getString("eligibility_criteria");
		db_events[i5][10]=res5.getString("departments");//.replaceAll("\n",">>");
		i5++;
//out.println(i);
		}
		res5.close();
		db.close();
		
		
		
		//out.println(rows);

		
%>
<script type="text/javascript" language="JavaScript">



function arrays()
{
events = new Array(8);
for (i = 0; i < events.length; ++ i)
	events [i] = new Array (8);
}
arrays();

function access()
{
<%
	for(int j5=0;j5<rows;j5++)
	{
		for(int k5=0;k5<11;k5++)
		{
			out.println("events["+j5+"]["+k5+"]=\""+db_events[j5][k5].replaceAll("\n",">>")+"\";");
		}
		out.println("");
	}
%>


}
access();




/* Preload images script */
var myimages=new Array()

function preloadimages(){
	for (i=0;i<preloadimages.arguments.length;i++){
		myimages[i]=new Image();
		myimages[i].src=preloadimages.arguments[i];
	}
}


/* The path of images to be preloaded inside parenthesis: (Extend list as desired.) */
preloadimages("../images/PrevYrOff40x40.jpg","../images/PrevYrOn40x40.jpg","../images/PrevMoOff40x40.jpg","../images/PrevMoOn40x40.jpg","../images/NextYrOff40x40.jpg","../images/NextYrOn40x40.jpg","../images/NextMoOff40x40.jpg","../images/NextMoOn40x40.jpg");


/***************************************************************************************
	JavaScript Calendar - Digital Christian Design
	//Script featured on and available at JavaScript Kit: http://www.javascriptkit.com
	// Functions
		changedate(): Moves to next or previous month or year, or current month depending on the button clicked.
		createCalendar(): Renders the calander into the page with links for each to fill the date form filds above.
			
***************************************************************************************/

var thisDate = 1;							// Tracks current date being written in calendar
var wordMonth = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
var today = new Date();							// Date object to store the current date
var todaysDay = today.getDay() + 1;					// Stores the current day number 1-7
var todaysDate = today.getDate();					// Stores the current numeric date within the month
var todaysMonth = today.getUTCMonth() + 1;				// Stores the current month 1-12
var todaysYear = today.getFullYear();					// Stores the current year
var monthNum = todaysMonth;						// Tracks the current month being displayed
var yearNum = todaysYear;						// Tracks the current year being displayed
var firstDate = new Date(String(monthNum)+"/1/"+String(yearNum));	// Object Storing the first day of the current month
var firstDay = firstDate.getUTCDay();					// Tracks the day number 1-7 of the first day of the current month
var lastDate = new Date(String(monthNum+1)+"/0/"+String(yearNum));	// Tracks the last date of the current month
var numbDays = 0;
var calendarString = "";
var eastermonth = 0;
var easterday = 0;


function changedate(buttonpressed) {
	if (buttonpressed == "prevyr") yearNum--;
	else if (buttonpressed == "nextyr") yearNum++;
	else if (buttonpressed == "prevmo") monthNum--;
	else if (buttonpressed == "nextmo") monthNum++;
	else  if (buttonpressed == "return") { 
		monthNum = todaysMonth;
		yearNum = todaysYear;
	}

	if (monthNum == 0) {
		monthNum = 12;
		yearNum--;
	}
	else if (monthNum == 13) {
		monthNum = 1;
		yearNum++
	}

	lastDate = new Date(String(monthNum+1)+"/0/"+String(yearNum));
	numbDays = lastDate.getDate();
	firstDate = new Date(String(monthNum)+"/1/"+String(yearNum));
	firstDay = firstDate.getDay() + 1;
	createCalendar();
	return;
}


function easter(year) {
// feed in the year it returns the month and day of Easter using two GLOBAL variables: eastermonth and easterday
var a = year % 19;
var b = Math.floor(year/100);
var c = year % 100;
var d = Math.floor(b/4);
var e = b % 4;
var f = Math.floor((b+8) / 25);
var g = Math.floor((b-f+1) / 3);
var h = (19*a + b - d - g + 15) % 30;
var i = Math.floor(c/4);
var j = c % 4;
var k = (32 + 2*e + 2*i - h - j) % 7;
var m = Math.floor((a + 11*h + 22*k) / 451);
var month = Math.floor((h + k - 7*m + 114) / 31);
var day = ((h + k - 7*m +114) % 31) + 1;
eastermonth = month;
easterday = day;
}


function createCalendar() {
	calendarString = '';
	var daycounter = 0;
	calendarString += '<table width="312" border="1" cellpadding="0" cellspacing="1">';
	calendarString += '<tr>';
	calendarString += '<td align=\"center\" valign=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.PrevYr.src=\'../images\/PrevYrOn40x40\.jpg\';\" onMouseOut=\"document.PrevYr.src=\'../images\/PrevYrOff40x40\.jpg\';\" onClick=\"changedate(\'prevyr\')\"><img name=\"PrevYr\" src=\"../images\/PrevYrOff40x40\.jpg\" width=\"40\" height=\"40\" border=\"0\" alt=\"Prev Yr\"\/><\/a><\/td>';
	calendarString += '<td align=\"center\" valign=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.PrevMo.src=\'../images\/PrevMoOn40x40\.jpg\';\" onMouseOut=\"document.PrevMo.src=\'../images\/PrevMoOff40x40\.jpg\';\" onClick=\"changedate(\'prevmo\')\"><img name=\"PrevMo\" src=\"../images\/PrevMoOff40x40\.jpg\" width=\"40\" height=\"40\" border=\"0\" alt=\"Prev Mo\"\/><\/a><\/td>';
	calendarString += '<td bgcolor=\"#C8C896\" align=\"center\" valign=\"center\" width=\"128\" height=\"40\" colspan=\"3\"><b>' + wordMonth[monthNum-1] + '&nbsp;&nbsp;' + yearNum + '<\/b><\/td>';
	calendarString += '<td align=\"center\" valign=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.NextMo.src=\'../images\/NextMoOn40x40\.jpg\';\" onMouseOut=\"document.NextMo.src=\'../images\/NextMoOff40x40\.jpg\';\" onClick=\"changedate(\'nextmo\')\"><img name=\"NextMo\" src=\"../images\/NextMoOff40x40\.jpg\" width=\"40\" height=\"40\" border=\"0\" alt=\"Next Mo\"\/><\/a><\/td>';
	calendarString += '<td align=\"center\" valign=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.NextYr.src=\'../images\/NextYrOn40x40\.jpg\';\" onMouseOut=\"document.NextYr.src=\'../images\/NextYrOff40x40\.jpg\';\" onClick=\"changedate(\'nextyr\')\"><img name=\"NextYr\" src=\"../images\/NextYrOff40x40\.jpg\" width=\"40\" height=\"40\" border=\"0\" alt=\"Next Yr\"\/><\/a><\/td>';
	calendarString += '<\/tr>';
	calendarString += '<tr>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Sun<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Mon<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Tue<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Wed<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Thu<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Fri<\/td>';
	calendarString += '<td bgcolor=\"#DDDDDD\" align=\"center\" valign=\"center\" width=\"40\" height=\"22\">Sat<\/td>';
	calendarString += '<\/tr>';

	thisDate == 1;

	for (var i = 1; i <= 6; i++) {
		calendarString += '<tr>';
		for (var x = 1; x <= 7; x++) {
			daycounter = (thisDate - firstDay)+1;
			thisDate++;
			if ((daycounter > numbDays) || (daycounter < 1)) {
				calendarString += '<td align=\"center\" bgcolor=\"#888888\" height=\"30\" width=\"40\">&nbsp;<\/td>';
			} else {
				if (checkevents(daycounter,monthNum,yearNum,i,x) || ((todaysDay == x) && (todaysDate == daycounter) && (todaysMonth == monthNum))){
					if ((todaysDay == x) && (todaysDate == daycounter) && (todaysMonth == monthNum)) {
						calendarString += '<td align=\"center\" bgcolor=\"#AAFFAA\" height=\"30\" width=\"40\"><a href=\"javascript:showevents(' + daycounter + ',' + monthNum + ',' + yearNum + ',' + i + ',' + x + ')\">' + daycounter + '<\/a><\/td>';
					}
 					else	calendarString += '<td align=\"center\" bgcolor=\"#FFFFC8\" height=\"30\" width=\"40\"><a href=\"javascript:showevents(' + daycounter + ',' + monthNum + ',' + yearNum + ',' + i + ',' + x + ')\">' + daycounter + '<\/a><\/td>';
				} else {
					calendarString += '<td align=\"center\" bgcolor=\"#DDFFFF\" height=\"30\" width=\"40\">' + daycounter + '<\/td>';
				}
			}
		}
		calendarString += '<\/tr>';
	}

	calendarString += '<tr><td colspan=\"7\" nowrap align=\"center\" valign=\"center\" bgcolor=\"#C8C896\" width=\"280\" height=\"22\"><a href=\"javascript:changedate(\'return\')\"><b>Show Current Date<\/b><\/a><\/td><\/tr><\/table>';

	var object=document.getElementById('calendar');
	object.innerHTML= calendarString;
	thisDate = 1;
}


function checkevents(day,month,year,week,dayofweek) {
var numevents = 0;
var floater = 0;

	for (var i = 0; i < events.length; i++) {
		if (events[i][0] == "Y") {
			if ((events[i][2] == day) && (events[i][1] == month)) numevents++;
		}
		else if (events[i][0] == "F") {
			if ((events[i][1] == month) && (events[i][2] == day) && (events[i][3] == year) ) {
				 numevents++;
			}
		}
		else if ((events[i][2] == day) && (events[i][1] == month) && (events[i][3] == year)) {
			numevents++;
		}
	}

	if (numevents == 0) {
		return false;
	} else {
		return true;
	}
}




function showevents(day,month,year,week,dayofweek) {
var theevent = "";
var floater = 0;

	for (var i = 0; i < events.length; i++) {
		// First we'll process recurring events (if any):
		if (events[i][0] != "") {
			if (events[i][0] == "D") {
			}
			if (events[i][0] == "W") {
				if ((events[i][2] == dayofweek)) {
				theevent += "Events of: " + month +'/'+ day +'/'+ year + '\n';
				theevent += "Company Name :"+events[i][6] + '\n';
				theevent += 'Start Time: ' + events[i][4] + '\n';
				theevent += 'Ending Time: ' + events[i][5] + '\n';
				theevent += 'Description: ' + events[i][7] + '\n';
				theevent += 'Venue: ' + events[i][8] + '\n';
				theevent += 'Eligibility: ' + events[i][9] + '\n';
				theevent += 'Departments: ' + events[i][10] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events[i][0] == "M") {
			}
			if (events[i][0] == "Y") {
				if ((events[i][2] == day) && (events[i][1] == month)) {
				theevent += "Schedule for : " + month +'/'+ day +'/'+ year + '\n';
				theevent += "Company Name :"+events[i][6] + '\n';
				theevent += 'Start Time: ' + events[i][4] + '\n';
				theevent += 'Ending Time: ' + events[i][5] + '\n';
				theevent += 'Description: ' + events[i][7] + '\n';
				theevent += 'Venue: ' + events[i][8] + '\n';
				theevent += 'Eligibility: ' + events[i][9] + '\n';
				theevent += 'Departments: ' + events[i][10] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events[i][0] == "F") {
				if ((events[i][1] == month) && (events[i][2] == day) && (events[i][3] == year) ) {
					/*if (easterday == day && eastermonth == month)*/ {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events[i][6] + '\n';
						theevent += 'Start Time: ' + events[i][4] + '\n';
						theevent += 'Ending Time: ' + events[i][5] + '\n';
						theevent += 'Description: ' + events[i][7] + '\n';
						theevent += 'Venue: ' + events[i][8] + '\n';
						theevent += 'Eligibility: ' + events[i][9] + '\n';
						theevent += 'Departments: ' + events[i][10] + '\n';
						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					} 
				} else {
					floater = floatingholiday(year,events[i][1],events[i][2],events[i][3]);

					if ((month == 5) && (events[i][1] == 5) && (events[i][2] == 4) && (events[i][3] == 2)) {
						if ((floater + 7 <= 31) && (day == floater + 7)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events[i][6] + '\n';
							theevent += 'Start Time: ' + events[i][4] + '\n';
							theevent += 'Ending Time: ' + events[i][5] + '\n';
							theevent += 'Description: ' + events[i][7] + '\n';
							theevent += 'Venue: ' + events[i][8] + '\n';
							theevent += 'Eligibility: ' + events[i][9] + '\n';
							theevent += 'Departments: ' + events[i][10] + '\n';

							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						} else if ((floater + 7 > 31) && (day == floater)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events[i][6] + '\n';
							theevent += 'Start Time: ' + events[i][4] + '\n';
							theevent += 'Ending Time: ' + events[i][5] + '\n';
							theevent += 'Description: ' + events[i][7] + '\n';
							theevent += 'Venue: ' + events[i][8] + '\n';
							theevent += 'Eligibility: ' + events[i][9] + '\n';
							theevent += 'Departments: ' + events[i][10] + '\n';

							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						}
					} else if ((events[i][1] == month) && (floater == day)) {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events[i][6] + '\n';
						theevent += 'Start Time: ' + events[i][4] + '\n';
						theevent += 'Ending Time: ' + events[i][5] + '\n';
						theevent += 'Description: ' + events[i][7] + '\n';
						theevent += 'Venue: ' + events[i][8] + '\n';
						theevent += 'Eligibility: ' + events[i][9] + '\n';
						theevent += 'Departments: ' + events[i][10] + '\n';

						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					}
				}
		}
		}
		// Now we'll process any One Time events happening on the matching month, day, year:
		else if ((events[i][2] == day) && (events[i][1] == month) && (events[i][3] == year)) {
			theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
			theevent += events[i][6] + '\n';
			theevent += 'Start Time: ' + events[i][4] + '\n';
			theevent += 'Ending Time: ' + events[i][5] + '\n';
			theevent += 'Description: ' + events[i][7] + '\n';
			theevent += 'Venue: ' + events[i][8] + '\n';
			theevent += 'Eligibility: ' + events[i][9] + '\n';
			theevent += 'Departments: ' + events[i][10] + '\n';

			theevent += '\n -------------- \n\n';
		
			document.forms.eventform.eventlist.value = theevent;
		}
	}
	if (theevent == "") document.forms.eventform.eventlist.value = 'No events to show.';
}


function floatingholiday(targetyr,targetmo,cardinaloccurrence,targetday) {
// Floating holidays/events of the events.js file uses:
//	the Month field for the Month (here it becomes the targetmo field)
//	the Day field as the Cardinal Occurrence  (here it becomes the cardinaloccurrence field)
//		1=1st, 2=2nd, 3=3rd, 4=4th, 5=5th, 6=6th occurrence of the day listed next
//	the Year field as the Day of the week the event/holiday falls on  (here it becomes the targetday field)
//		1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thurday, 6=Friday, 7=Saturday
//	example: "F",	"1",	"3",	"2", = Floating holiday in January on the 3rd Monday of that month.
//
// In our code below:
// 	targetyr is the active year
// 	targetmo is the active month (1-12)
// 	cardinaloccurrence is the xth occurrence of the targetday (1-6)
// 	targetday is the day of the week the floating holiday is on
//		0=Sun; 1=Mon; 2=Tue; 3=Wed; 4=Thu; 5=Fri; 6=Sat
//		Note: subtract 1 from the targetday field if the info comes from the events.js file
//
// Note:
//	If Memorial Day falls on the 22nd, 23rd, or 24th, then we add 7 to the dayofmonth to the result.
//
// Example: targetyr = 2052; targetmo = 5; cardinaloccurrence = 4; targetday = 1
//	This is the same as saying our floating holiday in the year 2052, is during May, on the 4th Monday
//
var firstdate = new Date(String(targetmo)+"/1/"+String(targetyr));	// Object Storing the first day of the current month.
var firstday = firstdate.getUTCDay();	// The first day (0-6) of the target month.
var dayofmonth = 0;	// zero out our calendar day variable.

	targetday = targetday - 1;

	if (targetday >= firstday) {
		cardinaloccurrence--;	// Subtract 1 from cardinal day.
		dayofmonth = (cardinaloccurrence * 7) + ((targetday - firstday)+1);
	} else {
		dayofmonth = (cardinaloccurrence * 7) + ((targetday - firstday)+1);
	}
return dayofmonth;
}



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

function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
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

function pass()
{
     alert("pass");
}

function check_agency_phone_fax(test)
{	
	var len=0;
	var str="1234567890-";
	for(i=0;i<test.length;i++)
	{
		for(j=0;j<str.length;j++)
		{
			if(test.charAt(i)==str.charAt(j))
			len++;
		}
	}
	
	if(len==test.length)
	return 1
	else
	return 0;
}



function check_agency_email(test)
{	var count=0;
	for(i=0;i<test.length;i++)
		if(test.charAt(i)=='@')
			count++;
	if(count==1)
		return 1;
	else
		return 0;
}		

function validate_empty(ptr,submit)
{	
 var message="";
 
 
  
  if (ptr.agency_name.value.length == 0 )
  	message+="Please enter the Name of Agency \n" ;
	
  
             
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
function call_check()
{ alert("cool");}

function test()
{alert("yup its working");
}


</script>


</head>
<body onmousemove="closesubnav(event);" onLoad="changedate('return')">  




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
      <a href="../instructions/info.jsp">Instructions</a><a href="../student_registration/edit.jsp">Edit Registration Details</a>
	  <a href="../upload_cv/upload.jsp" >Upload CV</a>
	  <a href="../student_performance/student_eligibility.jsp" >Check Eligibility</a><a href="placement_query.jsp" >Organization Information</a>
      <a href="../vacancies/vacancies.jsp">Vacancies</a>
    <%--  <a href="../placement_status/status.jsp">Placement Status</a><a href="../ppts/get_pdf.jsp">Organization PPT's</a> --%>
      <a href="../browse.jsp">Download Organization Literature</a> 
      <a href="../regulations/info.jsp">Policies and Regulations</a>      
      <a href="../../logout.jsp">LOGOUT</a>
      <img name="bot" src="../images/bot.gif" width="181" height="243" border="0" id="bot" alt="" /></div>
  </div>
  <div id="content"> 
    <div class="feature">
		<form name="form1" action="placement_query.jsp" method="post">
        <p><strong>Select Appropriate Organization</strong></p>
        <table align="center"><tr><td align="center"></td><td><strong>S.No.</strong></td><td align="center"><strong>Organization Name</strong></td><td align="center"><strong>Organization's Nature of Business</strong></td><td align="center"><strong>Date</strong></td></tr>
       
<%
			db.connect(); 
			ResultSet date_1=db.execSQL("select curdate()");
			String ss="";
			if(date_1.next()){ss=date_1.getString(1);}
			date_1.close();
			String[] dt=ss.split("-");
			String agency_id="";
			ResultSet rsab=db.execSQL("select agency_id from eligible_students where student_id='"+student_id+"';");
			int i=1;
			while (rsab.next()) 
			{	
				//out.println("<b>"+rsab.getString(1)+"</b>");
				agency_id=rsab.getString(1);
				ResultSet rs1= db.execSQL("select agency_name,nature_business,final_agency_date from agency where agency_id='"+agency_id+"';");
				rs1.next();
				//out.println("<br/>"+rs1.getString(1)+rs1.getString(2)+rs1.getString(3)+"<br/>");
				if(rs1.getString("final_agency_date")!=null){				
				String[] dt2=rs1.getString("final_agency_date").split("-");
				//out.println(dt[0]+dt[1]+dt[2]+"||"+dt2[0]+dt2[1]+dt2[2]);
				//if(Integer.parseInt(dt[0])<=Integer.parseInt(dt2[0])){
				//if(Integer.parseInt(dt[1])<=Integer.parseInt(dt2[1])){
				//if(Integer.parseInt(dt[2])<=Integer.parseInt(dt2[2]))
				{
				//out.println("<option value=\""+rs1.getString("agency_name")+"\" > ");
				String checked="";
				ResultSet rsba=db.execSQL("select count(*) from interested_students where student_id='"+student_id+"' and agency_id='"+agency_id+"';");
				rsba.next();
				if(rsba.getInt(1)>0)
				{
					checked=" checked";
				}
				rsba.close();
				out.println("<tr><td align=\"center\"><input type=\"checkbox\" name=\"agency_id\" id=\"agency_id\" value=\""+agency_id+"\" "+checked+"> </td><td> "+i+"</td><td width=\"150\"align=\"center\">");
				//out.println("<form action=\"details.jsp\" method=\"post\" id=\""+rs1.getString("agency_name")+"\">");
				out.println("<input type=\"hidden\" name=\"agency_name\" value=\""+rs1.getString("agency_name")+"\">");
				out.println("<a href=\"details.jsp?id="+agency_id+"\">");
				out.println(rs1.getString("agency_name")+"</a></input></form></td>");
				out.println("<td align=\"center\">"+rs1.getString("nature_business")+"</td><td width=\"50\" align=\"center\">"+dt2[2]+"-"+dt2[1]+"-"+dt2[0]+"</td></tr></option>");
				i++;
				}}//}}
				rs1.close();
			}	
			rsab.close();
			
			db.close();


 %>

        </table>
		<table align="center"><tr><td><input type="submit" name="submit" value="Submit"></td></tr></table>
		</form>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
<center>
<table id="evtcal" border="0" cellpadding="0" cellspacing="0" width="584">
	<tbody>
		<tr>
			<td style="padding: 3px;" align="center" bgcolor="#aaddff" valign="top" width="314">
				<div id="calendar"><!--  Dynamically Filled --></div>
	    </td>
			<td width="10">&nbsp;</td>
			<td style="padding: 3px;" align="center" bgcolor="#ffffc8" valign="top" width="260"><p><b>Intructions:</b><br />			  
			  Click a  date  to see the schedule of Organization's visting.<br />
			  </p>
			  <center>
			    <form id="eventform" name="eventform" action="#" method="get">
		          <p><strong>Details</strong></p>
		          <p>
		            <textarea name="eventlist" cols="25" rows="9" wrap="soft">Auto filled when clicking on date.</textarea>
	              </p>
                </form>
			    
		      </center>
			</td>
		</tr>
	</tbody>
</table>
</center>
    <p align="center">&nbsp;</p>    </div> 
  </div>
  <div id="siteInfo"><a href="#">About Us</a> | <a href="#">Site
    Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
    Company Name </div>
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
