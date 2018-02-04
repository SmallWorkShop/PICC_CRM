package com.zzfly.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.FuncMapper;
import com.zzfly.dao.RightMapper;
import com.zzfly.dao.RoleInfoMapper;
import com.zzfly.dao.UserInfoMapper;
import com.zzfly.model.Func;
import com.zzfly.model.Right;
import com.zzfly.model.UserInfo;
import com.zzfly.service.RightServiceI;

/**
 * 权限配置业务逻辑
 * 
 * @author zhengz.fly
 * 
 */
@Service("rightService")
public class RightServiceImpl implements RightServiceI {
	private RightMapper rightDao;
	private FuncMapper funcDao;
	private RoleInfoMapper roleInfoDao;
	private UserInfoMapper userInfoDao;

	public int deleteByPrimaryKey(Integer trId) {
		return 0;
	}

	public int insert(Right record) {
		return 0;
	}

	public Right selectByPrimaryKey(Integer trId) {
		return null;
	}

	public List<Right> selectFuncByRoleId(int roleId) {
		return rightDao.selectFuncByRoleId(roleId);
	}

	/**
	 * 批量更新角色菜单信息
	 */
	public int insertBat(String roleId, String funcIds) {
		Right r0 = new Right();
		Set<Integer> set = new HashSet<Integer>();
		int rId = Integer.parseInt(roleId);
		int k = 0;
		rightDao.deleteByRid(rId);
		r0.setrId(rId);
		String[] funcIdArr;
		funcIdArr = funcIds.split(",");
		set = findPFid(funcIdArr);
		if (set != null && set.size() != 0) {
			for (Integer index : set) {
				r0.setFuncId(index);
				k = rightDao.insert(r0);
			}
		}
		return k;
	}

	/**
	 * 批量更新用户拥有的角色
	 */
	public int updateBatUserRole(String u, String r) {
		UserInfo userInfo = new UserInfo();
		String[] userIdArr = null;
		int i = 0;
		if (u != null && !"".equals(u)) {
			userIdArr = u.substring(1, u.length()).split(",");
		}
		if (r != null && !"".equals(r)) {
			userInfo.setuRole(r.substring(1, r.length()));
		}
		if (userIdArr != null && userIdArr.length != 0) {
			for (String uId : userIdArr) {
				userInfo.setuId(Integer.parseInt(uId));
				i = i + userInfoDao.updateByPrimaryKeySelective(userInfo);
			}
		}
		return i;
	}

	public RightMapper getRightDao() {
		return rightDao;
	}

	@Autowired
	public void setRightDao(RightMapper rightDao) {
		this.rightDao = rightDao;
	}

	public FuncMapper getFuncDao() {
		return funcDao;
	}

	@Autowired
	public void setFuncDao(FuncMapper funcDao) {
		this.funcDao = funcDao;
	}

	public RoleInfoMapper getRoleInfoDao() {
		return roleInfoDao;
	}

	@Autowired
	public void setRoleInfoDao(RoleInfoMapper roleInfoDao) {
		this.roleInfoDao = roleInfoDao;
	}

	public UserInfoMapper getUserInfoDao() {
		return userInfoDao;
	}

	@Autowired
	public void setUserInfoDao(UserInfoMapper userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	/**
	 * 处理funcIds数组获取所有叶子节点的父节点
	 */
	public Set<Integer> findPFid(String[] s) {
		Set<Integer> set = new HashSet<Integer>();
		for (String str : s) {
			if (!"".equals(str)) {
				set.add(Integer.parseInt(str));
				set.addAll(recuFuncId(Integer.parseInt(str)));
			}
		}
		return set;
	}

	/**
	 * 递归查询funcId的父节点
	 * 
	 * @param s
	 * @return
	 */
	public Set<Integer> recuFuncId(Integer s) {
		Set<Integer> si = new HashSet<Integer>();
		if (funcDao.selectByPrimaryKey(s) != null) {
			if (funcDao.selectByPrimaryKey(s).getpFuncId() != null) {
				si.add(funcDao.selectByPrimaryKey(s).getpFuncId());
				si.addAll(recuFuncId(funcDao.selectByPrimaryKey(s).getpFuncId()));
			}
		}
		return si;
	}

}
