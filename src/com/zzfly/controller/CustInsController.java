package com.zzfly.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.CustIns;
import com.zzfly.service.CustInsService;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/custIns")
public class CustInsController {
	private CustInsService custInsService;
	/**
	 * 增加一条客户险种信息
	 * */
	@RequestMapping("/addCustIns")
	public String addCustInfo(CustIns custIns, HttpServletRequest request,
			HttpServletResponse response) {
		String msg = "请确保客户险种信息填写无误！";
		int i = -1;
		if (custIns != null) {
			custIns.setCreDate(new Date());
			custIns.setUpdDate(new Date());
			i = custInsService.insert(custIns);
			if (i == -2) {
				msg = "客户险种信息已存在，可作险种修改操作！";
			} else if (i > 0) {
				msg = "客户险种信息添加成功！";
			}
		}
		WriteToJson.writeText(msg, response);
		return null;
	}
	/**
	 *删除一条客户险种信息
	 * */
	@RequestMapping("/deleteCustIns")
	public String desletecustIns(int custInsId, HttpServletRequest request,
			HttpServletResponse response) {
		String str = "删除失败！";
		if (custInsService.delById(custInsId) != 0) {
			str = "删除成功";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	/**
	 *分页查询客户险种信息基础表
	 * 如果传参数则根据传的参数查询 
	 *例如： INS_ID	险种ID	INT
	 *	CUS_ID	客户ID	INT
	 *	INS_AMT	保费	DECIMAL(15,2)
	 *	INS_S_AMT	不计免赔	DECIMAL(15,2)
	 *	INS_LIM	保额	VARCHAR(20)
	 * */
	@RequestMapping("/findByCustIns")
	public String findBycustIns(CustIns custIns, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<CustIns> pm = new PageModel<CustIns>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		custIns.setPageModel(pm);
		maps = custInsService.loadCustInsByPage(custIns);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}
	/**
	 *更新客户险种信息
	 * */
	@RequestMapping("/updatecustIns")
	public String updatecustIns(CustIns custIns, HttpServletRequest request,
			HttpServletResponse response) {
		custIns.setUpdDate(new Date());
		String str = "修改失败！";
		if (custInsService.updateByPrimaryKey(custIns) != 0) {
			str = "修改成功！";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	public CustInsService getCustInsService() {
		return custInsService;
	}
	@Autowired
	public void setCustInsService(CustInsService custInsService) {
		this.custInsService = custInsService;
	}
	


}
