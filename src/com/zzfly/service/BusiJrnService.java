package com.zzfly.service;

import java.util.List;

import com.zzfly.model.BusiJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.model.InsInfo;
import com.zzfly.model.InsurInfo;

/**
 * 业务日志信息业务接口
 * 
 * @author zhengz.fly
 * 
 */
public interface BusiJrnService {
	public int insert(BusiJrn record);

	public int insertSelective(BusiJrn record);

	public BusiJrn selectByPrimaryKey(Integer jrnNo);

	public int insertCustSignBill(InsurInfo i, List<InsInfo> l);

	public CustInfo findCustInfoForOutBill(CustInfo custInfo);

	public int insertCustQuitBill(BusiJrn record);

	public int insertCustDistBill(InsurInfo insurInfo, BusiJrn busiJrn,
			Integer uId);

	public int insertCustDistBill(CustInfo custInfo, BusiJrn busiJrn,
			String flag);

	public List<BusiJrn> selectCustBusiByBj(BusiJrn bj);
}
