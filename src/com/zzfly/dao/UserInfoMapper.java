package com.zzfly.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzfly.model.UserInfo;

/**
 * 
 * 用户信息DAO
 * 
 * @author zhengz.fly
 * 
 */
@Repository("userInfoDao")
public interface UserInfoMapper {
	int deleteByPrimaryKey(Integer uId);

	int insert(UserInfo record);

	int insertSelective(UserInfo record);

	UserInfo selectByPrimaryKey(Integer uId);

	int updateByPrimaryKeySelective(UserInfo record);

	int updateByPrimaryKey(UserInfo record);

	UserInfo selectUserForLogin(UserInfo userInfo);

	List<UserInfo> selectUsers(UserInfo userInfo);

	int selectCount(UserInfo userInfo);
}