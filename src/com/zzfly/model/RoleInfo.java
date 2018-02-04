package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 角色信息表模型
 * 
 * @author zhengz.fly
 * 
 */
public class RoleInfo implements Serializable {

	private Integer rId;

	private String rCode;

	private String rNme;

	private String rSts;

	private String rRight;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getrId() {
		return rId;
	}

	public void setrId(Integer rId) {
		this.rId = rId;
	}

	public String getrCode() {
		return rCode;
	}

	public void setrCode(String rCode) {
		this.rCode = rCode == null ? null : rCode.trim();
	}

	public String getrNme() {
		return rNme;
	}

	public void setrNme(String rNme) {
		this.rNme = rNme == null ? null : rNme.trim();
	}

	public String getrSts() {
		return rSts;
	}

	public void setrSts(String rSts) {
		this.rSts = rSts == null ? null : rSts.trim();
	}

	public String getrRight() {
		return rRight;
	}

	public void setrRight(String rRight) {
		this.rRight = rRight == null ? null : rRight.trim();
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

	public RoleInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoleInfo(Integer rId, String rCode, String rNme, String rSts,
			String rRight, Date creDate, Date updDate, String preCol1,
			String preCol2, String preCol3) {
		super();
		this.rId = rId;
		this.rCode = rCode;
		this.rNme = rNme;
		this.rSts = rSts;
		this.rRight = rRight;
		this.creDate = creDate;
		this.updDate = updDate;
		this.preCol1 = preCol1;
		this.preCol2 = preCol2;
		this.preCol3 = preCol3;
	}

}