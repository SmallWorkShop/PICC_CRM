<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML >
<html>
<head>

<title>险种基本信息表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>
<style>
fieldset {
	border: 1px solid #95B8E7;
	background-color: #fff;
	width: 750px;
}

legend {
	font-size: 12px;
	color: #aaa;
	font-weight: 700;
}

td {
	font-size: 8px;
	color: #0E2D5F;
	width: 170px;
}
</style>
<body>
	<fieldset>
		<legend>险种信息</legend>
		<table style="font-weight: bold;color: #0E2D5F;font-size: 8px;">
			<tr>
				<td><input type="checkbox" id="ins01Name" /><label
					for="ins01Name">机动车损失保险</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins01Sts" /><label
					for="ins01Sts">不计免赔</label></td>
				<td>车损保额：<input class="easyui-textbox" size="10" /></td>
				<td>车损保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins02Name" /><label
					for="ins02Name">盗抢险</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins02Sts" /><label
					for="ins02Sts">不计免赔</label></td>
				<td>盗抢保额：<input class="easyui-textbox" size="10" /></td>
				<td>盗抢保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins03Name" /><label
					for="ins03Name">第三者责任保险</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins03Sts" /><label
					for="ins03Sts">不计免赔</label></td>
				<td>三者保额：<select class="easyui-combobox" style="width: 85px;">
						<option>未投保</option>
						<option>50000</option>
						<option>100000</option>
						<option>150000</option>
						<option>200000</option>
						<option>300000</option>
						<option>500000</option>
						<option>1000000</option>
						<option>1500000</option>
						<option>2000000</option>
				</select></td>
				<td>三者保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins04Name" /><label
					for="ins04Name">车上人员责任险（司机）</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins04Sts" /><label
					for="ins04Sts">不计免赔</label></td>
				<td>司机保额：<input class="easyui-textbox" size="10" /></td>
				<td>司机保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins05Name" /><label
					for="ins05Name">车上人员责任险（乘客）</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins05Sts" /><label
					for="ins05Sts">不计免赔</label></td>
				<td>单座保额：<input class="easyui-textbox" size="4" />&nbsp;<input
					class="easyui-textbox" size="1" />座</td>
				<td>乘客保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins06Name" /><label
					for="ins06Name">车身划痕损失险条款</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins06Sts" /><label
					for="ins06Sts">不计免赔</label></td>
				<td>划痕保额：<select class="easyui-combobox" style="width: 85px;">
						<option>未投保</option>
						<option>2000</option>
						<option>5000</option>
						<option>10000</option>
						<option>20000</option>
				</select></td>
				<td>划痕保费：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins07Name" /><label
					for="ins07Name">发动机特别损失险条款</label></td>
				<td style="width: 90px;"><input type="checkbox" id="ins07Sts" /><label
					for="ins07Sts">不计免赔</label></td>
				<td></td>
				<td>发动机损：<input class="easyui-textbox" size="10" /></td>
				<td>不计免赔：<input class="easyui-textbox" size="10" /></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins08Name" /><label
					for="ins08Name">自燃损失险条款</label></td>
				<td style="width: 90px;"></td>
				<td>自燃保额：<input class="easyui-textbox" size="10" /></td>
				<td>自燃保费：<input class="easyui-textbox" size="10" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins09Name" /><label
					for="ins09Name">玻璃单独破碎险条款</label></td>
				<td style="width: 90px;"></td>
				<td>玻璃种类：<select class="easyui-combobox" style="width: 85px;">
						<option>国产玻璃</option>
						<option>国产玻璃（特殊）</option>
						<option>进口玻璃</option>
						<option>进口玻璃（特殊）</option>
				</select></td>
				<td>玻破保费：<input class="easyui-textbox" size="10" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins10Name" /><label
					for="ins10Name">指定专修厂特约条款</label></td>
				<td style="width: 90px;"></td>
				<td></td>
				<td>指定修理：<input class="easyui-textbox" size="10" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins11Name" /><label
					for="ins11Name">机动车强制责任保险</label></td>
				<td style="width: 90px;"></td>
				<td></td>
				<td>交强保费：<input class="easyui-textbox" size="10" /></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="ins12Name" /><label
					for="ins12Name">车船税</label></td>
				<td style="width: 90px;"></td>
				<td></td>
				<td>车船税费：<input class="easyui-textbox" size="10" /></td>
				<td></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>
