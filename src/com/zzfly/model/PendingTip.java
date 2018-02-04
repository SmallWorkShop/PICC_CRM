package com.zzfly.model;

/**
 * 提示类封装
 * 
 * @author zhengz.fly
 * 
 */
public class PendingTip {
	private Boolean prConn;
	private Boolean prSign;
	private Boolean prOut;
	private Boolean prDist;
	private String connList;
	private String signList;
	private String outList;
	private String distList;

	public PendingTip() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PendingTip(Boolean prConn, Boolean prSign, Boolean prOut,
			Boolean prDist, String connList, String signList, String outList,
			String distList) {
		super();
		this.prConn = prConn;
		this.prSign = prSign;
		this.prOut = prOut;
		this.prDist = prDist;
		this.connList = connList;
		this.signList = signList;
		this.outList = outList;
		this.distList = distList;
	}

	public Boolean getPrConn() {
		return prConn;
	}

	public void setPrConn(Boolean prConn) {
		this.prConn = prConn;
	}

	public Boolean getPrSign() {
		return prSign;
	}

	public void setPrSign(Boolean prSign) {
		this.prSign = prSign;
	}

	public Boolean getPrOut() {
		return prOut;
	}

	public void setPrOut(Boolean prOut) {
		this.prOut = prOut;
	}

	public Boolean getPrDist() {
		return prDist;
	}

	public void setPrDist(Boolean prDist) {
		this.prDist = prDist;
	}

	public String getConnList() {
		return connList;
	}

	public void setConnList(String connList) {
		this.connList = connList;
	}

	public String getSignList() {
		return signList;
	}

	public void setSignList(String signList) {
		this.signList = signList;
	}

	public String getOutList() {
		return outList;
	}

	public void setOutList(String outList) {
		this.outList = outList;
	}

	public String getDistList() {
		return distList;
	}

	public void setDistList(String distList) {
		this.distList = distList;
	}

	@Override
	public String toString() {
		return "PendingTip [prConn=" + prConn + ", prSign=" + prSign
				+ ", prOut=" + prOut + ", prDist=" + prDist + ", connList="
				+ connList + ", signList=" + signList + ", outList=" + outList
				+ ", distList=" + distList + "]";
	}

}
