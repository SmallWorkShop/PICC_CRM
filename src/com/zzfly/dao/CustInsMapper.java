package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.CustIns;
import com.zzfly.model.InsInfo;

/**
 * 
 * 客户险种信息DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("custInsDao")
public interface CustInsMapper {
	int deleteByPrimaryKey(Integer custInsId);

	int deleteByCusId(Integer cusId);

	int insert(CustIns record);

	int insertSelective(CustIns record);

	CustIns selectByPrimaryKey(Integer custInsId);

	int updateByPrimaryKeySelective(CustIns record);

	int updateByPrimaryKey(CustIns record);

	List<InsInfo> loadByCustIns(CustIns custIns);

	int selectCount(CustIns custIns);

	List<CustIns> loadByCustInsWithIns(CustIns custIns);

}