package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.Right;

/**
 * 
 * 权限表DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("rightDao")
public interface RightMapper {
	int deleteByPrimaryKey(Integer trId);

	Integer deleteByRid(Integer rid);

	int insert(Right record);

	int insertSelective(Right record);

	Right selectByPrimaryKey(Integer trId);

	int updateByPrimaryKeySelective(Right record);

	int updateByPrimaryKey(Right record);

	List<Right> selectFuncByRoleId(int roleId);
}