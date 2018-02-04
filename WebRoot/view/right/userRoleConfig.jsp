<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>用户角色配置页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div title="" style="padding: 10px 10px 10px 15px">
		<table style="width: 100%;">
			<tr style="vertical-align: top;font-weight: bold;color: #0E2D5F;font-size: 12px;">
				<td>选择用户：</td>
				<td colspan="2">分配角色：</td>
			</tr>
			<tr>
				<td style="width: 50%; vertical-align: top;">
					<table id="view_right_userRoleConfig_user_table"
						class="easyui-datagrid" style="height: 400px"
						data-options="url:'${pageContext.request.contextPath }/user/findUserInfo.do',fitColumns:true,
			                          pagination:true,rownumbers:true,idField:'uId',
			                          resizable:true,remoteSort:false">
						<thead>
							<tr>
								<th data-options="field:'uId',checkbox:true">用户ID</th>
								<th data-options="field:'uCode',width:100">用户名</th>
								<th data-options="field:'uNme',width:100">姓名</th>
								<th data-options="field:'uTyp',width:100,sortable:true"
									formatter='utypfor'>用户类别</th>
							</tr>
						</thead>
					</table></td>
				<td style="vertical-align: top;width: 40%">
					<table id="view_right_userRoleConfig_role_table"
						class="easyui-datagrid" style="height: 400px"
						data-options="url:'${pageContext.request.contextPath }/role/findRole.do',
			              idField:'rId',resizable:true,rownumbers:true,fitColumns:true">
						<thead>
							<tr>
								<th data-options="field:'rId',checkbox:true">角色ID</th>
								<th data-options="field:'rCode',width:100">角色代码</th>
								<th data-options="field:'rNme',width:100">角色名称</th>
							</tr>
						</thead>
					</table></td>
				<td style="vertical-align: top;"><a href="javascript:void(0);"
					class="editClass" onclick="editUsersRoles();">确认配置</a></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	$('.editClass').linkbutton({
		text : '确认配置',
		plain : true,
		iconCls : 'icon-edit'
	});
		//格式化用户类型字段
		function utypfor(value, row, index) {
			if (value == '00') {
				return value + '-业务员';
			} else if (value == '10') {
				return value + '-出单员';
			} else if (value == '20') {
				return value + '-配送员';
			} else if (value == '30') {
				return value + '-经理';
			} else if (value == '40') {
				return value + '-合作公司';
			} else {
				return value;
			}
		}
		var editUsersRoles = function editUsersRoles(){
			var userChecked = $('#view_right_userRoleConfig_user_table').datagrid('getChecked');
			var roleChecked = $('#view_right_userRoleConfig_role_table').datagrid('getChecked');
			if('' == userChecked){
				alert('您未选择任何用户！');
			}else if('' == roleChecked){
				alert('请给用户分配角色！');
			}else{
				$.messager.confirm('确认','您确定想要对这些用户重新配置角色吗？',function(r){    
				    if (r){    
						var usersId = '';
						var rolesId = '';
						for(var i = 0 ; i < userChecked.length ; i ++ ){
							usersId = usersId + ',' + userChecked[i].uId;
						}
						for(var j = 0 ; j < roleChecked.length ; j ++){
							rolesId = rolesId + ',' + roleChecked[j].rId;
						}
						$.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath }/right/updUserRoles.do',
							dataType : 'text',
							data : {
								'usersId' : usersId,
								'rolesId' : rolesId
							},
							success : function(xmlq) {
								alert(xmlq);
								//$('#view_right_userRoleConfig_user_table').datagrid('reload');
								//$('#view_right_userRoleConfig_role_table').datagrid('reload');
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
