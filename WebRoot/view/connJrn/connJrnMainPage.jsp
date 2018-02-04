<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>联系日志管理界面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div id="view_custInfo_updCustInfo_tab" class="easyui-tabs"
		data-options="border:false,fit:true" style="width:500px;height:250px;">
		<div title="我的客户" style="padding: 10px 5px ;height: 30px">
			<form id="view_custInfo_updCustInfo_tab1_form" action=""
				style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
				<input id="selectSuId0" name="sUId" value="${userSession.uId }"
					size="5" hidden="true" style="display: none" /> 车牌号码：<input
					id="plateNoSelectId0" class="easyui-textbox" size="10"
					name="plateNo">&nbsp; 车架号码：<input id="frameNoSelectId0"
					class="easyui-textbox" size="10" name="frameNo">&nbsp; 姓名：<input
					id="cusNmeSelectId0" class="easyui-textbox" size="8" name="cusNme">&nbsp;
				手机号码：<input id="cusPhonSleectId0" class="easyui-textbox" size="11"
					name="cusPhon">&nbsp; <a href="javascript:void(0);"
					class="findClass0" onclick="findCustInfo(0);">精确查询</a>
			</form>
			<div title="">
				<table id="view_custInfo_updCustInfo_tab0_datagrid"
					style="width: 100%;height: 350px;">
				</table>
			</div>
		</div>
		<div title="下属客户" style="padding: 10px 5px ;height: 30px">
			<form id="view_custInfo_updCustInfo_tab2_form" action=""
				style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
				下属：<select id="selectSuIdcombotree" class="easyui-combotree"
					name="sUId" style="width: 130px"
					data-options="editable:true,idField:'id',textField:'text',animate : true,parentField:'pid',iconCls : 'icon-user',
							url:'${pageContext.request.contextPath }/user/findSonUserTree.do'"></select>
				<input id="selectSuId1" value="" hidden="true" style="display: none">
				&nbsp; 车牌号码：<input id="plateNoSelectId1" class="easyui-textbox"
					size="10" name="plateNo">&nbsp; 车架号码：<input
					id="frameNoSelectId1" class="easyui-textbox" size="10"
					name="frameNo">&nbsp; 姓名：<input id="cusNmeSelectId1"
					class="easyui-textbox" size="8" name="cusNme">&nbsp; 手机号码：<input
					id="cusPhonSleectId1" class="easyui-textbox" size="11"
					name="cusPhon">&nbsp; <a href="javascript:void(0);"
					class="findClass0" onclick="findCustInfo(1);">精确查询</a>
			</form>
			<div title="">
				<table id="view_custInfo_updCustInfo_tab1_datagrid"
					style="width: 100%;height: 350px;">
				</table>
			</div>
		</div>
	</div>
	<div id="view_connJrn_connrnMainPage_connEdit" title="添加联系记录"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 680px;height: 300px;padding: 5px 5px;"></div>
	<div id="view_connJrn_connrnMainPage_connFind" title="联系记录"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 680px;height: 300px;padding: 5px 5px;"></div>
	<script type="text/javascript">
		$('.findClass0').linkbutton({
			text : ' 搜    索  ',
			plain : true,
			iconCls : 'icon-search'
		});
		//select选项变量赋值（坑爹的地方）
		$('#selectSuIdcombotree').combotree({
			onSelect : function(rec) {
				$('#selectSuId1').val(rec.id);
			}
		});
		var findCustInfo = function findCustInfo(s) {
			$('#view_custInfo_updCustInfo_tab' + s + '_datagrid')
					.datagrid(
							{
								url : '${pageContext.request.contextPath}/custInfo/findCustInfoForUpd.do',
								queryParams : {
									busierId : $('#selectSuId' + s).val(),
									plateNo : $('#plateNoSelectId' + s).val(),
									frameNo : $('#frameNoSelectId' + s).val(),
									cusNme : $('#cusNmeSelectId' + s).val(),
									cusPhon : $('#cusPhonSleectId' + s).val(),
									cusSts : '00'
								},
								fitColumns : true,
								singleSelect : true,
								pagination : true,
								rownumbers : false,
								idField : 'cusId',
								resizable : true,
								remoteSort : false,
								columns : [ [
										{
											field : 'plateNo',
											title : '车牌号',
											width : 100,
											formatter : function(value, row,
													index) {
												var str = '';
												if (row.cusId) {
													str = str
															+ '<a href="javascript:void(0)" onclick="findConnJrn('
															+ row.cusId + ','
															+ 'null' + ')">'
															+ row.plateNo
															+ '</a>';
												} else {
													str = row.plateNo;
												}
												return str;
											}
										},
										{
											field : 'brand',
											title : '品牌',
											width : 100
										},
										{
											field : 'brandTyp',
											title : '品牌型号',
											width : 100
										},
										{
											field : 'frameNo',
											title : '车架号码',
											width : 100
										},
										{
											field : 'engineNo',
											title : '发动机号码',
											width : 100
										},
										{
											field : 'logDate',
											title : '初登日期',
											width : 100
										},
										{
											field : 'cusNme',
											title : '客户姓名',
											width : 100
										},
										{
											field : 'cusIdNo',
											title : '身份证号码',
											width : 100
										},
										{
											field : 'cusPhon',
											title : '电话1',
											width : 100
										},
										{
											field : 'cusTel',
											title : '电话2',
											width : 100
										},
										{
											field : 'cusAddr',
											title : '客户地址',
											width : 100
										},
										{
											field : 'op',
											title : '操作',
											width : 100,
											formatter : function(value, row,
													index) {
												if (row.cusSts) {
													var str = '';
													if (row.cusId != '') {
														if (s == 0) {
															str = str
																	+ '<a href="javascript:void(0)" class="editClass" onclick="findConnJrn('
																	+ row.cusId
																	+ ','
																	+ '\'addConnJrn\''
																	+ ')">联系</a>';
														}
													}
													return str;
												} else {
													return '';
												}
											}
										}, ] ],
								onLoadSuccess : function(data) {
									$('.editClass').linkbutton({
										text : '联系',
										plain : true,
										iconCls : 'icon-edit'
									});
								}
							});
			var p = $('#view_custInfo_updCustInfo_tab1_datagrid').datagrid(
					'getPager');
			$(p).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10   
				pageList : [ 10, 20, 30 ],//可以设置每页记录条数的列表   
				beforePageText : '第',//页数文本框前显示的汉字   
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		};
		//查看客户的联系记录
		var findConnJrn = function findConnJrn(cusId, flag) {
			var str = '${pageContext.request.contextPath }/connJrn/findCustConnJrnByObj.do?cusId='
					+ cusId + '&flag=' + flag;
			if (flag == 'addConnJrn') {
				$('#view_connJrn_connrnMainPage_connEdit').dialog('open')
						.dialog('refresh', str);
			} else {
				$('#view_connJrn_connrnMainPage_connFind').dialog('open')
						.dialog('refresh', str);
			}
		};
		//添加客户信息联系记录
		//var addConnJrn = function(cusId) {
		//	var str = '${pageContext.request.contextPath }/connJrn/findCustConnJrnByObj.do?cusId='
		//			+ cusId + '&flag=' + 'addConnJrn';
		//	$('#view_connJrn_connrnMainPage_connEdit').dialog('open').dialog(
		//			'refresh', str);
		//$('#view_connJrn_connrnMainPage_connFind').dialog('open').dialog(
		//		'refresh', str);
		//};
	</script>
</body>
</html>
