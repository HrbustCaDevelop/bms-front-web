package com.ca.service.impl;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.service.NameEntityService;

import com.ca.pojo.User;
import com.ca.service.AccountService;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:47
 * @version:1.0
 */
public class AccountServiceImpl extends NameEntityService<User> implements AccountService{

	public boolean login(User user) {
		if (this.SelUserByUser(user) != null) {
			return true;
		}
		return false;
	}

	public User SelUserByUser(User user) {
		return this.dao().fetch(User.class, Cnd.where("username", "=", user.getUsername())
				.and("password", "=", user.getPassword()));
	}

	public User SelUserById(int id) {
		return this.dao().fetch(User.class,id);
	}

	public List<User> SelUserByName(String name) {
		return this.dao().query(User.class, Cnd.where("name", "=", name));
	}

	public void InsUserByUser(User user) {
		this.dao().insert(user);
	}

}
