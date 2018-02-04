package com.zzfly.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.InsurInfo;
import com.zzfly.service.InsurInfoService;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/insurInfo")
public class InsurInfoController {
	private InsurInfoService insurInfoService;
	/**
	 * 增加一条客户保单信息
	 * */
	@RequestMapping("/addinsurInfo")
	public String addCustInfo(InsurInfo insurInfo, HttpServletRequest request,
			HttpServletResponse response) {
		String msg = "请确保客户保单信息填写无误！";
		int i = -1;
		if (insurInfo != null) {
			insurInfo.setCreDate(new Date());
			insurInfo.setUpdDate(new Date());
			i = insurInfoService.insert(insurInfo);
			if (i == -2) {
				msg = "客户保单信息已存在，可作客户信息修改操作！";
			} else if (i > 0) {
				msg = "客户保单信息添加成功！";
			}
		}
		WriteToJson.writeText(msg, response);
		return null;
	}
	/**
	 *删除一条客户保单信息
	 * */
	@RequestMapping("/deleteInsurInfo")
	public String deleteInsurInfo(int insurId, HttpServletRequest request,
			HttpServletResponse response) {
		String str = "删除失败！";
		if (insurInfoService.delById(insurId) != 0) {
			str = "删除成功";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	/**
	 *分页查询保单信息
	 *如果传参数则根据传的参数查询 
	 *例如：CUS_ID	客户ID	INT
	 *	DIST_DATE	配送日期	VARCHAR(20)
	 *  ADDR	配送地址	VARCHAR(255)
	 * */
	@RequestMapping("/findByInsurInfo")
	public String findByInsurInfo(InsurInfo insurInfo, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<InsurInfo> pm = new PageModel<InsurInfo>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		insurInfo.setPageModel(pm);
		maps = insurInfoService.loadInsurInfoByPage(insurInfo);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}
	/**
	 *更新保单信息
	 * */
	@RequestMapping("/updateInsurInfo")
	public String updateInsurInfo(InsurInfo insurInfo, HttpServletRequest request,
			HttpServletResponse response) {
		insurInfo.setUpdDate(new Date());
		String str = "修改失败！";
		if (insurInfoService.updateByPrimaryKey(insurInfo) != 0) {
			str = "修改成功！";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	
	public InsurInfoService getInsurInfoService() {
		return insurInfoService;
	}

	@Autowired
	public void setInsurInfoService(InsurInfoService insurInfoService) {
		this.insurInfoService = insurInfoService;
	}

}
