package me.zhilong.bms.show.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import me.zhilong.bms.show.service.DataService;
import me.zhilong.bms.show.utils.HttpClientTools;
import me.zhilong.bms.show.utils.HttpTarget;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import me.zhilong.bms.common.dto.AlertMsgDTO;
import me.zhilong.bms.common.dto.SensorDataDTO;
import me.zhilong.bms.common.enumtype.SensorDataStatusEnum;
import me.zhilong.bms.common.msg.dto.ReturnMsgAlertDTO;
import me.zhilong.bms.common.msg.dto.ReturnMsgDataDTO;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:27
 * @version:1.0
 */
@Service("dataService")
public class DataServiceImpl implements DataService {

	@Autowired
	HttpTarget httpTarget;
	
	@Override
	public SensorDataDTO realtime(String username, String usertoken,
			String serialnum) {
		String URL = httpTarget.getHostname() + httpTarget.getPath() + "sensordata/realtime";
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

	@Override
	public List<AlertMsgDTO> getAlertBySerial(String username, String usertoken,String serialnum) {
		String URL = httpTarget.getHostname() + httpTarget.getPath() + "sensordata/alert/get";
		Map<String, String> paramsMap = new HashMap<String, String>();
		paramsMap.put("username", username);
		paramsMap.put("usertoken", usertoken);
		paramsMap.put("serialnum", serialnum);
		ReturnMsgAlertDTO rmud;
		try {
			rmud = JSON.parseObject(HttpClientTools.doPost(URL, paramsMap),
					ReturnMsgAlertDTO.class);
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
