package com.ca.bms.show.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ca.bms.dto.SensorDataDTO;
import com.ca.bms.dto.UserDTO;
import com.ca.bms.show.annotation.AuthPass;
import com.ca.bms.show.service.DataService;

/**
 * 传感器数据Controller
 * 
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:09
 * @version:1.0
 */
@Controller
public class DataController {

	@Autowired
	DataService dataService;

	/**
	 * 跳转获取实时数据页面
	 * @param serialnum
	 * @param request
	 * @return
	*/
	@AuthPass
	@RequestMapping("/realtime.bms")
	public String realtime_page(String id, HttpServletRequest request) {
		request.setAttribute("serialnum", id);
		return "/data/show";
	}

	/**
	 * 获取实时数据
	 * @param serialnum
	 * @param request
	 * @param session
	 * @return
	*/
	@AuthPass
	@RequestMapping("/realtime")
	@ResponseBody
	public String realtime(String serialnum, HttpServletRequest request, HttpSession session) {
		SensorDataDTO data = dataService.realtime(
				((UserDTO)session.getAttribute("userdata")).getUsername(), 
				session.getAttribute("usertoken").toString(),
				serialnum);

		StringBuilder message = new StringBuilder("");
        message.append("{\"point\":");
        message.append("{\"temperature\":"+"\""+data.getTemperature()+"\""+","+"\"co\""+":"+"\""+data.getCo()+"\""+","+"\"flash\""+":"+"\""+data.getSmoke()+"\""+"}}");
        System.out.println(message);
        return message.toString();
	}
}
