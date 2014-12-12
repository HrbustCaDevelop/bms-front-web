package com.ca.bms.show.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
public class AcountController {
	
	@Autowired
	private AccountService accountService;

	/**
	 * 跳转到注册页
	 * @return
	*/
	@RequestMapping("/register")
	public String userRegister() {
		return "reg_page";
	}
	
	/**
	 * 跳转到登陆
	 * @return
	*/
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/registerc")
	public String registerc(UserEntity user, HttpServletRequest request) {
		if (accountService.register(user)) {
			request.setAttribute("msg", "注册成功！");
			return "account_status";
		}else {
			request.setAttribute("msg", "注册失败！");
			return "account_status";
		}
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @return
	*/
	@RequestMapping("/loginc")
	public String login(UserEntity user,HttpServletRequest request , HttpSession session) {
		Map<String, Object> msgMap = new HashMap<String, Object>();
		msgMap = accountService.login(user);
		if (null != msgMap) {
			session.setAttribute("usertoken", msgMap.get("usertoken"));
			session.setAttribute("userdata", msgMap.get("userdata"));
			return "mainpage";
		}
		request.setAttribute("msg", "登陆失败！");
		return "account_status";
	}

	//登出

	public void logout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}