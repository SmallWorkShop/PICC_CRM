package com.zzfly.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
 * 维修保养信息模型
 * 
 * @author zhengz.fly
 * 
 */
public class ServInfo implements Serializable {
	private Integer servId;

	private Integer cusId;

	private Date acDte;

	private String dealCod;

	private String dealNme;

	private String addr;

	private BigDecimal amt;

	private String dealInfo;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getServId() {
		return servId;
	}

	public void setServId(Integer servId) {
		this.servId = servId;
	}

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public Date getAcDte() {
		return acDte;
	}

	public void setAcDte(Date acDte) {
		this.acDte = acDte;
	}

	public String getDealCod() {
		return dealCod;
	}

	public void setDealCod(String dealCod) {
		this.dealCod = dealCod == null ? null : dealCod.trim();
	}

	public String getDealNme() {
		return dealNme;
	}

	public void setDealNme(String dealNme) {
		this.dealNme = dealNme == null ? null : dealNme.trim();
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr == null ? null : addr.trim();
	}

	public BigDecimal getAmt() {
		return amt;
	}

	public void setAmt(BigDecimal amt) {
		this.amt = amt;
	}

	public String getDealInfo() {
		return dealInfo;
	}

	public void setDealInfo(String dealInfo) {
		this.dealInfo = dealInfo == null ? null : dealInfo.trim();
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
}