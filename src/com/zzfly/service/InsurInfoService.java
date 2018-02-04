package com.zzfly.service;

import java.util.List;
import java.util.Map;

import com.zzfly.model.InsurInfo;

/**
 * 客户信息业务接口
 * 
 * @author bcy.fly
 * 
 */

public interface InsurInfoService {
	public int insert(InsurInfo insurInfo);

	public int delById(Integer id);

	public int delByCusId(Integer cusId);

	public Map<String, Object> loadInsurInfoByPage(InsurInfo insurInfo);

	public int updateByPrimaryKey(InsurInfo insurInfo);

	public List<InsurInfo> loadInsurInfoByInsurInfo(InsurInfo insurInfo);
}
