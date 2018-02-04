<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML >
<html>
<head>

<title>客户详细信息</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<!-- <h3 style="color: #0E2D5F">客户详细信息</h3>
	<div style="margin:20px 0 10px 0;"></div> -->
	<div class="easyui-accordion"
		style="width:100%;height:400px;border: 0px;">
		<div title="客户基本信息" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户基本信息</h4>
			<table class="zzTable" style="width: 750px;text-align: center;">
				<tr>
					<td hidden="true" style="display: none">客户ID：${custInfoWithAll.cusId
						}</td>
					<td class="zzTd1">车牌号</td>
					<td class="zzTd2">${custInfoWithAll.plateNo }</td>
					<td class="zzTd1">品牌</td>
					<td class="zzTd2">${custInfoWithAll.brand }</td>
				</tr>
				<tr>
					<td class="zzTd1">车架号码</td>
					<td class="zzTd2">${custInfoWithAll.frameNo }</td>
					<td class="zzTd1">品牌型号</td>
					<td class="zzTd2">${custInfoWithAll.brandTyp }</td>
				</tr>
				<tr>
					<td class="zzTd1">发动机号码</td>
					<td class="zzTd2">${custInfoWithAll.engineNo }</td>
					<td class="zzTd1">初登日期</td>
					<td class="zzTd2">${custInfoWithAll.logDate }</td>
				</tr>
				<tr>
					<td class="zzTd1">客户姓名</td>
					<td class="zzTd2">${custInfoWithAll.cusNme }</td>
					<td class="zzTd1">身份证号码</td>
					<td class="zzTd2">${custInfoWithAll.cusIdNo }</td>
				</tr>
				<tr>
					<td class="zzTd1">手机1</td>
					<td class="zzTd2">${custInfoWithAll.cusPhon }</td>
					<td class="zzTd1">手机2</td>
					<td class="zzTd2">${custInfoWithAll.cusTel }</td>
				</tr>
				<tr>
					<td class="zzTd1">客户状态</td>
					<td class="zzTd2"><c:if
							test="${custInfoWithAll.cusSts eq 'NO' }">NO-待处理</c:if> <c:if
							test="${custInfoWithAll.cusSts eq '00' }">00-待签单</c:if> <c:if
							test="${custInfoWithAll.cusSts eq '01' }">01-待出单</c:if> <c:if
							test="${custInfoWithAll.cusSts eq '02' }">02-待配送</c:if> <c:if
							test="${custInfoWithAll.cusSts eq '09' }">09-完成</c:if>
					</td>
					<td class="zzTd1">业务员</td>
					<td class="zzTd2">${custInfoWithAll.userInfo.uNme }</td>
				</tr>
				<tr>
					<td class="zzTd1">出单员</td>
					<td class="zzTd2">${custInfoWithAll.userInfo2.uNme }</td>
					<td class="zzTd1">配送员</td>
					<td class="zzTd2">${custInfoWithAll.userInfo3.uNme }</td>
				</tr>
				<tr>
					<td class="zzTd1">客户地址</td>
					<td class="zzTd2" colspan="3">${custInfoWithAll.cusAddr }</td>
				</tr>
			</table>
		</div>
		<div title="客户保单信息" data-options="iconCls:'icon-reload'"
			style="padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户保单信息</h4>
			<table class="zzTable" style="width: 750px;text-align: center;">
				<tr>
					<td class="zzTd1">车牌号</td>
					<td class="zzTd2" colspan="3">${custInfoWithAll.plateNo }</td>
					<td hidden="true" style="display: none">保单ID：${custInfoWithAll.insurInfo.insurId
						}</td>
				</tr>
				<tr>
					<td class="zzTd1">保险起保日期</td>
					<td class="zzTd2"><f:formatDate
							value="${custInfoWithAll.insurInfo.stDate }" pattern="yyyy-MM-dd" />
					</td>
					<td class="zzTd1">保险到期日期</td>
					<td class="zzTd2"><f:formatDate
							value="${custInfoWithAll.insurInfo.exDate }" pattern="yyyy-MM-dd" />
					</td>
				</tr>
				<tr>
					<td class="zzTd1">配送日期</td>
					<td class="zzTd2">${custInfoWithAll.insurInfo.distDate }</td>
					<td class="zzTd1">渠道方式</td>
					<td class="zzTd2"><c:if
							test="${custInfoWithAll.insurInfo.chl eq '00' }">00-传统</c:if> <c:if
							test="${custInfoWithAll.insurInfo.chl eq '01' }">01-电网销</c:if>
					</td>
				</tr>
				<tr>
					<td class="zzTd1">保险公司</td>
					<td class="zzTd2" colspan="3">${custInfoWithAll.insurInfo.insurCom
						}</td>
				</tr>
				<tr>
					<td class="zzTd1">配送地址</td>
					<td class="zzTd2" colspan="3">${custInfoWithAll.insurInfo.addr
						}</td>
				</tr>
				<tr>
					<td class="zzTd1">礼品</td>
					<td class="zzTd2" colspan="3">${custInfoWithAll.insurInfo.gift
						}</td>
				</tr>
			</table>
		</div>
		<div title="客户险种信息" data-options="iconCls:'icon-reload'"
			style="padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户险种信息</h4>
			<table class="zzTable" style="width: 750px;text-align: center;">
				<c:if test="${empty custInfoWithAll.lCustIns }">
					<tr>
						<td colspan="10" class="zzTd1">暂无险种信息。</td>
					</tr>
				</c:if>
				<c:set var="amt" value="0.00" />
				<c:forEach items="${custInfoWithAll.lCustIns }" var="ins">
					<c:set var="amt" value="${amt + ins.insAmt + ins.insSAmt}" />
					<tr>
						<td class="zzTd1">险种名称</td>
						<td class="zzTd2">${ins.insInfo.insNme }</td>
						<td class="zzTd1">险种类型</td>
						<td class="zzTd2"><c:if test="${ins.insInfo.insKnd eq '00' }">00-车船税</c:if>
							<c:if test="${ins.insInfo.insKnd eq '01' }">01-交强险</c:if> <c:if
								test="${ins.insInfo.insKnd eq '02' }">00-商业险</c:if></td>
						<td class="zzTd1">保费</td>
						<td class="zzTd2">${ins.insAmt }</td>
						<td class="zzTd1">保额</td>
						<td class="zzTd2"><c:if test="${ins.insLim eq 'undefined' }"></c:if>
							<c:if test="${ins.insLim ne 'undefined' }">${ins.insLim }</c:if>
						</td>
						<td class="zzTd1">不计免赔金额</td>
						<td class="zzTd2"><c:if test="${ins.insInfo.insSts eq '0' }">无</c:if>
							<c:if test="${ins.insInfo.insSts eq '1' }">${ins.insSAmt }</c:if>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td class="zzTd1">小计</td>
					<td class="zzTd2" colspan="9">${amt }</td>
				</tr>
			</table>
		</div>
		<div title="流程跟踪" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户流程日志</h4>
			<table class="zzTable" style="width: 750px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">处理人</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusAllJrn }">
					<tr>
						<td class="zzTd1" colspan="5">该客户暂无任何日志信息。</td>
					</tr>
				</c:if>
				<c:set var="index0" value="0" />
				<c:forEach items="${lCusAllJrn }" var="all">
					<c:set var="index0" value="${index0 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index0 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${all.acDte }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="zzTd2" style="width: 130px;">${all.userInfo.uNme }[${all.userInfo.uTel }]</td>
						<td class="zzTd2" style="width: 130px;">${all.operNme }</td>
						<td class="zzTd2" style="width: 230px;">${all.operInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
