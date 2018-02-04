package com.zzfly.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * 将对象转换为JSON字符串
 * 
 * @author zhengz.fly
 * 
 */
public class WriteToJson {
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public static String writeJson(Object object, HttpServletRequest request,
			HttpServletResponse response) {
		// GsonBuilder builder = new GsonBuilder();
		// Gson gson = builder.create();
		Gson gson = new Gson();
		String json;
		// json = JSON.toJSONString(object);
		json = gson.toJson(object);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 
	 * @param object
	 * @return
	 */
	public static String witeJson(Object object) {
		Gson gson = new Gson();
		String json;
		json = gson.toJson(object);
		return json;
	}

	/**
	 * 
	 * @param str
	 * @return
	 */
	public static String writeText(String str, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().write(str);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
}
