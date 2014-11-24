package com.ca.service;

import java.util.List;

import com.ca.pojo.Data;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:24:08
 * @version:1.0
 */
public interface DataService {
	/**
	 * 通过Id查询数据记录
	 * 
	 * @param id
	 * @return
	 */
	public Data SelDataById(int id);

	/**
	 * 通过传感器编号查询倒序查询一条
	 * 
	 * @param attribute
	 * @return
	 */
	public Data SelDataByAttrDesc(String attribute);

	/**
	 * 通过传感器查询所有数据
	 * 
	 * @param attribute
	 * @return
	 */
	public List<Data> SelDataByAttr(String attribute);

	/**
	 * 通过日期区间查询数据
	 * 
	 * @param start
	 * @param stop
	 * @return
	 */
	public List<Data> SelDataByDate(String start, String stop);
}
