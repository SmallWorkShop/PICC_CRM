package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.Dict;
/**
 * 
 * 数据字典DAO
 * @author zhengz.fly
 *
 */
@Repository("dictDao")
public interface DictMapper {
	int deleteByPrimaryKey(Integer dictId);

	int insert(Dict record);

	int insertSelective(Dict record);

	Dict selectByPrimaryKey(Integer dictId);

	int updateByPrimaryKeySelective(Dict record);

	int updateByPrimaryKey(Dict record);
	
	List<Dict> selectDictsByDict(Dict d);
}