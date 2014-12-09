package com.ca.bms.show.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;

import com.ca.bms.entitys.UserEntity;
import com.ca.bms.show.service.AccountService;

/**
 * 账户功能拦截器
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:49
 * @version:1.0
 */
@InjectName("acountController")
public class AcountController {
	private AccountService accountService;

	//登陆
	@At("login")
	public View userLogin(@Param(value = "..")UserEntity user,HttpServletRequest request) {
		Map<String, Object> msgMap = new HashMap<String, Object>();
		msgMap = accountService.login(user);
		if (null != msgMap) {
			request.getSession().setAttribute("usertoken", msgMap.get("usertoken"));
			request.getSession().setAttribute("userdata", msgMap.get("userdata"));
			return new JspView("admin.index");
		}
		return new JspView("admin.login");
	}

	//登出
	@At("logout")
	@Ok("redirect:/")
	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}