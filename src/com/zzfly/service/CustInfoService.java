package com.zzfly.service;

import java.util.List;
import java.util.Map;

import com.zzfly.model.CustInfo;

/**
 * 客户信息业务接口
 * 
 * @author zhengz.fly
 * 
 */

public interface CustInfoService {
	public int insert(CustInfo record);

	public List<CustInfo> findByCustInfo(CustInfo r);

	public Map<String, Object> findByCustInfoMap(CustInfo r);

	public Map<String, Object> findLikeCustInfo(CustInfo r);

	public Map<String, Object> findCustInfoForUpd(CustInfo r, Integer uid);

	public Map<String, Object> findCustInfoForOut(CustInfo r, Integer uid);

	public Map<String, Object> findCustInfoForDist(CustInfo r, Integer uid);

	public CustInfo selectByPrimaryKey(Integer cusId);

	public CustInfo selectCustParticularInfo(Integer cusId);

	public int updateByPrimaryKeySelective(CustInfo record);

	public int deleteByPrimaryKey(Integer cusId);

	public List<CustInfo> findCustInfoForConn(CustInfo ci);

	public Map<String, Object> batchInsertCustInfo(List<CustInfo> lCustInfo,
			Integer uId);
}
