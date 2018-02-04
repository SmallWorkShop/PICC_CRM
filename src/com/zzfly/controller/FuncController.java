package com.zzfly.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.easyui.Tree;
import com.zzfly.model.Func;
import com.zzfly.service.FuncServiceI;
import com.zzfly.utils.TreeFormatUtil;
import com.zzfly.utils.WriteToJson;

/**
 * 
 * 功能菜单Controller
 * 
 * @author zhengz.fly
 * 
 */
@Controller
@RequestMapping("/func")
public class FuncController {
	private FuncServiceI funcService;

	@RequestMapping("/add")
	public String add(Func func, HttpServletRequest request,
			HttpServletResponse response) {
		String str = "添加失败";
		int i = -1;
		i = funcService.insert(func);
		if (i == -2) {
			str = "请确保该功能代码是否已存在，请修改！";
		}
		if (i > 0) {
			str = "添加成功";
		}
		WriteToJson.writeText(str, response);
		return null;
	}

	@RequestMapping("/updateMenu")
	public String updateMenu(Func func, HttpServletRequest request,
			HttpServletResponse response) {
		func.setUpdDate(new Date());
		String str = "修改失败！";
		if (funcService.updateByPrimaryKey(func) != 0) {
			str = "修改成功！";
		}
		WriteToJson.writeText(str, response);
		return null;
	}

	@RequestMapping("/deleteFuncId")
	public String desleteFunc(int funcId, HttpServletRequest request,
			HttpServletResponse response) {
		String str = "删除失败！";
		if (funcService.deleteByPrimaryKey(funcId) != 0) {
			str = "删除成功";
		}
		WriteToJson.writeText(str, response);
		return null;
	}

	@RequestMapping("/find")
	public String selectFuncTree(HttpServletRequest request,
			HttpServletResponse response) {
		Collection<Func> resources = funcService.findAllFunc();
		Collection<Tree> treeFomat = new ArrayList<Tree>();
		treeFomat = TreeFormatUtil.funcToTree(resources);
		WriteToJson.writeJson(treeFomat, request, response);
		// request.getSession().setAttribute("treeString",
		// JSON.toJSONString(treeFomat));
		return "view/main_page/main";
	}

	@RequestMapping("/funcConfig")
	public String funcConfig(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		return "view/func/funcMain";
	}

	@RequestMapping("/findByKey")
	public String findFuncByKey(HttpServletRequest request,
			HttpServletResponse response, int funcId) {
		Func func = new Func();
		// WriteToJson.writeJson(this.funcService.selectByPrimaryKey(5),
		// request,
		// response);
		func = this.funcService.selectByPrimaryKey(funcId);
		request.setAttribute("func", func);
		return "view/func/updFunc";
	}

	public FuncServiceI getFuncService() {
		return funcService;
	}

	@Autowired
	public void setFuncService(FuncServiceI funcService) {
		this.funcService = funcService;
	}
}
