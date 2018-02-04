package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.RoleInfo;

/**
 * 
 * 角色信息表DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("roleInfoDao")
public interface RoleInfoMapper {
	int deleteByPrimaryKey(Integer rId);

	int insert(RoleInfo record);

	int insertSelective(RoleInfo record);

	RoleInfo selectByPrimaryKey(Integer rId);

	int updateByPrimaryKeySelective(RoleInfo record);

	int updateByPrimaryKey(RoleInfo record);

	List<RoleInfo> selectRoles();

	List<RoleInfo> selectRoleByRole(RoleInfo roleInfo);
}