<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>角色信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div id="view_role_roleMain_addRole_dialg" title="添加新角色"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,
		iconCls:'icon-add',modal:true"
		style="width: 300px;height: 200px;">
		<form id="view_role_roleMain_addRole_form">
			<table cellpadding="5">
				<tr>
					<td>角色代码:</td>
					<td><input class="easyui-textbox" type="text" name="rCode"
						value="" required="required"></input></td>
				</tr>
				<tr>
					<td>角色名称:</td>
					<td><input class="easyui-textbox" type="text" name="rNme"
						data-options="required:true" value=""></input></td>
				</tr>
				<tr hidden="true" style="display: none">
					<td>角色状态:</td>
					<td><input class="easyui-textbox" type="text" name="rSts"
						value="00"></input></td>
				</tr>
				<tr hidden="true" style="display: none;">
					<td>角色权限:</td>
					<td><input class="easyui-textbox" type="text" name="rRight"
						value=""></input></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="addRoleBt()">新增</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div title="" style="padding: 5px 10px 10px 5px">
		<div id="view_role_roleMain_addRole_bt">
			&nbsp;&nbsp;<a href="javascript:void(0);" class="addClass"
				onclick="addRole();">添加角色&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<br>
		<table id="view_role_roleMain_findRole_table" class="easyui-datagrid"
			data-options="url:'${pageContext.request.contextPath }/role/findRole.do',
			idField:'rId',resizable:true,rownumbers:true,fitColumns:true,singleSelect:true">
			<thead>
				<tr>
					<th data-options="field:'rCode',width:100">角色代码</th>
					<th data-options="field:'rNme',width:100">角色名称</th>
					<th data-options="field:'rSts',width:100" formatter='rStsfor'>角色状态</th>
					<th data-options="field:'rRight',width:100" hidden="true">角色权限</th>
					<th data-options="field:'creDate',width:100" formatter='creDatefor'>创建日期</th>
					<th data-options="field:'op',width:100" formatter='ropfor'>操作</th>
				</tr>
			</thead>
		</table>

	</div>
	<script type="text/javascript">
		$('.addClass').linkbutton({
			text : '添加角色',
			plain : true,
			iconCls : 'icon-add'
		});
		var addRole = function addRole() {
			$('#view_role_roleMain_addRole_dialg').dialog('open');
		};
		var addRoleBt = function addRoleBt(){
			if($('#view_role_roleMain_addRole_form').form('validate')){
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath }/role/addRole.do',
					dataType : 'text',
					data : $(
							'#view_role_roleMain_addRole_form').serialize(),
					success : function(xmlq) {
						alert(xmlq);
						$('#view_role_roleMain_addRole_dialg').dialog('close');
						$('#view_role_roleMain_findRole_table').datagrid('reload');
					},
					error : function(xmlq, errq) {
						alert(xmlq);
					}
				});
			}
		};
		//格式化角色状态字段
		function rStsfor(value, row, index) {
			if (value == '00') {
				return value + '-正常';
			} else if (value == '09') {
				return value + '-失效';
			} else {
				return value;
			}
		}
		//格式化操作一栏字段
		function ropfor(value, row, index) {
			if (value == '00') {
				return value + '-正常';
			} else if (value == '09') {
				return value + '-失效';
			} else {
				return value;
			}
		}
		//creDate日期栏位格式化
		function creDatefor(value,row,index){
			if (value == undefined){
				return "";
			} 
			/*时间转js时间格式*/
	        var date = new Date(value);
	        return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
	        + date.getDate();

		}
	</script>
</body>
</html>
