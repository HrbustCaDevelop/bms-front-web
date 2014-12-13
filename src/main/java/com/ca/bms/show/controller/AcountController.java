package com.ca.bms.show.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.bms.dto.UserDTO;
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
	@RequestMapping("/register.bms")
	public String register_page() {
		return "/account/register";
	}
	
	/**
	 * 跳转到登陆
	 * @return
	*/
	@RequestMapping("/index.bms")
	public String index_page() {
		return "index";
	}

	/**
	 * 跳转到个人信息修改
	 * @return
	*/
	@RequestMapping("/password.bms")
	public String password_page() {
		return "/account/password";
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @param request
	 * @return
	*/
	@RequestMapping("/register")
	public String register(UserEntity user, HttpServletRequest request) {
		if (accountService.register(user)) {
			request.setAttribute("msg", "注册成功！");
			return "/account/account_status";
		}else {
			request.setAttribute("msg", "注册失败！");
			return "/account/account_status";
		}
	}

	/**
	 * 用户信息更新
	 * @param user
	 * @param request
	 * @param session
	 * @return
	*/
	@RequestMapping("/update")
	public String update(UserEntity user, HttpServletRequest request, HttpSession session) {
		if (accountService.update(session.getAttribute("usertoken").toString(), user)) {
			request.setAttribute("msg", "更新成功！");
			return "/account/account_status";
		}else {
			request.setAttribute("msg", "更新失败！");
			return "/account/account_status";
		}
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @return
	*/
	@RequestMapping("/login")
	public String login(UserEntity user,HttpServletRequest request , HttpSession session) {
		Map<String, Object> msgMap = new HashMap<String, Object>();
		msgMap = accountService.login(user);
		if (null != msgMap) {
			session.setAttribute("usertoken", msgMap.get("usertoken"));
			session.setAttribute("userdata", msgMap.get("userdata"));
			user.setUsername(((UserDTO)msgMap.get("userdata")).toString());
			session.setAttribute("mysensor", accountService.getSensor(user.getUsername(), msgMap.get("usertoken").toString()));
			return "/mainframe/mainpage";
		}
		request.setAttribute("msg", "登陆失败！");
		return "/account/account_status";
	}

	/**
	 * 用户登出
	 * @param request
	*/
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}
}