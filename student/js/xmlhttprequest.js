var xmlHttp 
var div_tag_name 
function showHint(data , data_array, len, url , div_name)
{ div_tag_name= div_name ; 
 // alert(data.length);
  //alert("i m here inside"); 
  
 //alert(data.length);
 if (data.length > 0 )
 { //alert(data.length);
  //  str = encodeURIComponent(str) ;
    //alert("rohan");
    var query_string = "q0=" +data;
	var temp="";
	//alert(query_string);
	//alert(query_string);
	//alert(data_array[1]);
//	alert(data_array[2]);
//	alert(data_array[3]);
//	alert(data_array[4]);
//	alert(url);
//	alert(div_name); 
	//alert("len=="+len);
	if (len > 1)  // means there is some data pased in the array  .
	{	
	 	query_string+="&";
     	for (var i=1; i < len ; i++)
     	{ 
	 		 data_array[i] = encodeURIComponent(data_array[i]) ;
	 		// temp="q"+i+"="data_array[i] ;
	  	   temp="q"+i+"="+ data_array[i];
		   
		   //alert("temp"+temp);
		if (i == (len -1 ))	  
	  		 	query_string +=temp  ;
	  		else
	  		{
	   			temp+="&";	 
	   			query_string +=temp ; 
	  		}
     	}		  // end of the for loop 
//alert("query_string==="+query_string);
    } // end of if data_array is passed  
        
 temp ="&qlength="+len ;
 query_string +=temp ; 
// alert(query_string);
//alert(query_string);

  //var query_string ="q="+data;
 // alert(query_string);
// alert(div_name);
//alert("xmlHttp.readyState=="+xmlHttp.readyState);
//alert("xmlHttp.status=="+xmlHttp.status);
  xmlHttp=GetXmlHttpObject(stateChanged) ;
  xmlHttp.open("POST", url , false) ;
  xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
 	//alert(query_string);
 xmlHttp.send(query_string) ;
  }
else
 {  
 // document.getElementById(div_name).innerHTML="wait ......." ;
 } 
} 
 // writing the response recived in the div tag . 
 
function stateChanged() 
{ 
      if (xmlHttp.readyState < 4)
	  {
		//document.getElementById(div_tag_name).innerHTML= xmlHttp.readyState;  
		//document.getElementById("wait").innerHTML="wait ......." ;  
	  }
	  
      if (xmlHttp.readyState==4 )
      { 
        
    // alert(xmlHttp.responseText);
		 if (xmlHttp.status == 200) 
		 {
            	//document.getElementById("wait").innerHTML=""  ;
           document.getElementById(div_tag_name).innerHTML=xmlHttp.responseText  ;
		  // alert(xmlHttp.getAllResponseHeaders());
		//  alert("xmlHttp.responseText=="+xmlHttp.responseText);
		 }
		 else 
		 {
		 	alert("There was a problem retrieving the data:\n" +xmlHttp.statusText + xmlHttp.status);
		 }
      } 
	
	  
} 

function GetXmlHttpObject(handler)
{ 
 var objXmlHttp=null  ;
 
 if (navigator.userAgent.indexOf("Opera")>=0)
 {
  alert("This example doesn't work in Opera");  
  return ;
 }
 
 if (navigator.userAgent.indexOf("MSIE")>=0)
 { 
  var strName="Msxml2.XMLHTTP";
  if (navigator.appVersion.indexOf("MSIE 5.5")>=0)
  {
   strName="Microsoft.XMLHTTP" ;
  } 
  try
  { 
   objXmlHttp=new ActiveXObject(strName) ;
   objXmlHttp.onreadystatechange=handler ;
   return objXmlHttp ;
  } 
  catch(e)
  { 
   alert("Error. Scripting for ActiveX might be disabled")  ;
   return  ;
  } 
 } 
 if (navigator.userAgent.indexOf("Mozilla")>=0)
 {
  objXmlHttp=new XMLHttpRequest() ;
  objXmlHttp.onload=handler ;
  objXmlHttp.onerror=handler  ;
  return objXmlHttp ;
 }
}

