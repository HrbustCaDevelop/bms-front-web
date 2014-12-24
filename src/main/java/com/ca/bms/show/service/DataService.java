package com.ca.bms.show.service;

import java.util.List;

import com.ca.bms.common.dto.AlertMsgDTO;
import com.ca.bms.common.dto.SensorDataDTO;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:24:08
 * @version:1.0
 */
public interface DataService {
	/**
	 * 获取实时数据
	 * @return
	*/
	public SensorDataDTO realtime(String username, String usertoken, String serialnum);
	
	/**
	 * 获取报警信息
	 * @param serialnum
	 * @return
	 */
	public List<AlertMsgDTO> getAlertBySerial(String username, String usertoken,String serialnum);
}
