<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>
<title>修改功能菜单</title>
<jsp:include page="../../inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
</style>
</head>

<body>
	<div id="view_func_updFunc_panel" class="easyui-panel" title=""
		style="width: 100%;height: 100%;margin: auto;border: 0px"
		data-options="closable:true,iconCls:'icon-edit'">
		<form id="func_funcMain_updMenu"
			action="${pageContext.request.contextPath }/func/updateMenu.do"
			method="post">
			<table cellpadding="5">
				<tr hidden="true">
					<td>功能ID：</td>
					<td><input class="easyui-textbox" type="text" name="funcId"
						data-options="required:true" value="${func.funcId }"></input>
					</td>
				</tr>
				<tr>
					<td>功能代码:</td>
					<td><input class="easyui-textbox" type="text" name="funcCode"
						data-options="required:true" value="${func.funcCode }"
						disabled="disabled"></input>
					</td>
				</tr>
				<tr>
					<td>功能名称:</td>
					<td><input class="easyui-textbox" type="text" name="funcNme"
						data-options="required:true" value="${func.funcNme }"></input>
					</td>
				</tr>
				<tr>
					<td>功能简称:</td>
					<td><input class="easyui-textbox" type="text" name="funcSNme"
						value="${func.funcSNme }"></input>
					</td>
				</tr>
				<tr>
					<td>父功能ID:</td>
					<td><select id="view_func_updFunc_select_pFuncId"
						class="easyui-combotree" name="pFuncId"
						data-options="editable:true,idField:'id',textField:'text',parentField:'pid',
							url:'${pageContext.request.contextPath }/func/find.do',value:'${func.pFuncId }'"
						style="width: 150px;"></select></td>
				</tr>
				<tr hidden="true">
					<td>父功能代码:</td>
					<td><input id="view_func_funcTables_select_pFuncCode"
						class="easyui-textbox" type="text" name="pFuncCode"
						value="${func.pFuncCode }"></input>
					</td>
				</tr>
				<tr hidden="true">
					<td>功能图标:</td>
					<td><input class="easyui-textbox" type="text" name="funcImg"
						value="${func.funcImg }"></input>
					</td>
				</tr>
				<tr>
					<td>功能地址:</td>
					<td><input class="easyui-textbox" name="funcUrl"
						value="${func.funcUrl }" style="height: 60px;"></input></td>
				</tr>
				<tr>
					<td>功能状态:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-正常'},{
			                              label: '09',value: '09-失效'}],
			                      value:'${func.funcSts }'"
						name="funcSts"></input></td>
				</tr>
				<tr>

					<td hidden="true"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="clearForm()">重置</a>
					</td>
					<td colspan="2" align="right"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="submitForm()">提交</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function submitForm() {
			//$('#func_funcMain_updMenu').form('submit');
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath }/func/updateMenu.do',
				dataType : 'text',
				data : $('#func_funcMain_updMenu').serialize(),
				success : function(xmlq) {
					alert(xmlq);
					parent.$('#view_func_funcMain_dialog').panel('close');
					parent.$('#func_func_main_grid').treegrid('reload');
				},
				error : function(xmlq, errq) {
					alert(xmlq);
					parent.$('#view_func_funcMain_dialog').panel('close');
				}
			});
		}
		function clearForm() {
			$('#func_funcMain_updMenu').form('clear');
		}
		$('#view_func_updFunc_panel').panel({
			onClose : function() {
				parent.$('#view_func_funcMain_dialog').panel('close');
				//$.parent.$('#view_func_funcMain_dialog').panel('close');

			}
		});
		//$('#view_func_updFunc_select_pFuncId').combotree('select','${func.pFuncId}');
	</script>
</body>
</html>
