package com.zzfly.utils;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * 
 * 用户权限控制过滤工具类
 * @author zhengz.sdc
 *
 */
public class RightFilter {
	private HttpSession session;

	public RightFilter(HttpSession session) {
		super();
		this.session = session;
	}
	/**
	 * 
	 * @param url 功能地址
	 * @return 
	 */
	public boolean haveRight(String url){
		List userRight = new ArrayList();
		return false;
	}
	

}
