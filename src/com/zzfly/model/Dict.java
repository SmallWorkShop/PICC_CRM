package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 数据字典模型
 * 
 * @author zhengz.fly
 * 
 */
public class Dict implements Serializable {
	private Integer dictId;

	private String dictKnd;

	private String dictKndNme;

	private String dictCode;

	private String dictNme;

	private String distPCode;

	private String distPNme;

	private String distSts;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getDictId() {
		return dictId;
	}

	public void setDictId(Integer dictId) {
		this.dictId = dictId;
	}

	public String getDictKnd() {
		return dictKnd;
	}

	public void setDictKnd(String dictKnd) {
		this.dictKnd = dictKnd == null ? null : dictKnd.trim();
	}

	public String getDictKndNme() {
		return dictKndNme;
	}

	public void setDictKndNme(String dictKndNme) {
		this.dictKndNme = dictKndNme == null ? null : dictKndNme.trim();
	}

	public String getDictCode() {
		return dictCode;
	}

	public void setDictCode(String dictCode) {
		this.dictCode = dictCode == null ? null : dictCode.trim();
	}

	public String getDictNme() {
		return dictNme;
	}

	public void setDictNme(String dictNme) {
		this.dictNme = dictNme == null ? null : dictNme.trim();
	}

	public String getDistPCode() {
		return distPCode;
	}

	public void setDistPCode(String distPCode) {
		this.distPCode = distPCode == null ? null : distPCode.trim();
	}

	public String getDistPNme() {
		return distPNme;
	}

	public void setDistPNme(String distPNme) {
		this.distPNme = distPNme == null ? null : distPNme.trim();
	}

	public String getDistSts() {
		return distSts;
	}

	public void setDistSts(String distSts) {
		this.distSts = distSts == null ? null : distSts.trim();
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