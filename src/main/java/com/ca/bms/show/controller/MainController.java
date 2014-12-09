package com.ca.bms.show.controller;

import org.nutz.mvc.annotation.Encoding;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.ioc.provider.JsonIocProvider;

/**
 * Nutz主拦截器
 * @author：刘志龙
 * @since：2014年11月24日 下午8:28:50
 * @version:1.0
 */
@Modules({ AcountController.class , DataController.class})
@IocBy(type = JsonIocProvider.class, args = { "nutz.js"})
@Encoding(input = "utf-8", output = "utf-8")
@Fail("jsp:/WEB-INF/err/500.jsp")
public class MainController {
}
