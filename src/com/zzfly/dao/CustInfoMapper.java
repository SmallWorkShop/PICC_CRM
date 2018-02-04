package com.zzfly.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zzfly.model.CustInfo;

/**
 * 
 * 客户信息表DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("custInfoDao")
public interface CustInfoMapper {
	int deleteByPrimaryKey(Integer cusId);

	int insert(CustInfo record);

	int insertSelective(CustInfo record);

	CustInfo selectByPrimaryKey(Integer cusId);

	int updateByPrimaryKeySelective(CustInfo record);

	int updateByPrimaryKey(CustInfo record);

	List<CustInfo> findByCustInfo(CustInfo r);

	List<CustInfo> findByCustInfoLike(CustInfo r);

	List<CustInfo> findCustInfoForUpd(@Param("custInfo") CustInfo r,
			@Param("str") String str);

	Integer selectCounts(CustInfo r);

	Integer selectCountsOfLike(CustInfo r);

	Integer selectCountsForUpd(@Param("custInfo") CustInfo r,
			@Param("str") String str);

	CustInfo selectCustParticularInfo(Integer cusId);

	List<CustInfo> findCustInfoForConn(CustInfo ci);

}