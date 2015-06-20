function xxx()
{
        var url = "../student_registration/edit.jsp";
        var messageEle = document.getElementById("messages");
        messageEle.innerHTML = "";
     

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
        httpRequest.open("GET",url,true);  
        httpRequest.onreadystatechange = showForm; 
        httpRequest.send(url);
return false;
}

function showForm()
{
        if(httpRequest.readyState == 4)
        {
                if(httpRequest.status == 200)
                {
                        var ele = document.getElementById("corecenter");
                        ele.innerHTML = httpRequest.responseText;
                }
                else
                {
                        alert("Error with loading data \n" + httpRequest.status + ":" + httpRequest.statusText);
                }
        }
}

function editStudReg()
{
        var url = "../student_registration/edit.jsp";
        //var downloadWindow = window.open(url,"Student Registration","fullscreen=1,channelmode=1",true);
        var downloadWindow = window.open(url,'Student Registration','fullscreen=1,channelmode=1,scrollbars=yes,resizable=yes');
        downloadWindow.focus();
        return false;
}
