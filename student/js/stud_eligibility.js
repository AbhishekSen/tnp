function swap(ag_id,cv)
{
	if(cv==0)		//if cv_1 is clicked
	{
		if(document.getElementById("cvs_"+ag_id+"_0").checked==true)
		{
			document.getElementById("cvs_"+ag_id+"_1").checked=false;
		}
		else{
			if(document.getElementById(ag_id).checked==true){
				document.getElementById("cvs_"+ag_id+"_1").checked=true;
			}
		}
	}
	else		//cv_2 is clicked
	{
		if(document.getElementById("cvs_"+ag_id+"_1").checked==true)
		{
			document.getElementById("cvs_"+ag_id+"_0").checked=false;
		}
		else{
			if(document.getElementById(ag_id).checked==true){
				document.getElementById("cvs_"+ag_id+"_0").checked=true;
			}
		}
	}
}


function selectDefaultCV(agp_id){
	
	if(document.getElementById(agp_id).checked==true){
		document.getElementById("cvs_"+agp_id+"_0").disabled=false;
		document.getElementById("cvs_"+agp_id+"_1").disabled=false;
		if(document.getElementById("cvs_"+agp_id+"_0").checked==false && document.getElementById("cvs_"+agp_id+"_1").checked==false){
			document.getElementById("cvs_"+agp_id+"_0").checked=true;
		}
	}
	else{
			document.getElementById("cvs_"+agp_id+"_0").disabled=true;
			document.getElementById("cvs_"+agp_id+"_1").disabled=true;
			document.getElementById("cvs_"+agp_id+"_0").checked=false;
			document.getElementById("cvs_"+agp_id+"_1").checked=false;
	}
		
}

var httpRequest2;
function getStudentEiligibility()
{
        var url = "../student_performance/student_eligibility.jsp";
              
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
        httpRequest2.onreadystatechange = showEligibilityData; 
        httpRequest2.send(null);
        return false;
}

function showEligibilityData()
{
        if(httpRequest2.readyState == 4)
        {
                if(httpRequest2.status == 200)
                {
                        var eligibility = document.getElementById("corecenter");
                        eligibility.innerHTML = httpRequest2.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest2.status + ":" + httpRequest2.statusText);
                }
        }
}

function getAgencyDetails(ag_id,p_id)
{
        var url = "../student_performance/details.jsp?id="+ag_id+"&pid="+p_id;
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
        httpRequest2.onreadystatechange = showEligibilityData; 
        httpRequest2.send();
        return false;      
}
function confirmEligibility()
{
        var url = "../student_performance/confirm.jsp";
        var uploadForm = new FormData(document.forms.namedItem("formEligibility"));

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
        httpRequest2.open("POST",url,true);  
        httpRequest2.onreadystatechange = showEligibilityData; 
        httpRequest2.send(uploadForm);
        return false;        
}
