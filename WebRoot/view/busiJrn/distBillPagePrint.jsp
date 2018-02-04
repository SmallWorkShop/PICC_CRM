<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>

<title>配送单</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<div id="view_busiJrn_distBillPagePrint_div">
		<form>
			<table cellspacing="0%"
				style="border: 1px solid black;width: 750px;height: 250px;text-align: center;">
				<tr>
					<td colspan="6"
						style="font-size: 20px;font-weight: 700;border: 1px solid black">配&nbsp;&nbsp;送&nbsp;&nbsp;单
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid black">配送日期</td>
					<td style="border: 1px solid black">${custInfoAll.insurInfo.distDate}</td>
					<td style="border: 1px solid black">缴费方式</td>
					<td style="border: 1px solid black"><c:if
							test="${custInfoAll.insurInfo.preCol1 eq '00'}">现金</c:if> <c:if
							test="${custInfoAll.insurInfo.preCol1 eq '01'}">刷卡</c:if>
					</td>
					<td style="border: 1px solid black">金额</td>
					<td style="border: 1px solid black"><c:set var="amt" value="0" />
						<c:forEach var="ins" items="${custInfoAll.lCustIns }">
							<c:set var="amt" value="${amt + ins.insAmt + ins.insSAmt }"></c:set>
						</c:forEach> ${amt }</td>
				</tr>
				<tr>
					<td style="border: 1px solid black">车牌</td>
					<td style="border: 1px solid black">${custInfoAll.plateNo }</td>
					<td style="border: 1px solid black">姓名</td>
					<td style="border: 1px solid black">${custInfoAll.cusNme }</td>
					<td style="border: 1px solid black">电话</td>
					<td style="border: 1px solid black">${custInfoAll.cusPhon }</td>
				</tr>
				<tr>
					<td style="border: 1px solid black">地址</td>
					<td colspan="5" style="border: 1px solid black">${custInfoAll.insurInfo.addr}</td>
				</tr>
				<tr>
					<td style="border: 1px solid black">业务员</td>
					<td colspan="2" style="border: 1px solid black">${custInfoAll.userInfo.uNme
						}</td>
					<td style="border: 1px solid black">业务员电话</td>
					<td colspan="2" style="border: 1px solid black">${custInfoAll.userInfo.uPho
						}</td>
				</tr>
				<tr>
					<td style="border: 1px solid black">礼品</td>
					<td colspan="5" style="border: 1px solid black">${custInfoAll.insurInfo.gift}</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="text-align: right;padding:5px 50px 5px 10px">
		<a href="javascript:void(0);" class="easyui-linkbutton"
			onclick="preview();">&nbsp;打&nbsp;印&nbsp;</a>&nbsp;&nbsp;
		<!-- <a
			href="javascript:void(0);" class="easyui-linkbutton"
			onclick="closed();">&nbsp;返&nbsp;回&nbsp;</a> -->
	</div>
	<script type="text/javascript">
		var preview = function preview() {
			var head = "<html><head><title>中国人民财产保险公司CRM-配送单</title></head><body>";
			var foot = "</body><html>";
			var bdhtml = $('#view_busiJrn_distBillPagePrint_div').html();
			var oldhtml = document.body.innerHTML;
			//document.body.innerHTML = head + bdhtml + foot;
			//window.print();
			//document.body.innerHTML = oldhtml;
			//parent.$('#view_busiJrn_preOutBillSubPage_distBill_dialog').dialog('close');
			OpenWindow = window.open("");
			OpenWindow.document.write(head);
			OpenWindow.document.write(bdhtml);
			OpenWindow.document
					.write("</body><script type='text/javascript'>window.print();window.close();<\/script></html>");
			parent.$('#view_busiJrn_preOutBillSubPage_distBill_dialog').dialog(
					'close');
			parent.parent.$('#view_custInfo_updCustInfo_updForm_div').dialog(
					'close');
			parent.parent.$('#view_custInfo_updCustInfo_tab0_datagrid')
					.datagrid('reload');
			parent.parent.$('#view_custInfo_updCustInfo_tab1_datagrid')
					.datagrid('reload');
		};
		var closed = function closed() {
			window.location.reload();
		};
	</script>
</body>
</html>
