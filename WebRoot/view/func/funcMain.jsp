<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>

<title>功能菜单配置首页</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>
<body>
	<table id="func_func_main_grid" data-options="fit:true,border:false"
		style="width:100%;height:100%">
	</table>
	<br>
	<div id="view_func_funcMain_dialog" title="修改功能菜单"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 350px;height: 400px;"></div>
	<script type="text/javascript">
		var editFunc = function editFunc(id) {
			var str = '${pageContext.request.contextPath }/func/findByKey.do?funcId='
					+ id;
			$('#view_func_funcMain_dialog').panel('open').panel('refresh', str);
		};
		var removeFunc = function removeFunc(id) {
			$.messager
					.confirm(
							'确认',
							'您确定想要删除该功能菜单及其子孙功能菜单吗？',
							function(r) {
								if (r) {
									var str = '${pageContext.request.contextPath }/func/deleteFuncId.do?funcId='
											+ id;
									$.ajax({
										type : 'post',
										url : str,
										dataType : 'text',
										success : function(xmlq) {
											alert(xmlq);
											$('#func_func_main_grid').treegrid(
													'reload');
										},
										error : function(xmlq, errq) {
											alert(xmlq);
										}
									});
								}
							});
		};

		$('#func_func_main_grid')
				.treegrid(
						{
							url : '${pageContext.request.contextPath }/func/find.do',
							idField : 'id',
							treeField : 'text',
							parentField : 'pid',
							rownumbers : false,
							columns : [ [
									{
										field : 'funcNme',
										title : '功能名称',
										width : '18%',
										formatter : function(value, row, index) {
											if (row.attributes) {
												return row.attributes.funcNme;
											} else {
												return "";
											}
										}
									},
									{
										field : 'funcCode',
										title : '功能代码',
										width : '15%',
										formatter : function(value, row, index) {
											if (row.attributes) {
												return row.attributes.funcCode;
											} else {
												return "";
											}
										}
									},
									{
										field : 'text',
										title : '功能简称',
										width : '18%'
									},
									{
										field : 'url',
										title : '请求地址',
										width : '20%',
										formatter : function(value, row, index) {
											if (row.attributes) {
												return row.attributes.url;
											} else {
												return "";
											}
										}
									},
									{
										field : 'creDate',
										title : '创建日期',
										width : '15%',
										formatter : function(value, row, index) {
											if (row.attributes) {
												return row.attributes.creDate;
											} else {
												return "";
											}
										}
									},
									{
										field : 'oprate',
										title : '操作',
										width : '20%',
										formatter : function(value, row, index) {
											if (row.attributes) {
												var str = '<a href="javascript:void(0)" class="editCls" onclick="editFunc('
														+ row.id + ')">修改</a>';
												str = str
														+ '&nbsp;&nbsp;<a href="javascript:void(0)" class="removeCls" onclick="removeFunc('
														+ row.id + ')">删除</a>';

												//editCls
												//icon-remove
												return str;
											} else {
												return "";
											}
										}
									} ] ],
							onLoadSuccess : function(data) {
								$('.editCls').linkbutton({
									text : '修改',
									plain : true,
									iconCls : 'icon-edit'
								});
								$('.removeCls').linkbutton({
									text : '删除',
									plain : true,
									iconCls : 'icon-no'
								});

							}
						});
	</script>
</body>
</html>
