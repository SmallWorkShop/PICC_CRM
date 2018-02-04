<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
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
	${i }
	${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}
	<br>
	<form action="${pageContext.request.contextPath }/user/userLogin.do"
		method="post">
		<input type="file" name="fileName" /> <br> 用户代码：<input
			type="text" name="uCode" value="" /><br> 用户密码：<input
			type="password" name="uPwd" value="" /><br> <input
			type="submit" value="登录" />
	</form>
	<!-- <form action="${pageContext.request.contextPath }/user/insert.do"
		method="post">
		用户代码：<input type="text" name="uCode" value="" /><br> 用户密码：<input
			type="password" name="uPwd" value="" /><br> <input
			type="submit" value="插入用户" />
	</form>
 -->
	<form action="${pageContext.request.contextPath }/user/exportTest.do">
		<input type="submit" value="导出" /><br> 客户状态：<select
			id="cusStsSelectId" class="easyui-combobox" size="10" name="cusSts">
			<option value="00">00-待签单</option>
			<option value="01">01-待出单</option>
			<option value="02">02-待配送</option>
			<option value="09">09-已完成</option>
		</select>


	</form>
	<script type="text/javascript">
		alert($('#cusStsSelectId').combobox('setValue',00));
	</script>
</body>
</html>
