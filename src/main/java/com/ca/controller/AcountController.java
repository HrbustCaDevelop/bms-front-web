package com.ca.controller;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;

import com.ca.service.AccountService;

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
	public View useLogin(@Param(value = "..")User user,
			HttpServletRequest request) {
		if (accountService.login(user)) {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("lastid", "1");
			return new JspView("admin.index");
		} else {
			return new JspView("admin.login");
		}
	}

	//登出
	@At("logout")
	@Ok("redirect:/")
	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}