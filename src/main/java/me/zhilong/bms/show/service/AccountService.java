package me.zhilong.bms.show.service;

import java.util.List;
import java.util.Map;

import me.zhilong.bms.common.dto.SensorDTO;
import me.zhilong.bms.common.entitys.UserEntity;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:24:14
 * @version:1.0
 */
public interface AccountService {
	/**
	 * 用户登陆
	 * 
	 * @param user
	 */
	public Map<String, Object> login(UserEntity user);

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	public boolean register(UserEntity user);

	/**
	 * 获取用户传感器
	 * 
	 * @return
	 */
	public List<SensorDTO> getSensor(String username, String usertoken);

	/**
	 * 更新用户信息
	 * 
	 * @param username
	 * @param usertoken
	 * @return
	 */
	public boolean update(String usertoken, UserEntity entity);
	
	/**
	 * 验证用户名是否存在
	 * @param username
	 * @return
	*/
	public boolean checkusername(String username);
	
	/**
	 * 用户绑定传感器
	 * @param serialnum
	 * @return
	*/
	Map<String, String> regsensor(String username, String usertoken, String serialnum);
}
