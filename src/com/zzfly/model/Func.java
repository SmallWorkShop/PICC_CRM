package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * 功能菜单模型
 * 
 * @author zhengz.fly
 * 
 */
public class Func implements Serializable {

	private Integer funcId;

	private String funcCode;

	private String funcNme;

	private String funcSNme;

	private Integer pFuncId;

	private String pFuncCode;

	private String funcImg;

	private String funcUrl;

	private String funcSts;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	public Integer getFuncId() {
		return funcId;
	}

	public void setFuncId(Integer funcId) {
		this.funcId = funcId;
	}

	public String getFuncCode() {
		return funcCode;
	}

	public void setFuncCode(String funcCode) {
		this.funcCode = funcCode == null ? null : funcCode.trim();
	}

	public String getFuncNme() {
		return funcNme;
	}

	public void setFuncNme(String funcNme) {
		this.funcNme = funcNme == null ? null : funcNme.trim();
	}

	public String getFuncSNme() {
		return funcSNme;
	}

	public void setFuncSNme(String funcSNme) {
		this.funcSNme = funcSNme == null ? null : funcSNme.trim();
	}

	public Integer getpFuncId() {
		return pFuncId;
	}

	public void setpFuncId(Integer pFuncId) {
		this.pFuncId = pFuncId;
	}

	public String getpFuncCode() {
		return pFuncCode;
	}

	public void setpFuncCode(String pFuncCode) {
		this.pFuncCode = pFuncCode == null ? null : pFuncCode.trim();
	}

	public String getFuncImg() {
		return funcImg;
	}

	public void setFuncImg(String funcImg) {
		this.funcImg = funcImg == null ? null : funcImg.trim();
	}

	public String getFuncUrl() {
		return funcUrl;
	}

	public void setFuncUrl(String funcUrl) {
		this.funcUrl = funcUrl == null ? null : funcUrl.trim();
	}

	public String getFuncSts() {
		return funcSts;
	}

	public void setFuncSts(String funcSts) {
		this.funcSts = funcSts == null ? null : funcSts.trim();
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

	public Func() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Func(Integer funcId, String funcCode, String funcNme,
			String funcSNme, Integer pFuncId, String pFuncCode, String funcImg,
			String funcUrl, String funcSts, Date creDate, Date updDate,
			String preCol1, String preCol2, String preCol3) {
		super();
		this.funcId = funcId;
		this.funcCode = funcCode;
		this.funcNme = funcNme;
		this.funcSNme = funcSNme;
		this.pFuncId = pFuncId;
		this.pFuncCode = pFuncCode;
		this.funcImg = funcImg;
		this.funcUrl = funcUrl;
		this.funcSts = funcSts;
		this.creDate = creDate;
		this.updDate = updDate;
		this.preCol1 = preCol1;
		this.preCol2 = preCol2;
		this.preCol3 = preCol3;
	}

}