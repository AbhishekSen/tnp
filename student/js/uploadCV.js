var httpRequest1;
var httpRequest;

function uploadCVCheck(flag)
{
    var msg=document.getElementById("messages");
    msg.innerHTML="";
    if(flag == 1)
    {
        var url = "../upload_cv/check.jsp?id=1";
        var uploadForm = new FormData(document.forms.namedItem("upform1"));
        
        if(window.XMLHttpRequest)
        {
            httpRequest1 = new XMLHttpRequest();
        }
        else
        {
            if(window.ActiveXObject)
            {
                try{
                    httpRequest1 = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch(e) {}
                
            }
        }
        httpRequest1.open("POST",url,true);  
        httpRequest1.onreadystatechange = renderData; 
        httpRequest1.send(uploadForm);
    }
    else if(flag == 2)
    {
        url = "../upload_cv/check.jsp?id=2";
        uploadForm = new FormData(document.forms.namedItem("upform2"));
        
        if(window.XMLHttpRequest)
        {
            httpRequest1 = new XMLHttpRequest();
        }
        else
        {
            if(window.ActiveXObject)
            {
                try{
                    httpRequest1 = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch(e) {}
                
            }
        }
        httpRequest1.open("POST",url,true); 
        httpRequest1.onreadystatechange = renderData; 
        httpRequest1.send(uploadForm);
	
    } 
    return false;
}

function showCVForm(flag)
{
    if(flag == 2)
    {
        upForm2 = document.getElementById("formDiv2");
        upForm2.style.display = 'block';
        upForm1 = document.getElementById("formDiv1");
        upForm1.style.display = 'none';
    }
    else if (flag == 1)
    {
        upForm2 = document.getElementById("formDiv2");
        upForm2.style.display = 'none';
        upForm1 = document.getElementById("formDiv1");
        upForm1.style.display = 'block';
	
    }
}

function renderData()
{
    var xmlRes;
    var err;
    var ele;

    if(httpRequest1.readyState == 4)
    {
        if(httpRequest1.status == 200)
        { 
	    var parser=new DOMParser();
	    //var xmlDoc=httpRequest1.responseXML;
            var xmlDoc=parser.parseFromString(httpRequest1.responseText,"text/xml");
            err = xmlDoc.getElementsByTagName("Error");
            if(err[0].childNodes[0].nodeValue == "1")
            {

                ele = document.getElementById("messages");
                ele.style.color="#FF0000";
                ele.innerHTML = "<p>Error while uploading.File size limit exceeded. Try Again</p>";
            }
            else if(err[0].childNodes[0].nodeValue == "2")
            {

                ele1 = document.getElementById("messages");
                ele1.style.color="#FF0000";
                ele1.innerHTML = "<p>CV already uploaded.</p>";
                
            }
            else if(err[0].childNodes[0].nodeValue == "3")
            {
                ele1 = document.getElementById("messages");
                ele1.style.color="#00FF00";
                ele1.innerHTML = "<p>File Uploaded Successfully.Thank You.</p>";
                var formElement = document.getElementById("uploadfile1");
                formElement.value = "";
                formElement = document.getElementById("uploadfile2");
                formElement.value = "";
                
            }
            else if(err[0].childNodes[0].nodeValue == "4")
            {
                ele1 = document.getElementById("messages");
                ele1.style.color="#FF0000";
                ele1.innerHTML = "<p>Error while uploading. Input file not correct.Try Again</p>";
            }

	    
        }
        
        else
        {
            alert("Error with loading data \n" + httpRequest1.status + ":" + httpRequest1.statusText);
        }
    }
}

function getstat(flag)
{

    if((flag ==1 ) && (document.getElementById("uploadfile1").value.length==0))
    {
	alert("Please select a file to be uploaded !!");
	return false;
    }
    else if((flag == 2) && (document.getElementById("uploadfile2").value.length==0))
    {
	alert("Please select a file to be uploaded !!");
	return false;
	
    }
    
    
}

function updateError()
{
    alert("Error");
}


function uploadCV()
{
    var messageEle = document.getElementById("messages");
    messageEle.innerHTML = "";
    var url = "../upload_cv/upload.jsp";

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
    httpRequest.onreadystatechange = showData; 
    httpRequest.send(url);
}

function showData()
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


function downloadCV(flag)
{
    var url = "../upload_cv/down_cv.jsp?cv_id=" + flag;
    var downloadWindow = window.open(url,"CV Download","width=200,height=100,left=450,top=250,location=no,resizable=no",true);
    downloadWindow.focus();
}

