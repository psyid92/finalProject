package com.sp.store.mystore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("store.mystore.myStoreService")
public class MyStoreServiceImpl implements MyStoreService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMenuCT(MyStore dto) throws Exception {
		int result = 0;
		try {
			dao.getIntValue("menu.seqMenuCT");
			dto.setMenuct_Num(result);
			dao.insertData("menu.insertMenuCT", dto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertMainMenu(MyStore dto) throws Exception {
		int result = 0;
		try {
			dao.getIntValue("menu.seqMainMenu");
			dto.setMainmenu_Num(result);
			result = dao.insertData("menu.insertMainMenu", dto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
			
		}
		return result;
	}

	@Override
	public int insertSubMenu(MyStore dto) throws Exception {
		int result = 0;
		try {
			dao.getIntValue("menu.seqSubMenu");
			dto.setSubmenu_Num(result);
			result = dao.insertData("menu.insertSubMenu", dto);
		} catch (Exception e) {
			result = 0;
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteMenuCT(int menuct_Num) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("menu.deleteMenuCT", menuct_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteMainMenu(int mainmenu_Num) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("menu.deleteMainMenu", mainmenu_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteSubMenu(int submenu_Num) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("menu.deleteSubmenu", submenu_Num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
