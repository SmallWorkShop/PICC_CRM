<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>客户信息功能模块</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div title="" style="padding: 5px 10px 5px 8px;height: 30px;">
		<a href="javascript:void(0);" class="addClass"
			onclick="addCustInfo();">新增客户&nbsp;</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a
			href="javascript:void(0);" class="impClass0" onclick="impCustInfo();">导入客户&nbsp;</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<form id="view_custInfo_custInfoMain_fileform"
			action="${pageContext.request.contextPath }/custInfo/impCustInfo.do"
			enctype="multipart/form-data" method="post" target="hiddenIframe"
			style="display: none;">
			<input id="view_custInfo_custInfoMain_fileInput" type="file"
				name="file">
		</form>
	</div>
	<div title="" style="padding: 5px 10px 5px 8px;height: 50px">
		<form id="+" action=""
			style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
			车牌号码：<input id="plateNoSelectId" class="easyui-textbox" size="10"
				name="plateNo">&nbsp; 车架号码：<input id="frameNoSelectId"
				class="easyui-textbox" size="10" name="frameNo">&nbsp; 姓名：<input
				id="cusNmeSelectId" class="easyui-textbox" size="8" name="cusNme">&nbsp;
			手机号码：<input id="cusPhonSleectId" class="easyui-textbox" size="11"
				name="cusPhon">&nbsp; 客户状态：<select id="cusStsSelectId"
				class="easyui-combobox" size="10" name="cusSts">
				<option value="">全部</option>
				<option value="NO">NO-待处理</option>
				<option value="00">00-待签单</option>
				<option value="01">01-待出单</option>
				<option value="02">02-待配送</option>
				<option value="09">09-已完成</option>
			</select>&nbsp;<br> <a href="javascript:void(0);" class="findClass0"
				onclick="findCustInfo0();">精确查询</a> <a href="javascript:void(0);"
				class="findClass1" onclick="findCustInfo1();">模糊查询</a> <a
				href="javascript:void(0);" class="impClass1"
				onclick="expCustInfo();">导出客户</a>
		</form>
	</div>
	<div title="" style="padding: 0px 5px;">
		<table id="view_custInfo_custInfoMain_table_DataGrid"
			style="width: 100%;height: 350px;">
		</table>
	</div>
	<div id="view_custInfo_custInfoMain_addCust_dialog"></div>
	<div id="view_custInfo_custInfoMain_parDialog" title="客户信息详情"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-man',modal:true"
		style="width: 800px;height: 450px;"></div>
	<script type="text/javascript">
		$('.addClass').linkbutton({
			text : '新增客户',
			plain : true,
			iconCls : 'icon-add'
		});
		$('.impClass0').linkbutton({
			text : '导入客户',
			plain : true,
			iconCls : 'icon-excel'
		});
		$('.impClass1').linkbutton({
			text : '导出客户',
			plain : true,
			iconCls : 'icon-excel'
		});
		$('.findClass0').linkbutton({
			text : '精确查询',
			plain : true,
			iconCls : 'icon-search'
		});
		$('.findClass1').linkbutton({
			text : '模糊查询',
			plain : true,
			iconCls : 'icon-search'
		});

		//按钮方法
		//新增客户
		var addCustInfo = function addCustInfo() {
			var str = '${pageContext.request.contextPath }/view/custInfo/addCustInfoPage.jsp';
			//title="添加客户信息"
			//class="easyui-dialog"
			//data-options="closed:true,draggable:true,border:false,iconCls:'icon-add',modal:true"
			//style="width: 580px;height: 300px;"
			$('#view_custInfo_custInfoMain_addCust_dialog').dialog({
				title : '添加客户信息',
				width : '580px',
				height : '300px',
				draggable : true,
				border : false,
				iconCls : 'icon-add',
				modal : true
			}).dialog('refresh', str);

		};
		//导入客户
		var impCustInfo = function impCustInfo() {
			$('#view_custInfo_custInfoMain_fileInput').click();
			$('#view_custInfo_custInfoMain_fileInput')
					.change(
							function() {
								var str = $(
										'#view_custInfo_custInfoMain_fileInput')
										.val();
								str2 = str.substr(str.lastIndexOf(".") + 1);
								if (str2 != "xls") {
									alert("只可导入*.xls文件");
									return;
								} else {
									$.messager
											.confirm(
													'确认',
													'您确定要导入这个excel文件：' + str,
													function(r) {
														if (r) {
															$(
																	'#view_custInfo_custInfoMain_fileform')
																	.form(
																			'submit',
																			{
																				success : function(
																						data) {
																					alert(data);
																					$(
																							'#view_custInfo_custInfoMain_fileform')
																							.form(
																									'clear');
																				}

																			});
														}
													});
								}
							});
		};
		//导出客户
		var expFlg = true; //导出状态字  true表示精确查询导出  false表示模糊查询导出
		var expCustInfo = function expCustInfo() {
			var url = '${pageContext.request.contextPath }/custInfo/expCustInfo.do?expFlg='
					+ expFlg
					+ '&plateNo='
					+ $('#plateNoSelectId').val()
					+ '&frameNo='
					+ $('#frameNoSelectId').val()
					+ '&cusNme='
					+ $('#cusNmeSelectId').val()
					+ '&cusPhon='
					+ $('#cusPhonSleectId').val()
					+ '&cusSts='
					+ $('#cusStsSelectId').combobox('getValue');
			window.open(url);
			/*$
					.ajax({
						type : 'post',
						url : url,
						dataType : 'text',
						data : $('#view_custInfo_custInfoMain_select_form')
								.serialize(),
						success : function(xmlq) {
							//dataGridList(xmlq);
							alert(xmlq);
						},
						error : function(xmlq, errq) {
							alert(xmlq);
						}
					});*/
		};
		//精确查询客户信息
		var findCustInfo0 = function findCustInfo0() {
			var url = '${pageContext.request.contextPath }/custInfo/findByCustInfo.do';
			//findCustInfo(url);
			expFlg = true;
			dataGridList(url);
		};
		//模糊查询客户信息
		var findCustInfo1 = function findCustInfo1() {
			var url = '${pageContext.request.contextPath }/custInfo/findLikeCustInfo.do';
			$.messager.confirm('确认', '模糊查询效率较低，确定要这么做吗？', function(r) {
				if (r) {
					//findCustInfo(url);
					expFlg = false;
					dataGridList(url);
				}
			});
		};
		//查看保单信息
		var insurFind = function insurFind() {

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
		//select选项变量赋值（坑爹的地方）
		var cusStsSelectValue = '';
		$('#cusStsSelectId').combobox({
			onSelect : function(rec) {
				cusStsSelectValue = rec.value;
			}
		});
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
									cusSts : cusStsSelectValue
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
															+ '<a href="javascript:void(0)" class="insurFindClass" onclick="insurFind('
															+ row.cusId
															+ ')">查看详细</a>';
													//}
													return str;
												} else {
													return '';
												}
											}
										}, ] ],
								onLoadSuccess : function(data) {
									$('.insurFindClass').linkbutton({
										text : '查看详情',
										plain : true,
										iconCls : 'icon-search'
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
	</script>
</body>
</html>
