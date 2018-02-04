package com.zzfly.service.impl;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.InsurInfoMapper;
import com.zzfly.model.InsurInfo;
import com.zzfly.service.InsurInfoService;
import com.zzfly.utils.PageModel;

/**
 * 保单信息业务逻辑
 * 
 * @author bcy.fly
 * 
 */
@Service("insurInfoService")
public class InsurInfoServiceImpl implements InsurInfoService {
	private InsurInfoMapper insurInfoDao;

	/**
	 * 增加一条客户保单信息
	 */
	@Override
	public int insert(InsurInfo insurInfo) {
		// TODO Auto-generated method stub
		InsurInfo insur = new InsurInfo();
		PageModel<InsurInfo> pm = new PageModel<InsurInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		insur.setCusId(insurInfo.getCusId());
		insur.setPageModel(pm);
		if (insurInfoDao.loadByInsurInfo(insur) != null
				&& insurInfoDao.loadByInsurInfo(insur).size() != 0) {// 根据客户ID查询客户保单是否已经配置
			return -2;
		}
		return insurInfoDao.insert(insurInfo);
	}

	/**
	 * 根据保单自增ID删除该条保单信息
	 * 
	 * */
	@Override
	public int delById(Integer id) {// 备注：是否可以直接传个ID的数组 一次删除多个
		// TODO Auto-generated method stub
		return insurInfoDao.deleteByPrimaryKey(id);
	}

	/**
	 * 删除保单根据客户Id(cusId)
	 */
	public int delByCusId(Integer cusId) {
		return insurInfoDao.deleteByCusId(cusId);
	}

	/**
	 * 分页查询保单信息 如果传参数则根据传的参数查询 例如：CUS_ID 客户ID INT DIST_DATE 配送日期 VARCHAR(20)
	 * ADDR 配送地址 VARCHAR(255)
	 * */
	@Override
	public Map<String, Object> loadInsurInfoByPage(InsurInfo insurInfo) {
		// TODO Auto-generated method stub
		InsurInfo one = new InsurInfo();
		one.setCusId(insurInfo.getCusId());
		one.setDistDate(insurInfo.getDistDate());
		one.setAddr(insurInfo.getAddr());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", insurInfoDao.selectCount(one));
		map.put("rows", insurInfoDao.loadByInsurInfo(one));
		return map;
	}

	/**
	 * 更新保单信息
	 * */
	@Override
	public int updateByPrimaryKey(InsurInfo insurInfo) {
		// TODO Auto-generated method stub
		return insurInfoDao.updateByPrimaryKeySelective(insurInfo);
	}

	/**
	 * 根据保单部门字段栏位查询保单（返回一个list不分页查询）
	 */
	public List<InsurInfo> loadInsurInfoByInsurInfo(InsurInfo insurInfo) {
		PageModel<InsurInfo> pm = new PageModel<InsurInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		insurInfo.setPageModel(pm);
		return insurInfoDao.loadByInsurInfo(insurInfo);
	}

	public InsurInfoMapper getInsurInfoDao() {
		return insurInfoDao;
	}

	@Autowired
	public void setInsurInfoDao(InsurInfoMapper insurInfoDao) {
		this.insurInfoDao = insurInfoDao;
	}

}
