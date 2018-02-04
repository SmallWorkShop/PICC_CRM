package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 权限表模型
 * 
 * @author zhengz.fly
 * 
 */
public class Right implements Serializable {

	private Integer trId;

	private Integer rId;

	private Integer funcId;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getTrId() {
		return trId;
	}

	public void setTrId(Integer trId) {
		this.trId = trId;
	}

	public Integer getrId() {
		return rId;
	}

	public void setrId(Integer rId) {
		this.rId = rId;
	}

	public Integer getFuncId() {
		return funcId;
	}

	public void setFuncId(Integer funcId) {
		this.funcId = funcId;
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

	public Right() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Right(Integer trId, Integer rId, Integer funcId, Date creDate,
			Date updDate, String preCol1, String preCol2, String preCol3) {
		super();
		this.trId = trId;
		this.rId = rId;
		this.funcId = funcId;
		this.creDate = creDate;
		this.updDate = updDate;
		this.preCol1 = preCol1;
		this.preCol2 = preCol2;
		this.preCol3 = preCol3;
	}

}