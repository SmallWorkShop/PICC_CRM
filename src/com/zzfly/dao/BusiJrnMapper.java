package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.BusiJrn;

/**
 * 
 * 日志表DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("busiJrnDao")
public interface BusiJrnMapper {
	int deleteByPrimaryKey(Integer jrnNo);

	int insert(BusiJrn record);

	int insertSelective(BusiJrn record);

	BusiJrn selectByPrimaryKey(Integer jrnNo);

	int updateByPrimaryKeySelective(BusiJrn record);

	int updateByPrimaryKey(BusiJrn record);

	List<BusiJrn> selectCustBusiByBj(BusiJrn bj);
}