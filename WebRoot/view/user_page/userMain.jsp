<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>用户管理模块</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="renderer" content="webkit" />
</head>

<body>
	<div id="view_user_page_userMain_upd_dialog" title="修改用户信息"
		style="width: 650px;height: 400px;display: none;"></div>
	<div id="view_user_page_userMain_add_dialog" title="新增用户"
		style="width: 650px;height: 400px;display: none;"></div>
	<div class="easyui-panel"
		style="width: 100%;height: 100%;border: 0px;padding: 0px 5px" title="">
		<div id="view_user_page_userMain_toolbar">
			<a href="javascript:void(0);" class="addClass" onclick="addUser();">添加&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<table id="view_user_page_userMain_table" class="easyui-datagrid"
			style="height: 400px" style="width:100%;border: 0px;"
			data-options="url:'${pageContext.request.contextPath }/user/findUserInfo.do',fitColumns:true,singleSelect:true,
			pagination:true,rownumbers:false,idField:'uId',resizable:true,remoteSort:false">
			<thead>
				<tr>
					<th data-options="field:'uCode',width:100,sortable:true">工号</th>
					<th data-options="field:'uPwd',width:100," hidden="true">密码</th>
					<th data-options="field:'uTyp',width:100," formatter='utypfor'>用户类型</th>
					<th data-options="field:'uNme',width:100,">用户姓名</th>
					<th data-options="field:'uTpId',width:100,">用户证件号码</th>
					<th data-options="field:'uPho',width:100,">用户手机</th>
					<th data-options="field:'uTel',width:100,">用户电话</th>
					<th data-options="field:'uSts',width:100," formatter='ustsfor'>用户状态</th>
					<th data-options="field:'uSSts',width:100," hidden="true"
						formatter='usstsfor'>用户备用状态</th>
					<th data-options="field:'uAddr',width:100,">用户归属地址</th>
					<th data-options="field:'uScop',width:100,">用户负责辖区</th>
					<th data-options="field:'uRole',width:100," hidden="true">用户角色</th>
					<th data-options="field:'op',width:250," formatter='uopfor'>操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<div style="border: 0px;"></div>
	<script type="text/javascript">
		$('.addClass').linkbutton({
			text : '添加',
			plain : true,
			iconCls : 'icon-add'
		});
		var addUser = function addUser() {
			var str = '${pageContext.request.contextPath }/view/user_page/addUser.jsp';
			//$('#view_user_page_userMain_add_dialog').panel('open').panel(
			//		'refresh', str);
			$('#view_user_page_userMain_add_dialog').show().dialog({
				draggable:true,
				border:false,
				iconCls:'icon-add',
				modal:true
			}).dialog('refresh', str);
		};
		var editUser = function editUser(id) {
			var str = '${pageContext.request.contextPath }/user/findByKey.do?uId='+ id;
			//$('#view_user_page_userMain_upd_dialog').panel('open').panel(
			//				'refresh', str);   
			$('#view_user_page_userMain_upd_dialog').show().dialog({
				draggable:true,
				border:false,
				iconCls:'icon-edit',
				modal:true
			}).dialog('refresh', str);
		};
		var removeUser = function removeUser(id){
			$.messager.confirm('确认','您确定要删除该用户吗？',
					function(r) {
						if (r) {
							var str = '${pageContext.request.contextPath }/user/deleteUserById.do?uId='+ id;
							$.ajax({
								type : 'post',
								url : str,
								dataType : 'text',
								success : function(xmlq) {
									alert(xmlq);
									$('#view_user_page_userMain_table').datagrid(
											'reload');
								},
								error : function(xmlq, errq) {
									alert(xmlq);
								}
							});
						}
					});
			
			
		};
		//重置用户的密码
		var resetPwd = function resetPwd(id){
			$.messager.confirm('确认','您确定要重置该用户密码为：password？',
					function(r) {
						if (r) {
							var str = '${pageContext.request.contextPath }/user/resetUserPwd.do?uId='+ id;
							$.ajax({
								type : 'post',
								url : str,
								dataType : 'text',
								success : function(xmlq) {
									alert(xmlq);
									$('#view_user_page_userMain_table').datagrid(
											'reload');
								},
								error : function(xmlq, errq) {
									alert(xmlq);
								}
							});
						}
					});
		};
		//格式化用户类型字段
		function utypfor(value, row, index){
			if (value == '00') {
				return value + '-业务员';
			} else if(value == '10'){
				return value + '-出单员';
			} else if(value == '20'){
				return value + '-配送员';
			} else if(value == '30'){
				return value + '-经理';
			} else if (value == '40'){
				return value + '-合作公司';
			} else{
				return value;
			}
		}
		//格式化用户状态字段
		function ustsfor(value,row,index){
			if(value == '00'){
				return value + '-正常';
			} else if (value == '01'){
				return value + '-待激活';
			} else if (value == '09'){
				return value + '-注销';
			} else{
				return value;
			}
		}
		//格式化用户备用状态字段
		function usstsfor(value,row,index){
			if(value == '00'){
				return value + '-正常';
			} else if (value == '09'){
				return value + '-冻结';
			} else{
				return value;
			}
		}
		//操作
		function uopfor(value,row,index){
			if(row.uId){
				var str = '<a href="javascript:void(0)" class="editCls" onclick="editUser('
					+ row.uId + ')">修改</a>';
			str = str
					+ '&nbsp;&nbsp;<a href="javascript:void(0)" class="resetPwd" onclick="resetPwd('
					+ row.uId + ')">密码重置</a>';
			str = str
					+ '&nbsp;&nbsp;<a href="javascript:void(0)" class="removeCls" onclick="removeUser('
					+ row.uId + ')">删除</a>';
			return str; 
			}else {
				return '';
			}
		}
		//修改操作按钮样式
		$('#view_user_page_userMain_table').datagrid({
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
				$('.resetPwd').linkbutton({
					text : '密码重置',
					plain : true,
					iconCls : 'icon-edit'
				});

			}
		});
	</script>
</body>
</html>
