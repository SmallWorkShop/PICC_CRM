package com.zzfly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzfly.model.Dict;
import com.zzfly.service.DictServiceI;
import com.zzfly.utils.WriteToJson;

@Controller
@RequestMapping("/dict")
public class DictController {
	private DictServiceI dictService;

	@RequestMapping("/findAddrScope")
	public String findAddrScope(Dict dict, HttpServletRequest request,
			HttpServletResponse response) {
		List<Dict> list = new ArrayList<Dict>();
		if (dict != null) {
			dict.setDictKnd("0000");
			list = dictService.selectDictsByDict(dict);
		}
		WriteToJson.writeJson(list, request, response);
		return null;
	}

	public DictServiceI getDictService() {
		return dictService;
	}

	@Autowired
	public void setDictService(DictServiceI dictService) {
		this.dictService = dictService;
	}
}
