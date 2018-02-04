package com.zzfly.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.BusiJrnMapper;
import com.zzfly.model.BusiJrn;
import com.zzfly.model.CustInfo;
import com.zzfly.model.CustIns;
import com.zzfly.model.InsInfo;
import com.zzfly.model.InsurInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.BusiJrnService;
import com.zzfly.service.CustInfoService;
import com.zzfly.service.CustInsService;
import com.zzfly.service.InsInfoService;
import com.zzfly.service.InsurInfoService;
import com.zzfly.service.UserServiceI;

/**
 * 业务流程日志业务实现类
 * 
 * @author zhengz.fly
 * 
 */
@Service("busiJrnService")
public class BusiJrnServiceImpl implements BusiJrnService {
	private BusiJrnMapper busiJrnDao;
	private InsurInfoService insurInfoService;
	private CustInsService custInsService;
	private InsInfoService incInfoService;
	private CustInfoService custInfoService;
	private UserServiceI userService;

	public int insert(BusiJrn record) {
		return busiJrnDao.insert(record);
	}

	public int insertSelective(BusiJrn record) {
		return 0;
	}

	public BusiJrn selectByPrimaryKey(Integer jrnNo) {
		return null;
	}

	/**
	 * 业务员签单操作，插入保单信息（传入保单信息以及险种信息的参数）
	 */
	public int insertCustSignBill(InsurInfo i, List<InsInfo> l) {
		int j = 0;
		int k = 0;
		int n = 0;
		int m = 0;
		insurInfoService.delByCusId(i.getCusId());// 添加保单前先删除该客户的唯一一条保单
		j = insurInfoService.insert(i);// 插入一条保单信息
		if (j > 0) {
			custInsService.delByCusId(i.getCusId());// 添加险种前先删除该客户的险种信息
			for (InsInfo in : l) {// 插入该客户选择的险种
				CustIns ci = new CustIns();
				InsInfo ifo = new InsInfo();
				ifo.setPreCol1(in.getPreCol1());
				ci.setCusId(i.getCusId());
				ci.setInsId(incInfoService.findInsInfoByPreCol1(ifo).getInsId());
				ci.setInsAmt(in.getInsAmt());
				ci.setInsSAmt(in.getInsSAmt());
				ci.setInsLim(in.getInsLim());
				ci.setCreDate(new Date());
				ci.setUpdDate(new Date());
				k = k + custInsService.insert(ci);
			}
		}
		if (k > 0) {// 修改客户信息状态为01-待签单
			CustInfo custInfo = new CustInfo();
			custInfo.setCusId(i.getCusId());
			custInfo.setCusSts("01");
			n = custInfoService.updateByPrimaryKeySelective(custInfo);
		}
		if (n > 0) {
			CustInfo f = custInfoService.selectByPrimaryKey(i.getCusId());
			BusiJrn bj = new BusiJrn();
			bj.setAcDte(new Timestamp(new Date().getTime()));
			bj.setOperNo("1000");
			bj.setOperNme("【客户签单】");
			bj.setCusId(f.getCusId());
			bj.setPlateNo(f.getPlateNo());
			bj.setFrameNo(f.getFrameNo());
			bj.setCusNme(f.getCusNme());
			bj.setBusierId(f.getBusierId());
			bj.setOperInfo("业务员签单，填写保单信息并选择险种信息。");
			m = this.insert(bj);
		}
		return m;
	}

	/**
	 * 根据客户ID查询客户信息及客户保单信息以及客户险种信息，用户出单及配送操作
	 */
	public CustInfo findCustInfoForOutBill(CustInfo custInfo) {
		CustInfo ci = new CustInfo();
		InsurInfo ii = new InsurInfo();
		CustIns cusIns = new CustIns();
		UserInfo ui = new UserInfo();
		List<InsurInfo> lInsurInfo = new ArrayList<InsurInfo>();
		List<CustIns> lCustIns = new ArrayList<CustIns>();
		if (custInfo != null) {
			ci = custInfoService.selectByPrimaryKey(custInfo.getCusId());// 查询客户基本信息
			if (ci.getBusierId() != null) {
				ui = userService.selectByPrimaryKey(ci.getBusierId());// 查询客户信息中业务员信息
			}
			ci.setUserInfo(ui);// 设置用户封装到客户类中
			ii.setCusId(custInfo.getCusId());
			lInsurInfo = insurInfoService.loadInsurInfoByInsurInfo(ii);// 查询该客户保单信息
			if (lInsurInfo != null && lInsurInfo.size() != 0) {
				ci.setInsurInfo(lInsurInfo.get(0));// 目前保单与客户信息一一对应，所以可以直接取索引第一个
			}
			cusIns.setCusId(custInfo.getCusId());
			lCustIns = custInsService.loadCustInsByCustIns(cusIns);
			if (lCustIns != null && lCustIns.size() != 0) {
				ci.setlCustIns(lCustIns);
			}
		}
		return ci;
	}

	/**
	 * 出单员进行退回保单操作，并修改客户状态为00-待签单状态，插入日志
	 */
	public int insertCustQuitBill(BusiJrn record) {
		int i = 0;
		int m = -1;
		if (record != null) {
			CustInfo custInfo = new CustInfo();
			custInfo.setCusId(record.getCusId());
			custInfo.setCusSts("00");// 修改客户状态为00-待签单状态
			i = custInfoService.updateByPrimaryKeySelective(custInfo);
			if (i > 0) {
				record.setAcDte(new Timestamp(new Date().getTime()));
				record.setOperNo("2001");
				record.setOperNme("【客户退回】");
				m = this.insert(record);
			}
		}
		return m;
	}

	/**
	 * 出单员出单修改客户信息为待配送状态-并写入日志
	 */
	public int insertCustDistBill(InsurInfo insurInfo, BusiJrn busiJrn,
			Integer uId) {
		InsurInfo ii = new InsurInfo();
		CustInfo ci = new CustInfo();
		int n = 0;
		int m = 0;
		int k = 0;
		ii.setInsurId(insurInfo.getInsurId());// 保单ID
		ii.setDistDate(insurInfo.getDistDate());// 配送日期
		ii.setPreCol1(insurInfo.getPreCol1());// 支付方式
		n = insurInfoService.updateByPrimaryKey(ii);// 修改保单信息
		if (n > 0) {
			ci.setCusId(insurInfo.getCusId());
			ci.setCusSts("02");
			ci.setIssuId(uId);// 保存出单员ID
			m = custInfoService.updateByPrimaryKeySelective(ci);// 修改客户信息为02-待配送状态
			ci = custInfoService.selectByPrimaryKey(ci.getCusId());// 返回最新客户信息
		}
		if (m > 0) {
			busiJrn.setAcDte(new Timestamp(new Date().getTime()));
			busiJrn.setOperNo("2000");
			busiJrn.setOperNme("【客户出单】");
			busiJrn.setPlateNo(ci.getPlateNo());
			busiJrn.setFrameNo(ci.getFrameNo());
			busiJrn.setCusNme(ci.getCusNme());
			busiJrn.setOperInfo("出单员出单，修改配送日期以及填写支付方式，并打印配送单。");
			k = this.insert(busiJrn);
		}
		return k;
	}

	/**
	 * 配送员进行配送确认操作，修改客户信息状态已完成或待出单状态
	 */
	public int insertCustDistBill(CustInfo ci, BusiJrn bj, String flag) {
		int i = -1;
		int k = -1;
		if (flag != null && !"".equals(flag)) {
			if ("suc".equals(flag)) {
				ci.setCusSts("09");// 设置客户状态为09-完成状态
				bj.setOperNo("3002");
				bj.setOperNme("【配送成功】");
				bj.setOperInfo("配送员配送，客户保单配送成功。");
				k = custInfoService.updateByPrimaryKeySelective(ci);
			} else if ("err".equals(flag)) {
				ci.setCusSts("01");// 设置客户状态为01-待出单
				bj.setOperNo("3001");
				bj.setOperNme("【配送失败】");
				k = custInfoService.updateByPrimaryKeySelective(ci);
			}
		}
		ci = custInfoService.selectByPrimaryKey(ci.getCusId());
		bj.setCusId(ci.getCusId());
		bj.setPlateNo(ci.getPlateNo());
		bj.setFrameNo(ci.getFrameNo());
		bj.setCusNme(ci.getCusNme());
		if (k > 0) {
			i = this.insert(bj);
		}
		return i;
	}

	/**
	 * 根据客户ID查询该客户的流程日志
	 */
	public List<BusiJrn> selectCustBusiByBj(BusiJrn bj) {
		List<BusiJrn> lBusiJrn = new ArrayList<BusiJrn>();
		if (bj != null) {
			lBusiJrn = busiJrnDao.selectCustBusiByBj(bj);
		}
		return lBusiJrn;
	}

	public BusiJrnMapper getBusiJrnDao() {
		return busiJrnDao;
	}

	@Autowired
	public void setBusiJrnDao(BusiJrnMapper busiJrnDao) {
		this.busiJrnDao = busiJrnDao;
	}

	public InsurInfoService getInsurInfoService() {
		return insurInfoService;
	}

	@Autowired
	public void setInsurInfoService(InsurInfoService insurInfoService) {
		this.insurInfoService = insurInfoService;
	}

	public CustInsService getCustInsService() {
		return custInsService;
	}

	@Autowired
	public void setCustInsService(CustInsService custInsService) {
		this.custInsService = custInsService;
	}

	public InsInfoService getIncInfoService() {
		return incInfoService;
	}

	@Autowired
	public void setIncInfoService(InsInfoService incInfoService) {
		this.incInfoService = incInfoService;
	}

	public CustInfoService getCustInfoService() {
		return custInfoService;
	}

	@Autowired
	public void setCustInfoService(CustInfoService custInfoService) {
		this.custInfoService = custInfoService;
	}

	public UserServiceI getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}

}
