<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML >
<html>
<head>

<title>维修保养编辑页面</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div style="width: 100%;height: 100%;text-align: center;">
		<h4 style="color:#0099FF;" align="left">客户维修保养记录</h4>
		<div style="text-align: left;width: 100%;height: 30px;">
			<a href="javascript:void(0);" class="addClass"
				onclick="addServInfo();">添加&nbsp;</a>&nbsp;&nbsp;| <a
				href="javascript:void(0);" class="saveClass"
				onclick="saveServInfo();">保存&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<form id="view_servInfo_servInfoEditPage_form">
			<table class="zzTable" style="width: 630px;text-align: center;">
				<tr hidden="true" style="display: none">
					<td><input id="servInfo_servId" type="text" value="">
					</td>
					<td><input id="servInfo_cusId" type="text" value="${cusId }">
					</td>
				</tr>
				<tr>
					<td class="zzTd1">序号</td>
					<td class="zzTd1">日期</td>
					<td class="zzTd1">维修/保养</td>
					<td class="zzTd1">地点</td>
					<td class="zzTd1">金额</td>
					<td class="zzTd1">备注</td>
				</tr>
				<c:set var="index" value="0" />
				<c:if test="${empty lServInfo }">
					<tr>
						<td colspan="6" class="zzTd2">暂无该客户的维修/保养记录！</td>
					</tr>
				</c:if>
				<c:forEach var="servInfo" items="${lServInfo }">
					<c:set var="index" value="${index + 1 }" />
					<tr>
						<td class="zzTd2">${index }</td>
						<td class="zzTd2"><f:formatDate value="${servInfo.acDte }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2">${servInfo.dealNme }</td>
						<td class="zzTd2">${servInfo.addr }</td>
						<td class="zzTd2">${servInfo.amt }</td>
						<td class="zzTd2">${servInfo.dealInfo }</td>
					</tr>
				</c:forEach>
				<tr id="servInfo_addRow" style="visibility:hidden;">
					<td class="zzTd2"><input id="servInfo_num"
						class="easyui-textbox" size="3" value="${index + 1 }"
						disabled="disabled">
					</td>
					<td class="zzTd2"><input id="servInfo_acDte"
						class="easyui-datetimebox" required="required" size="12" /></td>
					<td><select id="servInfo_dealCod" class="easyui-combobox"
						data-options="value:'5001'">
							<option value="5000">5000-客户维修</option>
							<option value="5001">5001-客户保养</option>
					</select>
					</td>
					<td class="zzTd2"><input id="servInfo_addr"
						class="easyui-textbox" required="required" size="40"></td>
					<td class="zzTd2"><input id="servInfo_amt"
						class="easyui-textbox" required="required" size="5"></td>
					<td class="zzTd2"><input id="servInfo_dealInfo"
						class="easyui-textbox" required="required" size="40"></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$('.addClass').linkbutton({
			text : '添加',
			plain : true,
			iconCls : 'icon-add'
		});
		$('.saveClass').linkbutton({
			text : '保存',
			plain : true,
			iconCls : 'icon-save'
		});
		var addServInfo = function addServInfo() {
			$('#servInfo_addRow').css('visibility', 'visible');
		};
		var saveServInfo = function saveServInfo() {
			addServInfo();
			if ($('#view_servInfo_servInfoEditPage_form').form('validate')) {
				$.messager
						.confirm(
								'确认',
								'您确认要添加该条维修/保养记录？',
								function(r) {
									if (r) {
										$
												.ajax({
													type : 'post',
													url : '${pageContext.request.contextPath }/servInfo/insertServInfo.do',
													dataType : 'text',
													data : {
														'cusId' : '${cusId }',
														'servInfo_acDte' : $(
																'#servInfo_acDte')
																.datetimebox(
																		'getValue'),
														'dealCod' : $(
																'#servInfo_dealCod')
																.combobox(
																		'getValue'),
														'addr' : $(
																'#servInfo_addr')
																.val(),
														'amt' : $(
																'#servInfo_amt')
																.val(),
														'dealInfo' : $(
																'#servInfo_dealInfo')
																.val()
													},
													success : function(xmlq) {
														alert(xmlq);
														parent
																.$(
																		'#view_servInfoMain_servInfoEdit_dialog')
																.dialog(
																		'refresh');
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
