package com.ca.bms.show.service;

import java.util.List;
import java.util.Map;

import com.ca.bms.dto.SensorDTO;
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
	public Map<String, Object> login(UserEntity user);
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	*/
	public boolean register(UserEntity user);
	
	/**
	 * 获取用户传感器
	 * @return
	*/
	public List<SensorDTO> getSensor(String username, String usertoken);
	
	public boolean update(String username, String usertoken);
}
