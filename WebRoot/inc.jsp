<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();%>
<%String contextPath = request.getContextPath();%>
<%String version = "20131115";%><%-- 引入jQuery --%>
<script src="<%=contextPath%>/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=contextPath%>/js/json2.js" type="text/javascript" charset="utf-8"></script><%-- 引入EasyUI --%>
<link id="easyuiTheme" rel="stylesheet" href="<%=contextPath%>/js/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="<%=contextPath%>/js/themes/icon.css" type="text/css"> 
<script type="text/javascript" src="<%=contextPath%>/js/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=contextPath%>/js/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
<link rel="stylesheet" href="<%=contextPath%>/css/myTable.css" type="text/css">