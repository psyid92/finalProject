package com.sp.jumun;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("jumun.jumunService")
public class JumunServiceImpl implements JumunService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Jumun> listGiup(Map<String, Object> map) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.listGiup", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}
	
	@Override
	public List<Jumun> readMenuCategory(int g1_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readMenuCategory", g1_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> readMainMenu(int menuct_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readMainMenu", menuct_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<Jumun> readSubMenu(int mainmenu_Num) throws Exception {
		List<Jumun> list = new ArrayList<>();
		try {
			list = dao.getListData("jumun.readSubMenu", mainmenu_Num);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}


}