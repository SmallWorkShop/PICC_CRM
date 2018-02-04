<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>新增用户</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	
</script>
</head>
<body>
	<div title="" style="padding:10px 60px 20px 60px">
		<form id="view_user_page_addUser_form" method="post" action="">
			<table cellpadding="5">
				<tr hidden="true">
					<td>用户ID:</td>
					<td><input class="easyui-textbox" type="text" name="uId"
						value=""></input>
					</td>
				</tr>
				<tr>
					<td>工号:</td>
					<td><input class="easyui-textbox" type="text" name="uCode"
						data-options="required:true" value=""></input>
					</td>
					<td>直属上司:</td>
					<td><input id="view_user_page_addUser_upid_tree" name="uPId"
						style="width: 155px;"></input>
					</td>
				</tr>
				<tr>
					<td>用户密码:</td>
					<td><input id="view_user_page_addUser_form_upwd"
						class="easyui-textbox" type="password" name="uPwd"
						data-options="required:true"></input>
					</td>
					<td>复核密码:</td>
					<td><input class="easyui-textbox" type="password"
						name="uPwd_1"
						data-options="required:true,validType:'equals[\'#view_user_page_addUser_form_upwd\']'"></input>
					</td>
				</tr>
				<tr>
					<td>用户类型:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-业务员'}
		                                ,{label: '10',value: '10-出单员'}
		                                ,{label: '20',value: '20-配送员'}
		                                ,{label: '30',value: '30-经理'}
		                                ,{label: '40',value: '40-合作公司'}
			                            ],
			                      value:'00'"
						name="uTyp">
					</td>
					<td>用户状态:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-正常'}
		                                ,{label: '01',value: '01-待激活'}
		                                ,{label: '09',value: '09-注销'}
			                            ],
			                      value:'00'"
						name="uSts">
					</td>
				</tr>
				<tr hidden="true">
					<td>用户备用状态:</td>
					<td><input type="text" class="easyui-combobox"
						data-options="valueField: 'label',
					              textField: 'value',
		                          data: [{label: '00',value: '00-正常'}
		                                ,{label: '09',value: '09-冻结'}
			                            ],
			                      value:'00'"
						name="uSSts">
					</td>
				</tr>
				<tr>
					<td>用户姓名:</td>
					<td><input class="easyui-textbox" type="text" name="uNme"
						value="" required="required"></input>
					</td>
					<td>证件号码:</td>
					<td><input class="easyui-textbox" type="text" name="uTpId"
						value=""></input>
					</td>
				</tr>
				<tr>
					<td>联系电话:</td>
					<td><input class="easyui-textbox" type="text" name="uTel"
						value=""></input>
					</td>
					<td>联系手机:</td>
					<td><input class="easyui-textbox" type="text" name="uPho"
						value=""></input>
					</td>
				</tr>
				<tr>
					<td>归属地址:</td>
					<td hidden="true" style="display: none"><input id="addr0"
						class="easyui-textbox" data-options="multiline:true" name="uAddr"
						value="" style="height: 60px;"></input>
					</td>
					<td colspan="3">省：<input id="comboProvinceId0"
						name="comboProvinceName0" size="9">市：<input
						id="comboCityId0" name="comboCityName0" size="9">区：<input
						id="comboAreaId0" name="comboAreaName0" size="9"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">详细：<input id="comboAddrId"
						name="comboAddrName" data-options="multiline:true"
						class="easyui-textbox" style="width: 290px;height: 50px;">
					</td>
				</tr>
				<tr>
					<td>负责辖区:</td>
					<td hidden="true" style="display: none"><input id="addr1"
						class="easyui-textbox" data-options="multiline:true" name="uScop"
						value="" style="height: 60px;"></input>
					</td>
					<td colspan="3">省：<input id="comboProvinceId1"
						name="comboProvinceName1" size="9">市：<input
						id="comboCityId1" name="comboCityName1" size="9">区：<input
						id="comboAreaId1" name="comboAreaName1" size="9"></td>
				</tr>
				<tr hidden="true">
					<td>用户角色:</td>
					<td><input class="easyui-textbox" name="uRole" value=""></input>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="right"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="submitForm()">提交</a>
						&nbsp;&nbsp; <a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="clearForm()">重置</a></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		//密码校验
		$.extend($.fn.validatebox.defaults.rules, {
			equals : {
				validator : function(value, param) {
					return value == $(param[0]).val();
				},
				message : '两次输入的密码不一致！'
			}
		});
		function submitForm() {
			if ($('#view_user_page_addUser_form').form('validate')) {
				setFormValue(0);
				setFormValue(1);
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath }/user/insert.do',
					dataType : 'text',
					data : $('#view_user_page_addUser_form').serialize(),
					success : function(xmlq) {
						alert(xmlq);
						parent.$('#view_user_page_userMain_add_dialog').panel(
								'close');
						parent.$('#view_user_page_userMain_table').datagrid(
								'reload');
					},
					error : function(xmlq, errq) {
						alert(xmlq);
						parent.$('#view_user_page_userMain_add_dialog').panel(
								'close');
					}
				});
			}
			;
		}
		function clearForm() {
			$('#view_user_page_addUser_form').form('clear');
		}
		$('#view_user_page_addUser_upid_tree').combotree({
			url : '${pageContext.request.contextPath }/user/findUserTree.do',
			editable : false,
			animate : true,
			idField : 'id',
			textField : 'text',
			parentField : 'pid',
			iconCls : 'icon-user'
		});
		//设置省下拉框
		var setProvice = function setProvice(i,url) {
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
		setProvice(0,urlInit);
		setProvice(1,urlInit);
		setCity(0, '');
		setCity(1, '');
		setArea(0, '');
		setArea(1, '');
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
	</script>
</body>
</html>
