package com.zzfly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.Right;
import com.zzfly.service.RightServiceI;
import com.zzfly.utils.WriteToJson;

/**
 * 权限配置控制层
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/right")
public class RightController {
	private RightServiceI rightService;

	@RequestMapping("/selectFuncsByRoleId")
	public String selectFuncsByRoleId(String roleId,
			HttpServletRequest request, HttpServletResponse response) {
		List<Right> list = new ArrayList<Right>();
		list = rightService.selectFuncByRoleId(Integer.parseInt(roleId));
		if (list != null && list.size() != 0) {
			WriteToJson.writeJson(list, request, response);
		}
		return null;
	}

	@RequestMapping("/updRoleFuncs")
	public String updRoleFuncs(String rId, String funcIds,
			HttpServletRequest request, HttpServletResponse response) {
		int i = -1;
		String msg = "系统错误，请重新配置角色权限。";
		if (rId != null && !"".equals(rId)) {
			if (funcIds != null && !"".equals(funcIds)) {
				i = rightService.insertBat(rId, funcIds);
			} else {
				msg = "请选择菜单！";
			}
		} else {
			msg = "请选择需配置菜单的角色！";
		}
		if (i > 0) {
			msg = "角色权限配置成功，重新登录生效。";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	@RequestMapping("/updUserRoles")
	public String updUserRoles(String usersId, String rolesId,
			HttpServletRequest request, HttpServletResponse response) {
		int i = -1;
		String msg = "系统错误，请重新配置用户角色！";
		if (usersId != null && !"".equals(usersId)) {
			if (rolesId != null && !"".equals(rolesId)) {
				i = rightService.updateBatUserRole(usersId, rolesId);
			}
		}
		if(i > 0){
			msg = "配置成功，重新登录生效！";
		}
		WriteToJson.writeText(msg, response);
		return null;
	}

	public RightServiceI getRightService() {
		return rightService;
	}

	@Autowired
	public void setRightService(RightServiceI rightService) {
		this.rightService = rightService;
	}

}
