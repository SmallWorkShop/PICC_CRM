package com.zzfly.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.zzfly.utils.PageModel;

/**
 * 
 * 险种信息表模型
 * 
 * @author zhengz.fly
 * 
 */
public class InsInfo implements Serializable {
	private Integer insId;

	private String insNme;

	private String insKnd;

	private BigDecimal insAmt;

	private String insSts;

	private BigDecimal insSAmt;

	private String insLim;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private PageModel<InsInfo> pageModel;// 分页

	public Integer getInsId() {
		return insId;
	}

	public void setInsId(Integer insId) {
		this.insId = insId;
	}

	public String getInsNme() {
		return insNme;
	}

	public void setInsNme(String insNme) {
		this.insNme = insNme == null ? null : insNme.trim();
	}

	public String getInsKnd() {
		return insKnd;
	}

	public void setInsKnd(String insKnd) {
		this.insKnd = insKnd == null ? null : insKnd.trim();
	}

	public BigDecimal getInsAmt() {
		return insAmt;
	}

	public void setInsAmt(BigDecimal insAmt) {
		this.insAmt = insAmt;
	}

	public String getInsSts() {
		return insSts;
	}

	public void setInsSts(String insSts) {
		this.insSts = insSts == null ? null : insSts.trim();
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
		this.insLim = insLim;
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

	public PageModel<InsInfo> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<InsInfo> pageModel) {
		this.pageModel = pageModel;
	}

	@Override
	public String toString() {
		return "InsInfo [insId=" + insId + ", insNme=" + insNme + ", insKnd="
				+ insKnd + ", insAmt=" + insAmt + ", insSts=" + insSts
				+ ", insSAmt=" + insSAmt + ", insLim=" + insLim + ", creDate="
				+ creDate + ", updDate=" + updDate + ", preCol1=" + preCol1
				+ ", preCol2=" + preCol2 + ", preCol3=" + preCol3
				+ ", pageModel=" + pageModel + "]";
	}

}