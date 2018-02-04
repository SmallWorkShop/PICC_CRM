<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>权限控制模块</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div title="" style="padding: 10px 30px 10px 30px">
		<form id="view_right_roleFuncConfig_form">
			<table cellpadding="5">
				<tr>
					<td style="vertical-align: top;font-weight: bold;color: #0E2D5F;font-size: 13px;">选择角色：</td>
					<td style="vertical-align: top;"><input
						id="view_right_roleFuncConfig_roleSelect" name="rId" value="">
					</td>
					<td style="vertical-align: top;font-weight: bold;color: #0E2D5F;font-size: 13px;">授予权限：</td>
					<td style="width: 400px"><fieldset class="panel-header"
							style="width:90%;padding: 5px 60px 10px 50px;">
							<legend style="font-weight: bold;color: #0E2D5F;font-size: 8px;">功能菜单</legend>
							<ul id="view_right_roleFuncConfig_funcTree" class="easyui-tree">
							</ul>
						</fieldset></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><a href="javascript:void(0);"
						class="editClass" onclick="editRight();">确认配置</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$('#view_right_roleFuncConfig_roleSelect')
				.combobox(
						{
							url : '${pageContext.request.contextPath }/role/findRole.do',
							valueField : 'rId',
							textField : 'rNme',
							cache : false,
							formatter : function(row) {
								//var opts = $(this).combobox('options');
								//var str = '【' + row.rCode + '】' + row.rNme;
								var str = row.rNme;
								return str;
							},
							onSelect : function(rec) {
								var nodes = $(
										'#view_right_roleFuncConfig_funcTree')
										.tree('getChecked');
								for ( var i = 0; i < nodes.length; i++) {
									$('#view_right_roleFuncConfig_funcTree')
											.tree('uncheck', nodes[i].target);
								}
								$
										.ajax({
											type : 'post',
											url : '${pageContext.request.contextPath }/right/selectFuncsByRoleId.do',
											dataType : 'json',
											data : {
												'roleId' : rec.rId
											},
											success : function(xmlq) {
												$
														.each(
																xmlq,
																function(i, n) {
																	var node = $(
																			'#view_right_roleFuncConfig_funcTree')
																			.tree(
																					'find',
																					n.funcId);
																	if ($(
																			'#view_right_roleFuncConfig_funcTree')
																			.tree(
																					'isLeaf',
																					node.target)) {
																		$(
																				'#view_right_roleFuncConfig_funcTree')
																				.tree(
																						'check',
																						node.target);
																	} else {
																	}
																});
											},
											error : function(xmlq, errq) {
											}
										});
							}
						});
		$('#view_right_roleFuncConfig_funcTree').tree({
			url : '${pageContext.request.contextPath }/func/find.do',
			checkbox : true,
			cascadeCheck : true,
		});
		$('.editClass').linkbutton({
			text : '确认配置',
			plain : true,
			iconCls : 'icon-edit'
		});
		var editRight = function editRight() {
			$.messager
					.confirm(
							'确认',
							'您确认要修改该角色的功能权限吗？',
							function(r) {
								if (r) {
									var checkedNodes = $(
											'#view_right_roleFuncConfig_funcTree')
											.tree('getChecked');
									var funcIds = '';
									var rId = $(
											'#view_right_roleFuncConfig_roleSelect')
											.combobox('getValue');
									for ( var i = 0; i < checkedNodes.length; i++) {
										funcIds = funcIds + ','
												+ checkedNodes[i].id;
									}
									$
											.ajax({
												type : 'post',
												url : '${pageContext.request.contextPath }/right/updRoleFuncs.do',
												dataType : 'text',
												data : {
													'rId' : rId,
													'funcIds' : funcIds
												},
												success : function(xmlq) {
													alert(xmlq);
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
