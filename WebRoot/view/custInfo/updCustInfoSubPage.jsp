<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>
<title>客户信息修改子页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<form id="view_custInfo_updCustInfoSubPage_updForm" action="">
		<table
			style="padding: 10px 10px 10px 10px;font-weight: bold;color: #0E2D5F;font-size: 12px;">
			<tr hidden="true" style="display: none">
				<td>客户Id：</td>
				<td><input class="easyui-textbox" name="cusId"
					value="${custInfo.cusId }">
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>车牌号：</td>
				<td><input class="easyui-textbox" name="plateNo"
					value="${custInfo.plateNo }" disabled="disabled"></td>
				<td>品牌：</td>
				<td><input class="easyui-textbox" name="brand"
					value="${custInfo.brand }"></td>
			</tr>
			<tr>
				<td>车架号码：</td>
				<td><input class="easyui-textbox" name="frameNo"
					value="${custInfo.frameNo }" required="required"></td>
				<td>品牌型号：</td>
				<td><input class="easyui-textbox" name="brandTyp"
					value="${custInfo.brandTyp }"></td>
			</tr>
			<tr>
				<td>发动机号码：</td>
				<td><input class="easyui-textbox" name="engineNo"
					value="${custInfo.engineNo }" required="required"></td>
				<td>初登日期：</td>
				<td><input class="easyui-datetimebox" name="logDate"
					value="${custInfo.logDate }">
				</td>
			</tr>
			<tr>
				<td>客户姓名：</td>
				<td><input class="easyui-textbox" name="cusNme"
					value="${custInfo.cusNme }" required="required"></td>
				<td>身份证号码：</td>
				<td><input class="easyui-textbox" name="cusIdNo"
					value="${custInfo.cusIdNo }" required="required"></td>
			</tr>
			<tr>
				<td>电话1：</td>
				<td><input class="easyui-textbox" name="cusPhon"
					value="${custInfo.cusPhon }" required="required"></td>
				<td>电话2：</td>
				<td><input class="easyui-textbox" name="cusTel"
					value="${custInfo.cusTel }"></td>
			</tr>
			<tr>
				<td>客户状态：</td>
				<td><select id="view_custInfo_updCustInfoSub_select_cusStsId"
					name="cusSts" style="width: 155px" disabled="disabled">
						<option value="">全部</option>
						<option value="NO">NO-待处理</option>
						<option value="00">00-待签单</option>
						<option value="01">01-待出单</option>
						<option value="02">02-待配送</option>
						<option value="09">09-已完成</option>
				</select></td>
				<td>业务员：</td>
				<td><select id="view_custInfo_updCustInfoSub_select_busierIdId"
					name="busierId" style="width: 155px"></select></td>
			</tr>
			<tr>
				<td>客户地址：</td>
				<td hidden="true" style="display: none"><input id="addr0"
					class="easyui-textbox" data-options="multiline:true" name="cusAddr"
					value="${custInfo.cusAddr }" style="height: 60px;"></input>
				</td>
				<td colspan="3">省：<input id="comboProvinceId0"
					name="comboProvinceName0" size="9">市：<input
					id="comboCityId0" name="comboCityName0" size="9">区：<input
					id="comboAreaId0" name="comboAreaName0" size="9"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">详细：<input id="comboAddrId" name="comboAddrName"
					data-options="multiline:true,onChange(n,o){setFormValue(0);},"
					class="easyui-textbox" style="width: 290px;height: 50px;">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="submitForm();">&nbsp;修&nbsp;改&nbsp;</a>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		$('#view_custInfo_updCustInfoSub_select_cusStsId').combobox({
			value : '${custInfo.cusSts }'
		});
		$('#view_custInfo_updCustInfoSub_select_busierIdId')
				.combotree(
						{
							editable : true,
							idField : 'id',
							textField : 'text',
							animate : true,
							parentField : 'pid',
							iconCls : 'icon-user',
							url : '${pageContext.request.contextPath }/user/findSonUserTree.do',
							value : '${custInfo.busierId }'
						});
		var submitForm = function submitForm() {
			$.messager
					.confirm(
							'确认',
							'您确定要修改该客户基本信息吗？',
							function(r) {
								if (r) {
									$
											.ajax({
												type : 'post',
												url : '${pageContext.request.contextPath }/custInfo/updCustInfoByCustInfo.do',
												dataType : 'text',
												data : $(
														'#view_custInfo_updCustInfoSubPage_updForm')
														.serialize(),
												success : function(xmlq) {
													alert(xmlq);
													parent
															.$(
																	'#view_custInfo_updCustInfo_updForm_div')
															.dialog('close');
													parent
															.$(
																	'#view_custInfo_updCustInfo_tab0_datagrid')
															.datagrid('reload');
													parent
															.$(
																	'#view_custInfo_updCustInfo_tab1_datagrid')
															.datagrid('reload');
												},
												error : function(xmlq, errq) {
													alert(xmlq);
													//parent.$('#view_func_funcMain_dialog').panel('close');
												}
											});
								}
							});
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
				$("input[name='cusAddr']").val(str);
			} else {
				$("input[name='uScop']").val(str);
			}
		};
		//初始化地址表单
		var setInitValue = function setInitValue() {
			var uAddr = '${custInfo.cusAddr }';
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
