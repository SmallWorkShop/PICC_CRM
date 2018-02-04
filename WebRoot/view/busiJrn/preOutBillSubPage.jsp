<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>出单员进行出单操作</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<form id="view_busiJrn_preOutBillSubPage_form" action="">
		<table
			style="padding: 10px 10px 10px 10px;font-weight: bold;color: #0E2D5F;font-size: 12px;">
			<tr hidden="true" style="display: none">
				<td>客户Id：</td>
				<td><input id="cusIdId" class="easyui-textbox" name="cusId"
					value="${custInfoBill.cusId }">
				</td>
				<td>保单Id：</td>
				<td><input class="easyui-textbox" name="insurId" id="insurIdId"
					value="${custInfoBill.insurInfo.insurId }">
				</td>
			</tr>
			<tr>
				<td>车牌号：</td>
				<td><input class="easyui-textbox" name="plateNo"
					value="${custInfoBill.plateNo }" disabled="disabled"></td>
				<td>发动机号码：</td>
				<td><input class="easyui-textbox" name="engineNo"
					value="${custInfoBill.engineNo }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>客户姓名：</td>
				<td><input class="easyui-textbox" name="cusNme"
					value="${custInfoBill.cusNme }" disabled="disabled"></td>
				<td>电话1：</td>
				<td><input class="easyui-textbox" name="cusPhon"
					value="${custInfoBill.cusPhon }" disabled="disabled"></td>
			</tr>
			<tr>
				<td>起保日期：</td>
				<td><input class="easyui-datebox" name="stDate"
					value="${custInfoBill.insurInfo.stDate }" disabled="disabled">
				</td>
				<td>到期日期：</td>
				<td><input class="easyui-datebox" name="exDate"
					value="${custInfoBill.insurInfo.exDate }" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>保险公司：</td>
				<td><input id="insurComId" class="easyui-textbox"
					name="insurCom" value="${custInfoBill.insurInfo.insurCom }"
					disabled="disabled"></td>
				<td>渠道方式：</td>
				<td><select class="easyui-combobox" name="chl"
					style="width: 155px" disabled="disabled"
					data-options="value:'${custInfoBill.insurInfo.chl }'">
						<option value="00">00-传统</option>
						<option value="01">01-电网销</option>
				</select></td>
			</tr>
			<tr>
				<td>配送地址：</td>
				<td colspan="3"><input class="easyui-textbox" name="addr"
					value="${custInfoBill.insurInfo.addr }" disabled="disabled"
					style="width: 100%"></td>
			</tr>
			<tr>
				<td>配送日期：</td>
				<td><input class="easyui-datebox" id="distDateId"
					value="${custInfoBill.insurInfo.distDate }" name="distDate"
					required="required" /></td>
				<td>支付方式：</td>
				<td><select class="easyui-combobox" name="preCol1"
					id="preCol1Id" style="width: 155px">
						<option value="00">00-现金</option>
						<option value="01">01-刷卡</option>
				</select></td>
			</tr>
			<tr>
				<td>礼品：</td>
				<td colspan="3"><input id="giftId" class="easyui-textbox"
					data-options="multiline:true" name="gift"
					value="${custInfoBill.insurInfo.gift }"
					style="height: 50px;width: 250px;" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="right"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="quitBill();">&nbsp;退&nbsp;回&nbsp;</a>&nbsp;&nbsp;
					<a href="javascript:void(0);" class="easyui-linkbutton"
					onclick="submitForm();">&nbsp;配&nbsp;送&nbsp;</a></td>
			</tr>
		</table>
	</form>
	<div id="view_busiJrn_preOutBillSubPage_quitBill_dialog" title="退回理由"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-edit',modal:true"
		style="width: 380px;height: 180px;">
		<form id="view_busiJrn_preOutBillSubPage_quitReson_form">
			<table style="font-weight: bold;color: #0E2D5F;font-size: 12px;">
				<tr>
					<td>请填写退回理由：</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2"><input id="quitBillReason"
						class="easyui-textbox" data-options="multiline:true" value=""
						style="height: 60px;width: 350px;" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><a href="javascript:void(0);"
						class="easyui-linkbutton"
						onclick="quitBillSure('${custInfoBill.cusId }');">&nbsp;确&nbsp;定&nbsp;</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="view_busiJrn_preOutBillSubPage_distBill_dialog" title="配送单"
		class="easyui-dialog"
		data-options="closed:true,draggable:true,border:false,iconCls:'icon-print',modal:true"
		style="width: 800px;height: 360px; padding: 10px 10px 10px 10px">
	</div>
	<script type="text/javascript">
		//退回dialog对话框
		var quitBill = function quitBill() {
			$('#view_busiJrn_preOutBillSubPage_quitBill_dialog').dialog('open');
		};
		//退回请求
		var quitBillSure = function quitBillSure(cusId) {
			if ($('#view_busiJrn_preOutBillSubPage_quitReson_form').form(
					'validate')) {
				$.messager
						.confirm(
								'确认',
								'您确定要退回该客户信息吗？',
								function(r) {
									if (r) {
										$
												.ajax({
													type : 'post',
													url : '${pageContext.request.contextPath }/busiJrn/quitBill.do',
													dataType : 'text',
													data : {
														'cusId' : '${custInfoBill.cusId }',
														'plateNo' : '${custInfoBill.plateNo }',
														'frameNo' : '${custInfoBill.frameNo }',
														'cusNme' : '${custInfoBill.cusNme }',
														'busierId' : '${userSession.uId }',
														'operInfo' : $(
																'#quitBillReason')
																.val()
													},
													success : function(xmlq) {
														alert(xmlq);
														$(
																'#view_busiJrn_preOutBillSubPage_quitBill_dialog')
																.dialog('close');
														parent
																.$(
																		'#view_custInfo_updCustInfo_updForm_div')
																.dialog('close');
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
													error : function(xmlq, errq) {
														alert(xmlq);
													}
												});
									}
								});
			}
			;
		};
		//生成并显示配送单
		var submitForm = function submitForm() {
			$.messager
					.confirm(
							'确认',
							'您确定要生成配送单吗？',
							function(r) {
								if (r) {
									var str = '${pageContext.request.contextPath }/busiJrn/distBillAndPrintBill.do';
									str += "?insurId=" + $('#insurIdId').val();
									str += "&cusId=" + $('#cusIdId').val();
									str += "&distDate="
											+ $('#distDateId').val();
									str += "&preCol1="
											+ $('#preCol1Id').combobox(
													'getValue');
									$(
											'#view_busiJrn_preOutBillSubPage_distBill_dialog')
											.dialog('open').dialog('refresh',
													str);
								}
							});
		};
		var checkInsInfo = function checkInsInfo() {
			$('#view_busiSignBillSubPage_insInfo_dialog').dialog('open');
		};
		var checkInsOk = function checkInsOk() {
			$('#view_busiSignBillSubPage_insInfo_dialog').dialog('close');
		};
		var isChecked = function isChecked(i) {
		};
		var isChecked2 = function isChecked2(i) {
		};
	</script>
</body>
</html>
