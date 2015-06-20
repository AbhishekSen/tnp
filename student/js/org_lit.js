function getOrganizationLits()
{
	var url="../browse.jsp";
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
        httpRequest2.onreadystatechange = showOrganizationLits; 
        httpRequest2.send(null);
        return false;
}

function showOrganizationLits()
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


function getOrgLitFile(file)
{
        var url = "../process.jsp?filename=" + file;
        var downloadWindow = window.open(url,"Company Literature","width=200,height=100,left=450,top=250,location=no,resizable=no",true);
        downloadWindow.focus();
        return false;

}
