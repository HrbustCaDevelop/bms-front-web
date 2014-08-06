package com.ca.impl.service;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.service.NameEntityService;

import com.ca.pojo.Data;
import com.ca.service.DataService;

/**
 * @author liuzhilong<alexmaven@icloud.com>
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

	public List<Data> SelDataByDate(String start, String stop) {
		return (List<Data>) this.dao().fetch(Data.class,
				Cnd.where("datatime", ">", start).and("datatime", "<", stop));
	}

}
