var prConn = false;
var prSign = false;
var prOut = false;
var prDist = false;
var connList = "";
var signList = "";
var outList = "";
var distList = "";
var rootUrl = "";
var jsonA;
var showPending = function showPending(url) {
	rootUrl = url;
	var sRootUrl = rootUrl + '/busiRemind/findCustForPending.do';
	$.ajax({
		type : 'post',
		url : sRootUrl,
		dataType : 'json',
		data : {
			prConn : prConn,
			prSign : prSign,
			prOut : prOut,
			prDist : prDist,
			connList : connList,
			signList : signList,
			outList : outList,
			distList : distList
		},
		success : function(xmlq) {
			// jsonA = JSON.parse(xmlq);
			jsonA = xmlq;
			// alert(jsonA.prConn);
			connList = jsonA.connList;
			signList = jsonA.signList;
			outList = jsonA.outList;
			distList = jsonA.distList;
			htmlDiv(jsonA.prConn, jsonA.prSign, jsonA.prOut, jsonA.prDist);
		},
		error : function(xmlq, errq) {
			jsonA = JSON.parse(xmlq);
		}
	});

};
var htmlDiv = function htmlDiv(prC, prS, prO, prD) {
	var htmlText = "";
	var title;
	var url;
	if (prC) {
		title = "客户联系记录查询";
		url = rootUrl + "/view/connJrn/connJrnMainPage.jsp";
		htmlText += "<a href='javascript:void(0)' style='text-decoration:none;' onclick='dealTaskPage(\""
				+ title + "\",\"" + url + "\")'>您有待联系的客户需要处理。</a>&nbsp;&nbsp;";
		prConn = false;
	}
	if (prS) {
		title = "待签单客户查询";
		url = rootUrl + "/view/busiJrn/busiSignBillMain.jsp";
		htmlText += "<a href='javascript:void(0)' style='text-decoration:none;' onclick='dealTaskPage(\""
				+ title + "\",\"" + url + "\")'>您有待签单的客户需要处理。</a>&nbsp;&nbsp;";
		prSign = false;
	}
	if (prO) {
		title = "待出单客户查询";
		url = rootUrl + "/view/busiJrn/preOutBillMain.jsp";
		htmlText += "<a href='javascript:void(0)' style='text-decoration:none;' onclick='dealTaskPage(\""
				+ title + "\",\"" + url + "\")'>您有待出单的客户需要处理。</a>&nbsp;&nbsp;";
		prOut = false;
	}
	if (prD) {
		title = "待配送客户查询";
		url = rootUrl + "/view/busiJrn/distBillMain.jsp";
		htmlText += "<a href='javascript:void(0)' style='text-decoration:none;' onclick='dealTaskPage(\""
				+ title + "\",\"" + url + "\")'>您有待配送的客户需要处理。</a>&nbsp;&nbsp;";
		prDist = false;
	}
	if (htmlText != "") {
		$('#view_main_page_voice_marquee').html(htmlText);
		// parent.$('#view_main_page_main_message_tips').
		$.messager.show({
			title : '新消息',
			msg : htmlText,
			timeout : '0'
		});
		myAudio();
	}
	// alert(htmlText);

};
var myAudio = function myAudio() {
	var audio = document.getElementById("view_main_page_voice_audio");
	if (audio.paused) {
		audio.play();
		return;
	}
	audio.pause();
};
