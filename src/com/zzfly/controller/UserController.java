package com.zzfly.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.zzfly.easyui.Tree;
import com.zzfly.model.Func;
import com.zzfly.model.UserInfo;
import com.zzfly.service.UserServiceI;
import com.zzfly.utils.ExportUtils;
import com.zzfly.utils.MD5Util;
import com.zzfly.utils.PageModel;
import com.zzfly.utils.TreeFormatUtil;
import com.zzfly.utils.WriteToJson;

/**
 * 
 * 用户表Controller
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController {
	private UserServiceI userService;

	/**
	 * 主键查询用户信息
	 * 
	 * @param uId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findByKey")
	public String selectByPrimaryKey(int uId, String flag,
			HttpServletRequest request, HttpServletResponse response) {
		String str = "";
		UserInfo userInfo = userService.selectByPrimaryKey(uId);
		request.setAttribute("userInfo", userInfo);
		if ("allocatUpd".equals(flag)) {
			str = "view/busiJrn/allocatScopeSubPage";// 修改配送辖区的跳转页面
		} else {
			str = "view/user_page/updUser";// 修改用户信息的跳转页面
		}
		return str;
	}

	/**
	 * 用户信息修改
	 * 
	 * @param userInfo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(UserInfo userInfo, HttpServletRequest request,
			HttpServletResponse response) {
		userInfo.setUpdDate(new Date());
		int i = userService.updateByPrimaryKeySelective(userInfo);
		String msg = "用户信息修改失败！";
		if (i > 0) {
			msg = "用户信息修改成功！重新登录后生效。";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	/**
	 * 重置用户的密码为“password”
	 * 
	 * @param userInfo
	 * @param request
	 * @param response
	 */
	@RequestMapping("/resetUserPwd")
	public void resetUserPwd(UserInfo userInfo, HttpServletRequest request,
			HttpServletResponse response) {
		userInfo.setUpdDate(new Date());
		userInfo.setuPwd(MD5Util.md5("password"));
		int i = userService.updateByPrimaryKeySelective(userInfo);
		String msg = "用户密码重置失败！";
		if (i > 0) {
			msg = "用户密码已重置为:password";
		}
		WriteToJson.writeText(msg, response);
	}

	/**
	 * 用户删除
	 * 
	 * @param uId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteUserById")
	public String deleteUserById(int uId, HttpServletRequest request,
			HttpServletResponse response) {
		int i = userService.deleteByPrimaryKey(uId);
		String msg = "删除失败！";
		if (i > 0) {
			msg = "成功删除！";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	/**
	 * 用户个人信息修改！
	 * 
	 * @param uPwdHis
	 * @param uPwd
	 * @param uPwdRe
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/updPersonalInfo")
	public String updPersonalInfo(String uPwdHis, String uPwd, String uPwdRe,
			HttpServletRequest request, HttpServletResponse response) {
		UserInfo u1 = new UserInfo();
		UserInfo u2 = new UserInfo();
		String msg = "系统错误，无法修改当前密码！";
		u1 = (UserInfo) request.getSession().getAttribute("userSession");
		if (!MD5Util.md5(uPwdHis).equals(u1.getuPwd())) {
			msg = "您输入的当前密码有误,请您先核对当前密码是否正确！";
		} else {
			u2.setuId(u1.getuId());
			u2.setuPwd(MD5Util.md5(uPwd));
			u2.setUpdDate(new Date());
			int i = userService.updateByPrimaryKeySelective(u2);
			if (i > 0) {
				msg = "密码修改成功，请牢记，重新登录生效。";
			}
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("/userLogin")
	public String userLogin(HttpServletRequest request,
			HttpServletResponse response, HttpSession session, UserInfo userInfo) {
		UserInfo u = new UserInfo();
		String str = "用户名或密码不正确";
		if (StringUtils.isBlank(userInfo.getuSts())) {
			userInfo.setuSts("00");// 设置状态正常
		}
		if (StringUtils.isBlank(userInfo.getuSSts())) {
			userInfo.setuSSts("00");// 设置备用状态正常
		}
		if (!StringUtils.isBlank(userInfo.getuPwd())) {
			userInfo.setuPwd(MD5Util.md5(userInfo.getuPwd()));
		}
		u = userService.selectUserForLogin(userInfo);
		if (u != null) {
			session.setAttribute("treeString", JSON.toJSONString(TreeFormatUtil
					.funcToTree((Collection<Func>) u.getFuncs())));
			session.setAttribute("userSession", u);
			str = "success";
		}
		// WriteToJson.writeJson(JSON.toJSONString(json), request, response);
		WriteToJson.writeText(str, response);
		return null;// "view/main_page/main";// str = "view/main_page/main";

	}

	/**
	 * 用户对象查询
	 * 
	 * @param request
	 * @param response
	 * @param userInfo
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/findUserInfo")
	public String findUserInfo(HttpServletRequest request,
			HttpServletResponse response, UserInfo userInfo, String page,
			String rows) {
		Map<String, Object> maps = new HashMap<String, Object>();
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		int pageIndex = (page == null || page == "0") ? 1 : Integer
				.parseInt(page);
		int rowsIndex = (rows == null || rows == "0") ? 10 : Integer
				.parseInt(rows);
		int startIndex = (pageIndex - 1) * rowsIndex;
		pm.setOffset(startIndex);
		pm.setPageSize(rowsIndex);
		userInfo.setPageModel(pm);
		maps = userService.selectUsersPage(userInfo);
		WriteToJson.writeJson(maps, request, response);
		return null;
	}

	/**
	 * 查询我的个人信息放入list
	 * 
	 * @param uId
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findMyInfo")
	public void findMyInfo(String uId, HttpServletRequest request,
			HttpServletResponse response) {
		List<UserInfo> userList = new ArrayList<UserInfo>();
		UserInfo userInfo = userService.selectByPrimaryKey(Integer
				.parseInt(uId));
		userList.add(userInfo);
		WriteToJson.writeJson(userList, request, response);
	}

	/**
	 * 用户插入
	 * 
	 * @param request
	 * @param response
	 * @param u
	 * @return
	 */
	@RequestMapping("/insert")
	public String insertTest(HttpServletRequest request,
			HttpServletResponse response, UserInfo u) {
		u.setuPwd(MD5Util.md5(u.getuPwd()));
		int i = userService.insert(u);
		String str = "用户新增失败！请确认用户名是否已存在！";
		if (i > 0) {
			str = "成功添加新用户！";
		}
		WriteToJson.writeText(str, response);
		return null;
	}

	/**
	 * 获取所有用户树
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findUserTree")
	public String findUserTree(HttpServletRequest request,
			HttpServletResponse response) {
		UserInfo userInfo = new UserInfo();
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		userInfo.setPageModel(pm);
		Collection<UserInfo> resources = userService.selectUsers(userInfo);
		Collection<Tree> treeFomat = new ArrayList<Tree>();
		treeFomat = TreeFormatUtil.userToTree(resources);
		WriteToJson.writeJson(treeFomat, request, response);
		return null;
	}

	/**
	 * 获取所有下属用户树
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findSonUserTree")
	public String findSonUserTree(HttpServletRequest request,
			HttpServletResponse response) {
		UserInfo userInfo = new UserInfo();
		UserInfo u = new UserInfo();
		u = (UserInfo) request.getSession().getAttribute("userSession");
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		userInfo.setPageModel(pm);
		userInfo.setuId(u.getuId());
		Collection<UserInfo> resources = userService.selectSonUsers(userInfo);
		Collection<Tree> treeFomat = new ArrayList<Tree>();
		treeFomat = TreeFormatUtil.userToTree(resources);
		WriteToJson.writeJson(treeFomat, request, response);
		return null;
	}

	/**
	 * 获取下属用户信息，用于管理其配送地址
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/findSubUserList")
	public void findSubUserList(HttpServletRequest request,
			HttpServletResponse response) {
		UserInfo userInfo = new UserInfo();
		UserInfo u = new UserInfo();
		List<UserInfo> listSonUser = new ArrayList<UserInfo>();
		u = (UserInfo) request.getSession().getAttribute("userSession");
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		userInfo.setPageModel(pm);
		userInfo.setuId(u.getuId());
		listSonUser = userService.selectSonUsers(userInfo);
		WriteToJson.writeJson(listSonUser, request, response);
	}

	/**
	 * 主键查询
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping("/selectByAjax")
	public String selectByAjax(HttpServletRequest request,
			HttpServletResponse response, int id) {
		WriteToJson.writeJson(userService.selectByPrimaryKey(id), request,
				response);
		return null;
	}

	/**
	 * 用户退出操作--注销 清空session
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/userExit")
	public String userExit(HttpServletRequest request,
			HttpServletResponse response) {
		request.getSession().invalidate();
		return "user_login";
	}

	/**
	 * 导出测试
	 * 
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportTest")
	public String exportTest(HttpServletResponse response) {
		UserInfo userInfo = new UserInfo();
		PageModel<UserInfo> p = new PageModel<UserInfo>();
		p.setOffset(1);
		p.setPageSize(1);
		userInfo.setPageModel(p);
		Map<String, Object> headInfo = new LinkedHashMap<String, Object>();// 首行字段存放map
		headInfo.put("ucode", "用户名");
		headInfo.put("upwd", "密码");
		List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();// 查询结果list存放map
		for (UserInfo u : userService.selectUsers(userInfo)) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("ucode", u.getuCode());
			m.put("upwd", u.getuPwd());
			data.add(m);
		}
		try {
			ExportUtils.exportExcel(response, headInfo, data, "用户信息.xls");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
}
