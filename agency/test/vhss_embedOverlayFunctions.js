//embed overlay code
var eo_width, eo_height, eo_vhostX, eo_vhostY, eo_horzRef, eo_vertRef, eo_scroll, eo_closeBtn, eo_drag, eo_minimize, eo_customThumb, eo_thumb, eo_thumbnail, eo_tooltip, eo_loadMin, eo_minimizeTo, eo_appear, eo_hide, eo_hideAfter, eo_contentWinWidth;
var dv, dvHTML, re, positionVhostOn, dragObj, contentWidth, leftMarg, margOffset, showMargOffset, thumbWidth, thumbHeight, isMinimized;


function getElementStyle(IEStyleProp, CSSStyleProp) {
    var elem = document.body;
    if (elem.currentStyle) {
        return elem.currentStyle[IEStyleProp];
    } else if (window.getComputedStyle) {
        var compStyle = window.getComputedStyle(elem, "");
        return compStyle.getPropertyValue(CSSStyleProp);
    }
    return "";
}

function checkIt(string) {
	var place = navigator.userAgent.toLowerCase().indexOf(string) + 1;
	return place;
}

function initOverlay(overlayStr) {
	var cssMarg = parseInt(getElementStyle('marginLeft','margin-left'));
	var htmlMarg = parseInt(document.body.getAttribute('leftMargin'));
	if (isNaN(htmlMarg)) {htmlMarg = 0;}
	leftMarg = cssMarg + htmlMarg;
	if(checkIt('msie')) {
		margOffset = leftMarg/2;
	} else {
		margOffset = 0;
	}

	dv					= document.getElementById('divVHSS');
	dv.style.display 	= 'none';
	dv.style.position	= 'absolute';
	dv.style.zIndex		= 100;
	dvHTML 				= dv.innerHTML;
	positionVhostOn 	= true;
	showMargOffset		= true;
	isMinimized			= false;
	wasMinimized		= false;

	var eo_properties = overlayStr.split("|");
	eo_width	= parseInt(eo_properties[0]);
	eo_height	= parseInt(eo_properties[1]);
	eo_vhostX	= parseInt(eo_properties[2]);
	eo_vhostY	= parseInt(eo_properties[3]);
	eo_horzRef	= eo_properties[4];
	eo_vertRef	= eo_properties[5];
	if (eo_properties[6] == "false") eo_scroll = false;
		else eo_scroll = true;
	eo_drag 	= parseInt(eo_properties[7]);
	eo_closeBtn	= parseInt(eo_properties[8]);
	eo_minimize	= parseInt(eo_properties[9]);
	eo_customThumb = parseInt(eo_properties[10]);
	eo_thumb	= unescape(eo_properties[11]);
	eo_tooltip	= unescape(eo_properties[12]);
	eo_loadMin	= parseInt(eo_properties[13]);
	eo_minimizeTo = eo_properties[14];
	eo_appear	= parseInt(eo_properties[15]);
	eo_hide		= parseInt(eo_properties[16]);
	eo_hideAfter = parseInt(eo_properties[17]);
	eo_contentWinWidth = parseInt(eo_properties[18]);

	var tables = document.getElementsByTagName('table');
	var divs = document.getElementsByTagName('div');
	if(tables[0]) {
		contentWidth = parseInt(tables[0].offsetWidth);
	} else {
		contentWidth = parseInt(divs[0].offsetWidth);
	}

	eo_thumbnail = new Image();
	eo_thumbnail.src = eo_thumb;
	if (eo_customThumb && eo_thumbnail.width != 0) {
		thumbWidth = eo_thumbnail.width;
		thumbHeight = eo_thumbnail.height;
	} else {
		thumbWidth = 50;
		thumbHeight = 50;
	}

	if (eo_drag) {createDrag();}
	if (eo_minimize) {createMinimize();}
	if (eo_closeBtn) {createClose();}

	positionVhost();
	re = window.setInterval('positionVhost()', 10);

	if (eo_loadMin && eo_appear > -1) {
		minimizeVhost();
	} else {
		if (eo_appear == -1) {
			stopSpeech();
			overlay_sceneLoaded_internal = function () { stopSpeech(); };
			dv.style.display = "none";
		} else {
			stopSpeech();
			overlay_sceneLoaded_internal = function () { stopSpeech(); };
			setTimeout(function(){
				dv.style.display = "block"; replay();
				overlay_sceneLoaded_internal = null;
			}, eo_appear*1000);
		}
	}
}

function overlay_talkEnded_internal() {
	if (eo_hide) {
		if (eo_hide == 1) {
			window.setTimeout('dv.style.display = "none";', eo_hideAfter * 1000);
		} else if (eo_hide == 2) {
			if(!document.getElementById("maximize")) {
				var maximize = makeMaximize();
				document.body.appendChild(maximize);
			}
			minimizeVhost();
		}
	}
}

//positioning functions
function getWinWidth() {
	if (self.innerWidth) {
		return self.innerWidth;
	} else if (document.documentElement.clientWidth) {
		return document.documentElement.clientWidth;
	} else {
		return document.body.clientWidth;
	}
}

function getWinHeight() {
	if (self.innerHeight) {
		return self.innerHeight;
	} else if (document.documentElement.clientHeight) {
		return document.documentElement.clientHeight;
	} else {
		return document.body.clientHeight;
	}
}

function detectScroll(dimension) {
	if (eo_scroll) return 0;
	var eo_scrollY, eo_scrollX;

	if (document.documentElement) {
		eo_scrollX = document.documentElement.scrollLeft + document.body.scrollLeft;
		eo_scrollY = document.documentElement.scrollTop + document.body.scrollTop;
	}

	if (window.scrollX) {
		eo_scrollX = window.scrollX;
		eo_scrollY = window.scrollY;
	}

	if (dimension == 'X') {
		return eo_scrollX;
	} else if (dimension == 'Y') {
		return eo_scrollY;
	} else {
		return 0;
	}
}

function positionVhost() {
	if(!showMargOffset) margOffset = 0;
	if(positionVhostOn) {
		switch (eo_horzRef) {
			case "C":
				if (eo_scroll) {
					if (parseInt(getWinWidth()) > contentWidth) {
						dv.style.left	= (parseInt(getWinWidth())/2) + eo_vhostX + margOffset + "px";
					} else {
						dv.style.left	= (contentWidth/2) + eo_vhostX + margOffset + "px";
					}
				} else {
					dv.style.left = (parseInt(getWinWidth())/2) + eo_vhostX + detectScroll('X') + margOffset + "px";
				}
				break;
			case "R":
				dv.style.left	= parseInt(getWinWidth()) + eo_vhostX + detectScroll('X') + "px";
				break;
			default:	// case "L"
				dv.style.left	= eo_vhostX + detectScroll('X') + "px";
				break;
		}

		switch (eo_vertRef) {
			case "B":
				if (isMinimized) {
					document.getElementById("maximize").style.top = parseInt(getWinHeight()) + eo_vhostY + detectScroll('Y') + "px";
					break;
				} else {
					dv.style.top = parseInt(getWinHeight()) + eo_vhostY + detectScroll('Y') + "px";
					break;
				}
			case "M":
				dv.style.top = (parseInt(getWinHeight())/2) + eo_vhostY + detectScroll('Y') + "px";
				break;
			default:	// case "T"
				if (isMinimized) {
					document.getElementById("maximize").style.top = eo_vhostY + detectScroll('Y') + "px";
					break;
				} else {
					dv.style.top = eo_vhostY + detectScroll('Y') + "px";
					break;
				}
		}
	}
}

function resetPosition(newX,newY) {
	var winWidth	= parseInt(getWinWidth());
	var winHeight	= parseInt(getWinHeight());
	switch (eo_horzRef)	{
		case "C":
			eo_vhostX	= newX - (winWidth/2);
			break;
		case "R":
			eo_vhostX	= newX - winWidth;
			break;
		default:	// case "L"
			eo_vhostX	= newX;
			break;
	}

	switch (eo_vertRef) {
		case "B":
			eo_vhostY	= newY - winHeight - detectScroll('Y');
			break;
		case "M":
			eo_vhostY	= newY - (winHeight/2) - detectScroll('Y');
			break;
		default:	// case "T"
			eo_vhostY	= newY - detectScroll('Y');
			break;
	}
}

//drag bar functions
function createDrag() {
	dragObj = new Object();
	dragObj.zIndex = 10;
	if(!document.getElementById("dragBar")) {
		var dragBar = makeDragBar();
		dv.appendChild(dragBar);
	} else {
		var dragBar = document.getElementById("dragBar");
	}
	dragBar.onmousedown = function (e) {dragStart(e,'divVHSS');}
	eo_vhostY = eo_vhostY + 21;
}

function createMinimize() {
	if(!document.getElementById("dragBar")) {
		var dragBar = makeDragBar();
		dv.appendChild(dragBar);
	} else {
		var dragBar = document.getElementById("dragBar");
	}
	var minimize = makeMinimize();
	dragBar.appendChild(minimize);
	var maximize = makeMaximize();
	document.body.appendChild(maximize);
	minimize.onclick = minimizeVhost;
}

function createClose() {
	if(!document.getElementById("dragBar")) {
		var dragBar = makeDragBar();
		dv.appendChild(dragBar);
	} else {
		var dragBar = document.getElementById("dragBar");
	}
	var closeBtn = makeCloseBtn();
	dragBar.appendChild(closeBtn);
	closeBtn.onclick = closeVhost;
}

function makeDragBar() {
	var dragBar = document.createElement('div');
	dragBar.id = "dragBar";
	dragBar.style.position = "absolute";
	dragBar.style.left = "0px";
	dragBar.style.top =  "-21px";
	dragBar.style.height = "19px";
	dragBar.style.width = eo_width - 2 + "px";
	dragBar.style.zIndex = 1000;
	dragBar.style.padding = "0px";
	dragBar.style.backgroundImage = "url("+OddcastDomain+"/admin/images/overlay_dragbar_back.gif)";
	dragBar.style.backgroundRepeat = "repeat-x";
	dragBar.style.borderTop = "1px solid #636363";
	dragBar.style.borderLeft = "1px solid #636363";
	dragBar.style.borderRight = "1px solid #212121";
	dragBar.style.borderBottom = "1px solid #212121";
	dragBar.style.cursor = "move";
	dragBar.style.textAlign = "right";
	return dragBar;
}

function makeCloseBtn() {
	var closeBtn = document.createElement('a');
	closeBtn.innerHTML = "<img src='"+OddcastDomain+"/admin/images/overlay_close_button.gif' />";
	closeBtn.style.width = "18px";
	closeBtn.style.height = "19px";
	closeBtn.style.backgroundColor = "#3e3e3e";
	closeBtn.style.cursor = "pointer";
	return closeBtn;
}

function makeMinimize() {
	var minimize = document.createElement('a');
	minimize.innerHTML = "<img src='"+OddcastDomain+"/admin/images/overlay_minimize_button.gif' />";
	minimize.style.width = "18px";
	minimize.style.height = "19px";
	minimize.style.backgroundColor = "#3e3e3e";
	minimize.style.cursor = "pointer";
	return minimize;
}

function makeMaximize() {
	var maximize = document.createElement('div');
	maximize.id = "maximize";
	maximize.innerHTML = "<a title='" + eo_tooltip + "'><img src='" + eo_thumb + "' width='" + thumbWidth + "' height='" + thumbHeight + "' alt='" + eo_tooltip + "' /></a>";
	maximize.style.position = "absolute";
	maximize.style.border = "1px solid black";
	maximize.style.width = thumbWidth + "px";
	maximize.style.height = thumbHeight + "px";
	maximize.style.cursor = "pointer";
	maximize.style.zIndex = 1000;
	maximize.style.display = "none";
	maximize.style.overflow = "hidden";
	return maximize;
}

function showVhost(play) {
	if(!isOverlay) return;
	if(isMinimized) return;
	if(!document.getElementById('maximize')) {
		var maximize = makeMaximize();
		document.body.appendChild(maximize);
	} else {
		var maximize = document.getElementById('maximize');
	}
	if (eo_minimizeTo == "T") {
		var newX = parseInt(maximize.style.left, 10);
		var newY = parseInt(maximize.style.top, 10) + 21;
	} else {
		var newX = parseInt(maximize.style.left, 10) - (eo_width / 2) + (thumbWidth/2);
		var newY = parseInt(maximize.style.top, 10) - (eo_height / 2) + (thumbHeight/2) + 21;
	}
	if(!isNaN(newX)) {
		if (newX < 0) {newX = 0;}
		if (newY < 21) {newY = 21;}
		resetPosition(newX,newY);
		dv.style.left = newX + "px";
		dv.style.top = newY + "px";
	}
	dv.style.display = "block";
	wasMinimized = false;
	if(play == 0) {
		stopSpeech();
		overlay_sceneLoaded_internal = function () {
			stopSpeech();
		}
	} else if (play == 1) {
		replay(1);
		overlay_sceneLoaded_internal = function () {
			replay(1);
		}
	} else {
		overlay_sceneLoaded_internal = null;
		gotoScene(1);
	}
}

function closeVhost() {
	if(!isOverlay) return;
	if (isMinimized) {
		document.getElementById('maximize').style.display = 'none';
		isMinimized = false;
		wasMinimized = true;
	} else {
		wasMinimized = false;
	}
	stopSpeech();
	dv.style.display = 'none';
}

function maximizeVhost(play) {
	if(!isOverlay) return;
	if(!isMinimized) return;
	if(!document.getElementById('maximize')) return;
	var maximize = document.getElementById('maximize');
	if (eo_minimizeTo == "T") {
		var newX = parseInt(maximize.style.left, 10);
		var newY = parseInt(maximize.style.top, 10) + 21;
	} else {
		var newX = parseInt(maximize.style.left, 10) - (eo_width / 2) + (thumbWidth/2);
		var newY = parseInt(maximize.style.top, 10) - (eo_height / 2) + (thumbHeight/2) + 21;
	}
	if (newX < 0) {newX = 0;}
	if (newY < 21) {newY = 21;}
	resetPosition(newX,newY);
	dv.style.left = newX + "px";
	dv.style.top = newY + "px";
	maximize.style.display = "none";
	dv.style.display = "block";
	isMinimized = false;
	wasMinimized = false;
	if(play == 0) {
		stopSpeech();
		overlay_sceneLoaded_internal = function () {
			stopSpeech();
		}
	} else if (play == 1) {
		replay();
		overlay_sceneLoaded_internal = null;
	} else {
		overlay_sceneLoaded_internal = null;
	}
}

function minimizeVhost() {
	if(!isOverlay) return;
	if(isMinimized) return;
	if(!document.getElementById('maximize')) {
		var maximize = makeMaximize();
		document.body.appendChild(maximize);
	} else {
		var maximize = document.getElementById('maximize');
	}

	if (eo_minimizeTo == "T") {
		var newX = parseInt(dv.style.left, 10);
		var newY = parseInt(dv.style.top, 10) - 21;
	} else {
		if(!wasMinimized) {
			var newX = parseInt(dv.style.left, 10) + (eo_width / 2) - (thumbWidth/2);
			var newY = parseInt(dv.style.top, 10) + (eo_height / 2) - (thumbHeight/2) - 21;
			wasMinimized = false;
		} else {
			var newX = parseInt(dv.style.left, 10);
			var newY = parseInt(dv.style.top, 10) - 21;
			wasMinimized = true;
		}
	}
	if (newX < 0) {newX = 0;}
	if (newY < 21) {newY = 21;}
	resetPosition(newX,newY);
	maximize.style.left = newX + "px";
	maximize.style.top = newY + "px";

	dv.style.display = 'none';
	maximize.style.display = 'block';
	maximize.onmousedown = function (e) {dragStart(e,'maximize');}
	maximize.ondblclick = function () {maximizeVhost();}
	isMinimized = true;
	stopSpeech();
}

//drag functions
var mouseX, mouseY;
function getMousePos(e) {
	if(!e) e = window.event;
	if (e.srcElement) {
		mouseX = window.event.clientX + document.documentElement.scrollLeft + document.body.scrollLeft;
		mouseY = window.event.clientY + document.documentElement.scrollTop + document.body.scrollTop;
	}
	if (e.target) {
		mouseX = e.clientX + window.scrollX;
		mouseY = e.clientY + window.scrollY;
	}
}

function dragStart(e, id) {
	if(!e) e = window.event;
	positionVhostOn = false;
	showMargOffset = false;
	var el;
	if(!dragObj) dragObj = new Object();
	
	// If an element id was given, find it. Otherwise use the element being clicked on.
	if (id) {
		
		dragObj.elNode = document.getElementById(id);
	} else {
		if (e.srcElement) {dragObj.elNode = window.event.srcElement;}
		if (e.target) {dragObj.elNode = event.target;}

		// If this is a text node, use its parent element.
		if (dragObj.elNode.nodeType == 3) {dragObj.elNode = dragObj.elNode.parentNode;}
	}
	
	// Get cursor position with respect to the page.
	getMousePos(e);

	// Save starting positions of cursor and element.
	dragObj.cursorStartX = mouseX;
	dragObj.cursorStartY = mouseY;
	dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
	dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);

	if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
	if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;

	// Update element's z-index.
	dragObj.elNode.style.zIndex = ++dragObj.zIndex;

	// Capture mousemove and mouseup events on the page.
	if (e.srcElement) {
		document.attachEvent("onmousemove", dragGo);
		document.attachEvent("onmouseup",   dragStop);
		window.event.cancelBubble = true;
		window.event.returnValue = false;
	}
	if (e.target) {
		document.addEventListener("mousemove", dragGo,   true);
		document.addEventListener("mouseup",   dragStop, true);
		e.preventDefault();
	}
}

function dragGo(event) {
	// Get cursor position with respect to the page.
	getMousePos(event);

	// Move drag element by the same amount the cursor has moved.
	dragObj.elNode.style.left = (dragObj.elStartLeft + mouseX - dragObj.cursorStartX) + "px";
	dragObj.elNode.style.top  = (dragObj.elStartTop  + mouseY - dragObj.cursorStartY) + "px";
	dragObj.elNode.style.zIndex = 1000;

	if (event.srcElement) {
		window.event.cancelBubble = true;
		window.event.returnValue = false;
	}
	if (event.target) {
		event.preventDefault();
	}
}

function dragStop(event) {
	// Stop capturing mousemove and mouseup events.
	if (event.srcElement) {
		document.detachEvent("onmousemove", dragGo);
		document.detachEvent("onmouseup",   dragStop);
	}
	if (event.target) {
		document.removeEventListener("mousemove", dragGo,   true);
		document.removeEventListener("mouseup",   dragStop, true);
	}
	var newX = parseInt(dragObj.elNode.style.left, 10);
	var newY = parseInt(dragObj.elNode.style.top,  10);
	dragObj.elNode.style.zIndex = 1000;
	resetPosition(newX,newY);
	positionVhostOn = true;
}

if(window.globalOverlayString && globalOverlayString!=''){
	initOverlay(globalOverlayString);
}