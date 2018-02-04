<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>配送模块主页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
	<div id="view_busiJrn_preOutBillSubPage_distBill_dialog" title="配送单"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-print',modal:true"
		style="width: 800px;height: 360px; padding: 10px 10px 10px 10px">
	</div>
	<div id="view_busiJrn_distErr_dialog" title="配送失败原因"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 380px;height: 180px;">
		<form id="view_busiJrn_distErr_form">
			<table style="font-weight: bold;color: #0E2D5F;font-size: 12px;">
				<tr>
					<td>请填写配送失败原因：</td>
					<td hidden="true"><input id="view_busiJrn_distErr_form_cusId"
						type="text" style="display: none" /></td>
				</tr>
				<tr>
					<td colspan="2"><input id="view_busiJrn_distErr_form_errInfo"
						class="easyui-textbox" data-options="multiline:true" value=""
						style="height: 60px;width: 350px;" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="distErrInfoF();">&nbsp;确&nbsp;定&nbsp;</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
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
									cusSts : '02',
									flag : 'distBill'
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
												if (row.cusId) {
													var str = '';
													if (row.cusId != '') {
														str = str
																+ '<a href="javascript:void(0)" onclick="findDistBill('
																+ row.cusId
																+ ')">'
																+ row.plateNo
																+ '</a>';
													}
													return str;
												} else {
													return row.plateNo;
												}
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
											width : 200,
											formatter : function(value, row,
													index) {
												if (row.cusId) {
													var str = '';
													if (row.cusId != '') {
														if (s == 0) {
															str = str
																	+ '<a href="javascript:void(0)" class="sucDist" onclick="sucDistF('
																	+ row.cusId
																	+ ')">配送完成</a>';
															str = str
																	+ '<a href="javascript:void(0)" class="errDist" onclick="errDistF('
																	+ row.cusId
																	+ ')">配送失败</a>';
														}
													}
													return str;
												} else {
													return '';
												}
											}
										}, ] ],
								onLoadSuccess : function(data) {
									$('.sucDist').linkbutton({
										text : '配送成功',
										plain : true,
										iconCls : 'icon-edit'
									});
									$('.errDist').linkbutton({
										text : '配送失败',
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
		//查看配送单
		var findDistBill = function findDistBill(cusId) {
			var str = '${pageContext.request.contextPath }/busiJrn/findDistBillByCusId.do?cusId='
					+ cusId;
			$('#view_busiJrn_preOutBillSubPage_distBill_dialog').dialog('open')
					.dialog('refresh', str);
		};
		//配送成功确认
		var sucDistF = function sucDistF(cusId) {
			$.messager
					.confirm(
							'确认',
							'请确保保单已经配送成功！',
							function(r) {
								if (r) {
									$
											.ajax({
												type : 'post',
												url : '${pageContext.request.contextPath }/busiJrn/distBillConfirm.do',
												dataType : 'text',
												data : {
													'cusId' : cusId,
													'flag' : 'suc',
													'errMsg' : ''
												},
												success : function(xmlq) {
													alert(xmlq);
													$(
															'#view_custInfo_updCustInfo_tab0_datagrid')
															.datagrid('reload');
													$(
															'#view_custInfo_updCustInfo_tab1_datagrid')
															.datagrid('reload');
												},
												error : function(xmlq, errq) {
													alert(xmlq);
												}
											});
								}
							});
		};
		//配送失败-填写无法配送原因
		var errDistF = function errDistF(cusId) {
			$('#view_busiJrn_distErr_form_cusId').val(cusId);
			$('#view_busiJrn_distErr_dialog').dialog('open');
		};
		var distErrInfoF = function distErrInfoF() {
			if ($('#view_busiJrn_distErr_form').form('validate')) {
				$.messager
						.confirm(
								'确认',
								'请确定要执行配送失败的操作吗？',
								function(r) {
									if (r) {
										$
												.ajax({
													type : 'post',
													url : '${pageContext.request.contextPath }/busiJrn/distBillConfirm.do',
													dataType : 'text',
													data : {
														'cusId' : $(
																'#view_busiJrn_distErr_form_cusId')
																.val(),
														'flag' : 'err',
														'errMsg' : $(
																'#view_busiJrn_distErr_form_errInfo')
																.val()
													},
													success : function(xmlq) {
														alert(xmlq);
														$(
																'#view_busiJrn_distErr_dialog')
																.dialog('close');
														$(
																'#view_custInfo_updCustInfo_tab0_datagrid')
																.datagrid(
																		'reload');
														$(
																'#view_custInfo_updCustInfo_tab1_datagrid')
																.datagrid(
																		'reload');
													},
													error : function(xmlq, errq) {
														alert(xmlq);
													}
												});
									}
								});
			}
		};
	</script>
</body>
</html>
