package com.zzfly.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.ConnJrnMapper;
import com.zzfly.model.BusiJrn;
import com.zzfly.model.ConnJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.service.BusiJrnService;
import com.zzfly.service.ConnJrnServiceI;
import com.zzfly.service.CustInfoService;

/**
 * 客户联系记录日志service实现类（具体的业务逻辑）
 * 
 * @author zhengz.fly
 * 
 */
@Service("connJrnService")
public class ConnJrnServiceImpl implements ConnJrnServiceI {
	private ConnJrnMapper connJrnDao;

	private BusiJrnService busiJrnService;

	private CustInfoService custInfoService;

	/**
	 * 查询客户的联系日志、按序号排序
	 */
	public List<ConnJrn> selectConnJrnByObj(ConnJrn cj) {
		return connJrnDao.selectConnJrnByObj(cj);
	}

	/**
	 * 删除联系日志
	 */
	public int deleteByPrimaryKey(Integer connId) {
		return connJrnDao.deleteByPrimaryKey(connId);
	}

	/**
	 * 插入联系日志并写入主日志信息
	 */
	public int insert(ConnJrn record, BusiJrn bj) {
		CustInfo ci = new CustInfo();
		int i = -1;
		int k = -1;
		ci = custInfoService.selectByPrimaryKey(record.getCusId());
		i = connJrnDao.insert(record);
		if (i > 0) {
			bj.setAcDte(new Timestamp(new Date().getTime()));
			bj.setOperNo("6000");
			bj.setOperNme("【联系客户】");
			bj.setCusId(ci.getCusId());
			bj.setPlateNo(ci.getPlateNo());
			bj.setFrameNo(ci.getFrameNo());
			bj.setCusNme(ci.getCusNme());
			bj.setOperInfo(record.getConnDetail());
			k = busiJrnService.insert(bj);
		}
		return k;
	}

	/**
	 * 根据联系日志主键查询
	 */
	public ConnJrn selectByPrimaryKey(Integer connId) {
		return connJrnDao.selectByPrimaryKey(connId);
	}

	public ConnJrnMapper getConnJrnDao() {
		return connJrnDao;
	}

	@Autowired
	public void setConnJrnDao(ConnJrnMapper connJrnDao) {
		this.connJrnDao = connJrnDao;
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
