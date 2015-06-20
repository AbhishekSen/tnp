function getPlacementStatus()
{
        var url = "../placement_status/status.jsp";
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
        httpRequest2.onreadystatechange = showPlacementStatus; 
        $('#corecenter').innerHTML="";
        $('#spinner').show();
        httpRequest2.send(null);
        return false;
}

function showPlacementStatus()
{
        if(httpRequest2.readyState == 4)
        {
                if(httpRequest2.status == 200)
                {
                        $('#spinner').hide();
                        var eligibility = document.getElementById("corecenter");
                        eligibility.innerHTML = httpRequest2.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest2.status + ":" + httpRequest2.statusText);
                }
        }
}

function downloadCSV()
{
        var url = "../placement_status/status.jsp?submit=submit";
        var downloadWindow = window.open(url,"CV Download","width=1,height=1,left=450,top=250,location=no,resizable=no, visible=none",true);
        downloadWindow.focus();
	return false;
}

