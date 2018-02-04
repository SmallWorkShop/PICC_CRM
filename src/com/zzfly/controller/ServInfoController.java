package com.zzfly.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.ServInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.ServInfoServiceI;
import com.zzfly.utils.DateUtil;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/servInfo")
public class ServInfoController {
	private ServInfoServiceI servInfoService;

	/**
	 * 查询维修保养记录，
	 * 
	 * @param si
	 * @param flag
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectServInfoByObj")
	public String selectServInfoByObj(ServInfo si, String flag,
			HttpServletResponse response, HttpServletRequest request) {
		List<ServInfo> lServInfo = new ArrayList<ServInfo>();
		lServInfo = servInfoService.selectServInfoByObj(si);
		request.setAttribute("lServInfo", lServInfo);
		request.setAttribute("cusId", si.getCusId());
		return "view/servInfo/servInfoEditPage";
	}

	/**
	 * 查询新的维修或保养记录
	 * 
	 * @param si
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/insertServInfo")
	public String insertServInfo(ServInfo si, String servInfo_acDte,
			String flag, HttpServletRequest request,
			HttpServletResponse response) {
		BusiJrn bj = new BusiJrn();
		UserInfo ui = new UserInfo();
		String msg = "系统异常，请稍后再试！";
		int i = -1;
		ui = (UserInfo) request.getSession().getAttribute("userSession");
		bj.setBusierId(ui.getuId());
		si.setAcDte(new Timestamp(DateUtil.paseTringToDate(servInfo_acDte)
				.getTime()));
		si.setCreDate(new Date());
		si.setUpdDate(new Date());
		i = servInfoService.insert(si, bj);
		if (i > 0) {
			msg = "维修/保养记录保存成功！";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	public ServInfoServiceI getServInfoService() {
		return servInfoService;
	}

	@Autowired
	public void setServInfoService(ServInfoServiceI servInfoService) {
		this.servInfoService = servInfoService;
	}

}
