<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>保单填写页面</title>
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
	<form id="view_busiJrn_busiSignBillSubPage_form" action="" style="font-weight: bold;color: #0E2D5F;font-size: 12px;">
		<table style="padding: 10px 10px 10px 10px">
			<tr>
				<td>客户ID：</td>
				<td><input class="easyui-textbox" name="cusId">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>保险起保日期：</td>
				<td><input class="easyui-datebox" name="stDate"></td>
				<td>保险到期日期：</td>
				<td></td>
			</tr>
			<tr>
				<td>保险公司：</td>
				<td><input class="easyui-textbox" name="insurCom">
				</td>
				<td>渠道方式：</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="checkInsInfo();">&nbsp;选择险种&nbsp;</a>&nbsp;&nbsp;
					<a href="javascript:void(0);" class="easyui-linkbutton"
					onclick="submitForm();">&nbsp;签&nbsp;单&nbsp;</a>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
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
												url : '${pageContext.request.contextPath }/busiJrn/signBillWithIns.do',
												dataType : 'text',
												data : $(
														'#view_busiJrn_busiSignBillSubPage_form')
														.serialize(),
												success : function(xmlq) {
													alert(xmlq);
												},
												error : function(xmlq, errq) {
													alert(errq);
												}
											});
								}
							});
		};
	</script>
</body>
</html>
