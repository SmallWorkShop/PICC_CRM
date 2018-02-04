package com.zzfly.service;

import java.util.List;

import com.zzfly.model.RoleInfo;
/**
 * 角色service
 * @author zhengz.fly
 *
 */
public interface RoleServiceI {
	public int insert(RoleInfo record);

	public List<RoleInfo> selectRoles();

	List<RoleInfo> selectRoleByRole(RoleInfo roleInfo);
}
