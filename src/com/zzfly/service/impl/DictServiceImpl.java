package com.zzfly.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.DictMapper;
import com.zzfly.model.Dict;
import com.zzfly.service.DictServiceI;

@Service("dictService")
public class DictServiceImpl implements DictServiceI {
	private DictMapper dictDao;

	/**
	 * 根据数据字典的主键ID查询一条记录
	 */
	public Dict selectByPrimaryKey(Integer dictId) {
		return dictDao.selectByPrimaryKey(dictId);
	}

	/**
	 * 根据数据字典相关属性查询一个数据字典的list（通常有数据字典类型、字典代码、父代码等）
	 */
	public List<Dict> selectDictsByDict(Dict d) {
		List<Dict> list = new ArrayList<Dict>();
		if (d != null) {
			list = dictDao.selectDictsByDict(d);
		}
		return list;
	}

	public DictMapper getDictDao() {
		return dictDao;
	}

	@Autowired
	public void setDictDao(DictMapper dictDao) {
		this.dictDao = dictDao;
	}

}
