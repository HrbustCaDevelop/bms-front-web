package com.ca.bms.show.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import com.ca.bms.show.service.DataService;

/**
 * 传感器Controller
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:09
 * @version:1.0
 */
@Controller
public class DataController {
	private DataService dataService;
	
	/**
	 * @param senid 传感器编号
	 * @param request
	 * @return
	 */

	public String GetData(String senid,HttpServletRequest request) {
		System.out.println(senid);
        StringBuilder message = new StringBuilder("");
        message.append("{\"point\":");
        message.append("{\"temperature\":"+"\""+ " " +"\""+","+"\"humidity\""+":"+"\""+ " " +"\""+","+"\"nowtime\""+":"+"\""+ " " +"\""+"}}");
        System.out.println(message);
        return message.toString();
	}
	
	public void ConvertPort(String senid,HttpServletRequest request) {
        request.getSession().setAttribute("lastid",senid);
	}

	public void getHistory(String senid,HttpServletRequest request) {
        request.getSession().setAttribute("lastid",senid);
	}
}
