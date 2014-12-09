package com.ca.bms.show.controller;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.ca.bms.dto.UserDTO;
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
	public View useLogin(@Param(value = "..")UserDTO user,HttpServletRequest request) {
		return null;
	}

	//登出
	@At("logout")
	@Ok("redirect:/")
	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}