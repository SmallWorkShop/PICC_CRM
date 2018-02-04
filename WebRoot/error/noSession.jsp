<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>登录超时</title>
<jsp:include page="/inc.jsp"></jsp:include>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
</body>
<script type="text/javascript">
	$.messager.confirm('TIMEOUT!!', '${msg}', function(r) {
		if (r) {
			window.location.href = '${pageContext.request.contextPath }';
		} else {
			window.close();
		}
	});
</script>
</html>
