package com.ca.bms.show.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.bms.entitys.UserEntity;
import com.ca.bms.show.service.AccountService;

/**
 * 账户功能拦截器
 * @author：刘志龙
 * @since：2014年11月24日 下午8:29:49
 * @version:1.0
 */
@Controller
@RequestMapping("/user")
public class AcountController {
	private AccountService accountService;

	/**
	 * 跳转到注册页
	 * @return
	*/
	@RequestMapping("/reg.bms")
	public String userRegister() {
		return "admin/register";
	}
	
	/**
	 * 跳转到登陆
	 * @return
	*/
	@RequestMapping("/login.bms")
	public String userLogin() {
		return "admin/login";
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @return
	*/
	@RequestMapping("/userlogin.bms")
	public String login(UserEntity user,HttpSession session) {
		Map<String, Object> msgMap = new HashMap<String, Object>();
		msgMap = accountService.login(user);
		if (null != msgMap) {
			session.setAttribute("usertoken", msgMap.get("usertoken"));
			session.setAttribute("userdata", msgMap.get("userdata"));
			return "";
		}
		return "";
	}

	//登出

	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}