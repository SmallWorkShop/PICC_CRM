<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>添加客户信息的子页面</title>
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
	<form id="view_custInfo_custIndoMain_addCust_form" action="">
		<table style="padding: 10px 10px 10px 10px">
			<tr>
				<td>车牌号：</td>
				<td><input class="easyui-textbox" name="plateNo"
					required="required">
				</td>
				<td>品牌：</td>
				<td><input class="easyui-textbox" name="brand">
				</td>
			</tr>
			<tr>
				<td>车架号码：</td>
				<td><input class="easyui-textbox" name="frameNo"
					required="required">
				</td>
				<td>品牌型号：</td>
				<td><input class="easyui-textbox" name="brandTyp">
				</td>
			</tr>
			<tr>
				<td>发动机号码：</td>
				<td><input class="easyui-textbox" name="engineNo"
					required="required">
				</td>
				<td>初登日期：</td>
				<td><input id="logDateId" class="easyui-textbox" name="logDate">
				</td>
			</tr>
			<tr>
				<td>客户姓名：</td>
				<td><input class="easyui-textbox" name="cusNme"
					required="required">
				</td>
				<td>身份证号码：</td>
				<td><input class="easyui-textbox" name="cusIdNo"
					required="required">
				</td>
			</tr>
			<tr>
				<td>电话1：</td>
				<td><input class="easyui-textbox" name="cusPhon"
					required="required">
				</td>
				<td>电话2：</td>
				<td><input class="easyui-textbox" name="cusTel">
				</td>
			</tr>
			<tr>
				<td>客户地址：</td>
				<td hidden="true" style="display: none"><input id="addr0"
					class="easyui-textbox" data-options="multiline:true" name="cusAddr"
					value="" style="height: 60px;"></input>
				</td>
				<td colspan="3">省：<input id="comboProvinceId0"
					name="comboProvinceName0" size="9">市：<input
					id="comboCityId0" name="comboCityName0" size="9">区：<input
					id="comboAreaId0" name="comboAreaName0" size="9"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">详细：<input id="comboAddrId" name="comboAddrName"
					data-options="multiline:true,onChange(n,o){setFormValue(0);},"
					class="easyui-textbox" style="width: 290px;height: 50px;">
				</td>
			</tr>
			<tr hidden="true" style="display: none">
				<td>客户状态：</td>
				<td><input id="cusStsTextBoxId" class="easyui-textbox"
					name="cusSts" value="NO">
				</td>
				<td>业务员ID：</td>
				<td><input id="busierTextBoxId" class="easyui-textbox"
					name="busierId" value="${userSession.uId }">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="submitForm();">&nbsp;新&nbsp;增&nbsp;</a>
				</td>
				<td colspan="2" align="left"><a href="javascript:void(0);"
					class="easyui-linkbutton" onclick="clearForm();">&nbsp;重&nbsp;置&nbsp;</a>
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		//提交客户信息新增表单
		var submitForm = function submitForm() {
			if ($('#view_custInfo_custIndoMain_addCust_form').form('validate')) {
				var url = '${pageContext.request.contextPath}/custInfo/addCustInfo.do';
				setFormValue(0);
				$.ajax({
					type : 'post',
					url : url,
					dataType : 'text',
					data : $('#view_custInfo_custIndoMain_addCust_form')
							.serialize(),
					success : function(xmlq) {
						alert(xmlq);
						parent.$('#view_custInfo_custInfoMain_addCust_dialog')
								.dialog('close');
						parent.$('#view_custInfo_custInfoMain_table_DataGrid')
								.datagrid('reload');
					},
					error : function(xmlq, errq) {
						alert(xmlq);
					}
				});
			}
		};
		//重置
		var clearForm = function clearForm() {
			$('#view_custInfo_custIndoMain_addCust_form').form('clear');
			$('#cusStsTextBoxId').textbox(value, '00');
			$('#busierTextBoxId').textbox(value, '${userSession.uId }');
		};
		//设置省下拉框
		var setProvice = function setProvice(i, url) {
			$('#comboProvinceId' + i)
					.combobox(
							{
								url : url,
								valueField : 'dictCode',
								textField : 'dictNme',
								onSelect : function(rec) {
									var urlCity = '${pageContext.request.contextPath }/dict/findAddrScope.do';
									urlCity += "?dictKnd=0000";
									urlCity += "&distPCode=" + rec.dictCode;
									setCity(i, urlCity);
									setFormValue(i);
									//$('#comboCityId0').combobox('reload', urlCity);    
								}
							});
		};
		//日期格式渲染
		$('#logDateId').datetimebox();
		//设置市下拉框
		var setCity = function setCity(i, url) {
			$('#comboCityId' + i)
					.combobox(
							{
								url : url,
								valueField : 'dictCode',
								textField : 'dictNme',
								onSelect : function(rec) {
									var urlArea = '${pageContext.request.contextPath }/dict/findAddrScope.do';
									urlArea += "?dictKnd=0000";
									urlArea += "&distPCode=" + rec.dictCode;
									setArea(i, urlArea);
									setFormValue(i);
									//$('#comboAreaId0').combobox('reload', urlArea);    
								}
							});
		};
		//设置区下拉框
		var setArea = function setArea(i, url) {
			$('#comboAreaId' + i).combobox({
				url : url,
				valueField : 'dictCode',
				textField : 'dictNme',
				onSelect : function(rec) {
					setFormValue(i);
				}
			});
		};
		var urlInit = '${pageContext.request.contextPath }/dict/findAddrScope.do';
		urlInit += "?dictKnd=0000";
		urlInit += "&dictCode=260000";
		urlInit += "&distPCode=0";
		setProvice(0, urlInit);
		//setProvice(1,urlInit);
		setCity(0, '');
		//setCity(1, '');
		setArea(0, '');
		//setArea(1, '');
		//设置后台表单字段值
		var setFormValue = function setFormValue(i) {
			var str = $('#comboProvinceId' + i).combobox('getText') + ","
					+ $('#comboCityId' + i).combobox('getText') + ","
					+ $('#comboAreaId' + i).combobox('getText');
			if (i == 0) {
				str += "," + $('#comboAddrId').val();
				$("input[name='cusAddr']").val(str);
			} else {
				$("input[name='uScop']").val(str);
			}
		};
	</script>
</body>
</html>
