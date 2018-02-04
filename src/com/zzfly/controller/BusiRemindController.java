package com.zzfly.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.CustInfo;
import com.zzfly.model.PendingTip;
import com.zzfly.model.UserInfo;
import com.zzfly.service.CustInfoService;
import com.zzfly.service.UserServiceI;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.WriteToJson;

/**
 * 待处理任务提示清单
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/busiRemind")
public class BusiRemindController {
	private UserServiceI userService;

	private CustInfoService custInfoService;

	/**
	 * 定时查询数据库判断是否有新的待处理任务
	 * 
	 * @param pt
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findCustForPending")
	public void findCustForPending(PendingTip pt, HttpServletRequest request,
			HttpServletResponse response) {
		UserInfo ui = new UserInfo();
		PendingTip p = new PendingTip();
		ui = (UserInfo) request.getSession().getAttribute("userSession");
		String[] rL = ui.getuRole().split(",");
		String[] a1;
		String[] a2;
		for (String rid : rL) {
			if ("3".equals(rid) || "5".equals(rid) || "6".equals(rid)) {// 待签单及待联系查询判断逻辑
				CustInfo ci = new CustInfo();
				PageModel<CustInfo> pm = new PageModel<CustInfo>();
				List<CustInfo> lCustInfo1 = new ArrayList<CustInfo>();
				List<CustInfo> lCustInfo2 = new ArrayList<CustInfo>();
				pm.setPageSize(-2);
				pm.setOffset(-2);
				ci.setPageModel(pm);
				ci.setBusierId(ui.getuId());
				ci.setCusSts("00");
				a1 = pt.getConnList() != null ? pt.getConnList().split(",")
						: null;// 待联系
				lCustInfo1 = custInfoService.findCustInfoForConn(ci);
				if (lCustInfo1 != null && lCustInfo1.size() != 0) {
					StringBuilder sb = new StringBuilder();
					for (CustInfo c : lCustInfo1) {
						sb.append(",");
						sb.append(c.getCusId());
					}
					a2 = sb.substring(1, sb.length()).split(",");
					p.setPrConn(!compareArr(a1, a2));
					p.setConnList(sb.substring(1, sb.length()));
				}
				a1 = pt.getSignList() != null ? pt.getSignList().split(",")
						: null;// 待签单
				lCustInfo2 = custInfoService.findByCustInfo(ci);
				if (lCustInfo2 != null && lCustInfo2.size() != 0) {
					StringBuilder sb = new StringBuilder();
					for (CustInfo c : lCustInfo2) {
						sb.append(",");
						sb.append(c.getCusId());
					}
					a2 = sb.substring(1, sb.length()).split(",");
					p.setPrSign(!compareArr(a1, a2));
					p.setSignList(sb.substring(1, sb.length()));
				}
			}
			if ("8".equals(rid)) {// 待出单查询判断逻辑
				a1 = pt.getOutList() != null ? pt.getOutList().split(",")
						: null;
				CustInfo ci = new CustInfo();
				List<CustInfo> lCustInfo = new ArrayList<CustInfo>();
				PageModel<CustInfo> pm = new PageModel<CustInfo>();
				pm.setOffset(-2);
				pm.setPageSize(-2);
				ci.setCusSts("01");
				ci.setPageModel(pm);
				lCustInfo = custInfoService.findByCustInfo(ci);
				if (lCustInfo != null && lCustInfo.size() != 0) {
					StringBuilder sb = new StringBuilder();
					for (CustInfo c : lCustInfo) {
						sb.append(",");
						sb.append(c.getCusId());
					}
					a2 = sb.substring(1, sb.length()).split(",");
					p.setPrOut(!compareArr(a1, a2));
					p.setOutList(sb.substring(1, sb.length()));
				}
			}
			if ("7".equals(rid) || "9".equals(rid)) {// 待配送查询判断逻辑
				a1 = pt.getDistList() != null ? pt.getDistList().split(",")
						: null;
				CustInfo ci = new CustInfo();
				List<CustInfo> lCustInfo = new ArrayList<CustInfo>();
				PageModel<CustInfo> pm = new PageModel<CustInfo>();
				pm.setOffset(-2);
				pm.setPageSize(-2);
				ci.setPageModel(pm);
				ci.setCusSts("02");
				lCustInfo = (List<CustInfo>) custInfoService
						.findCustInfoForDist(ci, ui.getuId()).get("rows");
				if (lCustInfo != null && lCustInfo.size() != 0) {
					StringBuilder sb = new StringBuilder();
					for (CustInfo c : lCustInfo) {
						sb.append(",");
						sb.append(c.getCusId());
					}
					a2 = sb.substring(1, sb.length()).split(",");
					p.setPrDist(!compareArr(a1, a2));
					p.setDistList(sb.substring(1, sb.length()));
				}
			}
		}
		WriteToJson.writeJson(p, request, response);
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

	public CustInfoService getCustInfoService() {
		return custInfoService;
	}

	@Autowired
	public void setCustInfoService(CustInfoService custInfoService) {
		this.custInfoService = custInfoService;
	}

	/**
	 * 比较两个数组是否相等
	 * 
	 * @param arr1
	 * @param arr2
	 * @return
	 */
	public Boolean compareArr(String[] arr1, String[] arr2) {
		Arrays.sort(arr1);
		Arrays.sort(arr2);
		if (Arrays.equals(arr1, arr2)) {
			return true;
		} else {
			return false;
		}
	}
}
