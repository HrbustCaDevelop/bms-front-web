package me.zhilong.bms.show.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.zhilong.bms.show.annotations.AuthPass;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登陆权限鉴定
 * 
 * @author：刘志龙
 * @since：2014年12月4日 下午2:31:14
 * @version:1.0
 */
public class SecurityInterceptor implements HandlerInterceptor {
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean flag = false;
		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			AuthPass authPass = ((HandlerMethod) handler)
					.getMethodAnnotation(AuthPass.class);
			if (authPass == null || authPass.validate() == false)
				return true;
			else {
				HttpSession session = request.getSession();
				Object usertoken = session.getAttribute("usertoken");
				if (usertoken != null) {
					flag = true;
				}
				if (flag) {
					return true;
				} else {
					response.setContentType("text/html; charset=UTF-8");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
					return false;
				}
			}
		} else {
			return true;
		}
	}
}
