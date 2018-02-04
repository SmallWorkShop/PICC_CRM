package com.zzfly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.RoleInfo;
import com.zzfly.service.RoleServiceI;
import com.zzfly.utils.WriteToJson;

/**
 * 角色控制层
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	private RoleServiceI roleService;

	/**
	 * 查询所有角色
	 */
	@RequestMapping("/findRole")
	public String findRole(HttpServletRequest request,
			HttpServletResponse response) {
		List<RoleInfo> list = new ArrayList<RoleInfo>();
		list = roleService.selectRoles();
		WriteToJson.writeJson(list, request, response);
		return null;
	}

	/**
	 * 新增角色
	 * 
	 * @param request
	 * @param response
	 * @param r
	 * @return
	 */
	@RequestMapping("/addRole")
	public String addRole(HttpServletRequest request,
			HttpServletResponse response, RoleInfo r) {
		r.setCreDate(new Date());
		r.setUpdDate(new Date());
		int i = roleService.insert(r);
		String msg = "对不起，新增失败，请确认角色是否已存在！";
		if (i > 0) {
			msg = "成功新增角色！";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	public RoleServiceI getRoleService() {
		return roleService;
	}

	@Autowired
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}
}
