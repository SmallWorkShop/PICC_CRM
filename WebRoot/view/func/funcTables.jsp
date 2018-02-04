<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>新增功能</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div title="" style="padding:10px 60px 20px 60px">
		<form id="func_funcMain_addMenu" action="" method="post">
			<table cellpadding="5">
				<tr>
					<td>功能代码:</td>
					<td><input class="easyui-textbox" type="text" name="funcCode"
						data-options="required:true" value=""></input>
					</td>
					<td>功能名称:</td>
					<td><input class="easyui-textbox" type="text" name="funcNme"
						data-options="required:true" value=""></input>
					</td>
				</tr>
				<tr>
					<td>功能简称:</td>
					<td><input class="easyui-textbox" type="text" name="funcSNme"
						value="" data-options="required:true"></input>
					</td>
					<td>父功能ID:</td>
					<td><select id="view_func_funcTables_select_pFuncId"
						class="easyui-combotree" name="pFuncId"
						data-options="editable:true,idField:'id',textField:'text',parentField:'pid',
							url:'${pageContext.request.contextPath }/func/find.do'"
						style="width: 155px;"></select></td>
				</tr>
				<tr hidden="true">
					<td>父功能代码:</td>
					<td><input id="view_func_funcTables_select_pFuncCode"
						class="easyui-textbox" type="text" name="pFuncCode" value=""></input>
					</td>
					<td>功能图标:</td>
					<td><input class="easyui-textbox" type="text" name="funcImg"
						value=""></input>
					</td>
				</tr>
				<tr>
					<td>功能地址:</td>
					<td colspan="3"><input class="easyui-textbox" id="funcUrlId"
						data-options="multiline:true" name="funcUrl" value=""
						style="height:40px;width: 250px"></input></td>
				</tr>
				<tr hidden="true">
					<td>功能状态:</td>
					<td><input class="easyui-textbox" type="text" value=""
						name="funcSts"></input></td>
				</tr>
				<tr>
					<td align="right" colspan="2"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="submitForm()">提交</a></td>
					<td colspan="2"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="clearForm()">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function submitForm() {
			if ($('#func_funcMain_addMenu').form('validate')) {
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath }/func/add.do',
					dataType : 'text',
					data : $('#func_funcMain_addMenu').serialize(),
					success : function(xmlq) {
						alert(xmlq);
					},
					error : function(xmlq, errq) {
						alert(xmlq);
					}
				});
			}
		}
		function clearForm() {
			$('#func_funcMain_addMenu').form('clear');
		}
		$('#view_func_funcTables_select_pFuncId').combotree(
				{
					onSelect : function(node) {
						$('#view_func_funcTables_select_pFuncCode').val(
								node.attributes.funcCode);
					}
				});
	</script>

</body>
</html>
