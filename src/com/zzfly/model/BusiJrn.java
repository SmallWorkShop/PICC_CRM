package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 日志模型
 * 
 * @author zhengz.fly
 * 
 */
public class BusiJrn implements Serializable {
	private Integer jrnNo;

	private Date acDte;

	private String operNo;

	private String operNme;

	private Integer cusId;

	private String plateNo;

	private String frameNo;

	private String cusNme;

	private Integer busierId;

	private String operInfo;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private UserInfo userInfo;

	public Integer getJrnNo() {
		return jrnNo;
	}

	public void setJrnNo(Integer jrnNo) {
		this.jrnNo = jrnNo;
	}

	public Date getAcDte() {
		return acDte;
	}

	public void setAcDte(Date acDte) {
		this.acDte = acDte;
	}

	public String getOperNo() {
		return operNo;
	}

	public void setOperNo(String operNo) {
		this.operNo = operNo == null ? null : operNo.trim();
	}

	public String getOperNme() {
		return operNme;
	}

	public void setOperNme(String operNme) {
		this.operNme = operNme == null ? null : operNme.trim();
	}

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

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo == null ? null : frameNo.trim();
	}

	public String getCusNme() {
		return cusNme;
	}

	public void setCusNme(String cusNme) {
		this.cusNme = cusNme == null ? null : cusNme.trim();
	}

	public Integer getBusierId() {
		return busierId;
	}

	public void setBusierId(Integer busierId) {
		this.busierId = busierId;
	}

	public String getOperInfo() {
		return operInfo;
	}

	public void setOperInfo(String operInfo) {
		this.operInfo = operInfo == null ? null : operInfo.trim();
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

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

}