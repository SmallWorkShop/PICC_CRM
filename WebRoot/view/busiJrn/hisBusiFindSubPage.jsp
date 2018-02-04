<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML >
<html>
<head>

<title>客户操作流程跟踪</title>

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
	<div class="easyui-accordion"
		style="width:100%;height:350px;border: 0px;">
		<div title="客户流" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户流程日志</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
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
						<td class="zzTd2" style="width: 130px;">${all.userInfo.uNme }</td>
						<td class="zzTd2" style="width: 130px;">${all.operNme }</td>
						<td class="zzTd2" style="width: 230px;">${all.operInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div title="签单" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户签单记录</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">处理人</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusSignJrn }">
					<tr>
						<td class="zzTd1" colspan="5">该客户暂无签单记录。</td>
					</tr>
				</c:if>
				<c:set var="index1" value="0" />
				<c:forEach items="${lCusSignJrn }" var="sign">
					<c:set var="index1" value="${index1 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index1 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${sign.acDte }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2" style="width: 130px;">${sign.userInfo.uNme
							}</td>
						<td class="zzTd2" style="width: 130px;">${sign.operNme }</td>
						<td class="zzTd2" style="width: 230px;">${sign.operInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div title="出单" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户出单记录</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">处理人</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusOutJrn }">
					<tr>
						<td class="zzTd1" colspan="5">该客户暂无出单记录。</td>
					</tr>
				</c:if>
				<c:set var="index2" value="0" />
				<c:forEach items="${lCusOutJrn }" var="out">
					<c:set var="index2" value="${index2 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index2 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${out.acDte }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2" style="width: 130px;">${out.userInfo.uNme }</td>
						<td class="zzTd2" style="width: 130px;">${out.operNme }</td>
						<td class="zzTd2" style="width: 230px;">${out.operInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div title="配送" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户配送记录</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">处理人</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusDistJrn }">
					<tr>
						<td class="zzTd1" colspan="5">该客户暂无配送记录。</td>
					</tr>
				</c:if>
				<c:set var="index3" value="0" />
				<c:forEach items="${lCusDistJrn }" var="dist">
					<c:set var="index3" value="${index3 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index3 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${dist.acDte }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2" style="width: 130px;">${dist.userInfo.uNme
							}</td>
						<td class="zzTd2" style="width: 130px;">${dist.operNme }</td>
						<td class="zzTd2" style="width: 230px;">${dist.operInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div title="维修" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户维修记录</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 130px;">地点</td>
					<td class="zzTd1" style="width: 130px;">金额</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusRePair }">
					<tr>
						<td class="zzTd1" colspan="7">该客户暂无维修记录。</td>
					</tr>
				</c:if>
				<c:set var="index4" value="0" />
				<c:forEach items="${lCusRePair }" var="repaire">
					<c:set var="index4" value="${index4 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index4 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${repaire.acDte }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2" style="width: 130px;">${repaire.dealNme }</td>
						<td class="zzTd2" style="width: 130px;">${repaire.addr }</td>
						<td class="zzTd2" style="width: 130px;">${repaire.amt }</td>
						<td class="zzTd2" style="width: 230px;">${repaire.dealInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div title="保养" data-options="iconCls:'icon-reload'"
			style="overflow:auto;padding:10px 10px 10px 20px;">
			<h4 style="color:#0099FF;">客户保养记录</h4>
			<table class="zzTable" style="width: 800px;text-align: center;">
				<tr>
					<td class="zzTd1" style="width: 50px;">序号</td>
					<td class="zzTd1" style="width: 130px;">日期</td>
					<td class="zzTd1" style="width: 130px;">操作</td>
					<td class="zzTd1" style="width: 130px;">地点</td>
					<td class="zzTd1" style="width: 130px;">金额</td>
					<td class="zzTd1" style="width: 230px;">备注</td>
				</tr>
				<c:if test="${empty lCusKeep }">
					<tr>
						<td class="zzTd1" colspan="7">该客户暂无保养记录。</td>
					</tr>
				</c:if>
				<c:set var="index5" value="0" />
				<c:forEach items="${lCusKeep }" var="keep">
					<c:set var="index4" value="${index5 + 1 }" />
					<tr>
						<td class="zzTd2" style="width: 50px;">${index5 }</td>
						<td class="zzTd2" style="width: 130px;"><f:formatDate
								value="${keep.acDte }" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td class="zzTd2" style="width: 130px;">${keep.dealNme }</td>
						<td class="zzTd2" style="width: 130px;">${keep.addr }</td>
						<td class="zzTd2" style="width: 130px;">${keep.amt }</td>
						<td class="zzTd2" style="width: 230px;">${keep.dealInfo }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
