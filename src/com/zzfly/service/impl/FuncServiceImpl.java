package com.zzfly.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.FuncMapper;
import com.zzfly.model.Func;
import com.zzfly.service.FuncServiceI;

/**
 * 
 * 功能业务逻辑实现
 * 
 * @author Administrator
 * 
 */
@Service("funcService")
public class FuncServiceImpl implements FuncServiceI {
	private FuncMapper funcDao;

	Set<Integer> set = new HashSet<Integer>();

	public int insert(Func record) {
		Func f = new Func();
		List<Func> lFunc = new ArrayList<Func>();
		f.setFuncCode(record.getFuncCode());
		lFunc = funcDao.findFuncs(f);
		if(lFunc != null && lFunc.size() != 0){
			return -2;
		}
		return funcDao.insert(record);
	}

	public List<Func> findAllFunc() {
		return funcDao.findAllFunc();
	}

	public Func selectByPrimaryKey(Integer funcId) {
		return this.funcDao.selectByPrimaryKey(funcId);
	}

	public int updateByPrimaryKey(Func record) {
		return funcDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 删除功能菜单，删除子孙功能菜单
	 */
	public int deleteByPrimaryKey(Integer funcId) {
		int i = 0;
		if (reFindPid(funcId) != null && reFindPid(funcId).size() != 0) {
			for (Integer id : reFindPid(funcId)) {
				i = i + funcDao.deleteByPrimaryKey(id);
			}
		}
		return i;
	}

	public FuncMapper getFuncDao() {
		return funcDao;
	}

	@Autowired
	public void setFuncDao(FuncMapper funcDao) {
		this.funcDao = funcDao;
	}

	/**
	 * 递归获取父功能下的所有子孙功能ID
	 * 
	 * @param funcId
	 * @return
	 */
	public Set<Integer> reFindPid(int funcId) {
		Func func = new Func();
		set.add(funcId);
		func.setpFuncId(funcId);
		if (funcDao.findFuncs(func) != null
				&& funcDao.findFuncs(func).size() != 0) {
			for (Func f : funcDao.findFuncs(func)) {
				set.add(f.getFuncId());
				set.addAll(reFindPid(f.getFuncId()));
			}
		}
		return set;
	}
}
