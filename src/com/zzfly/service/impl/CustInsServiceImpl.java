package com.zzfly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.CustInsMapper;
import com.zzfly.model.CustIns;
import com.zzfly.service.CustInsService;
import com.zzfly.utils.PageModel;

/**
 * 客户险种信息业务逻辑
 * 
 * @author bcy.fly
 * 
 */
@Service("custInsService")
public class CustInsServiceImpl implements CustInsService {
	private CustInsMapper custInsDao;

	/**
	 * 增加一条客户险种信息
	 */
	@Override
	public int insert(CustIns custIns) {
		// TODO Auto-generated method stub
		CustIns one = new CustIns();
		PageModel<CustIns> pm = new PageModel<CustIns>();
		one.setCusId(custIns.getCusId());
		one.setInsId(custIns.getInsId());
		pm.setOffset(-1);
		pm.setPageSize(-1);
		one.setPageModel(pm);
		if (custInsDao.loadByCustIns(one) != null
				&& custInsDao.loadByCustIns(one).size() != 0) {// 根据客户ID查询客户保单是否已经配置
			return -2;
		}
		return custInsDao.insert(custIns);
	}

	/**
	 * 根据客户险种自增ID删除该条客户配置的险种信息
	 * 
	 * */
	@Override
	public int delById(Integer id) {
		// TODO Auto-generated method stub
		return custInsDao.deleteByPrimaryKey(id);
	}

	/**
	 * 根据客户ID删除该客户的所有险种信息cusId
	 */
	public int delByCusId(Integer cusId) {
		return custInsDao.deleteByCusId(cusId);
	}

	/**
	 * 分页查询客户险种信息 如果传参数则根据传的参数查询 例如： INS_ID 险种ID INT CUS_ID 客户ID INT INS_AMT 保费
	 * DECIMAL(15,2) INS_S_AMT 不计免赔 DECIMAL(15,2) INS_LIM 保额 VARCHAR(20)
	 * */
	@Override
	public Map<String, Object> loadCustInsByPage(CustIns custIns) {
		// TODO Auto-generated method stub
		CustIns one = new CustIns();
		one.setCusId(custIns.getCusId());
		one.setInsId(custIns.getInsId());
		one.setInsAmt(one.getInsAmt());
		one.setInsSAmt(one.getInsAmt());
		one.setInsLim(one.getInsLim());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", custInsDao.selectCount(one));
		map.put("rows", custInsDao.loadByCustIns(one));
		return map;
	}

	/**
	 * 更新客户险种信息
	 * */
	@Override
	public int updateByPrimaryKey(CustIns custIns) {
		// TODO Auto-generated method stub
		return custInsDao.updateByPrimaryKey(custIns);
	}

	/**
	 * 查询客户险种信息返回list（查询包括险种的基本信息）
	 */
	public List<CustIns> loadCustInsByCustIns(CustIns custIns) {
		return custInsDao.loadByCustInsWithIns(custIns);
	}

	public CustInsMapper getCustInsDao() {
		return custInsDao;
	}

	@Autowired
	public void setCustInsDao(CustInsMapper custInsDao) {
		this.custInsDao = custInsDao;
	}

}
