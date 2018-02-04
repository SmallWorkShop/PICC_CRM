package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.InsurInfo;

/**
 * 
 * 保单信息DAO
 * 
 * @author zheng.fly
 * 
 */
@Repository("insurInfoDao")
public interface InsurInfoMapper {
	int deleteByPrimaryKey(Integer insurId);

	int deleteByCusId(Integer cusId);

	int insert(InsurInfo record);

	int insertSelective(InsurInfo record);

	InsurInfo selectByPrimaryKey(Integer insurId);

	int updateByPrimaryKeySelective(InsurInfo record);

	int updateByPrimaryKey(InsurInfo record);

	List<InsurInfo> loadByInsurInfo(InsurInfo insurInfo);

	int selectCount(InsurInfo insurInfo);

}