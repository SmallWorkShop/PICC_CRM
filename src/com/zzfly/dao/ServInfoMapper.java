package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.ServInfo;

/**
 * 
 * 维修保养信息DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("servInfoDao")
public interface ServInfoMapper {
	int deleteByPrimaryKey(Integer servId);

	int insert(ServInfo record);

	int insertSelective(ServInfo record);

	ServInfo selectByPrimaryKey(Integer servId);

	int updateByPrimaryKeySelective(ServInfo record);

	int updateByPrimaryKey(ServInfo record);

	List<ServInfo> selectServInfoByObj(ServInfo si);
}