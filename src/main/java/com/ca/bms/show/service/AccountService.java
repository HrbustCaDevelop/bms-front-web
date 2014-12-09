package com.ca.bms.show.service;

import java.util.Map;

import com.ca.bms.entitys.UserEntity;


/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:24:14
 * @version:1.0
 */
public interface AccountService {
	/**
	 * 用户登陆
	 * @param user
	*/
	Map<String, Object> login(UserEntity user);
}
