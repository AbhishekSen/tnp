var httpRequest;
function getOrganizationPpts()
{
        var messageEle = document.getElementById("messages");
        messageEle.innerHTML = "";
	var url="../ppts/get_pdf.jsp";
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
        httpRequest2.onreadystatechange = showOrganizationPpts; 
        httpRequest2.send(null);
        return false;
}

function showOrganizationPpts()
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

function getPlacement(file)
{
        var url = "../ppts/process.jsp?filename=" + file;
        var downloadWindow = window.open(url,"Organization PPT","width=200,height=100,left=450,top=250,location=no,resizable=no",true);
        downloadWindow.focus();
        return false;

}

