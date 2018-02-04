<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>
<title>待处理任务提示音</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<script type="text/javascript" src="../../nyjs/myvoice.js"></script>
	<div>
		<audio id='view_main_page_voice_audio'>
			<source src="../../voice/4331.ogg" type="audio/ogg" />
			<source src="../../voice/4331.mp3" type="audio/mpeg" />
			<!--<embed height="100" width="100" src="../../voice/4331.mp3" />-->
		</audio>
	</div>
	<div id="view_main_page_voice_showhtml"
		style="padding: 8px 50px 5px 200px;font-size: 15px;">
		<marquee id="view_main_page_voice_marquee" width="550px;"
			direction="left" scrollamount="5" onmouseover="this.stop()"
			onmouseout="this.start()">
			<!-- <a href="javascript:void(0)" onclick="dealTaskPage(title,url)">您有待联系的客户需要处理。</a>&nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="dealTaskPage(title,url)">您有待签单的客户需要处理。</a>&nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="dealTaskPage(title,url)">您有待出单的客户需要处理。</a>&nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="dealTaskPage(title,url)">您有待配送的客户需要处理。</a>&nbsp;&nbsp;
			 -->
		</marquee>
	</div>
	<script type="text/javascript">
		//var mar = 5 * 60 * 1000;
		var dealTaskPage = function dealTaskPage(title, url) {
			parent.$('#view_page_main_layout_center').panel({
				title : title,
				href : url
			});
		};
		showPending('${pageContext.request.contextPath }');
		var mar = 5 * 60 * 1000;
		var inter = setInterval(
				"showPending('${pageContext.request.contextPath }')", mar);
	</script>
</body>
</html>
