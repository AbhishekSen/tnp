
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
var org_choice=0;

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

        if(org_choice==1)
        {
	       for (var i = 0; i < events_sel.length; i++) {
		if (events_sel[i][0] == "Y") {
			if ((events_sel[i][2] == day) && (events_sel[i][1] == month)) numevents++;
		}
		else if (events_sel[i][0] == "F") {
			if ((events_sel[i][1] == month) && (events_sel[i][2] == day) && (events_sel[i][3] == year) ) {
				 numevents++;
			}
		}
		else if ((events_sel[i][2] == day) && (events_sel[i][1] == month) && (events_sel[i][3] == year)) {
			numevents++;
		}        
        }
        }
        
        else
        {
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
alert(org_choice+"");
	if(org_choice == 1)
	{
	for (i = 0; i < events_sel.length; i++) {
		// First we'll process recurring events (if any):
		if (events_sel[i][0] != "") {
			if (events_sel[i][0] == "D") {
			}
			if (events_sel[i][0] == "W") {
				if ((events_sel[i][2] == dayofweek)) {
				theevent += "Events of: " + month +'/'+ day +'/'+ year + '\n';
				theevent += "Company Name :"+events_sel[i][6] + '\n';
				theevent += 'Start Time: ' + events_sel[i][4] + '\n';
				theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
				theevent += 'Description: ' + events_sel[i][7] + '\n';
				theevent += 'Venue: ' + events_sel[i][8] + '\n';
				theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
				theevent += 'Departments: ' + events_sel[i][10] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events_sel[i][0] == "M") {
			}
			if (events_sel[i][0] == "Y") {
				if ((events_sel[i][2] == day) && (events_sel[i][1] == month)) {
				theevent += "Schedule for : " + month +'/'+ day +'/'+ year + '\n';
				theevent += "Company Name :"+events_sel[i][6] + '\n';
				theevent += 'Start Time: ' + events_sel[i][4] + '\n';
				theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
				theevent += 'Description: ' + events_sel[i][7] + '\n';
				theevent += 'Venue: ' + events_sel[i][8] + '\n';
				theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
				theevent += 'Departments: ' + events_sel[i][10] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events_sel[i][0] == "F") {
				if ((events_sel[i][1] == month) && (events_sel[i][2] == day) && (events_sel[i][3] == year) ) {
					/*if (easterday == day && eastermonth == month)*/ {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events_sel[i][6] + '\n';
						theevent += 'Start Time: ' + events_sel[i][4] + '\n';
						theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
						theevent += 'Description: ' + events_sel[i][7] + '\n';
						theevent += 'Venue: ' + events_sel[i][8] + '\n';
						theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
						theevent += 'Departments: ' + events_sel[i][10] + '\n';
						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					} 
				} else {
					floater = floatingholiday(year,events_sel[i][1],events_sel[i][2],events_sel[i][3]);

					if ((month == 5) && (events_sel[i][1] == 5) && (events_sel[i][2] == 4) && (events_sel[i][3] == 2)) {
						if ((floater + 7 <= 31) && (day == floater + 7)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events_sel[i][6] + '\n';
							theevent += 'Start Time: ' + events_sel[i][4] + '\n';
							theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
							theevent += 'Description: ' + events_sel[i][7] + '\n';
							theevent += 'Venue: ' + events_sel[i][8] + '\n';
							theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
							theevent += 'Departments: ' + events_sel[i][10] + '\n';

							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						} else if ((floater + 7 > 31) && (day == floater)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events_sel[i][6] + '\n';
							theevent += 'Start Time: ' + events_sel[i][4] + '\n';
							theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
							theevent += 'Description: ' + events_sel[i][7] + '\n';
							theevent += 'Venue: ' + events_sel[i][8] + '\n';
							theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
							theevent += 'Departments: ' + events_sel[i][10] + '\n';

							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						}
					} else if ((events_sel[i][1] == month) && (floater == day)) {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events_sel[i][6] + '\n';
						theevent += 'Start Time: ' + events_sel[i][4] + '\n';
						theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
						theevent += 'Description: ' + events_sel[i][7] + '\n';
						theevent += 'Venue: ' + events_sel[i][8] + '\n';
						theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
						theevent += 'Departments: ' + events_sel[i][10] + '\n';

						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					}
				}
		}
		}
		// Now we'll process any One Time events happening on the matching month, day, year:
		else if ((events_sel[i][2] == day) && (events_sel[i][1] == month) && (events_sel[i][3] == year)) {
			theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
			theevent += events_sel[i][6] + '\n';
			theevent += 'Start Time: ' + events_sel[i][4] + '\n';
			theevent += 'Ending Time: ' + events_sel[i][5] + '\n';
			theevent += 'Description: ' + events_sel[i][7] + '\n';
			theevent += 'Venue: ' + events_sel[i][8] + '\n';
			theevent += 'Eligibility: ' + events_sel[i][9] + '\n';
			theevent += 'Departments: ' + events_sel[i][10] + '\n';

			theevent += '\n -------------- \n\n';
		
			document.forms.eventform.eventlist.value = theevent;
		}
	}	
	}
	
	else
        {
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

function getPlacementQuery()
{
        var messageEle = document.getElementById("messages");
        messageEle.innerHTML = "";
        var url = "../agency_query/placement_query.jsp";

        if(window.XMLHttpRequest)
        {
                httpRequest = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        httpRequest.open("POST",url,true);  
        httpRequest.onreadystatechange = showPlacementQuery; 
        httpRequest.send(null);
        
        return false;
}

function showPlacementQuery()
{
        if(httpRequest.readyState == 4)
        {
                if(httpRequest.status == 200)
                {
             <%
	    for(int p=0;p<rows1;p++)
	    {  
                for(int q=0;q<11;q++)
	        {
                        out.println("events["+p+"]["+q+"]=\""+db_events[p][q].replaceAll("\n",">>")+"\";");
                }
		       
	    }
	    for(int p=0;p<sel_cnt;p++)
	    {  
                for(int q=0;q<11;q++)
	        {
                        out.println("events_sel["+p+"]["+q+"]=\""+db_events_sel[p][q].replaceAll("\n",">>")+"\";");
                }
		       
	    }
	    %>
	                var ele = document.getElementById("corecenter");
                        ele.innerHTML = httpRequest.responseText;
                        changedate('return');
                        adjustHeight();
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest.status + ":" + httpRequest.statusText);
                }
        }
}


function getEventDetails(value)
{
        org_choice = value;
        
        return false;
}
