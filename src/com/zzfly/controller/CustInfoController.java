package com.zzfly.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.BusiJrnService;
import com.zzfly.service.CustInfoService;
import com.zzfly.utils.ExportUtils;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/custInfo")
public class CustInfoController {
	private CustInfoService custInfoService;

	private BusiJrnService busiJrnService;

	/**
	 * 添加新客户信息
	 * 
	 * @param custInfo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addCustInfo")
	public String addCustInfo(CustInfo custInfo, HttpServletRequest request,
			HttpServletResponse response) {
		UserInfo u = new UserInfo();
		u = (UserInfo) request.getSession().getAttribute("userSession");
		String msg = "请确保客户信息填写无误！";
		int i = -1;
		if (custInfo != null) {
			custInfo.setCreDate(new Date());
			custInfo.setUpdDate(new Date());
			custInfo.setBusierId(u.getuId());// 默认当前用户Id
			custInfo.setCusSts("NO");// 默认待处理状态
			i = custInfoService.insert(custInfo);
			if (i == -2) {
				msg = "客户信息已存在，可作客户信息修改操作！";
			} else if (i > 0) {
				msg = "客户信息添加成功！";
			}
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	/**
	 * 通过一个客户对象分页查询客户基本信息
	 * 
	 * @param custInfo
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findByCustInfo")
	public String findByCustInfo(CustInfo custInfo, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<CustInfo> pm = new PageModel<CustInfo>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		custInfo.setPageModel(pm);
		maps = custInfoService.findByCustInfoMap(custInfo);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}

	/**
	 * 通过客户对象模糊匹配客户基本信息加分页
	 * 
	 * @param custInfo
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findLikeCustInfo")
	public String findLikeCustInfo(CustInfo custInfo, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<CustInfo> pm = new PageModel<CustInfo>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		custInfo.setPageModel(pm);
		maps = custInfoService.findLikeCustInfo(custInfo);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}

	/**
	 * 客户信息导出
	 * 
	 * @param custInfo
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 */
	@RequestMapping("/expCustInfo")
	public void expCustInfo(CustInfo custInfo, String page, String rows,
			Boolean expFlg, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		List<CustInfo> lCustInfo = new ArrayList<CustInfo>();
		PageModel<CustInfo> pm = new PageModel<CustInfo>();
		String msg = "系统错误，请重新操作！";
		pm.setOffset(-2);// 不分页查询所有的数据
		pm.setPageSize(-2);// 不分页查询所有的数据
		custInfo.setPageModel(pm);
		if ((expFlg == null ? true : expFlg)) {
			maps = custInfoService.findByCustInfoMap(custInfo);
		} else {
			maps = custInfoService.findLikeCustInfo(custInfo);
		}
		lCustInfo = (List<CustInfo>) maps.get("rows");
		if (expFunctionTools(lCustInfo, response)) {
			msg = "成功导出文件。";
		}
		// WriteToJson.writeText(msg, response);
	}

	/**
	 * 客户信息导入请求
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/impCustInfo")
	public String impCustInfo(@RequestParam("file") CommonsMultipartFile file,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// System.out.println(file.getOriginalFilename());
		UserInfo ui = (UserInfo) request.getSession().getAttribute(
				"userSession");
		String msg = "";
		List<String> lS = new ArrayList<String>();
		String dir = writeOnDir(file, response);
		List<CustInfo> lCustInfo = ExportUtils.importFromExcel(dir);
		Map<String, Object> m = custInfoService.batchInsertCustInfo(lCustInfo,
				ui.getuId());
		lS = (List<String>) m.get("errRecord");
		msg = "成功导入" + m.get("record") + "条记录。";
		if (lS != null && lS.size() != 0) {
			msg += "失败客户如下：";
			for (String s : lS) {
				msg += s + ",";
			}
			msg = msg.substring(0, msg.lastIndexOf(",") - 1);
			msg += "。请手动修改以上客户信息。";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	/**
	 * 客户信息查询供用户对客户信息修改操作
	 * 
	 * @param custInfo
	 * @param page
	 * @param rows
	 * @param request
	 * @param response
	 * @param flag
	 */
	@RequestMapping("/findCustInfoForUpd")
	public void findCustInfoForUpd(CustInfo custInfo, String page, String rows,
			String flag, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<CustInfo> pm = new PageModel<CustInfo>();
		UserInfo u = (UserInfo) request.getSession()
				.getAttribute("userSession");
		Integer uid = u.getuId();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		custInfo.setPageModel(pm);
		if ("outBill".equals(flag)) {
			maps = custInfoService.findCustInfoForOut(custInfo, uid);// 查询客户信息用于客户出单
		} else if ("distBill".equals(flag)) {
			maps = custInfoService.findCustInfoForDist(custInfo,
					custInfo.getBusierId());
		} else {
			maps = custInfoService.findCustInfoForUpd(custInfo, uid);// 查询客户信息用于客户签单
		}
		WriteToJson.writeJson(maps, request, response);
	}

	/**
	 * 通过客户信息主键cusId查询客户基本信息
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
		return "view/custInfo/updCustInfoSubPage";
	}

	/**
	 * 通过主键cusId修改客户基本信息
	 * 
	 * @param custInfo
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updCustInfoByCustInfo")
	public void updCustInfoByCustInfo(CustInfo custInfo,
			HttpServletRequest request, HttpServletResponse response) {
		String msg = "系统错误，请重新尝试修改客户基本信息！";
		int i = -1;
		if (custInfo != null) {
			custInfo.setUpdDate(new Date());
			i = custInfoService.updateByPrimaryKeySelective(custInfo);
		}
		if (i > 0) {
			msg = "成功修改客户基本信息！";
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 通过主键删除客户基本信息（客户信息连带删除保单险种信息暂未开发）
	 * 
	 * @param cusId
	 * @param request
	 * @param response
	 */
	@RequestMapping("/deleteCustInfoByKey")
	public void deleteCustInfoByKey(String cusId, HttpServletRequest request,
			HttpServletResponse response) {
		String msg = "系统错误，请重新操作！";
		int i = -1;
		if (cusId != null && !"".equals(cusId)) {
			i = custInfoService.deleteByPrimaryKey(Integer.parseInt(cusId));
		}
		if (i > 0) {
			msg = "成功删除客户信息！";
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 查询客户所有的信息（客户基本信息、客户险种、客户保单等信息）
	 * 
	 * @param cusId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/selectCustParticularInfo")
	public String selectCustParticularInfo(Integer cusId,
			HttpServletRequest request, HttpServletResponse response) {
		CustInfo ci = new CustInfo();
		List<BusiJrn> lCusAllJrn = new ArrayList<BusiJrn>();// 客户所有流程日志
		ci = custInfoService.selectCustParticularInfo(cusId);
		BusiJrn bj = new BusiJrn();
		bj.setCusId(cusId);
		lCusAllJrn = busiJrnService.selectCustBusiByBj(bj);
		request.setAttribute("custInfoWithAll", ci);
		request.setAttribute("lCusAllJrn", lCusAllJrn);
		return "view/custInfo/custParticularInfo";
	}

	/**
	 * 客户信息导出工具方法
	 * 
	 * @return
	 */
	public boolean expFunctionTools(List<CustInfo> lCustInfo,
			HttpServletResponse response) {
		Map<String, Object> headInfo = new LinkedHashMap<String, Object>();// 首行字段存放map
		headInfo.put("plateNo", "车牌号");
		headInfo.put("brand", "品牌");
		headInfo.put("brandTyp", "品牌型号");
		headInfo.put("frameNo", "车架号码");
		headInfo.put("engineNo", "发动机号码");
		headInfo.put("cusIdNo", "身份证号码");
		headInfo.put("cusNme", "姓名");
		headInfo.put("cusAddr", "地址");
		headInfo.put("cusTel", "电话1");
		headInfo.put("cusPhon", "电话2");
		headInfo.put("logDate", "初登日期");
		List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();// 查询结果list存放map
		for (CustInfo ci : lCustInfo) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("plateNo", ci.getPlateNo());
			m.put("brand", ci.getBrand());
			m.put("brandTyp", ci.getBrandTyp());
			m.put("frameNo", ci.getFrameNo());
			m.put("engineNo", ci.getEngineNo());
			m.put("cusIdNo", ci.getCusIdNo());
			m.put("cusNme", ci.getCusNme());
			m.put("cusAddr", ci.getCusAddr());
			m.put("cusTel", ci.getCusTel());
			m.put("cusPhon", ci.getCusPhon());
			m.put("logDate", ci.getLogDate());
			data.add(m);
		}
		try {
			ExportUtils.exportExcel(response, headInfo, data, "客户基本信息.xls");
			return true;
		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 将前端文件传入服务器磁盘目录下
	 * 
	 * @param file
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public String writeOnDir(CommonsMultipartFile file,
			HttpServletResponse response) throws IOException {
		if (!file.isEmpty()) {
			BufferedOutputStream bos = new BufferedOutputStream(
					new FileOutputStream("C:/" + file.getOriginalFilename()));
			InputStream in = file.getInputStream();
			BufferedInputStream bis = new BufferedInputStream(in);
			int n = 0;
			byte[] b = new byte[1024];
			while ((n = bis.read(b)) != -1) {
				bos.write(b, 0, n);
			}
			bos.flush();
			bos.close();
			bis.close();
		}
		return "C:/" + file.getOriginalFilename();
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

}
