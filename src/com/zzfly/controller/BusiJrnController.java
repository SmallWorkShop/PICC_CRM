package com.zzfly.controller;

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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.zzfly.model.BusiJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.model.InsInfo;
import com.zzfly.model.InsurInfo;
import com.zzfly.model.ServInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.BusiJrnService;
import com.zzfly.service.CustInfoService;
import com.zzfly.service.ServInfoServiceI;
import com.zzfly.utils.WriteToJson;

/**
 * 业务日志Controller
 * 
 * @author zhengz.fy
 * 
 */
@Controller
@RequestMapping("/busiJrn")
public class BusiJrnController {
	private CustInfoService custInfoService;

	private BusiJrnService busiJrnService;

	private ServInfoServiceI servInfoDao;

	/**
	 * 通过客户信息主键cusId查询客户基本信息-用于签单的保单信息填写
	 * 
	 * @param cusId
	 * @return
	 */
	@RequestMapping("/findCustInfoByPrimaryKey")
	public String findCustInfoByPrimaryKey(String cusId,
			HttpServletRequest request, HttpServletResponse response) {
		CustInfo custInfo = new CustInfo();
		if (cusId != null && !"".equals(cusId)) {
			custInfo = custInfoService.selectByPrimaryKey(Integer
					.parseInt(cusId));
		}
		request.setAttribute("custInfo", custInfo);
		return "view/busiJrn/busiSignBillSubPage";
	}

	/**
	 * 客户签单（）填写保单信息及险种信息
	 * 
	 * @param custInfo
	 * @param inserInfo
	 * @param insStrName
	 * @param request
	 * @param response
	 */
	@RequestMapping("/signBillWithIns")
	public void signBillWithIns(InsurInfo insurInfo, String insStrName,
			HttpServletRequest request, HttpServletResponse response) {
		StringBuilder insIdStr = new StringBuilder();
		Gson gson = new Gson();
		List<InsInfo> list = new ArrayList<InsInfo>();
		String msg = "系统异常！请重新填写并提交保单信息！";
		if (insStrName != null && !"".equals(insStrName)) {
			insIdStr.append("[");
			insIdStr.append(insStrName.substring(1, insStrName.length()));
			insIdStr.append("]");
		}
		if (insIdStr != null) {
			list = gson.fromJson(insIdStr.toString(),
					new TypeToken<List<InsInfo>>() {
					}.getType());
		}
		if (insurInfo != null && list != null && list.size() != 0) {
			int i = busiJrnService.insertCustSignBill(insurInfo, list);
			if (i > 0) {
				msg = "签单成功，已通知出单员准备出单！";
			}
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 根据客户ID查询该客户的基本信息以及保单信息用于出单时进行配送日期的修改操作
	 * 
	 * @param cusId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findCustInforOutBill")
	public String findCustInforOutBill(String cusId,
			HttpServletRequest request, HttpServletResponse response) {
		CustInfo custInfo = new CustInfo();
		if (cusId != null && !"".equals(cusId)) {
			custInfo = custInfoService.selectByPrimaryKey(Integer
					.parseInt(cusId));
		}
		CustInfo ci = busiJrnService.findCustInfoForOutBill(custInfo);
		request.setAttribute("custInfoBill", ci);
		return "view/busiJrn/preOutBillSubPage";
	}

	/**
	 * 退回客户单（客户状态由待出单变待签单状态）
	 * 
	 * @param busiJrn
	 * @param request
	 * @param response
	 */
	@RequestMapping("/quitBill")
	public void quitBill(BusiJrn busiJrn, HttpServletRequest request,
			HttpServletResponse response) {
		String msg = "系统异常，退单操作失败！";
		int i = -1;
		if (busiJrn != null) {
			i = busiJrnService.insertCustQuitBill(busiJrn);
		}
		if (i > 0) {
			msg = "客户信息退回成功，已转待签单状态可重新签单！";
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 出单员出单修改配送日期及支付方式并生成配送单跳转打印页面
	 * 
	 * @param inserInfo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/distBillAndPrintBill")
	public String distBillAndPrintBill(InsurInfo insurInfo,
			HttpServletRequest request, HttpServletResponse response) {
		BusiJrn bj = new BusiJrn();
		CustInfo ci = new CustInfo();
		ci.setCusId(insurInfo.getCusId());
		UserInfo u = (UserInfo) request.getSession()
				.getAttribute("userSession");
		bj.setBusierId(u.getuId());
		String msg = "系统异常，暂时无法生成配送单！";
		String reStr = null;
		int i = 0;
		if (insurInfo != null) {
			bj.setCusId(insurInfo.getCusId());
			i = busiJrnService.insertCustDistBill(insurInfo, bj, u.getuId());
		}
		if (i > 0) {
			msg = "客户配送单已生成，已转配送员处理！";
			reStr = "view/busiJrn/distBillPagePrint";
		}
		ci = busiJrnService.findCustInfoForOutBill(ci);
		request.setAttribute("custInfoAll", ci);
		return reStr;
	}

	/**
	 * 查看客户的配送单
	 * 
	 * @param cusId
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/findDistBillByCusId")
	public String findDistBillByCusId(Integer cusId,
			HttpServletResponse response, HttpServletRequest request) {
		CustInfo ci = new CustInfo();
		if (cusId != null) {
			ci.setCusId(cusId);
		}
		ci = busiJrnService.findCustInfoForOutBill(ci);
		request.setAttribute("custInfoAll", ci);
		return "view/busiJrn/distBillPagePrint";
	}

	/**
	 * 配送单配送是否成功确认
	 * 
	 * @param cusId
	 * @param request
	 * @param response
	 */
	@RequestMapping("/distBillConfirm")
	public void distBillConfirm(Integer cusId, String flag, String errMsg,
			HttpServletRequest request, HttpServletResponse response) {
		BusiJrn bj = new BusiJrn();
		CustInfo ci = new CustInfo();
		UserInfo ui = new UserInfo();
		int i = -1;
		String msg = "系统异常，请重新选择操作！";
		ui = (UserInfo) request.getSession().getAttribute("userSession");
		if (cusId != null) {
			ci.setCusId(cusId);
			ci.setDistId(ui.getuId());
		}
		if ("err".equals(flag)) {
			bj.setOperInfo(errMsg);
		}
		bj.setBusierId(ui.getuId());
		i = busiJrnService.insertCustDistBill(ci, bj, flag);
		if (i > 0) {
			msg = "操作成功！";
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 根据客户ID查询客户的流程操作日志
	 * 
	 * @param ci
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/busiCustFlowFind")
	public String busiCustFlowFind(BusiJrn obj, HttpServletRequest request,
			HttpServletResponse response) {
		List<BusiJrn> lCusAllJrn = new ArrayList<BusiJrn>();// 客户所有流程日志
		List<BusiJrn> lCusSignJrn = new ArrayList<BusiJrn>();// 客户签单日志
		List<BusiJrn> lCusOutJrn = new ArrayList<BusiJrn>();// 客户出单日志
		List<BusiJrn> lCusDistJrn = new ArrayList<BusiJrn>();// 客户配送日志
		List<ServInfo> lCusRePair = new ArrayList<ServInfo>();// 客户维修日志
		List<ServInfo> lCusKeep = new ArrayList<ServInfo>();// 客户保养日志
		BusiJrn bj = new BusiJrn();
		ServInfo si = new ServInfo();
		bj.setCusId(obj.getCusId());
		si.setCusId(obj.getCusId());
		lCusAllJrn = busiJrnService.selectCustBusiByBj(bj);
		bj.setOperNo("1000");
		lCusSignJrn = busiJrnService.selectCustBusiByBj(bj);
		bj.setOperNo("200");
		lCusOutJrn = busiJrnService.selectCustBusiByBj(bj);
		bj.setOperNo("300");
		lCusDistJrn = busiJrnService.selectCustBusiByBj(bj);
		si.setDealCod("5000");
		lCusRePair = servInfoDao.selectServInfoByObj(si);
		si.setDealCod("5001");
		lCusKeep = servInfoDao.selectServInfoByObj(si);
		request.setAttribute("lCusAllJrn", lCusAllJrn);
		request.setAttribute("lCusSignJrn", lCusSignJrn);
		request.setAttribute("lCusOutJrn", lCusOutJrn);
		request.setAttribute("lCusDistJrn", lCusDistJrn);
		request.setAttribute("lCusRePair", lCusRePair);
		request.setAttribute("lCusKeep", lCusKeep);
		return "view/busiJrn/hisBusiFindSubPage";
	}

	public CustInfoService getCustInfoService() {
		return custInfoService;
	}

	@Autowired
	public void setCustInfoService(CustInfoService custInfoService) {
		this.custInfoService = custInfoService;
	}

	public BusiJrnService getBusiJrnService() {
		return busiJrnService;
	}

	@Autowired
	public void setBusiJrnService(BusiJrnService busiJrnService) {
		this.busiJrnService = busiJrnService;
	}

	public ServInfoServiceI getServInfoDao() {
		return servInfoDao;
	}

	@Autowired
	public void setServInfoDao(ServInfoServiceI servInfoDao) {
		this.servInfoDao = servInfoDao;
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
