package com.ca.bms.show.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ca.bms.common.dto.UserDTO;
import com.ca.bms.common.entitys.UserEntity;
import com.ca.bms.show.annotations.AuthPass;
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
		return "/view/account/register";
	}
	
	/**
	 * 跳转到登陆
	 * @return
	*/
	@RequestMapping("/index.bms")
	public String index_page() {
		return "index";
	}

	@RequestMapping("/regsensor.bms")
	public String regsensor_page() {
		return "/view/sensor/add";
	}
	
	/**
	 * 跳转到主页	
	 * @return
	*/
	@RequestMapping("/main.bms")
	public String main_page() {
		return "/view/main";
	}
	
	/**
	 * 跳转到个人信息修改
	 * @return
	*/
	@AuthPass
	@RequestMapping("/update.bms")
	public String password_page() {
		return "/view/account/update";
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	*/
	@RequestMapping(value = "/register", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String register(
			@RequestParam(value="username", required = true)String username,
			@RequestParam(value="password", required = true)String password,
			String nickname,
			String phonenum) {
		UserEntity user = new UserEntity();
		user.setUsername(username);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setPhoneNum(phonenum);
		if (accountService.register(user)) {
			return "{\"msg\" : 1}";
		}else {
			return "{\"msg\" : 0}";
		}
	}

	/**
	 * 用户信息更新
	 * @param user
	 * @param session
	 * @return
	*/
	@AuthPass
	@RequestMapping(value = "/update", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String update(UserEntity user, HttpSession session) {
		user.setUsername(((UserDTO)session.getAttribute("userdata")).getUsername());
		if (accountService.update(session.getAttribute("usertoken").toString(), user)) {
			return "{\"msg\" : 1}";
		}else {
			return "{\"msg\" : 0}";
		}
	}

	/**
	 * 用户绑定传感器
	 * @param serialnum
	 * @param session
	 * @return
	*/
	@AuthPass
	@RequestMapping(value = "/regsensor", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String regsensor(
			@RequestParam(value="serialnum", required = true)String serialnum, HttpSession session) {
		Map<String, String> msgMap = accountService.regsensor(((UserDTO)session.getAttribute("userdata")).getUsername(), session.getAttribute("usertoken").toString(), serialnum);
		if (null != msgMap) {
			if (msgMap.get("result").toString().trim().equals("1")) {
				return "{\"msg\" : 1}";
			} else {
				return "{\"msg\" : 0 ,\"reason\" : \"" + msgMap.get("reason").toString().trim() + "\"}";
			}
		}
		return "{\"msg\" : 0 ,\"reason\" : \"未知原因\"}";
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @return
	*/
	@RequestMapping(value = "/login", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String login(
			@RequestParam(value="username", required = true)String username,
			@RequestParam(value="password", required = true)String password,
			HttpSession session) {
		UserEntity user = new UserEntity();
		user.setUsername(username);
		user.setPassword(password);
		Map<String, Object> msgMap = new HashMap<String, Object>();
		msgMap = accountService.login(user);
		if (null != msgMap) {
			session.setAttribute("usertoken", msgMap.get("usertoken"));
			session.setAttribute("userdata", msgMap.get("userdata"));
			session.setAttribute("mysensor", accountService.getSensor(username, msgMap.get("usertoken").toString()));
			return "{\"msg\" : 1}";
		}
		return "{\"msg\" : 0}";
	}

	/**
	 * 检查用户名是否重复
	 * @param username
	 * @return
	*/
	@RequestMapping(value = "/checkusername", produces = "text/html;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String checkusername(String username) {
		if (accountService.checkusername(username)) {
			return "{\"msg\" : 1}";
		}else {
			return "{\"msg\" : 0}";
		}
	}
	
	/**
	 * 用户登出
	 * @param request
	*/
	@AuthPass
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}
}