function selectedCompanyChanged()
{
	var agencyId = document.getElementById('company_name').value;
     url="../permanent_companies/getProfiles.jsp?agencyId="+agencyId;
	if(agencyId > 0)
		document.getElementById("get_profile_details").disabled = false;
	else
	{
		document.getElementById("get_profile_details").disabled = true;
		ele = document.getElementById("profile");
           ele.innerHTML = "";
		return false;
	}
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
               httpRequest2.onreadystatechange = showProfilesByCompanyId;
               httpRequest2.send(null);
               
               return false;
}

function showProfilesByCompanyId()
{
        if(httpRequest2.readyState == 4)
        {
                if(httpRequest2.status == 200)
                {
                        var ele = document.getElementById("profile");
                        ele.innerHTML = httpRequest2.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest2.status + ":" + httpRequest2.statusText);
                }
        }	
}
function selectedProfileChanged()
{
	alert("Hello");
	var profileId = docuement.getElementById("profile_name").value;
	if(profileId == 0)
	{
		document.getElementById("get_profile_details").disabled = true;
		return false;
	}
	else
	{
		document.getElementById("get_profile_details").disabled = false;
		return false;
	}
}

function checkEmpty()
{

	var agencyId = document.getElementById('company_name').value;
	if(agencyId == 0)
	{
		alert("Please select company.");
		return false;
	}
	else
	{
		var profileId = docuement.getElementById('profile_name').value
		alert("Profile id: "+profileId);
		if(profileId == 0)
		{
			alert("Please select a profile.");
			return false;
		}
	}
	
	return true;
}
function openWindow()
{
	var agencyId = document.getElementById('company_name').value;
	var profileId = document.getElementById('profile_name').value;
	var url = "../permanent_companies/getProfileDetails.jsp?agencyId="+agencyId+",profileId="+profileId;
	alert("Here"+url);
	window.open(url);
	return true;
}