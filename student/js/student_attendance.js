function getAttendancePage()
{
        url="../instructions/std_atten.jsp";
        var messageEle = document.getElementById("messages");
        messageEle.innerHTML = "";
        if(window.XMLHttpRequest)
        {
                httpRequest2 = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest2 = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }
        
               httpRequest2.open("GET",url,true);  
               httpRequest2.onreadystatechange = showAttendancePage; 
               httpRequest2.send(null);
               
               return false;
}

function showAttendancePage()
{
        if(httpRequest2.readyState == 4)
        {
                if(httpRequest2.status == 200)
                {
                        var ele = document.getElementById("corecenter");
                        ele.innerHTML = httpRequest2.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest2.status + ":" + httpRequest2.statusText);
                }
        }
}


function getStudentAttendance()
{
   	url="../instructions/attendance.jsp";
        if(window.XMLHttpRequest)
        {
                httpRequest2 = new XMLHttpRequest();
        }
        else
        {
                if(window.ActiveXObject)
                {
                        try{
                                httpRequest2 = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch(e) {}
                        
                }
        }

	       formData = new FormData(document.forms.namedItem("attendanceForm"));
               httpRequest2.open("POST",url,true);  
               httpRequest2.onreadystatechange = showStudentAttendance; 
	       httpRequest2.send(formData);
        return false;
}

function showStudentAttendance()
{
        var err;
        var domParser;
        var xmlDoc;
        if(httpRequest2.readyState == 4)
        {
                if(httpRequest2.status == 200)
                {

			domParser=new DOMParser();
     	                
	                xmlDoc=domParser.parseFromString(httpRequest2.responseText,"text/xml");
			
			err = xmlDoc.getElementsByTagName("Error");
//alert(err[0].childNodes[0].nodeValue + " yes");
		if(err[0].childNodes[0].nodeValue  == "2")
		{
			
			displayBox = document.getElementById("messages");
                        displayBox.style.color="#FF0000";
			displayBox.innerHTML = "<p>Please enter a valid code.</p>";	
			
		}
	        else if(err[0].childNodes[0].nodeValue  == "3")
		{
			
			displayBox = document.getElementById("messages");
                        displayBox.style.color="#00FF00";
			displayBox.innerHTML = "<p>Attendance updated successfully</p>";
		        formElement = document.getElementsByName("code")[0];
                        formElement.value = "";	
			
		}
		 else
                 {
                 	displayBox = document.getElementById("corecenter");
                        displayBox.innerHTML = httpRequest2.responseText;
                 }
           }
           else
                {
                        alert("Error with loading data \n" + httpRequest2.status + ":" + httpRequest2.statusText);
                }
        }
}

function checkAttendanceForm()
{
	if(document.getElementById("inputCode").value.length == 0)
	{
		alert("Please enter code.");
		return false;
	}
}

