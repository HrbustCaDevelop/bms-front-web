package com.ca.bms.show.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.ca.bms.dto.SensorDTO;
import com.ca.bms.entitys.UserEntity;
import com.ca.bms.enumtype.UserStatusEnum;
import com.ca.bms.msg.dto.ReturnMsgSensorDTO;
import com.ca.bms.msg.dto.ReturnMsgUserDTO;
import com.ca.bms.show.service.AccountService;
import com.ca.bms.show.utils.HttpClientUtils;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:47
 * @version:1.0
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService{
	
	private static final String URL_HEADER = "http://192.168.0.1/bms/user/";
	
	public boolean register(UserEntity user) {
		String URL = URL_HEADER + "add";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", user.getUsername());
		paramsMap.put("password", user.getPassword());
		paramsMap.put("nickname", user.getNickname());
		paramsMap.put("phonenum", user.getPhoneNum());
		ReturnMsgUserDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap), ReturnMsgUserDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.RS.getValue())) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	public Map<String, Object> login(UserEntity user) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String URL = URL_HEADER + "login";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", user.getUsername());
		paramsMap.put("password", user.getPassword());
		ReturnMsgUserDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap), ReturnMsgUserDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.LS.getValue())) {
				returnMap.put("usertoken", rmud.getUsertoken());
				returnMap.put("userdata", rmud.getUserdata());
			}else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return returnMap;
	}

	@Override
	public List<SensorDTO> getSensor(String username, String usertoken) {
		List<SensorDTO> returnList = new ArrayList<SensorDTO>();
		String URL = URL_HEADER + "mysensor";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		paramsMap.put("usertoken", usertoken);
		ReturnMsgSensorDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap), ReturnMsgSensorDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.FS.getValue())) {
				returnList = rmud.getSensor();
			}else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return returnList;
	}



}
