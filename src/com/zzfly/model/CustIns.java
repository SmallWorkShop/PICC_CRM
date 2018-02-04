package com.zzfly.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.zzfly.utils.PageModel;

/**
 * 
 * 客户险种信息模型
 * 
 * @author zhengz.fly
 * 
 */
public class CustIns implements Serializable {
	private Integer custInsId;

	private Integer cusId;

	private Integer insId;

	private BigDecimal insAmt;

	private BigDecimal insSAmt;

	private String insLim;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private PageModel<CustIns> pageModel;

	private InsInfo insInfo;

	public Integer getCustInsId() {
		return custInsId;
	}

	public void setCustInsId(Integer custInsId) {
		this.custInsId = custInsId;
	}

	public Integer getCusId() {
		return cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public Integer getInsId() {
		return insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
	}

	public BigDecimal getInsAmt() {
		return insAmt;
	}

	public void setInsAmt(BigDecimal insAmt) {
		this.insAmt = insAmt;
	}

	public BigDecimal getInsSAmt() {
		return insSAmt;
	}

	public void setInsSAmt(BigDecimal insSAmt) {
		this.insSAmt = insSAmt;
	}

	public String getInsLim() {
		return insLim;
	}

	public void setInsLim(String insLim) {
		this.insLim = insLim == null ? null : insLim.trim();
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

	public PageModel<CustIns> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<CustIns> pageModel) {
		this.pageModel = pageModel;
	}

	public InsInfo getInsInfo() {
		return insInfo;
	}

	public void setInsInfo(InsInfo insInfo) {
		this.insInfo = insInfo;
	}

}