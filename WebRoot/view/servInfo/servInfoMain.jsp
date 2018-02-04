<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>维修保养记录操作主页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div title=""
		style="padding: 5px 10px 5px 8px;height: 50px;margin-top:5px 5px 0px 5px;">
		<form id="view_custInfo_custInfoMain_select_form" action=""
			style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
			车牌号码：<input id="plateNoSelectId" class="easyui-textbox" size="10"
				name="plateNo">&nbsp; 车架号码：<input id="frameNoSelectId"
				class="easyui-textbox" size="10" name="frameNo">&nbsp; 姓名：<input
				id="cusNmeSelectId" class="easyui-textbox" size="8" name="cusNme">&nbsp;
			手机号码：<input id="cusPhonSleectId" class="easyui-textbox" size="11"
				name="cusPhon">&nbsp;<a href="javascript:void(0);"
				class="findClass0" onclick="findCustInfo0();">搜索</a>
		</form>
	</div>
	<div title="" style="padding: 0px 5px;">
		<table id="view_custInfo_custInfoMain_table_DataGrid"
			style="width: 100%;height: 350px;">
		</table>
	</div>
	<div id="view_custInfo_custInfoMain_parDialog" title="客户信息详情"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-man',modal:true"
		style="width: 800px;height: 450px;"></div>
	<div id="view_servInfoMain_servInfoEdit_dialog" title="客户维修/保养"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-filter',modal:true"
		style="width: 900px;height: 300px;padding: 5px 5px;"></div>
	<script type="text/javascript">
		$('.findClass0').linkbutton({
			text : '搜索',
			plain : true,
			iconCls : 'icon-search'
		});
		//精确查询客户信息
		var findCustInfo0 = function findCustInfo0() {
			var url = '${pageContext.request.contextPath }/custInfo/findByCustInfo.do';
			//findCustInfo(url);
			dataGridList(url);
		};
		//抽取查询提交请求模式
		var findCustInfo = function findCustInfo1(url) {
			$
					.ajax({
						type : 'post',
						url : url,
						dataType : 'json',
						data : $('#view_custInfo_custInfoMain_select_form')
								.serialize(),
						success : function(xmlq) {
							dataGridList(xmlq);
						},
						error : function(xmlq, errq) {
							alert(xmlq);
						}
					});
		};
		//抽取生成列表的方法
		var dataGridList = function dataGridList(json) {
			$('#view_custInfo_custInfoMain_table_DataGrid')
					.datagrid(
							{
								//data : json,
								url : json,
								queryParams : {
									plateNo : $('#plateNoSelectId').val(),
									frameNo : $('#frameNoSelectId').val(),
									cusNme : $('#cusNmeSelectId').val(),
									cusPhon : $('#cusPhonSleectId').val(),
									cusSts : '09'
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
													str = '<a href="javascript:void(0)"onclick="insurFind('
															+ row.cusId
															+ ')">'
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
											width : 120,
											formatter : function(value, row,
													index) {
												if (row.cusSts) {
													var str = '';
													//if (row.cusSts != '00') {
													str = str
															+ '<a href="javascript:void(0)" class="servInfoOpClass" onclick="servInfoOp('
															+ row.cusId
															+ ')">维修保养</a>';
													//}
													return str;
												} else {
													return '';
												}
											}
										}, ] ],
								onLoadSuccess : function(data) {
									$('.servInfoOpClass').linkbutton({
										text : '维修保养',
										plain : true,
										iconCls : 'icon-edit'
									});
								}
							});
			var p = $('#view_custInfo_custInfoMain_table_DataGrid').datagrid(
					'getPager');
			$(p).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10   
				pageList : [ 10, 20, 30 ],//可以设置每页记录条数的列表   
				beforePageText : '第',//页数文本框前显示的汉字   
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			/*onBeforeRefresh:function(){  
			    $(this).pagination('loading');  
			    alert('before refresh');  
			    $(this).pagination('loaded');  
			}*/
			});

		};
		//查看客户信息明细
		var insurFind = function insurFind(cusId) {
			var str = '${pageContext.request.contextPath }/custInfo/selectCustParticularInfo.do?cusId='
					+ cusId;
			$('#view_custInfo_custInfoMain_parDialog').dialog('open').dialog(
					'refresh', str);
		};
		findCustInfo0();
		//填写维修保养记录
		var servInfoOp = function servInfoOp(cusId) {
			var str = '${pageContext.request.contextPath }/servInfo/selectServInfoByObj.do?cusId='
					+ cusId;
			$('#view_servInfoMain_servInfoEdit_dialog').dialog('open').dialog(
					'refresh', str);
		};
	</script>
</body>
</html>
