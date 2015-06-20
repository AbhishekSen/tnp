var xmlHttp
var element;
var query;
function ajax_func(data,div_tag,url)
{ 
	//alert(url);alert(data);alert(element);
	 element=div_tag;
	 var year=document.getElementById("year2").value;
	 var semester=document.getElementById("semester2").value;
	 query= "sid=" + Math.random() + "&department_name=" + data + "&year=" + year + "&semester=" + semester ;	
			//var url="getprogrammes.jsp?"+"q="+str;
	//alert(url+"  "+ query+"  "+ element);
	xmlHttp=GetXmlHttpObject(stateChanged);
	xmlHttp.open("POST", url , false);
	xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	//xmlHttp.send("q="+str);
		xmlHttp.send(query);
	//alert(url);
	
} 

function stateChanged() 
{ 
	if(xmlHttp.readyState<4 )
	//	document.getElementById("wait").innerHTML="Please WAIT..........."   ;
		document.getElementById(element).innerHTML="Please WAIT..........."   
		//alert(xmlHttp.readyState)
	//	alert("wait")
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete" )
	{  
		if(xmlHttp.status==200  )
		{
				//alert("ready");
			//document.getElementById("wait").innerHTML="";
	    	//alert(xmlHttp.responseText);
			document.getElementById(element).innerHTML=xmlHttp.responseText ;
			//document.getElementById("wait").innerHTML='<option value="a">asdf</option><option value="b">ashdff</option>' ;
			
		}
		else
			alert("Error:"+xmlHttp.statusText+" "+xmlHttp.status);
} 
} 

function GetXmlHttpObject(handler)
{ 
	var objXmlHttp=null;

	if (navigator.userAgent.indexOf("Opera")>=0)
	{
		alert("This example doesn't work in Opera") ;
		return 
	}
	if (navigator.userAgent.indexOf("MSIE")>=0)
	{ 
		var strName="Msxml2.XMLHTTP";
		alert(strName);
		if (navigator.appVersion.indexOf("MSIE 5.5")>=0)
		{
			strName="Microsoft.XMLHTTP";
			alert(strName);
			
		} 
		try
		{ 
			alert(strName);
			objXmlHttp=new ActiveXObject(strName);
			objXmlHttp.onreadystatechange=handler ;
			//alert(objXmlHttp);
			return objXmlHttp;
		} 
		catch(e)
		{   
			alert("Error. Scripting for ActiveX might be disabled") 
			return 
		} 
	} 
	if (navigator.userAgent.indexOf("Mozilla")>=0)
	{    //alert(strName);
		objXmlHttp=new XMLHttpRequest();
		objXmlHttp.onload=handler;
		objXmlHttp.onerror=handler ;
		return objXmlHttp;
	}
} 

