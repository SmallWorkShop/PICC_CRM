package com.zzfly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.RoleInfoMapper;
import com.zzfly.model.RoleInfo;
import com.zzfly.service.RoleServiceI;

/**
 * 角色信息业务逻辑
 * 
 * @author zhengz.fly
 * 
 */
@Service("roleService")
public class RoleServiceImpl implements RoleServiceI {
	private RoleInfoMapper roleInfoDao;

	/**
	 * 插入角色信息
	 */
	public int insert(RoleInfo record) {
		RoleInfo r1 = new RoleInfo();
		int i = -1;
		if (record.getrCode() != null) {
			r1.setrCode(record.getrCode());
		}
		// 判断角色是否存在
		if (roleInfoDao.selectRoleByRole(r1) == null
				|| roleInfoDao.selectRoleByRole(r1).size() == 0) {
			i = roleInfoDao.insert(record);
		}

		return i;
	}

	/**
	 * 查询所有角色信息
	 */
	public List<RoleInfo> selectRoles() {
		return this.roleInfoDao.selectRoles();
	}

	/**
	 * 根据相关条件查询角色
	 */
	public List<RoleInfo> selectRoleByRole(RoleInfo roleInfo) {
		return this.roleInfoDao.selectRoleByRole(roleInfo);
	}

	public RoleInfoMapper getRoleInfoDao() {
		return roleInfoDao;
	}

	@Autowired
	public void setRoleInfoDao(RoleInfoMapper roleInfoDao) {
		this.roleInfoDao = roleInfoDao;
	}

}
