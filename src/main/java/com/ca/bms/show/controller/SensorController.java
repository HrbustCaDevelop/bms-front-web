package com.ca.bms.show.controller;

import org.springframework.stereotype.Controller;

/**
 * 传感器Controller
 * 
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:09
 * @version:1.0
 */
@Controller
public class SensorController {

//	@Autowired
//	DataService dataService;
//
//	@RequestMapping("/realtime.bms")
//	public String realtime_page(String serialnum, HttpServletRequest request) {
//		request.setAttribute("serialnum", serialnum);
//		return "/data/show";
//	}
//
//	@RequestMapping("/realtime")
//	@ResponseBody
//	public String realtime(String serialnum, HttpServletRequest request, HttpSession session) {
//		SensorDataDTO data = dataService.realtime(
//				((UserDTO)session.getAttribute("userdata")).getUsername(), 
//				session.getAttribute("usertoken").toString(),
//				serialnum);
//
//		StringBuilder message = new StringBuilder("");
//        message.append("{\"point\":");
//        message.append("{\"temperature\":"+"\""+data.getTemperature()+"\""+","+"\"co\""+":"+"\""+data.getCo()+"\""+","+"\"flash\""+":"+"\""+data.getSmoke()+"\""+"}}");
//        System.out.println(message);
//        return message.toString();
//	}
}
