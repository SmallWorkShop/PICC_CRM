package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.InsInfo;
/**
 * 
 * 险种信息表DAO
 * @author zhengz.fly
 *
 */
@Repository("insInfoDao")
public interface InsInfoMapper {
	int deleteByPrimaryKey(Integer insId);

	int insert(InsInfo record);

	int insertSelective(InsInfo record);

	InsInfo selectByPrimaryKey(Integer insId);

	int updateByPrimaryKeySelective(InsInfo record);

	int updateByPrimaryKey(InsInfo record);
	
	List<InsInfo> loadByInsInfo(InsInfo insInfo);
	
	int selectCount(InsInfo insInfo);
}