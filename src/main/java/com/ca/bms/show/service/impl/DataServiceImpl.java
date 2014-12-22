package com.ca.bms.show.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.ca.bms.common.dto.SensorDataDTO;
import com.ca.bms.common.enumtype.SensorDataStatusEnum;
import com.ca.bms.common.msg.dto.ReturnMsgDataDTO;
import com.ca.bms.show.service.DataService;
import com.ca.bms.show.utils.HttpClientTools;
import com.ca.bms.show.utils.HttpTarget;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:27
 * @version:1.0
 */
@Service("dataService")
public class DataServiceImpl extends HttpTarget implements DataService {

	@Override
	public SensorDataDTO realtime(String username, String usertoken,
			String serialnum) {
		String URL = HOSTNAME + SERVER_PATH + "sensordata/realtime";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		paramsMap.put("usertoken", usertoken);
		paramsMap.put("serialnum", serialnum);
		ReturnMsgDataDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientTools.doPost(URL, paramsMap),
					ReturnMsgDataDTO.class);
			if (rmud.getReturnmsg().trim().equals(SensorDataStatusEnum.DFS.getValue())) {
				return rmud.getData();
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
}
