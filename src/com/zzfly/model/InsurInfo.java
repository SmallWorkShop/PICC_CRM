package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

import com.zzfly.utils.PageModel;

/**
 * 
 * 保单信息模型
 * 
 * @author zhengz.fly
 * 
 */
public class InsurInfo implements Serializable {
	private Integer insurId;

	private Integer cusId;

	private Date stDate;

	private Date exDate;

	private String insurCom;

	private String chl;

	private String addr;

	private String distDate;

	private String gift;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private PageModel<InsurInfo> pageModel;// 分页

	public Integer getInsurId() {
		return insurId;
	}

	public void setInsurId(Integer insurId) {
		this.insurId = insurId;
	}

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public Date getStDate() {
		return stDate;
	}

	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}

	public Date getExDate() {
		return exDate;
	}

	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}

	public String getInsurCom() {
		return insurCom;
	}

	public void setInsurCom(String insurCom) {
		this.insurCom = insurCom == null ? null : insurCom.trim();
	}

	public String getChl() {
		return chl;
	}

	public void setChl(String chl) {
		this.chl = chl == null ? null : chl.trim();
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr == null ? null : addr.trim();
	}

	public String getDistDate() {
		return distDate;
	}

	public void setDistDate(String distDate) {
		this.distDate = distDate == null ? null : distDate.trim();
	}

	public String getGift() {
		return gift;
	}

	public void setGift(String gift) {
		this.gift = gift == null ? null : gift.trim();
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

	public PageModel<InsurInfo> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<InsurInfo> pageModel) {
		this.pageModel = pageModel;
	}

	@Override
	public String toString() {
		return "InsurInfo [insurId=" + insurId + ", cusId=" + cusId
				+ ", stDate=" + stDate + ", exDate=" + exDate + ", insurCom="
				+ insurCom + ", chl=" + chl + ", addr=" + addr + ", distDate="
				+ distDate + ", gift=" + gift + ", creDate=" + creDate
				+ ", updDate=" + updDate + ", preCol1=" + preCol1
				+ ", preCol2=" + preCol2 + ", preCol3=" + preCol3
				+ ", pageModel=" + pageModel + "]";
	}

}