mouseMode=1;

var vh_mc = null;

var InternetExplorer = navigator.appName.indexOf("Microsoft") != -1;

if(InternetExplorer){
	sep1 = sep2 = ".";
}else{
	sep1 = ":";
	sep2 = "/";
}

function VHSS_Command(eventName, args) {
	if (eventName == "onSlideBegin" || eventName == "sceneLoaded" || eventName == "vh_sceneLoaded") {
		if (vh_mc == null){
			vh_mc = document["VHSS"];
		}
		if (window.vh_sceneLoaded != null){
			vh_sceneLoaded(args);
		}
		if (window.overlay_sceneLoaded_internal != null)	overlay_sceneLoaded_internal();
	}
	else if (eventName == "vh_scenePreloaded") {
		if (window.vh_scenePreloaded != null)	vh_scenePreloaded();
	}
	else if (eventName=="hostLoaded" || eventName=="vh_hostLoaded") {
		if (window.vh_hostLoaded != null)	vh_hostLoaded();
	}
	else if (eventName=="talkStarted" || eventName=="vh_talkStarted") {
		if (window.vh_talkStarted != null)	vh_talkStarted();
	}
	else if (eventName=="talkEnded" || eventName=="vh_talkEnded") {
		if (window.vh_talkEnded != null)	vh_talkEnded();
		if (window.overlay_talkEnded_internal != null)	overlay_talkEnded_internal();
	}
	else if (eventName=="audioLoaded" || eventName=="vh_audioLoaded"){
		if (window.vh_audioLoaded != null)	vh_audioLoaded(args);
	}
	else if (eventName == "ttsLoaded" || eventName == "vh_ttsLoaded"){
		if (window.vh_ttsLoaded != null)	vh_ttsLoaded(args);
	}
	else if (eventName=="aiResponse" || eventName=="vh_aiResponse"){
		if (window.vh_aiResponse != null){
			var ai_array = args.split("|");
			vh_aiResponse(unescape(ai_array[0]), ai_array[1]);
		}
	}
	else if (eventName == "audioProgress" || eventName == "vh_audioProgress"){
		if (window.vh_audioProgress !=null) vh_audioProgress(args);
	}
	else if (eventName == "vh_followOnPage"){
		//alert("follow in page " + args);
		if (window.mousemoveCapture != null && args == 4){
			//alert("follow in page  -- pass");
			mousemoveCapture();
		}
		else if (window.mousemoveRelease != null && (args == 0 || args == 2)){
			mousemoveRelease();
		}
	}
	else if (eventName=="audioStarted" || eventName=="vh_audioStarted") {
		if (window.vh_audioStarted != null)	vh_audioStarted();
	}
	else if (eventName=="audioEnded" || eventName=="vh_audioEnded") {
		if (window.vh_audioEnded != null)	vh_audioEnded();
	}
}

function stopSpeech(){
	if(!vh_mc) return;
	vh_mc.stopSpeech();
}

function sayText(ttsText, voice, lang, engine, fx_type, fx_level){
	if(!vh_mc)	return;
	vh_mc.sayText(encodeURIComponent(ttsText), voice, lang, engine, fx_type, fx_level, "js");
}

function sayAIResponse(ttsText, voice, lang, engine, botid, fx_type, fx_level){
	if(!vh_mc) return;
	vh_mc.sayAIResponse(encodeURIComponent(ttsText), voice, lang, engine, botid, fx_type, fx_level, "js");
}

function sayAudio(audioName, stTime){
	if(!vh_mc) return;
	vh_mc.sayAudio(audioName, stTime);
}

function loadText(ttsText, voice, lang, engine, fx_type, fx_level){
	if(!vh_mc) return;
	vh_mc.loadText(encodeURIComponent(ttsText), voice, lang, engine, fx_type, fx_level, "js");
}

function loadAudio(audioName){
	if(!vh_mc) return;
	vh_mc.loadAudio(audioName);	
}

function loadShow(showIndex){
	if(!vh_mc) return;
	vh_mc.loadShow(showIndex);
}

function loadScene(sceneIndex){
	loadShow(sceneIndex);
}

function setBackground(bgName){
	if(!vh_mc) return;
	vh_mc.setBackground(bgName);
}

function replay(_val){
	if(!vh_mc) return;
	vh_mc.replay(_val);
}

function setInterruptMode(_mode){
	if(!vh_mc) return;
	vh_mc.setInterruptMode(_mode);
}

function setStatus(interruptMode, audioProgress, lookSpeed, randomMvmt){
	if (!vh_mc) return;
	vh_mc.setStatus(interruptMode, audioProgress, lookSpeed, randomMvmt);
}

function saySilent(init_time){
	if(!vh_mc) return;
	vh_mc.saySilent(init_time);
}

function setPlayerVolume(in_vol){
	if(!vh_mc) return;
	vh_mc.setPlayerVolume(in_vol);
}

function followCursor(newMouseMode){
	
	if(!vh_mc) return;
	if (newMouseMode == 2)
		mousemoveCapture();
	else
		mousemoveRelease();
	
	vh_mc.followCursor(newMouseMode);
}

function recenter(){
	if(!vh_mc) return;
	vh_mc.recenter();
}

function setGaze(deg, dur, rad, pageReq){
	if(!vh_mc) return;
	vh_mc.setGaze(deg, dur, rad, pageReq);
}

function freezeToggle(){
	if(!vh_mc) return;
	vh_mc.freezeToggle();
}

function setColor(part_js, clr_js){
	if(!vh_mc) return;
	vh_mc.setColor(part_js, clr_js);
}

function isNewSession(){
	return true;
}

function sendCustomEvent(ce_index)
{
	if(!vh_mc) return;
	vh_mc.setCustomEvent(ce_index);
}


// --- Embed Overlay api ---
function overlayOpen(_min, _play){
	if (window.showVhost != null){
		if (_min == "min"){
			minimizeVhost();
		}else{
			if (isMinimized) {
				maximizeVhost(_play);
			} else {
				showVhost(_play);
			}
		}
	}
}

function overlayClose(){
	if (window.closeVhost != null)	closeVhost();
}

function overlayMaximize(_play){
	//if (window.maximizeVhost != null)	maximizeVhost(_play);
}

function overlayMinimize(){
	if (window.minimizeVhost != null)	minimizeVhost();
}
// --- End Embed Overlay api ---

function setLink(href, targetName){
	if(!vh_mc) return;
	vh_mc.setLink(href, targetName);
}

function SetLink (href, targetName){
	if(!vh_mc) return;
	vh_mc.setLink(href, targetName);
}

function showTranscript(acc_id,ss_id,audioID,slidenum){
	transWindow = window.open("http://vhss.oddcast.com/transcript_frame.php?acc="+acc_id+"&ss="+ss_id+"&au="+audioID+"&sn="+slidenum,"transWindow","width=500,height=500,toolbar=no,resizable=no");
	transWindow.focus();
}

function sayAIResponseExported(ttsText,voice,lang,engine,account){
	if(!vh_mc) return;
	vh_mc.sayAIResponseExported(encodeURIComponent(ttsText), voice, lang, engine, account);
}

function sayAudioExported(audioName, account, stTime){
	if(!vh_mc) return;
	vh_mc.sayAudioExported(audioName, account, stTime);
}

function sayTextExported(ttsText,voice,lang,engine,account){
	if(!vh_mc) return;
	vh_mc.sayTextExported(encodeURIComponent(ttsText), voice, lang, engine, account);
}

function sayTextEmo(ttsText,voice,lang,engine,emo){
	if(!vh_mc) return;
	vh_mc.sayTextEmo(encodeURIComponent(ttsText), voice, lang, engine, emo);
}

function hostSleep(_state){
	if(!vh_mc) return;
	vh_mc.sleepState(_state);
}

//Pro functions
function setNextSceneIndex(slideRange){
	if(!vh_mc) return;
	vh_mc.setNextSceneIndex(slideRange);
}

function gotoScene(slideIndex){
	if(!vh_mc) return;
	vh_mc.gotoScene(slideIndex);
}

function gotoNextScene (){
	if(!vh_mc) return;
	vh_mc.gotoNextScene();
}

function gotoPrevScene(){
	if(!vh_mc) return;
	vh_mc.gotoPrevScene();
}

function preloadScene(slideIndex){
	if(!vh_mc) return;
	vh_mc.preloadScene(slideIndex);
}

function preloadNextScene(){
	if(!vh_mc) return;
	vh_mc.preloadNextScene();
}