package com.zzfly.service;

import java.util.List;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.ServInfo;

/**
 * 维修保养业务层接口
 * 
 * @author zhengz.fly
 * 
 */
public interface ServInfoServiceI {
	public int insert(ServInfo record , BusiJrn busiJrn);

	public ServInfo selectByPrimaryKey(Integer servId);

	public int deleteByPrimaryKey(Integer servId);

	public List<ServInfo> selectServInfoByObj(ServInfo si);
}
