<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>个人信息查询</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div id="view_user_page_findPersonalnfo_updPwd_dialog" title="修改我的密码"
		style="width: 300px;height: 200px;display: none;"></div>
	<div title="" style="padding: 5px 10px 10px 5px;">
		<div id="view_user_page_findPersonalnfo_updPwd_bt"
			style="display: none;">
			&nbsp;&nbsp;<a href="javascript:void(0);" class="editClass"
				onclick="editMyPwd();">修改我的密码&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<br>
		<table id="view_user_page_findPersonalnfo_table"
			class="easyui-datagrid"
			data-options="url:'${pageContext.request.contextPath }/user/findMyInfo.do?uId=${userSession.uId }',fitColumns:true,singleSelect:true,
			rownumbers:false,idField:'uId',resizable:true,remoteSort:false">
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
				</tr>
			</thead>
		</table>

	</div>
	<script type="text/javascript">
	//密码修改
	var editMyPwd = function editMyPwd(){
		var str = '${pageContext.request.contextPath }/view/user_page/updPwdSubPage.jsp';
		//$('#view_user_page_findPersonalnfo_updPwd_dialog')
		//		.panel('open').panel('refresh', str);
		$('#view_user_page_findPersonalnfo_updPwd_dialog').show().dialog({
			draggable:true,
			border:false,
			iconCls:'icon-add',
			modal:true
		}).dialog('refresh', str);
	};
	$('.editClass').linkbutton({
		text : '修改我的密码',
		plain : true,
		iconCls : 'icon-edit'
	});
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
	</script>
</body>
</html>
