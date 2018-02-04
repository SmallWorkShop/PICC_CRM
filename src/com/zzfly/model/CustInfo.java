package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.zzfly.utils.PageModel;

/**
 * 
 * 客户信息模型
 * 
 * @author zhengz.fly
 * 
 */
public class CustInfo implements Serializable {
	private Integer cusId;

	private String plateNo;

	private String brand;

	private String brandTyp;

	private String frameNo;

	private String engineNo;

	private String cusIdNo;

	private String cusNme;

	private String cusAddr;

	private String cusTel;

	private String cusPhon;

	private String logDate;

	private String cusSts;

	private Integer busierId;

	private Integer issuId;

	private Integer distId;

	private Integer insurId;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private PageModel<CustInfo> pageModel;

	private InsurInfo insurInfo;

	private List<CustIns> lCustIns;

	private UserInfo userInfo;
	
	private UserInfo userInfo2;
	
	private UserInfo userInfo3;

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public String getPlateNo() {
		return plateNo;
	}

	public void setPlateNo(String plateNo) {
		this.plateNo = plateNo == null ? null : plateNo.trim();
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand == null ? null : brand.trim();
	}

	public String getBrandTyp() {
		return brandTyp;
	}

	public void setBrandTyp(String brandTyp) {
		this.brandTyp = brandTyp == null ? null : brandTyp.trim();
	}

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo == null ? null : frameNo.trim();
	}

	public String getEngineNo() {
		return engineNo;
	}

	public void setEngineNo(String engineNo) {
		this.engineNo = engineNo == null ? null : engineNo.trim();
	}

	public String getCusIdNo() {
		return cusIdNo;
	}

	public void setCusIdNo(String cusIdNo) {
		this.cusIdNo = cusIdNo == null ? null : cusIdNo.trim();
	}

	public String getCusNme() {
		return cusNme;
	}

	public void setCusNme(String cusNme) {
		this.cusNme = cusNme == null ? null : cusNme.trim();
	}

	public String getCusAddr() {
		return cusAddr;
	}

	public void setCusAddr(String cusAddr) {
		this.cusAddr = cusAddr == null ? null : cusAddr.trim();
	}

	public String getCusTel() {
		return cusTel;
	}

	public void setCusTel(String cusTel) {
		this.cusTel = cusTel == null ? null : cusTel.trim();
	}

	public String getCusPhon() {
		return cusPhon;
	}

	public void setCusPhon(String cusPhon) {
		this.cusPhon = cusPhon == null ? null : cusPhon.trim();
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate == null ? null : logDate.trim();
	}

	public String getCusSts() {
		return cusSts;
	}

	public void setCusSts(String cusSts) {
		this.cusSts = cusSts == null ? null : cusSts.trim();
	}

	public Integer getBusierId() {
		return busierId;
	}

	public void setBusierId(Integer busierId) {
		this.busierId = busierId;
	}

	public Integer getIssuId() {
		return issuId;
	}

	public void setIssuId(Integer issuId) {
		this.issuId = issuId;
	}

	public Integer getDistId() {
		return distId;
	}

	public void setDistId(Integer distId) {
		this.distId = distId;
	}

	public Integer getInsurId() {
		return insurId;
	}

	public void setInsurId(Integer insurId) {
		this.insurId = insurId;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getUpdDate() {
		return updDate;
	}

	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}

	public String getPreCol1() {
		return preCol1;
	}

	public void setPreCol1(String preCol1) {
		this.preCol1 = preCol1 == null ? null : preCol1.trim();
	}

	public String getPreCol2() {
		return preCol2;
	}

	public void setPreCol2(String preCol2) {
		this.preCol2 = preCol2 == null ? null : preCol2.trim();
	}

	public String getPreCol3() {
		return preCol3;
	}

	public void setPreCol3(String preCol3) {
		this.preCol3 = preCol3 == null ? null : preCol3.trim();
	}

	public PageModel<CustInfo> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<CustInfo> pageModel) {
		this.pageModel = pageModel;
	}

	public InsurInfo getInsurInfo() {
		return insurInfo;
	}

	public void setInsurInfo(InsurInfo insurInfo) {
		this.insurInfo = insurInfo;
	}

	public List<CustIns> getlCustIns() {
		return lCustIns;
	}

	public void setlCustIns(List<CustIns> lCustIns) {
		this.lCustIns = lCustIns;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public UserInfo getUserInfo2() {
		return userInfo2;
	}

	public void setUserInfo2(UserInfo userInfo2) {
		this.userInfo2 = userInfo2;
	}

	public UserInfo getUserInfo3() {
		return userInfo3;
	}

	public void setUserInfo3(UserInfo userInfo3) {
		this.userInfo3 = userInfo3;
	}

	public String toString() {
		return "CustInfo [cusId=" + cusId + ", plateNo=" + plateNo + ", brand="
				+ brand + ", brandTyp=" + brandTyp + ", frameNo=" + frameNo
				+ ", engineNo=" + engineNo + ", cusIdNo=" + cusIdNo
				+ ", cusNme=" + cusNme + ", cusAddr=" + cusAddr + ", cusTel="
				+ cusTel + ", cusPhon=" + cusPhon + ", logDate=" + logDate
				+ ", cusSts=" + cusSts + ", busierId=" + busierId + ", issuId="
				+ issuId + ", distId=" + distId + ", insurId=" + insurId
				+ ", creDate=" + creDate + ", updDate=" + updDate
				+ ", preCol1=" + preCol1 + ", preCol2=" + preCol2
				+ ", preCol3=" + preCol3 + "]";
	}

}