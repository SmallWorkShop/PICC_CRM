<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>个人信息修改</title>
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
	<div title="" style="padding:10px 20px 20px 20px">
		<div id="view_user_page_findPersonalnfo_updPwd_bt">
			&nbsp;&nbsp;<a href="javascript:void(0);" class="editClassPwd"
				onclick="editMyPwd();">修改我的密码&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<form id="view_user_page_updPersonalInfo_form" method="post" action="">
			<table cellpadding="5">
				<tr hidden="true" style="display: none;">
					<td class="zzTd3">用户ID:</td>
					<td><input class="easyui-textbox" type="text" name="uId"
						value="${userSession.uId }"></input>
					</td>
				</tr>
				<tr>
					<td class="zzTd3">工号:</td>
					<td><input class="easyui-textbox" type="text" name="uCode"
						data-options="required:true" value="${userSession.uCode }"
						disabled="disabled"></input>
					</td>
					<td class="zzTd3">用户姓名:</td>
					<td><input class="easyui-textbox" type="text" name="uNme"
						value="${userSession.uNme }" disabled="disabled"></input>
					</td>
					<td class="zzTd3">证件号码:</td>
					<td><input class="easyui-textbox" type="text" name="uTpId"
						value="${userSession.uTpId }" disabled="disabled"></input>
					</td>
				</tr>
				<tr hidden="true" style="display: none;">
					<td class="zzTd3">用户状态:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-正常'}
		                                ,{label: '01',value: '01-待激活'}
		                                ,{label: '09',value: '09-注销'}
			                            ],
			                      value:'${userSession.uSts }'"
						name="uSts">
					</td>
					<td class="zzTd3">用户备用状态:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-正常'}
		                                ,{label: '09',value: '09-冻结'}
			                            ],
			                      value:'${userSession.uSSts }'"
						name="uSSts">
					</td>
					<td class="zzTd3">直属上司:</td>
					<td><select class="easyui-combotree" name="uPId"
						data-options="editable:true,idField:'id',textField:'text',parentField:'pid',
							url:'${pageContext.request.contextPath }/',value:'${userSession.uPId }'"
						style="width: 155px;"></select>
					</td>
					<td class="zzTd3">用户类型:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-业务员'}
		                                ,{label: '10',value: '10-出单员'}
		                                ,{label: '20',value: '20-配送员'}
		                                ,{label: '30',value: '30-经理'}
		                                ,{label: '40',value: '40-合作公司'}
			                            ],
			                      value:'${userSession.uTyp }'"
						name="uTyp">
					</td>
					<td class="zzTd3">用户角色:</td>
					<td><input class="easyui-textbox" name="uRole"
						value="${userSession.uRole }"></input></td>
					<td class="zzTd3">负责辖区:</td>
					<td><input class="easyui-textbox"
						data-options="multiline:true" name="uScop"
						value="${userSession.uScop }" style="height: 60px;"></input>
					</td>
				</tr>
				<tr>
					<td class="zzTd3">联系电话:</td>
					<td><input class="easyui-textbox" type="text" name="uTel"
						value="${userSession.uTel }"></input>
					</td>
					<td class="zzTd3">联系手机:</td>
					<td><input class="easyui-textbox" type="text" name="uPho"
						value="${userSession.uPho}"></input>
					</td>
				</tr>
				<tr>
					<td class="zzTd3">归属地址:</td>
					<td hidden="true" style="display: none"><input id="addr0"
						class="easyui-textbox" data-options="multiline:true" name="uAddr"
						value="${userSession.uAddr  }" style="height: 60px;"></input></td>
					<td colspan="3" class="zzTd3">省：<input id="comboProvinceId0"
						name="comboProvinceName0" size="9">市：<input
						id="comboCityId0" name="comboCityName0" size="9">区：<input
						id="comboAreaId0" name="comboAreaName0" size="9">
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3" class="zzTd3">详细：<input id="comboAddrId"
						name="comboAddrName"
						data-options="multiline:true,onChange(n,o){setFormValue(0);},"
						class="easyui-textbox" style="width: 290px;height: 50px;">
					</td>
				</tr>
				<tr>
					<td colspan="4" align="right"><a href="javascript:void(0)"
						class="editClass" onclick="submitForm()">修改</a> <a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()" style="display: none">重置</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		//密码修改
		var editMyPwd = function editMyPwd() {
			var str = '${pageContext.request.contextPath }/view/user_page/updPwdSubPage.jsp';
			//$('#view_user_page_findPersonalnfo_updPwd_dialog')
			//		.panel('open').panel('refresh', str);
			$('#view_user_page_findPersonalnfo_updPwd_dialog').show().dialog({
				draggable : true,
				border : false,
				iconCls : 'icon-add',
				modal : true
			}).dialog('refresh', str);
		};
		$('.editClassPwd').linkbutton({
			text : '修改我的密码',
			plain : true,
			iconCls : 'icon-edit'
		});
		$('.editClass').linkbutton({
			text : '修改',
			plain : true,
			iconCls : 'icon-edit'
		});
		var submitForm = function submitForm() {
			$.messager
					.confirm(
							'确认',
							'您确定要修改吗？',
							function(r) {
								if (r) {
									$
											.ajax({
												type : 'post',
												url : '${pageContext.request.contextPath }/user/updateUser.do',
												dataType : 'text',
												data : $(
														'#view_user_page_updPersonalInfo_form')
														.serialize(),
												success : function(xmlq) {
													alert(xmlq);
													//parent.$('#view_user_page_userMain_upd_dialog').panel('close');
													//parent.$('#view_user_page_userMain_table').datagrid('reload');
												},
												error : function(xmlq, errq) {
													alert(xmlq);
													//parent.$('#view_user_page_userMain_upd_dialog').panel('close');
												}
											});
								}
							});
		};
		var clearForm = function clearForm() {
			$('#view_user_page_updUser_form').form('clear');
		};
		//设置省下拉框
		var setProvice = function setProvice(i, url) {
			$('#comboProvinceId' + i)
					.combobox(
							{
								url : url,
								valueField : 'dictCode',
								textField : 'dictNme',
								onSelect : function(rec) {
									var urlCity = '${pageContext.request.contextPath }/dict/findAddrScope.do';
									urlCity += "?dictKnd=0000";
									urlCity += "&distPCode=" + rec.dictCode;
									setCity(i, urlCity);
									setFormValue(i);
									//$('#comboCityId0').combobox('reload', urlCity);    
								}
							});
		};
		//设置市下拉框
		var setCity = function setCity(i, url) {
			$('#comboCityId' + i)
					.combobox(
							{
								url : url,
								valueField : 'dictCode',
								textField : 'dictNme',
								onSelect : function(rec) {
									var urlArea = '${pageContext.request.contextPath }/dict/findAddrScope.do';
									urlArea += "?dictKnd=0000";
									urlArea += "&distPCode=" + rec.dictCode;
									setArea(i, urlArea);
									setFormValue(i);
									//$('#comboAreaId0').combobox('reload', urlArea);    
								}
							});
		};
		//设置区下拉框
		var setArea = function setArea(i, url) {
			$('#comboAreaId' + i).combobox({
				url : url,
				valueField : 'dictCode',
				textField : 'dictNme',
				onSelect : function(rec) {
					setFormValue(i);
				}
			});
		};
		var urlInit = '${pageContext.request.contextPath }/dict/findAddrScope.do';
		urlInit += "?dictKnd=0000";
		urlInit += "&dictCode=260000";
		urlInit += "&distPCode=0";
		setProvice(0, urlInit);
		setCity(0, '');
		setArea(0, '');
		//setProvice(1, urlInit);
		//setCity(1, '');
		//setArea(1, '');
		//设置后台表单字段值
		var setFormValue = function setFormValue(i) {
			var str = $('#comboProvinceId' + i).combobox('getText') + ","
					+ $('#comboCityId' + i).combobox('getText') + ","
					+ $('#comboAreaId' + i).combobox('getText');
			if (i == 0) {
				str += "," + $('#comboAddrId').val();
				$("input[name='uAddr']").val(str);
			} else {
				$("input[name='uScop']").val(str);
			}
		};
		//初始化地址表单
		var setInitValue = function setInitValue() {
			var uAddr = '${userSession.uAddr}';
			//var uScop = '${userInfo.uScop}';
			var param0 = uAddr.split(',');
			//var param1 = uScop.split(',');
			$('#comboProvinceId0').combobox('setText', param0[0]);
			$('#comboCityId0').combobox('setText', param0[1]);
			$('#comboAreaId0').combobox('setText', param0[2]);
			$('#comboAddrId').textbox('setText', param0[3]);
			$('#comboAddrId').val(param0[3]);
			//$('#comboProvinceId1').combobox('setText', param1[0]);
			//$('#comboCityId1').combobox('setText', param1[1]);
			//$('#comboAreaId1').combobox('setText', param1[2]);
		};
		setTimeout('setInitValue()', 5000); //3s后执行给地区赋值的语句
	</script>
</body>
</html>
