package com.zzfly.service;

import java.util.Map;

import com.zzfly.model.InsInfo;

/**
 * 险种信息业务接口
 * 
 * @author bcy.fly
 * 
 */

public interface InsInfoService {
	public int insert(InsInfo insInfo);

	public int delById(Integer id);

	public Map<String, Object> loadInsInfoByPage(InsInfo insInfo);

	public int updateByPrimaryKey(InsInfo insInfo);

	public InsInfo findInsInfoByPreCol1(InsInfo insInfo);
}
