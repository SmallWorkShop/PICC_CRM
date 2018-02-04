<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>修改配送员负责辖区</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<div id="view_busiJrn_allocatScope_upd_dialog" title="修改用户信息"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,
		iconCls:'icon-edit',modal:true,cache:true"
		style="width: 650px;height: 300px;"></div>
	<div style="margin: 10px"></div>
	<div class="easyui-panel"
		style="width: 100%;height: 100%;border: 0px;padding: 0px 5px" title="">
		<table id="view_user_page_userMain_table" class="easyui-datagrid"
			style="height: 400px" style="width:100%;border: 0px;"
			data-options="url:'${pageContext.request.contextPath }/user/findSubUserList.do',fitColumns:true,singleSelect:true,
			pagination:true,rownumbers:false,idField:'uId',resizable:true,remoteSort:false">
			<thead>
				<tr>
					<th data-options="field:'uCode',width:100,sortable:true">用户名</th>
					<th data-options="field:'uPwd',width:100," hidden="true">密码</th>
					<th data-options="field:'uTyp',width:100," formatter='utypfor'>用户类型</th>
					<th data-options="field:'uNme',width:100,">用户姓名</th>
					<th data-options="field:'uTpId',width:100," hidden="true">用户证件号码</th>
					<th data-options="field:'uPho',width:100,">用户手机</th>
					<th data-options="field:'uTel',width:100,">用户电话</th>
					<th data-options="field:'uSts',width:100," formatter='ustsfor'>用户状态</th>
					<th data-options="field:'uSSts',width:100," hidden="true"
						formatter='usstsfor'>用户备用状态</th>
					<th data-options="field:'uAddr',width:100,">用户归属地址</th>
					<th data-options="field:'uScop',width:200,">用户负责辖区</th>
					<th data-options="field:'uRole',width:100," hidden="true">用户角色</th>
					<th data-options="field:'op',width:100," formatter='uopfor'>操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<div style="border: 0px;"></div>
	<script type="text/javascript">
		var editUser = function editUser(id) {
			var str = '${pageContext.request.contextPath }/user/findByKey.do?uId='+ id+'&flag=allocatUpd';
			$('#view_busiJrn_allocatScope_upd_dialog').panel('open').panel(
							'refresh', str);   
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
			}
		});
	</script>
</body>
</html>
