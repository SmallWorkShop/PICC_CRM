package com.zzfly.service;

import java.util.List;
import java.util.Set;

import com.zzfly.model.Func;

/**
 * 
 * 功能菜单接口
 * 
 * @author zhengz.fly
 * 
 */
public interface FuncServiceI {
	public int insert(Func record);

	public List<Func> findAllFunc();

	public Func selectByPrimaryKey(Integer funcId);

	public int updateByPrimaryKey(Func record);

	public int deleteByPrimaryKey(Integer funcId);

	public Set<Integer> reFindPid(int funcId);
}
