package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 联系日志模型
 * 
 * @author zhengz.fly
 * 
 */
public class ConnJrn implements Serializable {
	private Integer connId;

	private Integer cusId;

	private Date acDte;

	private Integer connNum;

	private Date nextConn;

	private String connDetail;

	private String sts;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getConnId() {
		return connId;
	}

	public void setConnId(Integer connId) {
		this.connId = connId;
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

	public Integer getConnNum() {
		return connNum;
	}

	public void setConnNum(Integer connNum) {
		this.connNum = connNum;
	}

	public Date getNextConn() {
		return nextConn;
	}

	public void setNextConn(Date nextConn) {
		this.nextConn = nextConn;
	}

	public String getConnDetail() {
		return connDetail;
	}

	public void setConnDetail(String connDetail) {
		this.connDetail = connDetail == null ? null : connDetail.trim();
	}

	public String getSts() {
		return sts;
	}

	public void setSts(String sts) {
		this.sts = sts == null ? null : sts.trim();
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