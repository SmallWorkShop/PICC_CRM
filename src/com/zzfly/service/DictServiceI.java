package com.zzfly.service;

import java.util.List;

import com.zzfly.model.Dict;

/**
 * 数据字典业务层接口
 * 
 * @author zhengz.fly
 * 
 */
public interface DictServiceI {
	public List<Dict> selectDictsByDict(Dict d);

	public Dict selectByPrimaryKey(Integer dictId);
}
