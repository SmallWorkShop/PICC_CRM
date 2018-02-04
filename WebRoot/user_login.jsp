<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>中国人名财产保险公司CRM-用户登录</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="renderer" content="webkit" />

</head>

<body background="images/main_bg.jpg">
	<div style="width: 100%;height: 100%;">
		<div id="userLoginDialogDiv"
			style="width: 400px;height: 100px; padding: 60px 10px 10px 10px;display: none;">
			<form id="view_user_page_user_login_form"
				action="${pageContext.request.contextPath }/user/userLogin.do"
				method="post">
				<table cellpadding="5" style="margin: auto">
					<tr>
						<td>账号：</td>
						<td><input type="text" class="easyui-textbox" name="uCode"
							value="" data-options="required:true" />
						</td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" class="easyui-textbox" name="uPwd"
							value="" data-options="required:true" />
						</td>
					</tr>
					<tr style="display: none">
						<td>用户状态：</td>
						<td><input type="text" class="easyui-textbox" name="uSts"
							value="00" />
						</td>
					</tr>
					<tr style="display: none">
						<td>用户备用状态：</td>
						<td><input type="text" class="easyui-textbox" name="uSSts"
							value="00" />
						</td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					onclick="submitForm()">登录</a> <a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="clearForm()">重置</a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function submitForm() {
			if ($('#view_user_page_user_login_form').form('validate')) {
				$
						.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath }/user/userLogin.do',
							dataType : 'text',
							data : $('#view_user_page_user_login_form')
									.serialize(),
							success : function(xmlq) {
								//alert(xmlq);
								if ("success" == xmlq) {
									window.location.href = "${pageContext.request.contextPath }/view/main_page/main.jsp";
								} else {
									alert(xmlq);
								}
							},
							error : function(xmlq, errq) {
								alert(xmlq);
							}
						});
			}
		}
		function clearForm() {
			$("#view_user_page_user_login_form").form("clear");
		}
		$('#userLoginDialogDiv').show().dialog({
			title : "用户登录",
			resizable : false,
			modal : true,
			draggable : false,
		});
		//$('#userLoginDialogDiv').dialog('open');
		//width: 400px;height: 250px; padding: 60px 10px 10px 10px;
	</script>
</body>
</html>
