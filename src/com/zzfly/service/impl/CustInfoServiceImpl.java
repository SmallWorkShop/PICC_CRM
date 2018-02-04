package com.zzfly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.CustInfoMapper;
import com.zzfly.dao.UserInfoMapper;
import com.zzfly.model.CustInfo;
import com.zzfly.model.InsurInfo;
import com.zzfly.model.UserInfo;
import com.zzfly.service.CustInfoService;
import com.zzfly.utils.PageModel;

/**
 * 客户信息业务逻辑
 * 
 * @author zhengz.fly
 * 
 */
@Service("custInfoService")
public class CustInfoServiceImpl implements CustInfoService {
	private CustInfoMapper custInfoDao;
	private UserInfoMapper userInfoDao;
	Set<Integer> set = new HashSet<Integer>();

	/**
	 * 插入客户信息
	 */
	public int insert(CustInfo record) {
		CustInfo c = new CustInfo();
		PageModel<CustInfo> pm = new PageModel<CustInfo>();
		pm.setOffset(-2);
		pm.setPageSize(-2);
		c.setPageModel(pm);
		c.setPlateNo(record.getPlateNo());
		if (custInfoDao.findByCustInfo(c) != null
				&& custInfoDao.findByCustInfo(c).size() != 0) {
			return -2;
		}
		return custInfoDao.insert(record);
	}

	/**
	 * 查询客户信息返回list
	 */
	public List<CustInfo> findByCustInfo(CustInfo r) {
		return custInfoDao.findByCustInfo(r);
	}

	/**
	 * 查询客户信息返回Map
	 */
	public Map<String, Object> findByCustInfoMap(CustInfo r) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", custInfoDao.selectCounts(r));
		map.put("rows", custInfoDao.findByCustInfo(r));
		return map;
	}

	/**
	 * 模糊查询客户信息返回Map
	 */
	public Map<String, Object> findLikeCustInfo(CustInfo r) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", custInfoDao.selectCountsOfLike(r));
		map.put("rows", custInfoDao.findByCustInfoLike(r));
		return map;
	}

	/**
	 * 查询下属客户返回分页Map
	 */
	public Map<String, Object> findCustInfoForUpd(CustInfo r, Integer uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		String str = "";
		Set<Integer> s = new HashSet<Integer>();
		if (r.getBusierId() == null) {
			s = reFindUid(uid);
			for (int index : s) {
				str = str + "," + index;
			}
		} else {
			str = str + "," + r.getBusierId().toString();
		}
		map.put("total",
				custInfoDao.selectCountsForUpd(r,
						str.substring(1, str.length())));
		map.put("rows",
				custInfoDao.findCustInfoForUpd(r,
						str.substring(1, str.length())));
		return map;
	}

	/**
	 * 查询客户信息用于客户出单操作（出单员暂时不需要根据用户ID递归查下属客户待出单客户）
	 */
	public Map<String, Object> findCustInfoForOut(CustInfo r, Integer uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		// String str = "";
		// Set<Integer> s = new HashSet<Integer>();
		// if (r.getBusierId() == null) {
		// s = reFindUid(uid);
		// for (int index : s) {
		// str = str + "," + index;
		// }
		// } else {
		// str = str + "," + r.getBusierId().toString();
		// }
		map.put("total", custInfoDao.selectCountsForUpd(r, null));
		map.put("rows", custInfoDao.findCustInfoForUpd(r, null));
		return map;
	}

	/**
	 * 根据配送员的辖区等相关信息查询相关辖区下的待配送客户信息
	 */
	public Map<String, Object> findCustInfoForDist(CustInfo r, Integer uId) {
		UserInfo u = new UserInfo();
		InsurInfo ii = new InsurInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		if (uId != null) {
			u = userInfoDao.selectByPrimaryKey(uId);// 判断是否选择了配送员，如没选择就查询所有配送池里面的客户信息
		}
		ii.setAddr(u.getuScop());
		r.setInsurInfo(ii);
		map.put("total", custInfoDao.selectCountsForUpd(r, null));
		map.put("rows", custInfoDao.findCustInfoForUpd(r, null));
		return map;
	}

	/**
	 * 根据客户状态及业务员ID查询该业务员需要待联系的客户，用于提醒
	 */
	public List<CustInfo> findCustInfoForConn(CustInfo ci) {
		return custInfoDao.findCustInfoForConn(ci);
	}

	/**
	 * 递归查询下属用户Id
	 * 
	 * @param uId
	 * @return
	 */
	public Set<Integer> reFindUid(Integer uId) {
		UserInfo userInfo = new UserInfo();
		PageModel<UserInfo> pm = new PageModel<UserInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		userInfo.setPageModel(pm);
		userInfo.setuPId(uId);
		// set.add(uId);
		if (userInfoDao.selectUsers(userInfo) != null
				&& userInfoDao.selectUsers(userInfo).size() != 0) {
			for (UserInfo u : userInfoDao.selectUsers(userInfo)) {
				set.add(u.getuId());
				set.addAll(reFindUid(u.getuId()));
			}
		}
		return set;
	}

	/**
	 * 主键cusId查询客户基本信息
	 */
	public CustInfo selectByPrimaryKey(Integer cusId) {
		return this.custInfoDao.selectByPrimaryKey(cusId);
	}

	/**
	 * 主键cusId查询客户的所有信息(基本信息、保单信息、险种信息、业务员、出单员、配送员等信息)
	 */
	public CustInfo selectCustParticularInfo(Integer cusId) {
		return this.custInfoDao.selectCustParticularInfo(cusId);
	}

	/**
	 * 通过主键cusId客户基本信息，不为空则修改
	 */
	public int updateByPrimaryKeySelective(CustInfo record) {
		return this.custInfoDao.updateByPrimaryKeySelective(record);
	}

	/**
	 * 通过主键删除客户信息（暂时还未开发连带删除客户其他的保单或险种信息）
	 */
	public int deleteByPrimaryKey(Integer cusId) {
		return this.custInfoDao.deleteByPrimaryKey(cusId);
	}

	/**
	 * 批量插入客户信息（入参是客户信息的list集合）
	 */
	public Map<String, Object> batchInsertCustInfo(List<CustInfo> lCustInfo,
			Integer uId) {
		Map<String, Object> m = new HashMap<String, Object>();
		int i = 0;
		int j = 0;
		List<String> lPlateNo = new ArrayList<String>();
		if (lCustInfo != null && lCustInfo.size() != 0) {
			// CustInfo ci = new CustInfo();
			for (CustInfo ci : lCustInfo) {
				ci.setBusierId(uId);
				ci.setCusSts("00");// 默认待签单状态
				j = this.insert(ci);
				if (j > 0) {
					i += j;
				} else {
					lPlateNo.add(ci.getPlateNo());
				}
			}
		}
		m.put("record", i);
		m.put("errRecord", lPlateNo);
		return m;
	}

	public CustInfoMapper getCustInfoDao() {
		return custInfoDao;
	}

	@Autowired
	public void setCustInfoDao(CustInfoMapper custInfoDao) {
		this.custInfoDao = custInfoDao;
	}

	public UserInfoMapper getUserInfoDao() {
		return userInfoDao;
	}

	@Autowired
	public void setUserInfoDao(UserInfoMapper userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

}
