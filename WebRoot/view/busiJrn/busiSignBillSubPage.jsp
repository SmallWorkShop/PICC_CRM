<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>
<title>客户签单填写保单子页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.tdClass {
	width: 170px;
}
</style>
</head>

<body>
	<form id="view_busiJrn_busiSignBillSubPage_form" action="">
		<table
			style="padding: 10px 10px 10px 10px;font-weight: bold;color: #0E2D5F;font-size: 12px;">
			<tr hidden="true" style="display: none">
				<td>客户Id：</td>
				<td><input id="cusIdId" class="easyui-textbox" name="cusId"
					value="${custInfo.cusId }">
				</td>
				<td>险种：</td>
				<td><input type="text" name="insStrName" id="insStrId" value="">
				</td>
			</tr>
			<tr>
				<td>车牌号：</td>
				<td><input class="easyui-textbox" name="plateNo"
					value="${custInfo.plateNo }" disabled="disabled"></td>
				<td>发动机号码：</td>
				<td><input class="easyui-textbox" name="engineNo"
					value="${custInfo.engineNo }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>客户姓名：</td>
				<td><input class="easyui-textbox" name="cusNme"
					value="${custInfo.cusNme }" disabled="disabled"></td>
				<td>电话1：</td>
				<td><input class="easyui-textbox" name="cusPhon"
					value="${custInfo.cusPhon }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>起保日期：</td>
				<td><input id="stDateId" class="easyui-datebox" name="stDate"
					value="" required="required"></td>
				<td>到期日期：</td>
				<td><input id="exDateId" class="easyui-datebox" name="exDate"
					value="" required="required"></td>
			</tr>
			<tr>
				<td>保险公司：</td>
				<td><input id="insurComId" class="easyui-textbox"
					name="insurCom" value="" required="required"></td>
				<td>渠道方式：</td>
				<td><select id="chlId" class="easyui-combobox" name="chl"
					style="width: 155px">
						<option value="00">00-传统</option>
						<option value="01">01-电网销</option>
				</select></td>
			</tr>
			<tr>
				<td>配送日期：</td>
				<td><input id="distDateId" class="easyui-datebox"
					name="distDate" required="required" /></td>
			</tr>
			<tr>
				<td>配送地址：</td>
				<td hidden="true" style="display: none"><input id="addr0"
					class="easyui-textbox" data-options="multiline:true" name="addr"
					value="" style="height: 60px;"></input></td>
				<td colspan="3">省：<input id="comboProvinceId0"
					name="comboProvinceName0" size="9">市：<input
					id="comboCityId0" name="comboCityName0" size="9">区：<input
					id="comboAreaId0" name="comboAreaName0" size="9">
				</td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">详细：<input id="comboAddrId" name="comboAddrName"
					class="easyui-textbox"
					data-options="onChange(n,o){setFormValue(0);},"
					style="width: 100%;"></td>
			</tr>
			<tr>
				<td>礼品：</td>
				<td colspan="3"><input id="giftId" class="easyui-textbox"
					name="gift" value="" style="width: 100%;"></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="checkInsInfo();">&nbsp;选择险种&nbsp;</a>&nbsp;&nbsp;
					<a href="javascript:void(0);" class="easyui-linkbutton"
					onclick="submitForm();">&nbsp;签&nbsp;单&nbsp;</a></td>
			</tr>
		</table>
	</form>
	<div id="view_busiSignBillSubPage_insInfo_dialog" title="选择险种"
		style="width: 880px;display: none;font-weight: bold;color: #0E2D5F;font-size: 10px;">
		<fieldset style="border: 1px solid #95B8E7;background-color: #fff;">
			<legend style="font-size: 12px;color: #aaa;font-weight: 700;">险种信息</legend>
			<table style="font-weight: bold;color: #0E2D5F;font-size: 10px;">
				<tr>
					<td class="tdClass"><input type="checkbox" id="ins01Name"
						name="ins01NameName" /><label for="ins01Name">机动车损失保险</label>
					</td>
					<td><input type="checkbox" id="ins01Sts" name="ins01StsName" /><label
						for="ins01Sts">不计免赔</label>
					</td>
					<td>车损保额：<input class="easyui-textbox" size="10" id="ins01Lim"
						name="ins01LimName" />
					</td>
					<td>车损保费：<input class="easyui-textbox" size="10" id="ins01Amt"
						name="ins01AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins01SAmt" name="ins01SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins02Name" name="ins02NameName" /><label
						for="ins02Name">盗抢险</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins02Sts"
						name="ins02StsName" /><label for="ins02Sts">不计免赔</label>
					</td>
					<td>盗抢保额：<input class="easyui-textbox" size="10" id="ins02Lim"
						name="ins02LimName" />
					</td>
					<td>盗抢保费：<input class="easyui-textbox" size="10" id="ins02Amt"
						name="ins02AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins02SAmt" name="ins02SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins03Name" name="ins03NameName" /><label
						for="ins03Name">第三者责任保险</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins03Sts"
						name="ins03StsName" /><label for="ins03Sts">不计免赔</label>
					</td>
					<td>三者保额：<select class="easyui-combobox" style="width: 85px;"
						id="ins03Lim" name="ins03LimName">
							<option>未投保</option>
							<option>50000</option>
							<option>100000</option>
							<option>150000</option>
							<option>200000</option>
							<option>300000</option>
							<option>500000</option>
							<option>1000000</option>
							<option>1500000</option>
							<option>2000000</option>
					</select>
					</td>
					<td>三者保费：<input class="easyui-textbox" size="10" id="ins03Amt"
						name="ins03AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins03SAmt" name="ins03SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins04Name" name="ins04NameName" /><label
						for="ins04Name">车上人员责任险（司机）</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins04Sts"
						name="ins04StsName" /><label for="ins04Sts">不计免赔</label>
					</td>
					<td>司机保额：<input class="easyui-textbox" size="10" id="ins04Lim"
						name="ins04LimName" />
					</td>
					<td>司机保费：<input class="easyui-textbox" size="10" id="ins04Amt"
						name="ins04AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins04SAmt" name="ins04SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins05Name" name="ins05NameName" /><label
						for="ins05Name">车上人员责任险（乘客）</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins05Sts"
						name="ins05StsName" /><label for="ins05Sts">不计免赔</label>
					</td>
					<td>单座保额：<input class="easyui-textbox" size="4" id="ins05Lim"
						name="ins05LimName" />&nbsp;<input class="easyui-textbox"
						size="1" name="ins05LimName2" />座</td>
					<td>乘客保费：<input class="easyui-textbox" size="10" id="ins05Amt"
						name="ins05AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins05SAmt" name="ins05SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins06Name" name="ins06NameName" /><label
						for="ins06Name">车身划痕损失险条款</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins06Sts"
						name="ins06StsName" /><label for="ins06Sts">不计免赔</label>
					</td>
					<td>划痕保额：<select class="easyui-combobox" style="width: 85px;"
						id="ins06Lim" name="ins06LimName">
							<option>未投保</option>
							<option>2000</option>
							<option>5000</option>
							<option>10000</option>
							<option>20000</option>
					</select>
					</td>
					<td>划痕保费：<input class="easyui-textbox" size="10" id="ins06Amt"
						name="ins06AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins06SAmt" name="ins06SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins07Name" name="ins07NameName" /><label
						for="ins07Name">发动机特别损失险条款</label>
					</td>
					<td style="width: 90px;"><input type="checkbox" id="ins07Sts"
						name="ins07StsName" /><label for="ins07Sts">不计免赔</label>
					</td>
					<td></td>
					<td>发动机损：<input class="easyui-textbox" size="10" id="ins07Amt"
						name="ins07AmtName" />
					</td>
					<td>不计免赔：<input class="easyui-textbox" size="10"
						id="ins07SAmt" name="ins07SAmtName" />
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins08Name" name="ins08NameName" /><label
						for="ins08Name">自燃损失险条款</label>
					</td>
					<td style="width: 90px;"></td>
					<td>自燃保额：<input class="easyui-textbox" size="10" id="ins08Lim"
						name="ins08LimName" />
					</td>
					<td>自燃保费：<input class="easyui-textbox" size="10" id="ins08Amt"
						name="ins08AmtName" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins09Name" name="ins09NameName" /><label
						for="ins09Name">玻璃单独破碎险条款</label>
					</td>
					<td style="width: 90px;"></td>
					<td>玻璃种类：<select class="easyui-combobox" style="width: 85px;"
						id="ins09Lim" name="ins09LimName">
							<option>国产玻璃</option>
							<option>国产玻璃（特殊）</option>
							<option>进口玻璃</option>
							<option>进口玻璃（特殊）</option>
					</select>
					</td>
					<td>玻破保费：<input class="easyui-textbox" size="10" id="ins09Amt"
						name="ins09AmtName" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins10Name" name="ins10NameName" /><label
						for="ins10Name">指定专修厂特约条款</label>
					</td>
					<td style="width: 90px;"></td>
					<td></td>
					<td>指定修理：<input class="easyui-textbox" size="10" id="ins10Amt"
						name="ins10AmtName" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins11Name" name="ins11NameName" /><label
						for="ins11Name">机动车强制责任保险</label>
					</td>
					<td style="width: 90px;"></td>
					<td></td>
					<td>交强保费：<input class="easyui-textbox" size="10" id="ins11Amt"
						name="ins11AmtName" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="ins12Name" name="ins12NameName" /><label
						for="ins12Name">车船税</label>
					</td>
					<td style="width: 90px;"></td>
					<td></td>
					<td>车船税费：<input class="easyui-textbox" size="10" id="ins12Amt"
						name="ins12AmtName" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="5" align="right"><a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="checkInsOk();">&nbsp;完&nbsp;成&nbsp;</a>
					</td>
				</tr>
			</table>
		</fieldset>
	</div>
	<script type="text/javascript">
		//ins01Name ins01Sts   ins01Lim  ins01Amt  ins01SAmt
		//required="required"
		var submitForm = function submitForm() {
			if ($('#view_busiJrn_busiSignBillSubPage_form').form('validate')) {
				var str = "";
				var obj = "";
				$("input[id^='ins'][id$='Name']:checked")
						.each(
								function() {
									var num = $(this).attr("id").substr(3, 2);
									obj = "{" + "'preCol1':" + "'"
											+ $(this).attr("id") + "'" + ","
											+ "'insAmt':" + "'";
									if ($('#ins' + num + 'Amt').val() == ""
											|| typeof ($('#ins' + num + 'Amt')
													.val()) == "undefined") {
										obj = obj + "0";
									} else {
										obj = obj
												+ $('#ins' + num + 'Amt').val();
									}
									obj = obj + "'" + "," + "'insSAmt':" + "'";
									if ($('#ins' + num + 'SAmt').val() == ""
											|| typeof ($('#ins' + num + 'SAmt')
													.val()) == "undefined") {
										obj = obj + "0";
									} else {
										obj = obj
												+ $('#ins' + num + 'SAmt')
														.val();
									}
									obj = obj + "'" + "," + "'insLim':" + "'"
											+ $('#ins' + num + 'Lim').val()
											+ "'" + "}";
									str = str + "," + obj;
								});
				if (str == "") {
					alert("您还未选择险种！");
				} else {
					$('#insStrId').val(str);
					$.messager
							.confirm(
									'确认',
									'请确保客户保单及险种信息已经填写完整！',
									function(r) {
										if (r) {
											setFormValue(0);
											$
													.ajax({
														type : 'post',
														url : '${pageContext.request.contextPath }/busiJrn/signBillWithIns.do',
														dataType : 'text',
														data : $(
																'#view_busiJrn_busiSignBillSubPage_form')
																.serialize(),
														success : function(xmlq) {
															alert(xmlq);
															parent
																	.$(
																			'#view_custInfo_updCustInfo_updForm_div')
																	.dialog(
																			'close');
															parent
																	.$(
																			'#view_custInfo_updCustInfo_tab0_datagrid')
																	.datagrid(
																			'reload');
															parent
																	.$(
																			'#view_custInfo_updCustInfo_tab1_datagrid')
																	.datagrid(
																			'reload');
														},
														error : function(xmlq,
																errq) {
															alert(xmlq);
														}
													});
										}
									});
				}
			} else {
				alert("请注意必输栏位！");
			}

		};
		var checkInsInfo = function checkInsInfo() {
			//data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
			$('#view_busiSignBillSubPage_insInfo_dialog').dialog({
				border : false,
				iconCls : 'icon-edit',
				modal : true,
				draggable : true
			}).show();
		};
		var checkInsOk = function checkInsOk() {
			$('#view_busiSignBillSubPage_insInfo_dialog').dialog('close');
		};
		var isChecked = function isChecked(i) {
		};
		var isChecked2 = function isChecked2(i) {
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
		//setProvice(1,urlInit);
		setCity(0, '');
		//setCity(1, '');
		setArea(0, '');
		//setArea(1, '');
		//设置后台表单字段值
		var setFormValue = function setFormValue(i) {
			var str = $('#comboProvinceId' + i).combobox('getText') + ","
					+ $('#comboCityId' + i).combobox('getText') + ","
					+ $('#comboAreaId' + i).combobox('getText');
			if (i == 0) {
				str += "," + $('#comboAddrId').val();
				$("input[name='addr']").val(str);
			} else {
				$("input[name='uScop']").val(str);
			}
		};
		$('#stDateId').datebox();
		$('#exDateId').datebox();
		$('#distDateId').datebox();
		$('#chlId').combobox();
	</script>
</body>
</html>
