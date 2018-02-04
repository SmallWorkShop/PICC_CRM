<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML >
<html>
<head>

<title>客户联系记录查询</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div style="width: 100%;height: 100%;text-align: center;">
		<h4 style="color:#0099FF;" align="left">客户联系记录</h4>
		<div style="text-align: left;width: 100%;height: 30px;display: none;">
			<a href="javascript:void(0);" class="addClass"
				onclick="addConnJrn();">添加&nbsp;</a>&nbsp;&nbsp;| <a
				href="javascript:void(0);" class="saveClass"
				onclick="saveConnJrn();">保存&nbsp;</a>&nbsp;&nbsp;|
		</div>
		<form id="view_connJrn_connJrnFindPage_form">
			<table class="zzTable" style="width: 530px;text-align: center;">
				<tr hidden="true" style="display: none">
					<td><input id="connJrn_connId" type="text" value=""></td>
					<td><input id="connJrn_cusId" type="text" value="${cusId }">
					</td>
				</tr>
				<tr>
					<td class="zzTd1">序号</td>
					<td class="zzTd1">联系日期</td>
					<td class="zzTd1">备注</td>
					<td class="zzTd1">状态</td>
					<td class="zzTd1">预约下次时间</td>
				</tr>
				<c:set var="index" value="0" />
				<c:if test="${empty lConnJrn }">
					<tr>
						<td colspan="5" class="zzTd2">暂无该客户的联系记录！</td>
					</tr>
				</c:if>
				<c:forEach var="connJrnL" items="${lConnJrn }">
					<c:set var="index" value="${index + 1 }" />
					<tr>
						<td class="zzTd2">${connJrnL.connNum }</td>
						<td class="zzTd2"><f:formatDate value="${connJrnL.acDte }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="zzTd2">${connJrnL.connDetail }</td>
						<td class="zzTd2"><c:if test="${connJrnL.sts eq '0' }">0-未联系</c:if>
							<c:if test="${connJrnL.sts eq '1' }">1-已联系</c:if>
						</td>
						<td class="zzTd2"><f:formatDate value="${connJrnL.nextConn }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
				<tr id="connJrn_addRow" style="visibility:hidden;">
					<td class="zzTd2"><input id="connJrn_connNum"
						class="easyui-textbox" size="3">
					</td>
					<td class="zzTd2"><input id="connJrn_acDte"
						class="easyui-datetimebox" required="required" size="12" /></td>
					<td class="zzTd2"><input id="connJrn_connDetail"
						class="easyui-textbox" data-options="" required="required"
						size="40">
					</td>
					<td class="zzTd2"><select id="connJrn_sts"
						class="easyui-combobox" size="6">
							<option value="0">0-未联系</option>
							<option value="1">1-已联系</option>
					</select>
					</td>
					<td class="zzTd2"><input id="connJrn_nextConn"
						class="easyui-datetimebox" size="12" /></td>
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
		var addConnJrn = function addConnJrn() {
			$('#connJrn_addRow').css('visibility', 'visible');
		};
		var saveConnJrn = function saveConnJrn() {
			addConnJrn();
			if ($('#view_connJrn_connJrnFindPage_form').form('validate')) {
				alert("--");
			}
		};
	</script>
</body>
</html>
