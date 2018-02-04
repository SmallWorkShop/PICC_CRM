package com.zzfly.service;

import java.util.List;
import java.util.Map;

import com.zzfly.model.CustIns;

/**
 * 险种信息业务接口
 * 
 * @author bcy.fly
 * 
 */

public interface CustInsService {
	public int insert(CustIns custIns);

	public int delById(Integer id);

	public int delByCusId(Integer id);

	public Map<String, Object> loadCustInsByPage(CustIns custIns);

	public int updateByPrimaryKey(CustIns custIns);

	 public List<CustIns> loadCustInsByCustIns(CustIns custIns);
}
