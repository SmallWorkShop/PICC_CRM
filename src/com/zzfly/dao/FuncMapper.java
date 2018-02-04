package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.Func;

/**
 * 
 * 功能菜单DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("funcDao")
public interface FuncMapper {
	int deleteByPrimaryKey(Integer funcId);

	int insert(Func record);

	int insertSelective(Func record);

	Func selectByPrimaryKey(Integer funcId);

	int updateByPrimaryKeySelective(Func record);

	int updateByPrimaryKey(Func record);

	List<Func> findAllFunc();

	List<Func> findFuncs(Func func);
}