<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style type="text/css">

#evtcal a:link {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}		/* unvisited link */
#evtcal a:visited {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}	/* visited link */
#evtcal a:hover {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: underline;}	/* mouse over link */
#evtcal a:active {font: normal 12pt "Arial", "Helvetica", "Sans Serif"; color: #004400; text-decoration: none;}		/* selected link */

</style>

</head>

<body>

<form>
<br/>
  <table width="80%" align="center">

<tr>
                      <td>See the schedule of:</td>
                      <td><input name="org" type="radio" value="1"  onclick="getEventDetails(this.value);">
                        Selected Organisations     
                        <input type="radio" name="org" value="0"  onclick="getEventDetails(this.value);">
                        All Organisations</td>
                    </tr>  
   </table>
   </form>
<br/>
<center>
<table id="evtcal" border="0" cellpadding="0" cellspacing="0" width="584">
	<tbody>
		<tr>
			<td style="padding: 3px;" align="center" bgcolor="#aaddff" valign="top" width="314">
				<div id="calendar"><!--  Dynamically Filled --></div>
	    </td>
			<td width="10">&nbsp;</td>
		<td style="padding: 3px;" align="center" bgcolor="#ffffc8" valign="top" width="260"><p><b>Intructions:</b><br/>			  
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

</body>
</html>

