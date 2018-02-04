<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>
<title>待出单客户信息操作</title>
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
			<form id="view_custInfo_updCustInfo_tab1_form" action="" style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
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
		<!--  <div title="下属客户" style="padding: 10px 5px ;height: 30px;">
			<form id="view_custInfo_updCustInfo_tab2_form" action="">
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
		</div>-->
	</div>
	<div id="view_custInfo_updCustInfo_updForm_div" title="客户出单"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 580px;height: 360px;"></div>
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
									//busierId : $('#selectSuId' + s).val(),
									plateNo : $('#plateNoSelectId' + s).val(),
									frameNo : $('#frameNoSelectId' + s).val(),
									cusNme : $('#cusNmeSelectId' + s).val(),
									cusPhon : $('#cusPhonSleectId' + s).val(),
									cusSts : '01',
									flag:'outBill'
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
											width : 100
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
											width : 155,
											formatter : function(value, row,
													index) {
												if (row.cusId) {
													var str = '';
													if (row.cusId != '') {
														if (s == 0) {
															str = str
																	+ '<a href="javascript:void(0)" class="editClass" onclick="editCustInfo('
																	+ row.cusId
																	+ ')">出单</a>';
														}
														if (s == -1) {
															str = str
																	+ '<a href="javascript:void(0)" class="removeClass" onclick="removeCustInfo('
																	+ row.cusId
																	+ ')">删除</a>';
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
										text : '出单',
										plain : true,
										iconCls : 'icon-edit'
									});
									$('.removeClass').linkbutton({
										text : '删除',
										plain : true,
										iconCls : 'icon-remove'
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
		//修改删除客户信息方法
		var editCustInfo = function(cusId) {
			var str = '${pageContext.request.contextPath }/busiJrn/findCustInforOutBill.do?cusId='
					+ cusId;
			$('#view_custInfo_updCustInfo_updForm_div').dialog('open').dialog(
					'refresh', str);
		};
		var removeCustInfo = function(cusId) {
			var str = '${pageContext.request.contextPath }/custInfo/deleteCustInfoByKey.do?cusId='
					+ cusId;
			$.messager.confirm('确认', '【慎重】您确定要删除该客户信息吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'post',
						url : str,
						dataType : 'text',
						success : function(xmlq) {
							alert(xmlq);
							$('#view_custInfo_updCustInfo_tab0_datagrid')
									.datagrid('reload');
							$('#view_custInfo_updCustInfo_tab1_datagrid')
									.datagrid('reload');
						},
						error : function(xmlq, errq) {
							alert(xmlq);
						}
					});
				}
			});

		};
	</script>
</body>
</html>
