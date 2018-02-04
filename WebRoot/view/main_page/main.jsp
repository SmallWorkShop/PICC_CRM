<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>中国人民财产保险公司CRM-WELCOME</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="renderer" content="webkit" />
</head>
<!-- ../../images/main_bg.jpg -->
<body background="">
	<!-- <h2 style="color:#0E2D5F ">中国人民财产保险股份有限公司-客户关系管理系统（CRM）</h2> -->
	<img alt="中国人民财产保险股份有限公司-客户关系管理系统（CRM）" src="../../images/logo2.jpg">
	<div
		style="text-align: right;padding-right: 50px;width: 100%;font-weight: bold;color: #0E2D5F;font-size: 10px;">
		${userSession.uNme },您好，欢迎你来到人保CRM！&nbsp;&nbsp; <a
			href="javascript:void(0);" class="exitClass" onclick="exitBt();">新增客户&nbsp;</a>
	</div>
	<div class="easyui-layout" style="width:100%;height:100%;">
		<div id="view_main_page_main_layout_north"
			data-options="region:'north',href:'${pageContext.request.contextPath }/view/main_page/voice.jsp'"
			style="height:35px;display: none;"></div>
		<div data-options="region:'south',split:true"
			style="height:30px;padding: 5px;text-align: center;">
			@CopyRight zhengz.fly 2015</div>
		<div data-options="region:'west',split:true" title="菜单"
			style="width:200px;padding:5px 0px 10px 20px;">
			<div class="easyui-layout" data-options="fit:true,border:false"
				style="width: 100%;height: 400px">
				<div data-options="region:'center',fit:true,border:false">
					<ul id="main_page_left_tree_menu" class="easyui-tree"
						data-options="editable : true,
							idField : 'id',
							textField : 'text',
							parentField : 'pid'"></ul>
				</div>
				<!-- <div data-options="region:'south',split:true,border:false"
					style="height:200px;border: 0px;"></div> -->
			</div>
		</div>
		<div id="view_page_main_layout_center"
			data-options="region:'center',title:'操作页面'"></div>
	</div>
	<div id="view_main_page_main_message_tips" title="新消息"
		style="display: none;"></div>
	<script type="text/javascript">
		$('#main_page_left_tree_menu').tree({
			data : JSON.parse('${sessionScope.treeString}')
		});
		$('#main_page_left_tree_menu')
				.tree(
						{
							onClick : function(node) {
								$('#view_page_main_layout_center')
										.panel(
												{
													title : node.text,
													href : '${pageContext.request.contextPath }/'
															+ node.attributes.url
												});
							}
						});
		$('.exitClass').linkbutton({
			text : '注销',
			plain : true,
			iconCls : 'icon-back'
		});
		var exitBt = function exitBt() {
			$.messager
					.confirm(
							'确认',
							'您确认要退出吗？',
							function(r) {
								if (r) {
									window.location.href = '${pageContext.request.contextPath }/user/userExit.do';
								}
							});
		};
		//var mar = 5 * 60 * 1000;
		var dealTaskPage = function dealTaskPage(title, url) {
			$('#view_page_main_layout_center').panel({
				title : title,
				href : url
			});
		};
		//showPending('${pageContext.request.contextPath }');
		//var mar = 5 * 60 * 1000;
		//var inter = setInterval(
		//		"showPending('${pageContext.request.contextPath }')", mar);
	</script>
</body>
</html>