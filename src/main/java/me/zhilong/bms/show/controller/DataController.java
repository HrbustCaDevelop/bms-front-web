package me.zhilong.bms.show.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import me.zhilong.bms.show.annotations.AuthPass;
import me.zhilong.bms.show.service.DataService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;
import me.zhilong.bms.common.dto.SensorDataDTO;
import me.zhilong.bms.common.dto.UserDTO;

/**
 * 传感器数据Controller
 * 
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:09
 * @version:1.0
 */
@Controller
public class DataController {

	private static SimplePropertyPreFilter dataFilter = new SimplePropertyPreFilter(
			SensorDataDTO.class, "temperature", "co", "smoke");
	
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
		return "/view/data/show";
	}
	
	/**
	 * 浏览报警数据
	 * @param id
	 * @param request
	 * @return
	 */
	@AuthPass
	@RequestMapping("/alert.bms")
	public String alert_page(String id, HttpServletRequest request, HttpSession session) {
		request.setAttribute("serialnum", id);
		request.setAttribute("alertmsg", dataService.getAlertBySerial(((UserDTO)session.getAttribute("userdata")).getUsername(), 
				session.getAttribute("usertoken").toString(), id));
		return "/view/alert/list";
	}
	
	/**
	 * 列出传感器
	 * @return
	*/
	@AuthPass
	@RequestMapping("/listsensor.bms")
	public String listsensor_page() {
		return "/view/sensor/list";
	}
	
	/**
	 * 获取实时数据
	 * @param serialnum
	 * @param request
	 * @param session
	 * @return
	*/
	@AuthPass
	@RequestMapping(value = "/realtime", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String realtime(String serialnum, HttpSession session) {
		SensorDataDTO data = dataService.realtime(
				((UserDTO)session.getAttribute("userdata")).getUsername(), 
				session.getAttribute("usertoken").toString(),
				serialnum);
        return JSON.toJSONString(data, dataFilter); 
	}
}
