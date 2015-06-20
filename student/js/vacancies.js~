var time = 3000;
var numofitems = 7;

//menu constructor
function menu(allitems,thisitem,startstate){ 
  callname= "gl"+thisitem;
  divname="subglobal"+thisitem;  
  this.numberofmenuitems = 7;
  this.caller = document.getElementById(callname);
  this.thediv = document.getElementById(divname);
  this.thediv.style.visibility = startstate;
}

function clearinfo()
{
	document.getElementById("infobar").innerHTML="";
	document.getElementById("pagecell1").style.top='112';
}

//menu methods
function ehandler(event,theobj){
  for (var i=1; i<= theobj.numberofmenuitems; i++){
    var shutdiv =eval( "menuitem"+i+".thediv");
    shutdiv.style.visibility="hidden";
  }
  theobj.thediv.style.visibility="visible";
}
				
function closesubnav(event){
  if ((event.clientY <48)||(event.clientY > 107)){
    for (var i=1; i<= numofitems; i++){
      var shutdiv =eval('menuitem'+i+'.thediv');
      shutdiv.style.visibility='hidden';
    }
  }
}
function call_xml_http_request1(data , url , div_tag_name)
{//alert("rohan hahaha");
	var arr = new Array(4);
  
    arr[0] = 1; 

	//1 to 2 the parameters for the query.

	arr[1]=document.getElementById("department_name").value;
	
	arr[2]=document.getElementById("program_name").value;
	
	


	//3 to 4 we have the data itself that is to be sent.
	//the value is empty string if it not entered
	
	//for(var i=0;i<3;i++)
	//alert(arr[i]);

//alert("rohan1"); 	
    showHint(data , arr,'3',url ,div_tag_name );
	//alert("hurray");
}


function activate(check_box,activate_tag)
{
	if(check_box.checked==1)
	{
		document.getElementById(activate_tag).disabled=false;
		document.getElementById(activate_tag).focus();
	}
	else
		document.getElementById(activate_tag).disabled=true;
}


function get_data()
{//alert("hi");
	 
		call_xml_http_request1('data','get_placement_details1.jsp','div_get_placement_details1');
		sortables_init();
		//alert("rohan");
	//}
}


function validate_empty(ptr_name)
{//alert("1");
	var selected=false;
 	var message="";
	var ptr=document.getElementById(ptr_name);

	   if (ptr.department_name.value.length == 0 )
   		{
  			 message+="Please enter the department name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.department_name.select();
			 }
		}
    if (ptr.program_name.value.length == 0 )
   		{
  			 message+="Please enter the program name.\n" ;
			 if(selected==false)
			 {
			 	selected=true;
				ptr.program_name.select();
			 }
		}
 
  
	 
	 if (message.length > 0)
	 {
	    alert(message);
	    return true ;
	 } 
	 else
	 { alert(message);
		return false;
	 }

}




function getVacancies()
{
	var url="../vacancies/vacancies.jsp";
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
        httpRequest2.onreadystatechange = showVacancies; 
        httpRequest2.send(null);
        return false;
}

function showVacancies()
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

function getPlacementDetails()
{
        var url = "../vacancies/get_placement_details1.jsp";

        if(document.getElementById("department_id").selectedIndex == 0 || document.getElementById("programme_id").selectedIndex == 0){
                alert("Please enter valid information");
                return false;
                }
        var vacancyForm = new FormData(document.forms.namedItem("form_query_placement"));
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
        httpRequest2.onreadystatechange = showVacancies; 
        httpRequest2.send(vacancyForm);
        return false;

}
