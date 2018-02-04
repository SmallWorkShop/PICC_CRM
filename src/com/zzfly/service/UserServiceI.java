package com.zzfly.service;

import java.util.List;
import java.util.Map;

import com.zzfly.model.RoleInfo;
import com.zzfly.model.UserInfo;

/**
 * 
 * 用户接口
 * 
 * @author zhengz.fly
 * 
 */
public interface UserServiceI {
	public int insert(UserInfo record);

	public UserInfo selectByPrimaryKey(Integer uId);

	public UserInfo selectUserForLogin(UserInfo userInfo);

	public List<UserInfo> selectUsers(UserInfo userInfo);

	public Map<String, Object> selectUsersPage(UserInfo userInfo);

	public int updateByPrimaryKeySelective(UserInfo record);

	public int deleteByPrimaryKey(Integer uId);

	List<UserInfo> selectSonUsers(UserInfo r);

}
