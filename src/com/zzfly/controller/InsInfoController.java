package com.zzfly.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.InsInfo;
import com.zzfly.service.InsInfoService;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/insInfo")
public class InsInfoController {
	private InsInfoService insInfoService;
	/**
	 * 增加一条险种信息
	 * */
	@RequestMapping("/addinsInfo")
	public String addCustInfo(InsInfo insInfo, HttpServletRequest request,
			HttpServletResponse response) {
		String msg = "请确保险种信息填写无误！";
		int i = -1;
		if (insInfo != null) {
			insInfo.setCreDate(new Date());
			insInfo.setUpdDate(new Date());
			i = insInfoService.insert(insInfo);
			if (i == -2) {
				msg = "险种信息已存在，可作险种修改操作！";
			} else if (i > 0) {
				msg = "险种信息添加成功！";
			}
		}
		WriteToJson.writeText(msg, response);
		return null;
	}
	/**
	 *删除一条险种信息
	 * */
	@RequestMapping("/deleteInsInfo")
	public String desleteInsInfo(int insurId, HttpServletRequest request,
			HttpServletResponse response) {
		String str = "删除失败！";
		if (insInfoService.delById(insurId) != 0) {
			str = "删除成功";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	/**
	 *分页查询险种信息
	 * 如果传参数则根据传的参数查询 
	 *例如：
	 * INS_NME	险种名称	VARCHAR(255)					
	 * INS_KND	险种大类	CHAR(2)					00:车船税  01：交强险  02：商业险
	 * */
	@RequestMapping("/findByInsInfo")
	public String findByInsInfo(InsInfo insInfo, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<InsInfo> pm = new PageModel<InsInfo>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		insInfo.setPageModel(pm);
		maps = insInfoService.loadInsInfoByPage(insInfo);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}
	/**
	 *更新险种信息
	 * */
	@RequestMapping("/updateInsInfo")
	public String updateInsInfo(InsInfo insInfo, HttpServletRequest request,
			HttpServletResponse response) {
		insInfo.setUpdDate(new Date());
		String str = "修改失败！";
		if (insInfoService.updateByPrimaryKey(insInfo) != 0) {
			str = "修改成功！";
		}
		WriteToJson.writeText(str, response);
		return null;
	}
	
	public InsInfoService getInsInfoService() {
		return insInfoService;
	}

	@Autowired
	public void setInsInfoService(InsInfoService insInfoService) {
		this.insInfoService = insInfoService;
	}

}
