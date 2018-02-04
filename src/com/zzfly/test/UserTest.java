package com.zzfly.test;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.zzfly.dao.FuncMapper;
import com.zzfly.dao.UserInfoMapper;
import com.zzfly.model.Func;
import com.zzfly.model.UserInfo;
import com.zzfly.service.FuncServiceI;
import com.zzfly.service.UserServiceI;
import com.zzfly.service.impl.FuncServiceImpl;
import com.zzfly.utils.DateUtil;
import com.zzfly.utils.MD5Util;
import com.zzfly.utils.PageModel;

/**
 * 
 * 用户模块单元测试
 * 
 * @author zhengz.fly
 * 
 */
public class UserTest {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserTest.class);

	private UserServiceI userService;
	private FuncServiceI funcService;
	private UserInfoMapper userDao;
	private FuncMapper funcDao;

	@Before
	public void beforeTest() {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				new String[] { "classpath:spring.xml", "spring-mybatis.xml" });
		userService = (UserServiceI) ac.getBean("userService");
		funcService = (FuncServiceI) ac.getBean("funcService");
		userDao = (UserInfoMapper) ac.getBean("userInfoDao");
		funcDao = (FuncMapper) ac.getBean("funcDao");
	}

	@Test
	public void testInsertUser() {
		UserInfo userInfo = new UserInfo();
		userInfo.setuCode("admin");
		userInfo.setuNme("admin");
		userInfo.setuPwd(MD5Util.md5("admin"));
		System.out.println(userInfo.getuNme() + "--" + userInfo.getuCode());
		String s = JSON.toJSONString(userInfo);
		System.out.println(s);
		// logger.info(JSON.toJSONString(userInfo));
		// System.out.println(userService.insert(userInfo));
	}

	@Test
	public void test02() {
		System.out.println(DateUtil.dateToString(new Date()));
		UserInfo u = new UserInfo();
		u = userService.selectByPrimaryKey(6);
		System.out.println(u);
		System.out.println(JSON.toJSONString(u));
		logger.info(JSON.toJSONString(userService.selectByPrimaryKey(6)));
	}

	@Test
	public void test03() {
		Func f = new Func();
		f.setFuncCode("testMenu");
		// funcService.insert(f);
		System.out.println(funcService.findAllFunc().toString());
	}

	@Test
	public void test04() {
		System.out.println(StringUtils.isBlank(""));
		Map<String, Object> m = new LinkedHashMap<String, Object>();
		m.put("age", 19);
		m.put("pwd", "password");
		m.put("name", "sss");
		System.out.println(m.toString());
		System.out.println(m.keySet().toString());
	}

	@Test
	public void test05() {
		UserInfo userInfo = new UserInfo();
		PageModel<UserInfo> p = new PageModel<UserInfo>();
		p.setOffset(0);
		p.setPageSize(2);
		userInfo.setPageModel(p);
		System.out.println(userService.selectUsers(userInfo).toString());
	}

	@Test
	public void test06() {
		// FuncServiceImpl fsi = new FuncServiceImpl();
		// Func func = new Func();
		// func.setpFuncId(9);
		// System.out.println(funcDao.findFuncs(func).toString());
		System.out.println(funcService.reFindPid(19).toString());
	}

	@Test
	public void testMd5() {
		String a = "admin";
		String a0 = MD5Util.md5(a);
		String a1 = MD5Util.dm5(a0);
		System.out.println(a + "---" + a0 + "---" + a1);
		//21232f297a57a5a743894a0e4a801fc3
	}
}
