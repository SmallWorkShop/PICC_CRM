package com.zzfly.service;

import java.util.List;

import com.zzfly.model.Right;

/**
 * 权限配置Service
 * 
 * @author zhengz.fly
 * 
 */
public interface RightServiceI {
	public int deleteByPrimaryKey(Integer trId);

	public int insert(Right record);
	
	public Right selectByPrimaryKey(Integer trId);

	public List<Right> selectFuncByRoleId(int roleId);

	public int insertBat(String roleId, String funcId);
	
	public int updateBatUserRole(String u,String r);
}
