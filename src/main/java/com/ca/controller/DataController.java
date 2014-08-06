package com.ca.controller;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

import com.ca.pojo.Data;
import com.ca.service.DataService;

/**
 * @author liuzhilong<alexmaven@icloud.com>
 */
@InjectName("dataController")
public class DataController {
	private DataService dataService;
	
	/**
	 * @param senid 传感器编号
	 * @param request
	 * @return
	 */
	@At("GetData")
	@Ok("raw:json")
	public String GetData(String senid,HttpServletRequest request) {
		System.out.println(senid);
		request.getSession().setAttribute("lastid",senid);
        Data data = dataService.SelDataByAttrDesc(senid);
        StringBuilder message = new StringBuilder("");
        message.append("{\"point\":");
        message.append("{\"temperature\":"+"\""+data.getTemperature()+"\""+","+"\"humidity\""+":"+"\""+data.getHumidity()+"\""+","+"\"nowtime\""+":"+"\""+data.getDatatime()+"\""+"}}");
        System.out.println(message);
        return message.toString();
	}
	
	@At("ConvertPort")
	@Ok("jsp:admin.index")
	public void ConvertPort(String senid,HttpServletRequest request) {
        request.getSession().setAttribute("lastid",senid);
	}
	
	@At("getHistory")
	@Ok("jsp:admin.index")
	public void getHistory(String senid,HttpServletRequest request) {
        request.getSession().setAttribute("lastid",senid);
	}
}
