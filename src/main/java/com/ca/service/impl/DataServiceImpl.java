package com.ca.service.impl;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.service.NameEntityService;

import com.ca.pojo.Data;
import com.ca.service.DataService;

/**
 * @author：刘志龙
 * @since：2014年11月24日 下午8:23:27
 * @version:1.0
 */
public class DataServiceImpl extends NameEntityService<Data> implements
		DataService {

	public Data SelDataById(int id) {
		return this.dao().fetch(Data.class, id);
	}

	public List<Data> SelDataByAttr(String attribute) {
		return null;
	}

	public Data SelDataByAttrDesc(String attribute) {
		return this.dao().fetch(Data.class,
				Cnd.wrap("sensorid ='" + attribute + "' ORDER BY id DESC"));
	}

	@SuppressWarnings("unchecked")
	public List<Data> SelDataByDate(String start, String stop) {
		return (List<Data>) this.dao().fetch(Data.class,
				Cnd.where("datatime", ">", start).and("datatime", "<", stop));
	}

}
