package com.ca.bms.show.service;

import com.ca.bms.dto.SensorDataDTO;

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
}
