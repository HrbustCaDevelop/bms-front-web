package com.ca.bms.show.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.ca.bms.dto.SensorDTO;
import com.ca.bms.entitys.UserEntity;
import com.ca.bms.enumtype.SensorStatusEnum;
import com.ca.bms.enumtype.UserStatusEnum;
import com.ca.bms.msg.dto.ReturnMsgDTO;
import com.ca.bms.msg.dto.ReturnMsgSensorDTO;
import com.ca.bms.msg.dto.ReturnMsgUserDTO;
import com.ca.bms.show.service.AccountService;
import com.ca.bms.show.utils.HttpClientUtils;
import com.ca.bms.show.utils.HttpTarget;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:47
 * @version:1.0
 */
@Service("accountService")
public class AccountServiceImpl extends HttpTarget implements AccountService {

	public boolean register(UserEntity user) {
		String URL = HOSTNAME + SERVER_PATH + "user/add";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", user.getUsername());
		paramsMap.put("password", user.getPassword());
		paramsMap.put("nickname", user.getNickname());
		paramsMap.put("phonenum", user.getPhoneNum());
		ReturnMsgUserDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgUserDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.RS.getValue())) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public Map<String, Object> login(UserEntity user) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String URL = HOSTNAME + SERVER_PATH + "user/login";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", user.getUsername());
		paramsMap.put("password", user.getPassword());
		ReturnMsgUserDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgUserDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.LS.getValue())) {
				returnMap.put("usertoken", rmud.getUsertoken());
				returnMap.put("userdata", rmud.getUserdata());
			} else {
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
		String URL = HOSTNAME + SERVER_PATH + "user/mysensor";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		paramsMap.put("usertoken", usertoken);
		ReturnMsgSensorDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgSensorDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.FS.getValue())) {
				returnList = rmud.getSensor();
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
		return returnList;
	}

	@Override
	public boolean update(String usertoken, UserEntity entity) {
		String URL = HOSTNAME + SERVER_PATH + "user/update";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", entity.getUsername());
		paramsMap.put("password", entity.getPassword());
		paramsMap.put("nickname", entity.getNickname());
		paramsMap.put("phonenum", entity.getPhoneNum());
		paramsMap.put("usertoken", usertoken);
		ReturnMsgDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.US.getValue())) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean checkusername(String username) {
		String URL = HOSTNAME + SERVER_PATH + "user/checkusername";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		ReturnMsgDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgDTO.class);
			if (rmud.getReturnmsg().trim().equals(UserStatusEnum.ACBU.getValue())) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Map<String, String> regsensor(String username, String usertoken, String serialnum) {
		Map<String, String> returnMap = new HashMap<String, String>();
		String URL = HOSTNAME + SERVER_PATH + "user/regsensor";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		paramsMap.put("usertoken", usertoken);
		paramsMap.put("serialnum", serialnum);
		ReturnMsgDTO dto;
		try {
			dto = JSON.parseObject(HttpClientUtils.doPost(URL, paramsMap),
					ReturnMsgDTO.class);
			if (dto.getReturnmsg().trim().equals(SensorStatusEnum.RS.getDisplayName())) {
				returnMap.put("result", "1");
			} else {
				returnMap.put("result", "0");
				returnMap.put("reason", dto.getReturnmsg().trim());
			}
		} catch (Exception e) {
			return null;
		}
		return returnMap;
	}

}
