package com.zzfly.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.ConnJrn;
import com.zzfly.model.UserInfo;
import com.zzfly.service.ConnJrnServiceI;
import com.zzfly.utils.DateUtil;
import com.zzfly.utils.WriteToJson;

/**
 * 客户联系记录控制层
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/connJrn")
public class ConnJrnController {
	private ConnJrnServiceI connJrnService;

	/**
	 * 查询某客户的联系日志
	 * 
	 * @param cj
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findCustConnJrnByObj")
	public String findCustConnJrnByObj(ConnJrn cj, String flag,
			HttpServletRequest request, HttpServletResponse response) {
		String str = "";
		List<ConnJrn> lConnJrn = new ArrayList<ConnJrn>();
		if (cj != null) {
			lConnJrn = connJrnService.selectConnJrnByObj(cj);
		}
		request.setAttribute("lConnJrn", lConnJrn);
		request.setAttribute("cusId", cj.getCusId());
		if ("addConnJrn".equals(flag)) {
			str = "view/connJrn/connJrnEditPage";
		} else {
			str = "view/connJrn/connJrnFindPage";
		}
		return str;
	}

	/**
	 * 添加客户联系记录包括（客户ID、联系日期、备注、预约联系日期等）
	 * 
	 * @param cj
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addConnJrn")
	public String addConnJrn(ConnJrn cj, String connJrn_acDte,
			String connJrn_nextConn, HttpServletRequest request,
			HttpServletResponse response) {
		BusiJrn busiJrn = new BusiJrn();
		UserInfo ui = new UserInfo();
		String msg = "系统异常，请稍后重试！";
		ui = (UserInfo) request.getSession().getAttribute("userSession");
		int i = -1;
		cj.setAcDte(new Timestamp(DateUtil.paseTringToDate(connJrn_acDte)
				.getTime()));
		cj.setNextConn((new Timestamp(DateUtil
				.paseTringToDate(connJrn_nextConn).getTime())));
		cj.setCreDate(new Date());
		cj.setUpdDate(new Date());
		busiJrn.setBusierId(ui.getuId());
		i = connJrnService.insert(cj,busiJrn);
		if (i > 0) {
			msg = "联系记录添加成功！";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	public ConnJrnServiceI getConnJrnService() {
		return connJrnService;
	}

	@Autowired
	public void setConnJrnService(ConnJrnServiceI connJrnService) {
		this.connJrnService = connJrnService;
	}

	/**
	 * springMVC关于日期格式的处理初始化日期转换
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		// SimpleDateFormat datetimeFormat = new SimpleDateFormat(
		// "yyyy-MM-dd HH:mm:ss");
		// datetimeFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));// true:允许输入空值，false:不能为空值
	}

}
