
function getAnchorPosition(anchorname) {
	var useWindow=false;
	var coordinates=new Object();
	var x=0,y=0;

	var use_gebi=false, use_css=false, use_layers=false;
	if (document.getElementById) { use_gebi=true; }
	else if (document.all) { use_css=true; }
	else if (document.layers) { use_layers=true; }

	if (use_gebi && document.all) {
		x=AnchorPosition_getPageOffsetLeft(document.all[anchorname]);
		y=AnchorPosition_getPageOffsetTop(document.all[anchorname]);
		}
	else if (use_gebi) {
		var o=document.getElementById(anchorname);
		x=AnchorPosition_getPageOffsetLeft(o);
		y=AnchorPosition_getPageOffsetTop(o);
		}
 	else if (use_css) {
		x=AnchorPosition_getPageOffsetLeft(document.all[anchorname]);
		y=AnchorPosition_getPageOffsetTop(document.all[anchorname]);
		}
	else if (use_layers) {
		var found=0;
		for (var i=0; i<document.anchors.length; i++) {
			if (document.anchors[i].name==anchorname) { found=1; break; }
			}
		if (found==0) {
			coordinates.x=0; coordinates.y=0; return coordinates;
			}
		x=document.anchors[i].x;
		y=document.anchors[i].y;
		}
	else {
		coordinates.x=0; coordinates.y=0; return coordinates;
		}
	coordinates.x=x;
	coordinates.y=y;
	return coordinates;
}

function AnchorPosition_getPageOffsetLeft (el) {
	var ol=el.offsetLeft;
	while ((el=el.offsetParent) != null) { ol += el.offsetLeft; }
	return ol;
}

function AnchorPosition_getPageOffsetTop (el) {
	var ot=el.offsetTop;
	while((el=el.offsetParent) != null) { ot += el.offsetTop; }
	return ot;
}

function mousemoveCapture() {
	//alert("mouse capture");
	document.captureEvents(Event.MOUSEMOVE)
	if (document.onmousemove == null) document.onmousemove = updateMousePosition;
}

function mousemoveRelease() {
	//alert("stop mouse capture");
	document.releaseEvents(Event.MOUSEMOVE)
	document.onmousemove = null;
}



var tempX = 0;
var tempY = 0;
var milSeconds = 200;
var lastCallTime = getMicroTime();

function getMicroTime(){
	var d = new Date();
	return d.getTime();
}

function updateMousePosition(e) {
    tempX = e.pageX;
    tempY = e.pageY;

    if (tempX < 0){tempX = 0}
  	if (tempY < 0){tempY = 0}
  
	obj = getAnchorPosition('VHSS');
	
	hostX = obj.x + objWidth/2;
	hostY = obj.y - objHeight/2;
	
	w = tempX - hostX;
	h = tempY - hostY;

	if((tempX>obj.x && tempX<(obj.x+objWidth)) && (tempY>obj.y && tempY<obj.y)){
		return true;
	}	
	
	radius	= Math.sqrt(w*w + h*h);
	deg		= Math.atan(w/h)/0.017453293;
	
	if(w>=0&&h<=0){
		deg = Math.abs(deg);
	}else if(w>=0&&h>0){
		deg = 180 - deg;
	}else if(w<0&&h>0){
		deg = Math.abs(deg)+180;
	}else if(w<0&&h<=0){
		deg = 360 - deg;
	}
	
	if(radius>100)	radius = 100;
	
	if((getMicroTime()-lastCallTime)>milSeconds){
		setGaze(deg, 1, radius, 1);
		lastCallTime = getMicroTime();
	}
	
	return true
}