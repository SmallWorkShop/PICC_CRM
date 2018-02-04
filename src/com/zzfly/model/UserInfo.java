package com.zzfly.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import com.zzfly.utils.PageModel;

/**
 * 用户信息模型
 * 
 * @author zhengz.fly
 * 
 */
public class UserInfo implements Serializable {

	private Integer uId;

	private String uCode;

	private String uPwd;

	private Integer uPId;

	private String uTyp;

	private String uSts;

	private String uSSts;

	private String uAddr;

	private String uScop;

	private String uRole;

	private String uNme;

	private String uTpId;

	private String uTel;

	private String uPho;

	private Date creDate;

	private Date updDate;

	private String preCol1;

	private String preCol2;

	private String preCol3;

	private Set<RoleInfo> roleInfos;// 角色

	private Set<Right> rights;// 权限

	private Set<Func> funcs;// 功能

	private PageModel<UserInfo> pageModel;// 分页

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuCode() {
		return uCode;
	}

	public void setuCode(String uCode) {
		this.uCode = uCode;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public Integer getuPId() {
		return uPId;
	}

	public void setuPId(Integer uPId) {
		this.uPId = uPId;
	}

	public String getuTyp() {
		return uTyp;
	}

	public void setuTyp(String uTyp) {
		this.uTyp = uTyp;
	}

	public String getuSts() {
		return uSts;
	}

	public void setuSts(String uSts) {
		this.uSts = uSts;
	}

	public String getuSSts() {
		return uSSts;
	}

	public void setuSSts(String uSSts) {
		this.uSSts = uSSts;
	}

	public String getuAddr() {
		return uAddr;
	}

	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}

	public String getuScop() {
		return uScop;
	}

	public void setuScop(String uScop) {
		this.uScop = uScop;
	}

	public String getuRole() {
		return uRole;
	}

	public void setuRole(String uRole) {
		this.uRole = uRole;
	}

	public String getuNme() {
		return uNme;
	}

	public void setuNme(String uNme) {
		this.uNme = uNme;
	}

	public String getuTpId() {
		return uTpId;
	}

	public void setuTpId(String uTpId) {
		this.uTpId = uTpId;
	}

	public String getuTel() {
		return uTel;
	}

	public void setuTel(String uTel) {
		this.uTel = uTel;
	}

	public String getuPho() {
		return uPho;
	}

	public void setuPho(String uPho) {
		this.uPho = uPho;
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
		this.preCol1 = preCol1;
	}

	public String getPreCol2() {
		return preCol2;
	}

	public void setPreCol2(String preCol2) {
		this.preCol2 = preCol2;
	}

	public String getPreCol3() {
		return preCol3;
	}

	public void setPreCol3(String preCol3) {
		this.preCol3 = preCol3;
	}

	public Set<RoleInfo> getRoleInfos() {
		return roleInfos;
	}

	public void setRoleInfos(Set<RoleInfo> roleInfos) {
		this.roleInfos = roleInfos;
	}

	public Set<Right> getRights() {
		return rights;
	}

	public void setRights(Set<Right> rights) {
		this.rights = rights;
	}

	public Set<Func> getFuncs() {
		return funcs;
	}

	public void setFuncs(Set<Func> funcs) {
		this.funcs = funcs;
	}

	public PageModel<UserInfo> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<UserInfo> pageModel) {
		this.pageModel = pageModel;
	}

	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

}