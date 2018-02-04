package com.zzfly.service.impl;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzfly.dao.InsInfoMapper;
import com.zzfly.model.InsInfo;
import com.zzfly.service.InsInfoService;
import com.zzfly.utils.PageModel;

/**
 * 险种信息业务逻辑
 * 
 * @author bcy.fly
 * 
 */
@Service("incInfoService")
public class InsInfoServiceImpl implements InsInfoService {
	private InsInfoMapper insInfoDao;

	/**
	 * 增加一条险种信息
	 */
	@Override
	public int insert(InsInfo insInfo) {
		// TODO Auto-generated method stub
		PageModel<InsInfo> pm = new PageModel<InsInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		InsInfo insur = new InsInfo();
		insur.setInsNme(insInfo.getInsNme());
		insur.setPreCol1(insInfo.getPreCol1());
		insur.setPageModel(pm);
		if (insInfoDao.loadByInsInfo(insur) != null
				&& insInfoDao.loadByInsInfo(insur).size() != 0) {// 根据险种名称查询是否已经配置
			return -2;
		}
		return insInfoDao.insert(insInfo);
	}

	/**
	 * 根据险种自增ID删除该条险种信息
	 * 
	 * */
	@Override
	public int delById(Integer id) {// 备注：是否可以直接传个ID的数组 一次删除多个
		// TODO Auto-generated method stub
		return insInfoDao.deleteByPrimaryKey(id);
	}

	/**
	 * 分页查询险种信息 如果传参数则根据传的参数查询 例如： INS_NME 险种名称 VARCHAR(255) INS_KND 险种大类
	 * CHAR(2) 00:车船税 01：交强险 02：商业险
	 * */
	@Override
	public Map<String, Object> loadInsInfoByPage(InsInfo insInfo) {
		// TODO Auto-generated method stub
		InsInfo insur = new InsInfo();
		insur.setInsNme(insInfo.getInsNme());
		insur.setInsKnd(insInfo.getInsKnd());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", insInfoDao.selectCount(insur));
		map.put("rows", insInfoDao.loadByInsInfo(insur));
		return map;
	}

	/**
	 * 根据险种代码查询险种信息 入参险种代码封装成险种对象传入
	 */
	public InsInfo findInsInfoByPreCol1(InsInfo insInfo) {
		PageModel<InsInfo> pm = new PageModel<InsInfo>();
		pm.setOffset(-1);
		pm.setPageSize(-1);
		insInfo.setPageModel(pm);
		if (insInfoDao.loadByInsInfo(insInfo) != null
				&& insInfoDao.loadByInsInfo(insInfo).size() != 0) {
			return insInfoDao.loadByInsInfo(insInfo).get(0);
		}
		return null;
	}

	/**
	 * 更新险种信息
	 * */
	@Override
	public int updateByPrimaryKey(InsInfo insInfo) {
		// TODO Auto-generated method stub
		return insInfoDao.updateByPrimaryKey(insInfo);
	}

	public InsInfoMapper getInsInfoDao() {
		return insInfoDao;
	}

	@Autowired
	public void setInsInfoDao(InsInfoMapper insInfoDao) {
		this.insInfoDao = insInfoDao;
	}

}
