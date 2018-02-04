<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>修改个人密码</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<form id="view_user_page_updPersonalInfo_updUserPwd_form" action=""
		method="post">
		<table cellpadding="5">
			<tr>
				<td class="zzTd3">原始密码:</td>
				<td><input class="easyui-textbox" type="password"
					name="uPwdHis" required="required" value=""></input></td>
			</tr>
			<tr>
				<td class="zzTd3">新密码:</td>
				<td><input class="easyui-textbox" type="password" name="uPwd"
					id="newUpwd" required="required" value=""></input></td>
			</tr>
			<tr>
				<td class="zzTd3">复核密码:</td>
				<td><input class="easyui-textbox" type="password" name="uPwdRe"
					data-options="required:true,validType:'equals[\'#newUpwd\']'"></input>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><a href="javascript:void(0)"
					class="easyui-linkbutton" onclick="updPwdForm()">修改</a>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		//密码校验
		$.extend($.fn.validatebox.defaults.rules, {
			equals : {
				validator : function(value, param) {
					return value == $(param[0]).val();
				},
				message : '两次输入的密码不一致！'
			}
		});
		function updPwdForm() {
			if ($('#view_user_page_updPersonalInfo_updUserPwd_form').form(
					'validate')) {
				$.messager
						.confirm(
								'确认',
								'您确定要修改您的密码吗？',
								function(r) {
									if (r) {
										$
												.ajax({
													type : 'post',
													url : '${pageContext.request.contextPath }/user/updPersonalInfo.do',
													dataType : 'text',
													data : $(
															'#view_user_page_updPersonalInfo_updUserPwd_form')
															.serialize(),
													success : function(xmlq) {
														alert(xmlq);
														$(
																'#view_user_page_updPersonalInfo_updUserPwd_form')
																.form('clear');
														parent
																.$(
																		'#view_user_page_findPersonalnfo_updPwd_dialog')
																.dialog('close');
													},
													error : function(xmlq, errq) {
														alert(xmlq);
														$(
																'#view_user_page_updPersonalInfo_updUserPwd_form')
																.form('clear');
														parent
																.$(
																		'#view_user_page_updPersonalInfo_updUserPwd_dialog')
																.dialog('close');

													}
												});
									}
								});
			}
		}
	</script>
</body>
</html>
