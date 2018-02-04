package com.zzfly.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.ServInfoMapper;
import com.zzfly.model.BusiJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.model.ServInfo;
import com.zzfly.service.BusiJrnService;
import com.zzfly.service.CustInfoService;
import com.zzfly.service.ServInfoServiceI;

/**
 * 维修保养业务层实现类
 * 
 * @author zhengz.fly
 * 
 */
@Service("servInfoService")
public class ServInfoServiceImpl implements ServInfoServiceI {
	private ServInfoMapper servInfoDao;

	private CustInfoService custInfoService;

	private BusiJrnService busiJrnService;

	/**
	 * 插入维修保养信息，并且写入主日志
	 */
	public int insert(ServInfo record, BusiJrn bj) {
		CustInfo ci = new CustInfo();
		ci = custInfoService.selectByPrimaryKey(record.getCusId());
		int i = -1;
		int j = -1;
		if ("5000".equals(record.getDealCod())) {
			record.setDealNme("【客户维修】");
		} else if ("5001".equals(record.getDealCod())) {
			record.setDealNme("【客户保养】");
		} else {
			record.setDealNme("其他操作");
		}
		i = servInfoDao.insert(record);
		if (i > 0) {
			bj.setAcDte(new Timestamp(new Date().getTime()));
			bj.setOperNo(record.getDealCod());
			bj.setOperNme(record.getDealNme());
			bj.setCusId(ci.getCusId());
			bj.setPlateNo(ci.getPlateNo());
			bj.setFrameNo(ci.getFrameNo());
			bj.setCusNme(ci.getCusNme());
			bj.setOperInfo(record.getDealInfo());
			j = busiJrnService.insert(bj);
		}
		return j;
	}

	/**
	 * 根据维修保养ID查询维修保养记录明细
	 */
	public ServInfo selectByPrimaryKey(Integer servId) {
		return null;
	}

	/**
	 * 根据前台的查询条件查询维修保养记录（客户ID、时间等信息）
	 */
	public List<ServInfo> selectServInfoByObj(ServInfo si) {
		return servInfoDao.selectServInfoByObj(si);
	}

	/**
	 * 删除维修保养记录
	 */
	public int deleteByPrimaryKey(Integer servId) {
		return 0;
	}

	public ServInfoMapper getServInfoDao() {
		return servInfoDao;
	}

	@Autowired
	public void setServInfoDao(ServInfoMapper servInfoDao) {
		this.servInfoDao = servInfoDao;
	}

	public BusiJrnService getBusiJrnService() {
		return busiJrnService;
	}

	@Autowired
	public void setBusiJrnService(BusiJrnService busiJrnService) {
		this.busiJrnService = busiJrnService;
	}

	public CustInfoService getCustInfoService() {
		return custInfoService;
	}

	@Autowired
	public void setCustInfoService(CustInfoService custInfoService) {
		this.custInfoService = custInfoService;
	}

}
