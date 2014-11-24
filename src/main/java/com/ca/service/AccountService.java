package com.ca.service;

import java.util.List;

import com.ca.pojo.User;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:24:14
 * @version:1.0
 */
public interface AccountService {
	public boolean login(User user);
	public User SelUserByUser(User user);
	public User SelUserById(int id);
	public List<User> SelUserByName(String name);
	public void InsUserByUser(User user);
}
