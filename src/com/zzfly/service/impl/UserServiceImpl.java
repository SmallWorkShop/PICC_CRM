package com.zzfly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.FuncMapper;
import com.zzfly.dao.RightMapper;
import com.zzfly.dao.RoleInfoMapper;
import com.zzfly.dao.UserInfoMapper;
import com.zzfly.model.Func;
import com.zzfly.model.Right;
import com.zzfly.model.RoleInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.UserServiceI;
import com.zzfly.utils.PageModel;

/**
 * 
 * 用户业务逻辑实现
 * 
 * @author zhengz.fly
 * 
 */
@Service("userService")
public class UserServiceImpl implements UserServiceI {
	private UserInfoMapper userInfoDao;
	private RightMapper rightDao;
	private RoleInfoMapper roleInfoDao;
	private FuncMapper funcDao;
	Set<Integer> set = new HashSet<Integer>();

	/**
	 * 用户信息修改
	 */
	public int updateByPrimaryKeySelective(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 用户信息插入
	 */
	public int insert(UserInfo record) {
		UserInfo u = new UserInfo();
		if (record.getuCode() != null) {
			u.setuCode(record.getuCode());
		}
		int i = -1;
		u.setPageModel(new PageModel<UserInfo>());
		if (userInfoDao.selectUsers(u) == null
				|| userInfoDao.selectUsers(u).size() == 0) {
			i = this.userInfoDao.insert(record);
		}
		return i;
	}

	/**
	 * 主键查询
	 */
	public UserInfo selectByPrimaryKey(Integer uId) {
		return this.userInfoDao.selectByPrimaryKey(uId);
	}

	/**
	 * 主键删除
	 */
	public int deleteByPrimaryKey(Integer uId) {
		return this.userInfoDao.deleteByPrimaryKey(uId);
	}

	/**
	 * 用户登录业务逻辑
	 */
	public UserInfo selectUserForLogin(UserInfo userInfo) {
		UserInfo u = new UserInfo();
		String[] role = null;
		u = userInfoDao.selectUserForLogin(userInfo);
		if (u != null) {
			u.setRoleInfos(new HashSet<RoleInfo>());
			u.setRights(new HashSet<Right>());
			u.setFuncs(new HashSet<Func>());
			if (!StringUtils.isBlank(u.getuRole())) {
				role = u.getuRole().split(",");
				for (String r : role) {
					u.getRoleInfos()
							.add(roleInfoDao.selectByPrimaryKey(Integer
									.parseInt(r)));
					if (u.getRoleInfos() != null) {
						for (RoleInfo ro : u.getRoleInfos()) {
							u.getRights().addAll(
									rightDao.selectFuncByRoleId(ro.getrId()));
							if (u.getRights() != null) {
								for (Right ri : u.getRights()) {
									u.getFuncs().add(
											funcDao.selectByPrimaryKey(ri
													.getFuncId()));
								}
							}

						}
					}

				}
			}

		}
		return u;
	}

	/**
	 * 查询用户
	 */
	public List<UserInfo> selectUsers(UserInfo userInfo) {
		return userInfoDao.selectUsers(userInfo);
	}

	/**
	 * 查询下属用户
	 */
	public List<UserInfo> selectSonUsers(UserInfo userInfo) {
		Set<Integer> s = new HashSet<Integer>();
		List<UserInfo> list = new ArrayList<UserInfo>();
		s = reFindUid(userInfo.getuId());
		for (Integer i : s) {
			list.add(userInfoDao.selectByPrimaryKey(i));
		}
		return list;
	}

	/**
	 * 分页查询用户信息
	 */
	public Map<String, Object> selectUsersPage(UserInfo userInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", userInfoDao.selectCount(userInfo));
		map.put("rows", userInfoDao.selectUsers(userInfo));
		return map;
	}

	/**
	 * 递归查询下属用户Id
	 * 
	 * @param uId
	 * @return
	 */
	public Set<Integer> reFindUid(Integer uId) {
		UserInfo userInfo = new UserInfo();
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		userInfo.setPageModel(pm);
		userInfo.setuPId(uId);
		set.add(uId);
		if (userInfoDao.selectUsers(userInfo) != null
				&& userInfoDao.selectUsers(userInfo).size() != 0) {
			for (UserInfo u : userInfoDao.selectUsers(userInfo)) {
				set.add(u.getuId());
				set.addAll(reFindUid(u.getuId()));
			}
		}
		return set;
	}

	public UserInfoMapper getUserInfoDao() {
		return userInfoDao;
	}

	@Autowired
	public void setUserInfoDao(UserInfoMapper userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public RightMapper getRightDao() {
		return rightDao;
	}

	@Autowired
	public void setRightDao(RightMapper rightDao) {
		this.rightDao = rightDao;
	}

	public RoleInfoMapper getRoleInfoDao() {
		return roleInfoDao;
	}

	@Autowired
	public void setRoleInfoDao(RoleInfoMapper roleInfoDao) {
		this.roleInfoDao = roleInfoDao;
	}

	public FuncMapper getFuncDao() {
		return funcDao;
	}

	@Autowired
	public void setFuncDao(FuncMapper funcDao) {
		this.funcDao = funcDao;
	}

}
