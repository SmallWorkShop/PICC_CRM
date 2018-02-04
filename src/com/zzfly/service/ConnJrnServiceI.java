package com.zzfly.service;

import java.util.List;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.ConnJrn;

/**
 * 客户联系日志业务层接口
 * 
 * @author zhengz.fly
 * 
 */
public interface ConnJrnServiceI {

	public List<ConnJrn> selectConnJrnByObj(ConnJrn cj);

	public int deleteByPrimaryKey(Integer connId);

	public int insert(ConnJrn record, BusiJrn bj);

	public ConnJrn selectByPrimaryKey(Integer connId);
}
