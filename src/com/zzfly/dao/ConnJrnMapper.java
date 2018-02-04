package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.ConnJrn;

/**
 * 
 * 联系日志表DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("connJrnDao")
public interface ConnJrnMapper {
	int deleteByPrimaryKey(Integer connId);

	int insert(ConnJrn record);

	int insertSelective(ConnJrn record);

	ConnJrn selectByPrimaryKey(Integer connId);

	int updateByPrimaryKeySelective(ConnJrn record);

	int updateByPrimaryKey(ConnJrn record);

	List<ConnJrn> selectConnJrnByObj(ConnJrn cj);
	
}